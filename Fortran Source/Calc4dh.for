
      program poincare 
c     this program is poincare section for the henon-heiles system(4D)
c    			Leila Kheibarshekan
c ------------------------------------------------------------------------
	USE parameters, ONLY: rn
	USE fparser
	USE PORTLIB
	USE MSFLIB

	implicit double precision (a-h,o-z)

      dimension x(4),yp(4),xx(5),y(4)
      dimension F0(4),F1(4),F2(4),F3(4),F4(4),F5(4),F6(4),F7(4),epp(4)
           
!      external forces,pot,rk78
      external forces,rk78

	PARAMETER(CALC4DH_FILE_IDENTIFIER = 12345)


	INTEGER xxdotflag, NumOfIniSteps, NumOfRKSteps, x3FormulaFlag
	INTEGER x2IniFlag, x4IniFlag, MainStepFactor, RK78StepFactor
	INTEGER XVarNo, YVarNo, PCalcStatus, x3CalcStatus
	INTEGER iInternalFormulaIndex, iProgramLocation, iSkipCurrentStage
	INTEGER YDotFormulaIndex

	DOUBLE PRECISION X1DotTemp, YVarMultFactor

      COMMON xxdotflag, NumOfIniSteps, NumOfRKSteps, x3FormulaFlag,
	&	   x2IniFlag, x4IniFlag, MainStepFactor, RK78StepFactor,
	&	   XVarNo, YVarNo, PCalcStatus, x3CalcStatus, X1DotTemp,
     &	   iInternalFormulaIndex, iProgramLocation, iSkipCurrentStage,
	&	   YVarMultFactor, YDotFormulaIndex

      INTEGER i
	INTEGER FileID
	INTEGER(4) i4ret

	DOUBLE PRECISION YVarTemp

      CHARACTER VariableNames(5)*2
      CHARACTER Formulas(22)*400              !Maximum length of each formula is 400.
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c      Define Program Parameters:
c       xxdotflag:      0=Don't Create xxdot.dat 1=Create xxdot.dat
c       HH:             Initial value for h
c        HH=0.1d0
c       xl:             Desired poincae surface(always x1=0)
c        xl=0.d0 !x1=x1
c       yl:             Initial condition for x2
c        yl=-0.3d0 !y1=x2
c       vyl:            Initial condition for x4
c        vyl=-0.2d0 !vy1=x4
c       NumOfIniSteps:  Number of used initial conditions
c        NumOfIniSteps=80
c       NumOfRKSteps:   Number of runge-kutta(7-8) calculations for each step
c        NumOfRKSteps=900000
c       x2IniFlag:      0=Don't use x2IniChangeValue 1=Use x2IniChangeValue
c        x2IniFlag=0
c       x2IniChangeValue: Initiali cndition changing value for x2
c        x2IniChangeValue=1
c       x4IniFlag:      0=Don't use x4IniChangeValue 1=Use x4IniChangeValue
c        x4IniFlag=0
c       x4IniChangeValue: Initiali cndition changing value for x4
c        x4IniChangeValue=1
        INTEGER(4) status

	  INTERFACE   
		FUNCTION  hand_fpe (sigid, except)
		  !MS$ATTRIBUTES C :: hand_fpe
		  INTEGER(4) hand_fpe
		  INTEGER(2)  sigid, except
		END FUNCTION
	  END INTERFACE

	  !Set floating-point exception handler
	  i4ret=SIGNALQQ(SIG$FPE, hand_fpe)

        status=ACCESS('input.tmp','  ');
        IF(status.NE.0) THEN
          PRINT*,'Fatal Error: No Input'
          STOP ''
        END IF
        status=ACCESS('status.tmp',' ');
        IF(status.NE.0) THEN
          PRINT*,'Fatal Error: No Output'
          STOP ''
        END IF
        OPEN(UNIT=10,FILE='input.tmp')
        READ(10,*)HH,yl,vyl,FileID
        READ(10,*)NumOfInitSteps,NumOfRKSteps
        READ(10,*)x2IniFlag,x2IniChangeValue
        READ(10,*)x4IniFlag,x4IniChangeValue
        READ(10,*)xxdotflag
        READ(10,*)MainStepFactor,RK78StepFactor,x3FormulaFlag,
	&    iInternalFormulaIndex, XVarNo, YVarNo
        !Read 22 formulas from the input file:
        !1)H , 2)rond(H)/rond(x1) , 3))rond(H)/rond(x2) , 4))rond(H)/rond(x3) , 5))rond(H)/rond(x4)
        !6)rond[rond(H)/rond(x1)]/rond(x1) , 7)rond[rond(H)/rond(x1)]/rond(x2)
        !  ...   ...   ...
        !21)rond[rond(H)/rond(x4)]/rond(x4) , 22)X3

        DO i=1,22
          READ(10,'(A)',END=9990)Formulas(i)
	    CYCLE
   
          !Error: End Of File
9990	    PRINT*,'Fatal Error: Invalid Input Format'
	    STOP ''
	  END DO
        CLOSE(UNIT=10,STATUS='DELETE')

	  IF(FileID.NE.CALC4DH_FILE_IDENTIFIER) THEN
          OPEN(UNIT=20,FILE='err.msg')
          WRITE(20,*)'WRONG_FILE_VERSION'
          CLOSE(20)
          OPEN(UNIT=20,FILE='cpause.tmp')
          WRITE(20,*)'?'
          CLOSE(20)
		CALL SLEEP(3)
		STOP ''
	  END IF

	  IF(XVarNo.LT.1.OR.XVarNo.GT.4) THEN
	    !Do anything necessary
		PRINT*,'Invalid X variable number'
		STOP ''
	  END IF
        IF(YVarNo.LT.0.OR.YVarNo.GT.4) THEN
	    !Do anything necessary
		PRINT*,'Invalid Y variable number'
		STOP ''
	  END IF

	 IF(iInternalFormulaIndex.GT.1.OR.iInternalFormulaIndex.LT.0) THEN
		PRINT*,'Invalid formula index'
		STOP ''
	  END IF

	  GetYVarSign: SELECT CASE (YVarNo)
		CASE (1)
		  YVarMultFactor = 1.0d0
		  YDotFormulaIndex = 4
		CASE (2)
		  YVarMultFactor = 1.0d0
		  YDotFormulaIndex = 5
		CASE (3)
	      YVarMultFactor = -1.0d0
		  YDotFormulaIndex = 2
		CASE (4)
	      YVarMultFactor = -1.0d0
		  YDotFormulaIndex = 3
	  END SELECT GetYVarSign

        OPEN(UNIT=10,FILE='status.tmp')
        
        IF(iInternalFormulaIndex.EQ.0) THEN
		!CALL InitializeExpressionParser
		VariableNames(1)='x1'
		VariableNames(2)='x2'
		VariableNames(3)='x3'
		VariableNames(4)='x4'
		VariableNames(5)='hh'

		CALL initf(22)
		DO i=1,22
		  CALL parsef(i,Formulas(i),VariableNames)
		END DO
	  END IF
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc

      IF(xxdotflag.EQ.1) OPEN(1,FILE='xout.tmp')
      OPEN(2,FILE='yout.tmp')
      
c --- tolerance for Energy conservation.

      do i1=1,4
      epp(i1) = 1.d-12
      enddo
c-----------Ham=.5(xdot**2+ydot**2+Ax**2+Bx**2)-epsx**2y----------------------------------      
	  iProgramLocation = 0
	  iSkipCurrentStage = 0

! initial condition must be enter in this position
        xl=0.d0
        Iniyl=yl
      DO l1=1,NumOfInitSteps        ! do for initial condition !
      
        !!!!!!!!!! Check End !!!!!!!!!!!!
        IF(MOD(l1,3).EQ.0) THEN
          status=ACCESS('end.tmp',' ')
          IF(status.eq.0) THEN
            CLOSE(2)
            IF(xxdotflag.eq.1) CLOSE(1)
            STOP ''
          END IF
        END IF
        !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      
        IF(MOD(l1,MainStepFactor).EQ.0) THEN
	    WRITE(10,*)'*'
	    CALL FlushStatus
	  END IF
        
	  IF(x2IniFlag.EQ.0) THEN
		IF(MOD(l1,20).EQ.0) yl=Iniyl !-0.3d0
		yl=yl+.03
        ELSE
          yl=yl+x2IniChangeValue
        END IF
        IF(x4IniFlag.EQ.0) THEN
		IF(MOD(l1,20).EQ.0) vyl=vyl+0.1d0 
        ELSE
          vyl=vyl+x4IniChangeValue
        END IF

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
C       Calculate X3 (the unknown variable)
	  CalcUVar: SELECT CASE (iInternalFormulaIndex)
		CASE (0)
		  x3CalcStatus=iCalculateX3(0.0d0,yl,vyl,HH,vxl)
		CASE (1)
		  tempv=2.d0*HH-yl**2-vyl**2+2.d0*yl**3/3.d0
		  IF(tempv.LT.0.0d0) THEN
			x3CalcStatus = 1
		  ELSE
			vxl=DSQRT(tempv) !vx1=x3
			x3CalcStatus = 0
		  END IF
	  END SELECT CalcUVar
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        IF(x3CalcStatus.NE.0) THEN
          !ERROR: Unable to calculate x3
          !Send error message
          OPEN(unit=20,file='err.msg')
		WRITE(20,*)'Unable to calculate the unknown variable',
	&	  ' (math error).'
          WRITE(20,*)'Please change your initial conditions.'
		WRITE(20,*)'Continue(with changing initial conditions)',
	&	  ' or Stop?'
          CLOSE(20)
          status=ACCESS('resume.tmp',' ')
          IF(status.EQ.0) THEN
            OPEN(UNIT=20,FILE='resume.tmp')
            CLOSE(20,STATUS='DELETE')
          END IF
          OPEN(UNIT=20,FILE='cpause.tmp')
          WRITE(20,*)'?'
          CLOSE(20)
          !Check if continue('resume.tmp') or end('end.tmp')
          DOWHILE(.TRUE.)
            status=ACCESS('resume.tmp',' ')
            IF(status.EQ.0) GOTO 100
            status=ACCESS('end.tmp',' ')
            IF(status.EQ.0) THEN
              CLOSE(2)
              IF(xxdotflag.EQ.1) CLOSE(1)
              STOP ''
            END IF
          END DO
          !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        END IF
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

	  y(1) =xl    !x1
	  y(2) =yl    !x2
	  y(3) =vxl   !x3
        y(4) =vyl   !x4

!      call pot(y(1),y(2),phi)
!      E = 0.5d0 * (y(3)**2 + y(4)**2) + phi
!      E=H(x1,x2,x3,x4)
!	  iProgramLocation = 0
!       PCalcStatus=iEvaluateFormula(1,y(1),y(2),y(3),y(4),0.0d0,E)
!	  IF(iSkipCurrentStage.EQ.1) GOTO 100
       
	t=0.d0
	dtt = 0.01d0
      tp = dtt

c ---   dt is the first step. It has to be small enough to conserve
c       the energy relatively well. 

      dt = 0.1d0
 
c --- do ? steps   for sulotion of equation by rung-kutta7-8-------------

      DO K1=1,NumOfRKSteps
      
        !!!!!!!!!! Check End !!!!!!!!!!!!
        IF(MOD(k1,100000).eq.0) THEN
		status=ACCESS('end.tmp',' ')
		IF(status.EQ.0) THEN
		  Close(2)
		  IF(xxdotflag.EQ.1) CLOSE(1)
		  STOP ''
		END IF
        END IF
        !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        
       IF(MOD(k1,RK78StepFactor).EQ.0) THEN
	   WRITE(10,*)'0'
	   CALL FlushStatus
	   !CALL FLUSH(10)  --> This is a dangerous command here
	 END IF
          
       x(1)=y(1)	 
       x(2)=y(2)
       x(3)=y(3)
       x(4)=y(4)
28     IF (T+DT.GT.TP) DT = TP - T + 1D-12
	 CALL RK78(IR1,T,DT,X,F0,F1,F2,F3,F4,F5,F6,F7,4,epp,forces)
	  IF(iSkipCurrentStage.EQ.1) GOTO 100
          IF (T.LT.TP) GOTO 28
          TP = TP + DTT
          
!	    call pot(x(1),x(2),phi)
!         dh1=phi+0.5d0*(x(3)**2+x(4)**2)-HH
!         dh1=H(x1,x2,x3,x4)-HH
	  CalcDH1: SELECT CASE (iInternalFormulaIndex)
		CASE (0)
		  iProgramLocation = 0
		  PCalcStatus=iEvaluateFormula(1,x(1),x(2),x(3),
	&		x(4),0.0d0,dh1)
		  IF(iSkipCurrentStage.EQ.1) GOTO 100
		CASE (1)
		  dh1=0.5d0*(x(3)**2.0d0+x(4)**2.0d0+x(1)**2.0d0+x(2)**2.0d0)+
	&		x(1)**2.0d0*x2-x(2)**3.0d0/3.0d0
	  END SELECT CalcDH1
	  dh1=dh1-HH

c-------------initial condition for nonlinear equation---------------------------------
	an=0.0d0
	x1=x(1)
	x2=x(2)
      x3=x(3)
	x4=x(4)
c-----------------------------------------------------------------------------
	CALL Newton(x1,x2,x3,x4,an,HH,xx)
	IF(iSkipCurrentStage.EQ.1) GOTO 100
	x(1)=xx(1)
	x(2)=xx(2)
	x(3)=xx(3)
	x(4)=xx(4)
	an=xx(5)
	
!	call pot(x(1),x(2),phi)
!	dh2= phi + 0.5d0 * (x(3)**2 + x(4)**2) -HH
!       dh2=H(x1,x2,x3,x4)-HH
	  CalcDH2: SELECT CASE (iInternalFormulaIndex)
		CASE (0)
		  iProgramLocation = 0
		  PCalcStatus=iEvaluateFormula(1,x(1),x(2),
	&		x(3),x(4),0.0d0,dh2)
		  IF(iSkipCurrentStage.EQ.1) GOTO 100
		CASE (1)
		  dh1=0.5d0*(x(3)**2.0d0+x(4)**2.0d0+x(1)**2.0d0+x(2)**2.0d0)+
	&		x(1)**2.0d0*x2-x(2)**3.0d0/3.0d0
	  END SELECT CalcDH2
	  dh2=dh2-HH

        IF (dh2.ge.dh1) THEN
           x(1)=x1
           x(2)=x2
           x(3)=x3
           x(4)=x4
	  END IF

!          if(y(1)*x(1).lt.0.and.x(3).gt.0) then
!          X1Dot=rond(H)/rond(x3)
	  CalcX1Dot: SELECT CASE (iInternalFormulaIndex)
		CASE (0)
		  iProgramLocation = 0
		  PCalcStatus=iEvaluateFormula(4,x(1),x(2),x(3),x(4),
	&    	0.0d0,X1DotTemp)
		  IF(iSkipCurrentStage.EQ.1) GOTO 100
		CASE (1)
		  X1DotTemp = x(3)
	  END SELECT CalcX1Dot
	  
	  IF(y(1)*x(1).LT.0.0d0.AND.X1DotTemp.GT.0.0d0) THEN
          CALL forces(t,y,yp)
		IF(iSkipCurrentStage.EQ.1) GOTO 100
	    dx1=0.0d0-y(1)
	  
!          dt1=dx1/yp(1)      !dt1=dx1/X1Dot
!	  iProgramLocation = 0
!          PCalcStatus=iEvaluateFormula(4,y(1),y(2),y(3),y(4),0.0d0,X1DotTemp)
!	  IF(iSkipCurrentStage.EQ.1) GOTO 100
!          dt1=dx1/X1DotTemp
           dt1=dx1/yp(1)

          xn1 = 0.0d0
		xn2=y(2)+yp(2)*dt1  !x2=x2+X2Dot*dt1
	    xn3=y(3)+yp(3)*dt1  !x3=x3+X3Dot*dt1
          xn4=y(4)+yp(4)*dt1  !x4=x4+X4Dot*dt1
          
		IF(xxdotflag.EQ.1) THEN
            !write(1,*)t,x1,xn3   !xn3=X1Dot
		  CalcOutputX1Dot: SELECT CASE (iInternalFormulaIndex)
			CASE (0)
			  iProgramLocation = 0
			  PCalcStatus=iEvaluateFormula(4,xn1,xn2,xn3,xn4,
	&			0.0d0,X1DotTemp)
			  IF(iSkipCurrentStage.EQ.1) GOTO 100
			CASE (1)
			  !Calculate Heno-Heiles X1Dot
			  X1DotTemp = xn3
		  END SELECT CalcOutputX1Dot
            WRITE(1,9920)t,x1,X1DotTemp
9920		  FORMAT(3E40.20)
          END IF
          
	    !write(2,*)xn2,xn4         !xn2=y=X2 , xn4=ydot=X2Dot
	    !Use X1DotTemp as a temp to calculate X2Dot
		CalcYDot: SELECT CASE (iInternalFormulaIndex)
		  CASE (0)
			iProgramLocation = 0									  
			PCalcStatus=iEvaluateFormula(YDotFormulaIndex,xn1,
	&		  xn2,xn3,xn4,0.0d0,X1DotTemp)
			!It is not necessary to check iSkipCurrentStage here, because the current line of the output
			! file must be completed.
			X1DotTemp = X1DotTemp * YVarMultFactor
		  CASE (1)
			CalcHenonHeilesYDot: SELECT CASE (YVarNo)
			  CASE (1)
				X1DotTemp = xn3
			  CASE (2)
				X1DotTemp = xn4
			  CASE (3)
				X1DotTemp = -(xn1+2.0d0*xn1*xn2)
			  CASE (4)
				X1DotTemp = -(xn2+xn1**2.0d0-xn2**2.0d0)
			END SELECT CalcHenonHeilesYDot
		END SELECT CalcYDot
	  
		GetY: SELECT CASE (YVarNo)
		  CASE (1)
			YVarTemp = xn1
		  CASE (2)
			YVarTemp = xn2
		  CASE (3)
			YVarTemp = xn3
		  CASE (4)
			YVarTemp = xn4
		END SELECT GetY
	    !WRITE(2,*)YVarTemp, X1DotTemp
		WRITE(2,9930)YVarTemp, X1DotTemp
9930		FORMAT(2E40.20)
	  
	  END IF
  
	 y(1)= x(1)	 
  	 y(2)= x(2)
	 y(3)= x(3)
	 y(4)= x(4)

   	END DO
100   END DO
      IF(xxdotflag.EQ.1) CLOSE(1)
      CLOSE(2)
      CLOSE(10)

      STOP ''
      END

c --------------------------------------------------------------------

!      subroutine pot(x,y,phi)
!      implicit double precision (a-h,o-z)
!      common /param/ A,B,eps
!      phi = 0.5d0*(x**2+y**2+2.d0*x**2*y-2.d0*y**3/3.d0)
!      return
!      end

c --------------------------------------------------------------------

      subroutine forces(t,v,yp)
      implicit double precision (a-h,o-z)
!      common /param/ A,B,eps
      dimension v(4),yp(4)
c      x is  v(1)
c      y is  v(2)

      COMMON xxdotflag, NumOfIniSteps, NumOfRKSteps, x3FormulaFlag,
	&	   x2IniFlag, x4IniFlag, MainStepFactor, RK78StepFactor,
	&	   XVarNo, YVarNo, PCalcStatus, x3CalcStatus, X1DotTemp,
     &	   iInternalFormulaIndex, iProgramLocation, iSkipCurrentStage,
	&	   YVarMultFactor, YDotFormulaIndex

	INTEGER xxdotflag, NumOfIniSteps, NumOfRKSteps, x3FormulaFlag
	INTEGER x2IniFlag, x4IniFlag, MainStepFactor, RK78StepFactor
	INTEGER XVarNo, YVarNo, PCalcStatus, x3CalcStatus
	INTEGER iInternalFormulaIndex, iProgramLocation, iSkipCurrentStage
	INTEGER YDotFormulaIndex
	DOUBLE PRECISION X1DotTemp, YVarMultFactor

!       yp(1)=X1Dot , yp(2)=X2Dot , yp(3)=X3Dot , yp(4)=X4Dot

	  IF(iInternalFormulaIndex.EQ.1) THEN
		!Henon-Heiles Hamiltonian
		yp(1) = v(3)
		yp(2) = v(4)
		yp(3) = -v(1)-2.d0*v(1)*v(2)  ! -rond(H)/rond(x)
		yp(4) = v(2)**2-v(1)**2-v(2)  ! -rond(H)/rond(y)
	  ELSE IF(iInternalFormulaIndex.EQ.0) THEN
		iProgramLocation = 1

		!Use X1DotTemp as a temp to calculate values

	!Calculate X1Dot=rond(H)/rond(x3)
		PCalcStatus=iEvaluateFormula(4,v(1),v(2),v(3),v(4),
	&	  0.0d0,X1DotTemp)
		IF(iSkipCurrentStage.EQ.1) RETURN
		yp(1)=X1DotTemp
      
      !Calculate X2Dot=rond(H)/rond(x4)
		PCalcStatus=iEvaluateFormula(5,v(1),v(2),v(3),v(4),
	&	  0.0d0,X1DotTemp)
		IF(iSkipCurrentStage.EQ.1) RETURN
		yp(2)=X1DotTemp

      !Calculate X3Dot=-rond(H)/rond(x1)
		PCalcStatus=iEvaluateFormula(2,v(1),v(2),v(3),v(4),
	&	  0.0d0,X1DotTemp)
		IF(iSkipCurrentStage.EQ.1) RETURN
		yp(3)=-X1DotTemp

      !Calculate X4Dot=-rond(H)/rond(x2)
		PCalcStatus=iEvaluateFormula(3,v(1),v(2),v(3),v(4),
	&	  0.0d0,X1DotTemp)
		IF(iSkipCurrentStage.EQ.1) RETURN
		yp(4)=-X1DotTemp
	END IF

      RETURN
      END
      
c --------------------------------------------------------------

      SUBROUTINE RK78(IR1,T,DT,X,F0,F1,F2,F3,F4,F5,F6,F7,N,TOL,DER)
C	
C  Variable step-size automatic one-step integrator for a system of
C  N firts order ordinary differential equations with initial values
C  The Runge-Kutta-Fehlberg formula 7(8) is used
C  REF   E. FEHLBERG, NASA TECHNICAL REPORT TR R-287, 1968
C  Description of parameters list
C          (All floating variables in DOUBLE PRECISION)
C  IR1      O    NUMBER OF REJECTIONS OF THE LAST STEP
C               (IN CASE  DT WAS TOO LARGE)
C  T       I-O  INDEPENDENT VARIABLE
C  DT      I-O  STEP SIZE
C               A RECOMMENDED VALUE FOR THE NEXT STEP IS OUTPUT
C  X(N)    I-O  DEPENDENT VARIABLES
C  FM(N)        AUXILIARY ARRAYS   WITH M = 0 TO 6
C  F7(N)   O    ABSOLUTE ESTIMATED TRUNCATION ERROR ON EACH COMPONENT
C  N       I    ORDER OF THE DIFFERENTIAL EQUATIONS SYSTEM
C  TOL(N)  I    RELATIVE TOLERATED ERROR ON EACH COMPONENT
C  DER     I    NAME OF THE SUBROUTINE COMPUTING THE DERIVATIVES. THIS
C               SUBROUTINE HAS TO HAVE THE STANDARD CALLING SEQUENCE
C                          CALL DER(T,X,F0)
C
          IMPLICIT DOUBLEPRECISION (A-H,O-Z)
c      
      PARAMETER ( CH1 = 34D0/105D0, CH2 = 9D0/35D0, CH3 = 9D0/280D0,
     &            CH4 = 41D0/840D0, AL2 = 2D0/27D0, AL3 = 1D0/9D0,
     &            AL4 = 1D0/6D0,    AL5 = 5D0/12D0, AL6 = 5D-1,
     &            AL7 = 5D0/6D0,    AL9 = 2D0/3D0,  ALA = 1D0/3D0,
     & B21 = 2D0/27D0,     B31 = 1D0/36D0,    B41 = 1D0/24D0,
     & B51 = 5D0/12D0,     B61 = 5D-2,        B71 = -25D0/108D0,
     & B81 = 31D0/3D2,     B101= -91D0/108D0, B111= 2383D0/41D2,
     & B121= 3D0/205D0,    B131= -1777D0/41D2,B32 = 1D0/12D0,
     & B43 = .125D0,       B53 = -25D0/16D0,  B64 = 25D-2,
     & B74 = 125D0/108D0,  B94 = -53D0/6D0,   B104= 23D0/108D0,
     & B114= -341D0/164D0, B65 = 2D-1,        B75 = -65D0/27D0,
     & B85 = 61D0/225D0,   B95 = 704D0/45D0,  B105= -976D0/135D0,
     & B115= 4496D0/1025D0,B76 = 125D0/54D0,  B86 = -2D0/9D0,
     & B96 = -107D0/9D0,   B106= 311D0/54D0,  B116= -301D0/82D0,
     & B126= -6D0/41D0,    B136= -289D0/82D0, B87 = 13D0/9D2,
     & B97 = 67D0/9D1,     B107= -19D0/6D1,   B117= 2133D0/41D2,
     & B127= -3D0/205D0,   B137= 2193D0/41D2, B108= 17D0/6D0,
     & B118= 45D0/82D0,    B128= -3D0/41D0,   B138= 51D0/82D0,
     & B119= 45D0/164D0,   B139= 33D0/164D0,  B1110= 18D0/41D0,
     & B1310= 12D0/41D0 )
C
      DIMENSION X(N),F0(N),F1(N),F2(N),F3(N),F4(N),F5(N),F6(N),F7(N),
     &          TOL(N)

!      common /param/ A,B,eps

      COMMON xxdotflag, NumOfIniSteps, NumOfRKSteps, x3FormulaFlag,
	&	   x2IniFlag, x4IniFlag, MainStepFactor, RK78StepFactor,
	&	   XVarNo, YVarNo, PCalcStatus, x3CalcStatus, X1DotTemp,
     &	   iInternalFormulaIndex, iProgramLocation, iSkipCurrentStage,
	&	   YVarMultFactor, YDotFormulaIndex

	INTEGER xxdotflag, NumOfIniSteps, NumOfRKSteps, x3FormulaFlag
	INTEGER x2IniFlag, x4IniFlag, MainStepFactor, RK78StepFactor
	INTEGER XVarNo, YVarNo, PCalcStatus, x3CalcStatus
	INTEGER iInternalFormulaIndex, iProgramLocation, iSkipCurrentStage
	INTEGER YDotFormulaIndex
	DOUBLE PRECISION X1DotTemp, YVarMultFactor

      IR1 = 0
      CALL DER(T, X,F1)
	IF(iSkipCurrentStage.EQ.1) RETURN
C
   20 DO I = 1, N
        F0(I) = X(I) + DT*B21*F1(I)
      ENDDO
      CALL DER(T + AL2*DT, F0, F2)
	IF(iSkipCurrentStage.EQ.1) RETURN
      DO I = 1, N
        F0(I) = X(I) + DT*(B31*F1(I) + B32*F2(I))
      ENDDO
      CALL DER(T + AL3*DT, F0, F3)
	IF(iSkipCurrentStage.EQ.1) RETURN
      DO I = 1, N
        F0(I) = X(I) + DT*(B41*F1(I) + B43*F3(I))
      ENDDO
      CALL DER(T + AL4*DT, F0, F4)
	IF(iSkipCurrentStage.EQ.1) RETURN
      DO I = 1, N
        F0(I) = X(I) + DT*(B51*F1(I) + B53*(F3(I) - F4(I)))
      ENDDO
      CALL DER(T + AL5*DT, F0, F5)
	IF(iSkipCurrentStage.EQ.1) RETURN
      DO I = 1, N
        F0(I) = X(I) + DT*(B61*F1(I) + B64*F4(I) + B65*F5(I))
      ENDDO
      CALL DER(T + AL6*DT, F0, F6)
	IF(iSkipCurrentStage.EQ.1) RETURN
      DO I = 1, N
        F0(I) = X(I) + DT*(B71*F1(I) + B74*F4(I) + B75*F5(I) +
     &          B76*F6(I))
      ENDDO
      CALL DER(T + AL7*DT, F0, F7)
	IF(iSkipCurrentStage.EQ.1) RETURN
      DO I = 1, N
        F0(I) = X(I) + DT*(B81*F1(I) + B85*F5(I) + B86*F6(I) +
     &          B87*F7(I))
      ENDDO
      CALL DER(T + AL4*DT, F0, F2)
	IF(iSkipCurrentStage.EQ.1) RETURN
      DO I = 1, N
        F0(I) = X(I) + DT*(2D0*F1(I) + B94*F4(I) + B95*F5(I) +
     &          B96*F6(I) + B97*F7(I) + 3D0*F2(I))
      ENDDO
      CALL DER(T + AL9*DT, F0, F3)
	IF(iSkipCurrentStage.EQ.1) RETURN
      DO I = 1, N
        X1 = F1(I)
        X4 = F4(I)
        X5 = F5(I)
        X6 = F6(I)
        X7 = F7(I)
        X8 = F2(I)
        X9 = F3(I)
        F2(I) = CH1*X6 + CH2*(X7 + X8) + CH3*X9
        F0(I) = X(I) + DT*(B101*X1 + B104*X4 + B105*X5 + B106*X6 +
     &          B107*X7 + B108*X8 - B32*X9)
        F4(I) = B111*X1 + B114*X4 + B115*X5 + B116*X6 + B117*X7 +
     &          B118*X8 + B119*X9
        F5(I) = B121*X1 + B126*X6 + B127*X7 + B128*(X8 - X9)
        F6(I) = B131*X1 + B114*X4 + B115*X5 + B136*X6 + B137*X7 +
     &          B138*X8 + B139*X9
      ENDDO
      CALL DER(T + ALA*DT, F0, F3)
	IF(iSkipCurrentStage.EQ.1) RETURN
      DO I = 1, N
        F7(I) = X(I) + DT*(F4(I) + B1110*F3(I))
        F0(I) = X(I) + DT*(F5(I) - B126*F3(I))
      ENDDO
      CALL DER(T + DT, F7, F4)
	IF(iSkipCurrentStage.EQ.1) RETURN
      CALL DER(T,  F0, F5)
	IF(iSkipCurrentStage.EQ.1) RETURN
      DO I = 1, N
        F0(I) = X(I) + DT*(F6(I) + B1310*F3(I) + F5(I))
      ENDDO
      CALL DER(T + DT, F0, F6)
	IF(iSkipCurrentStage.EQ.1) RETURN
      X7 = 1D-30
      DO I = 1, N
        F0(I) = X(I)
        X(I) = X(I) + DT*(CH3*F3(I) + CH4*(F5(I) + F6(I)) + F2(I))
        F7(I) = DT*(F1(I) + F4(I) - F5(I) - F6(I))*CH4
        X7 = X7 + (F7(I)/TOL(I))**2
      ENDDO
      X9 = DT
      DT = DT*(25D-4/X7)**625D-4
      IF (X7 .GT. 1D0) THEN
        DO I = 1, N
          X(I) = F0(I)
        ENDDO
        IR1 = IR1 + 1
        GOTO 20
      ENDIF
      T = T + X9
      RETURN
      END
c*******************************************************************************

      subroutine Newton(x1,x2,x3,x4,an,HH,xx)
      implicit double precision (a-h,o-z)
      parameter(pi=3.141592654d0,np=10,jjmax=50,error=1d-6,nu=5)
      dimension ajacob(np,np),f(np),xnew(np),dx(np),xx(np)
      integer indx(np)
!      common /param/ A,B,eps 

      COMMON xxdotflag, NumOfIniSteps, NumOfRKSteps, x3FormulaFlag,
	&	   x2IniFlag, x4IniFlag, MainStepFactor, RK78StepFactor,
	&	   XVarNo, YVarNo, PCalcStatus, x3CalcStatus, X1DotTemp,
     &	   iInternalFormulaIndex, iProgramLocation, iSkipCurrentStage,
	&	   YVarMultFactor, YDotFormulaIndex

	INTEGER xxdotflag, NumOfIniSteps, NumOfRKSteps, x3FormulaFlag
	INTEGER x2IniFlag, x4IniFlag, MainStepFactor, RK78StepFactor
	INTEGER XVarNo, YVarNo, PCalcStatus, x3CalcStatus
	INTEGER iInternalFormulaIndex, iProgramLocation, iSkipCurrentStage
	INTEGER YDotFormulaIndex
	DOUBLE PRECISION X1DotTemp, YVarMultFactor

c --- initialization of arrays ---

      do mm=1,np
        xnew(mm)=0d0
        dx(mm)=0d0
        f(mm)=0d0
        do nn=1,np
           ajacob(mm,nn)=0d0
         enddo
      enddo

        xx(1)=x1
        xx(2)=x2
        xx(3)=x3
	  xx(4)=x4
	  xx(5)=an
c --- implementation of the Newton-Raphson method

      call fasmbl(nu,np,xx,f,bnorm1,x1,x2,x3,x4,HH) 
	  IF(iSkipCurrentStage.EQ.1) RETURN
11    continue    !print *,'Norm =',bnorm1!
      if(bnorm1.lt.error) goto 30
      call aasmbl(nu,np,xx,ajacob)
	  IF(iSkipCurrentStage.EQ.1) RETURN
      call ludcmp(ajacob,nu,np,indx,d)
      call lubksb(ajacob,nu,np,indx,f)
      do k=1,nu
        dx(k)=f(k)
      enddo 
      jj=0
12    do i=1,nu
        xnew(i)=xx(i)+dx(i)/(2**jj)
      enddo
      call fasmbl(nu,np,xnew,f,bnorm2,x1,x2,x3,x4,HH) 
	IF(iSkipCurrentStage.EQ.1) RETURN
      if(bnorm2.lt.bnorm1)then
        bnorm1=bnorm2
        do k=1,nu
          xx(k)=xnew(k)
        enddo
        goto 11
      endif
      jj=jj+1
      if(jj.gt.jjmax)then
c        print *,'change your initial conditions !!'
        goto 40 
      endif
      goto 12 
30    continue     !print *,' answer found ... '
40    continue     ! do kk=1,nu
                   ! print *,kk,xx(kk)
c                    enddo
c      close(2)
      
      return
      end
c   -------------------------------------------------------------------------------------------------    

      SUBROUTINE ludcmp(a,n,np,indx,d)
      IMPLICIT DOUBLE PRECISION (A-H,O-Z)
      INTEGER n,np,indx(n),NMAX
      DIMENSION a(np,np)
      PARAMETER (NMAX=700,TINY=1.d-22)
      DIMENSION vv(NMAX)
      INTEGER i,imax,j,k

	INTEGER ACCESS

      COMMON xxdotflag, NumOfIniSteps, NumOfRKSteps, x3FormulaFlag,
	&	   x2IniFlag, x4IniFlag, MainStepFactor, RK78StepFactor,
	&	   XVarNo, YVarNo, PCalcStatus, x3CalcStatus, X1DotTemp,
     &	   iInternalFormulaIndex, iProgramLocation, iSkipCurrentStage,
	&	   YVarMultFactor, YDotFormulaIndex

	INTEGER xxdotflag, NumOfIniSteps, NumOfRKSteps, x3FormulaFlag
	INTEGER x2IniFlag, x4IniFlag, MainStepFactor, RK78StepFactor
	INTEGER XVarNo, YVarNo, PCalcStatus, x3CalcStatus
	INTEGER iInternalFormulaIndex, iProgramLocation, iSkipCurrentStage
	INTEGER YDotFormulaIndex
	DOUBLE PRECISION X1DotTemp, YVarMultFactor

	INTEGER(4) status

      d=1.d0
      do 12 i=1,n
        aamax=0.d0
        do 11 j=1,n
          if (dabs(a(i,j)).gt.aamax) aamax=dabs(a(i,j))
11      continue
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        IF(aamax.EQ.0.d0) THEN
          !ERROR
          OPEN(unit=20,file='err.msg')
          WRITE(20,*)'Singular matrix in ludcmp in newton method.'
          WRITE(20,*)'Continue or Stop?'
          CLOSE(20);
          status=ACCESS('resume.tmp',' ')
          IF(status.EQ.0) THEN
            OPEN(UNIT=20,FILE='resume.tmp')
            CLOSE(20,STATUS='DELETE')
          END IF
          OPEN(UNIT=20,FILE='cpause.tmp')
          WRITE(20,*)'?'
          CLOSE(20)
          !Check if continue('resume.tmp') or end('end.tmp')
          DOWHILE(.TRUE.)
            status=ACCESS('resume.tmp',' ')
            IF(status.EQ.0) GOTO 100
            status=ACCESS('end.tmp',' ')
            IF(status.EQ.0) THEN
              CLOSE(2)
              IF(xxdotflag.EQ.1) CLOSE(1)
              STOP ''
            END IF
          END DO
          !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        END IF
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
100      vv(i)=1.d0/aamax
12    continue
      do 19 j=1,n
        do 14 i=1,j-1
          sum=a(i,j)
          do 13 k=1,i-1
            sum=sum-a(i,k)*a(k,j)
13        continue
          a(i,j)=sum
14      continue
        aamax=0.d0
        do 16 i=j,n
          sum=a(i,j)
          do 15 k=1,j-1
            sum=sum-a(i,k)*a(k,j)
15        continue
          a(i,j)=sum
          dum=vv(i)*dabs(sum)
          if (dum.ge.aamax) then
            imax=i
            aamax=dum
          endif
16      continue
        if (j.ne.imax)then
          do 17 k=1,n
            dum=a(imax,k)
            a(imax,k)=a(j,k)
            a(j,k)=dum
17        continue
          d=-d
          vv(imax)=vv(j)
        endif
        indx(j)=imax
        if(a(j,j).eq.0.d0)a(j,j)=TINY
        if(j.ne.n)then
          dum=1.d0/a(j,j)
          do 18 i=j+1,n
            a(i,j)=a(i,j)*dum
18        continue
        endif
19    continue
      return
      END

c  -------------------------------------------------------------------------------------

      SUBROUTINE lubksb(a,n,np,indx,b)
      IMPLICIT DOUBLE PRECISION (A-H,O-Z)
      INTEGER n,np,indx(n)
      DIMENSION a(np,np),b(n)
      INTEGER i,ii,j,ll

      ii=0
      do 12 i=1,n
        ll=indx(i)
        sum=b(ll)
        b(ll)=b(i)
        if (ii.ne.0)then
          do 11 j=ii,i-1
            sum=sum-a(i,j)*b(j)
11        continue
        else if (sum.ne.0.) then
          ii=i
        endif
        b(i)=sum
12    continue
      do 14 i=n,1,-1
        sum=b(i)
        do 13 j=i+1,n
          sum=sum-a(i,j)*b(j)
13      continue
        b(i)=sum/a(i,i)
14    continue
      return
      END
c    ----------------------------------------------------------------------------------


      subroutine aasmbl(n,np,xx,ajacob)
      implicit double precision (a-h,o-z)
      dimension xx(np),ajacob(np,np)
!      common /param/ A,B,eps 
c

      COMMON xxdotflag, NumOfIniSteps, NumOfRKSteps, x3FormulaFlag,
	&	   x2IniFlag, x4IniFlag, MainStepFactor, RK78StepFactor,
	&	   XVarNo, YVarNo, PCalcStatus, x3CalcStatus, X1DotTemp,
     &	   iInternalFormulaIndex, iProgramLocation, iSkipCurrentStage,
	&	   YVarMultFactor, YDotFormulaIndex

	INTEGER xxdotflag, NumOfIniSteps, NumOfRKSteps, x3FormulaFlag
	INTEGER x2IniFlag, x4IniFlag, MainStepFactor, RK78StepFactor
	INTEGER XVarNo, YVarNo, PCalcStatus, x3CalcStatus
	INTEGER iInternalFormulaIndex, iProgramLocation, iSkipCurrentStage
	INTEGER YDotFormulaIndex
	DOUBLE PRECISION X1DotTemp, YVarMultFactor

      !do i=1,n
      !  do j=1,n
      !    ajacob(i,j)=0d0
      !  enddo
      !enddo 
c
	  IF(iInternalFormulaIndex.EQ.1) THEN
		!Henon-Heiles Hamiltonian
		ajacob(1,1)=(1+2*xx(2))*xx(5)-2
		ajacob(1,2)=+2*xx(1)*xx(5)
		ajacob(1,3)=0.0d0
		ajacob(1,4)=0.0d0
		ajacob(1,5)=xx(1)+2*xx(1)*xx(2)
		ajacob(2,1)=2*xx(1)*xx(5)
		ajacob(2,2)=(-2*xx(2)+1)*xx(5)-2
		ajacob(2,3)=0.0d0
		ajacob(2,4)=0.0d0
		ajacob(2,5)=-xx(2)**2+xx(1)**2+xx(2)
		ajacob(3,1)=0.0d0
		ajacob(3,2)=0.0d0
		ajacob(3,3)=xx(5)-2
		ajacob(3,4)=0.0d0
		ajacob(3,5)=xx(3)
		ajacob(4,1)=0.0d0
		ajacob(4,2)=0.0d0
		ajacob(4,3)=0.0d0
		ajacob(4,4)=xx(5)-2
		ajacob(4,5)=xx(4)
		ajacob(5,1)=xx(1)+2*xx(1)*xx(2)
		ajacob(5,2)=xx(2)+xx(1)**2-xx(2)**2
		ajacob(5,3)=xx(3)
		ajacob(5,4)=xx(4)
		ajacob(5,5)=0.0d0
	  ELSE IF(iInternalFormulaIndex.EQ.0) THEN

		iProgramLocation = 2

      !Use X1DotTemp as a temp to calculate values

      !ajacob(i,j)=rond(Fi)/rond(xj)
		PCalcStatus=iEvaluateFormula(6,xx(1),xx(2),xx(3),xx(4),
	&	  0.0d0,X1DotTemp)
		IF(iSkipCurrentStage.EQ.1) RETURN
		ajacob(1,1)=xx(5)*X1DotTemp - 2.0d0
		PCalcStatus=iEvaluateFormula(7,xx(1),xx(2),xx(3),xx(4),
	&	  0.0d0,X1DotTemp)
		IF(iSkipCurrentStage.EQ.1) RETURN
		ajacob(1,2)=xx(5)*X1DotTemp
		PCalcStatus=iEvaluateFormula(8,xx(1),xx(2),xx(3),xx(4),
	&	  0.0d0,X1DotTemp)
		IF(iSkipCurrentStage.EQ.1) RETURN
		ajacob(1,3)=xx(5)*X1DotTemp
		PCalcStatus=iEvaluateFormula(9,xx(1),xx(2),xx(3),xx(4),
	&	  0.0d0,X1DotTemp)
		IF(iSkipCurrentStage.EQ.1) RETURN
		ajacob(1,4)=xx(5)*X1DotTemp
       !rond(H)/rond(x1)
		PCalcStatus=iEvaluateFormula(2,xx(1),xx(2),xx(3),xx(4),
	&	  0.0d0,X1DotTemp)
		IF(iSkipCurrentStage.EQ.1) RETURN
		ajacob(1,5)=X1DotTemp
       
		PCalcStatus=iEvaluateFormula(10,xx(1),xx(2),xx(3),xx(4),
	&	  0.0d0,X1DotTemp)
		IF(iSkipCurrentStage.EQ.1) RETURN
		ajacob(2,1)=xx(5)*X1DotTemp
		PCalcStatus=iEvaluateFormula(11,xx(1),xx(2),xx(3),xx(4),
	&	  0.0d0,X1DotTemp)
		IF(iSkipCurrentStage.EQ.1) RETURN
		ajacob(2,2)=xx(5)*X1DotTemp - 2.0d0
		PCalcStatus=iEvaluateFormula(12,xx(1),xx(2),xx(3),xx(4),
	&	  0.0d0,X1DotTemp)
		IF(iSkipCurrentStage.EQ.1) RETURN
		ajacob(2,3)=xx(5)*X1DotTemp
		PCalcStatus=iEvaluateFormula(13,xx(1),xx(2),xx(3),xx(4),
	&	  0.0d0,X1DotTemp)
		IF(iSkipCurrentStage.EQ.1) RETURN
		ajacob(2,4)=xx(5)*X1DotTemp
       !rond(H)/rond(x2)
		PCalcStatus=iEvaluateFormula(3,xx(1),xx(2),xx(3),xx(4),
	&	  0.0d0,X1DotTemp)
		IF(iSkipCurrentStage.EQ.1) RETURN
		ajacob(2,5)=X1DotTemp
       
		PCalcStatus=iEvaluateFormula(14,xx(1),xx(2),xx(3),xx(4),
	&	  0.0d0,X1DotTemp)
		IF(iSkipCurrentStage.EQ.1) RETURN
		ajacob(3,1)=xx(5)*X1DotTemp
		PCalcStatus=iEvaluateFormula(15,xx(1),xx(2),xx(3),xx(4),
	&	  0.0d0,X1DotTemp)
		IF(iSkipCurrentStage.EQ.1) RETURN
		ajacob(3,2)=xx(5)*X1DotTemp
		PCalcStatus=iEvaluateFormula(16,xx(1),xx(2),xx(3),xx(4),
	&	  0.0d0,X1DotTemp)
		IF(iSkipCurrentStage.EQ.1) RETURN
		ajacob(3,3)=xx(5)*X1DotTemp - 2.0d0
		PCalcStatus=iEvaluateFormula(17,xx(1),xx(2),xx(3),xx(4),
	&	  0.0d0,X1DotTemp)
		IF(iSkipCurrentStage.EQ.1) RETURN
		ajacob(3,4)=xx(5)*X1DotTemp
       !rond(H)/rond(x3)
		PCalcStatus=iEvaluateFormula(4,xx(1),xx(2),xx(3),xx(4),
	&	  0.0d0,X1DotTemp)
		IF(iSkipCurrentStage.EQ.1) RETURN
		ajacob(3,5)=X1DotTemp
       
		PCalcStatus=iEvaluateFormula(18,xx(1),xx(2),xx(3),xx(4),
	&	  0.0d0,X1DotTemp)
		IF(iSkipCurrentStage.EQ.1) RETURN
		ajacob(4,1)=xx(5)*X1DotTemp
		PCalcStatus=iEvaluateFormula(19,xx(1),xx(2),xx(3),xx(4),
	&	  0.0d0,X1DotTemp)
		IF(iSkipCurrentStage.EQ.1) RETURN
		ajacob(4,2)=xx(5)*X1DotTemp
		PCalcStatus=iEvaluateFormula(20,xx(1),xx(2),xx(3),xx(4),
	&	  0.0d0,X1DotTemp)
		IF(iSkipCurrentStage.EQ.1) RETURN
		ajacob(4,3)=xx(5)*X1DotTemp
		PCalcStatus=iEvaluateFormula(21,xx(1),xx(2),xx(3),xx(4),
	&	  0.0d0,X1DotTemp)
		IF(iSkipCurrentStage.EQ.1) RETURN
		ajacob(4,4)=xx(5)*X1DotTemp - 2.0d0
       !rond(H)/rond(x4)
		PCalcStatus=iEvaluateFormula(5,xx(1),xx(2),xx(3),xx(4),
	&	  0.0d0,X1DotTemp)
		IF(iSkipCurrentStage.EQ.1) RETURN
		ajacob(4,5)=X1DotTemp
       
		PCalcStatus=iEvaluateFormula(2,xx(1),xx(2),xx(3),xx(4),
	&	  0.0d0,X1DotTemp)
		IF(iSkipCurrentStage.EQ.1) RETURN
		ajacob(5,1)=X1DotTemp
		PCalcStatus=iEvaluateFormula(3,xx(1),xx(2),xx(3),xx(4),
	&	  0.0d0,X1DotTemp)
		IF(iSkipCurrentStage.EQ.1) RETURN
		ajacob(5,2)=X1DotTemp
		PCalcStatus=iEvaluateFormula(4,xx(1),xx(2),xx(3),xx(4),
	&	  0.0d0,X1DotTemp)
		IF(iSkipCurrentStage.EQ.1) RETURN
		ajacob(5,3)=X1DotTemp
		PCalcStatus=iEvaluateFormula(5,xx(1),xx(2),xx(3),xx(4),
	&	  0.0d0,X1DotTemp)
		IF(iSkipCurrentStage.EQ.1) RETURN
		ajacob(5,4)=X1DotTemp
       !rond(F5)/rond(lamda)=0.0d0
		ajacob(5,5)=0.0d0
	  END IF
      RETURN
      END

c  ----------------------------------------------------------------------------------------
      
      subroutine fasmbl(n,np,xx,f,fnorm,x1,x2,x3,x4,HH)
      implicit double precision (a-h,o-z)
      dimension xx(np),f(np)
!      common /param/ A,B,eps

      COMMON xxdotflag, NumOfIniSteps, NumOfRKSteps, x3FormulaFlag,
	&	   x2IniFlag, x4IniFlag, MainStepFactor, RK78StepFactor,
	&	   XVarNo, YVarNo, PCalcStatus, x3CalcStatus, X1DotTemp,
     &	   iInternalFormulaIndex, iProgramLocation, iSkipCurrentStage,
	&	   YVarMultFactor, YDotFormulaIndex

	INTEGER xxdotflag, NumOfIniSteps, NumOfRKSteps, x3FormulaFlag
	INTEGER x2IniFlag, x4IniFlag, MainStepFactor, RK78StepFactor
	INTEGER XVarNo, YVarNo, PCalcStatus, x3CalcStatus
	INTEGER iInternalFormulaIndex, iProgramLocation, iSkipCurrentStage
	INTEGER YDotFormulaIndex
	DOUBLE PRECISION X1DotTemp, YVarMultFactor

	DOUBLE PRECISION ct

	  IF(iInternalFormulaIndex.EQ.1) THEN
		!Henon-Heiles Hamiltonian
		f(1)=(xx(1)+2.0d0*xx(1)*xx(2))*xx(5)-2.0d0*(xx(1)-x1)
		f(2)=(-xx(2)**2.0d0+xx(1)**2.0d0+xx(2))*xx(5)-2.0d0*(xx(2)-x2)
		f(3)=xx(3)*xx(5)-2.0d0*(xx(3)-x3)
		f(4)=xx(4)*xx(5)-2.0d0*(xx(4)-x4)
		ct=xx(3)**2.0d0+xx(4)**2.0d0+xx(1)**2.0d0+xx(2)**2.0d0
		f(5)=0.5d0*ct+xx(2)*xx(1)**2.0d0-xx(2)**3.0d0/3.0d0-HH
	  ELSE IF(iInternalFormulaIndex.EQ.0) THEN

		iProgramLocation = 3

      !Use X1DotTemp as a temp to calculate values

	!f(1)=lamda*rond(H)/rond(x1)-2(x1-x10)
		PCalcStatus=iEvaluateFormula(2,xx(1),xx(2),xx(3),xx(4),
	&	  0.0d0,X1DotTemp)
		IF(iSkipCurrentStage.EQ.1) RETURN
		f(1)=xx(5)*X1DotTemp-2.0d0*(xx(1)-x1)

	!f(2)=lamda*rond(H)/rond(x2)-2(x2-x20)
		PCalcStatus=iEvaluateFormula(3,xx(1),xx(2),xx(3),xx(4),
	&	  0.0d0,X1DotTemp)
		IF(iSkipCurrentStage.EQ.1) RETURN
		f(2)=xx(5)*X1DotTemp-2.0d0*(xx(2)-x2)

	!f(3)=lamda*rond(H)/rond(x3)-2(x3-x30)
		PCalcStatus=iEvaluateFormula(4,xx(1),xx(2),xx(3),xx(4),
	&	  0.0d0,X1DotTemp)
		IF(iSkipCurrentStage.EQ.1) RETURN
		f(3)=xx(5)*X1DotTemp-2.0d0*(xx(3)-x3)

	!f(4)=lamda*rond(H)/rond(x4)-2(x4-x40)
		PCalcStatus=iEvaluateFormula(5,xx(1),xx(2),xx(3),xx(4),
	&      0.0d0,X1DotTemp)
		IF(iSkipCurrentStage.EQ.1) RETURN
		f(4)=xx(5)*X1DotTemp-2.0d0*(xx(4)-x4)

	!f(5)=H-HH
		PCalcStatus=iEvaluateFormula(1,xx(1),xx(2),xx(3),xx(4),
	&      0.0d0,X1DotTemp)
		IF(iSkipCurrentStage.EQ.1) RETURN
		f(5)=X1DotTemp-HH
	  END IF

        fnorm=0d0
       do k=1,n
        fnorm=fnorm+f(k)**2.0d0
      enddo
      fnorm=dsqrt(fnorm)
      return
      end
c-------------------------------------------------------------------------------------------.
c--------  THIS SECTION IS ADDED FOR EXPRESSION PARSER  ---------
c-------------------------------------------------------------------------------------------.

c       subroutine InitializeExpressionParser
c         COMMON /PARSER/ Formulas
c         CHARACTER VariableNames(5)*2
c         INTEGER i
c         VariableNames(1)='x1'
c         VariableNames(2)='x2'
c         VariableNames(3)='x3'
c         VariableNames(4)='x4'
c         VariableNames(5)='hh'
c         call initf(18)
c         do i=1,18
c           call parsef(i,Formulas(i),VariableNames)
c         end do
c         return
c       end
	
c-------------------------------------------------------------------------------------------.

       INTEGER FUNCTION iEvaluateFormula(FIndex,x1,x2,x3,x4,hh,Result)
       !Output: 0= No Error
       !        >0 = Error Code as follows:
       !???
         USE parameters, ONLY: rn
	   USE fparser
         DOUBLE PRECISION x1,x2,x3,x4,hh,Result

	!  iProgramLocation Values:
	!	  0: Main program block
	!	  1: Into forces
	!	  2: Into aasmbl
	!	  3: Into fasmbl
	!	  4: Into iCalculateX3

	  INTEGER(4) ACCESS
        INTEGER FIndex

      COMMON xxdotflag, NumOfIniSteps, NumOfRKSteps, x3FormulaFlag,
	&	   x2IniFlag, x4IniFlag, MainStepFactor, RK78StepFactor,
	&	   XVarNo, YVarNo, PCalcStatus, x3CalcStatus, X1DotTemp,
     &	   iInternalFormulaIndex, iProgramLocation, iSkipCurrentStage,
	&	   YVarMultFactor, YDotFormulaIndex

	INTEGER xxdotflag, NumOfIniSteps, NumOfRKSteps, x3FormulaFlag
	INTEGER x2IniFlag, x4IniFlag, MainStepFactor, RK78StepFactor
	INTEGER XVarNo, YVarNo, PCalcStatus, x3CalcStatus
	INTEGER iInternalFormulaIndex, iProgramLocation, iSkipCurrentStage
	INTEGER YDotFormulaIndex
	DOUBLE PRECISION X1DotTemp, YVarMultFactor

	  DOUBLE PRECISION VariableValues(5)
	  INTEGER(4) status
         VariableValues(1)=x1
         VariableValues(2)=x2
         VariableValues(3)=x3
         VariableValues(4)=x4
         VariableValues(5)=hh

         Result=evalf(FIndex,VariableValues)
C        Error Checking: IF (EvalErrType > 0) WRITE(*,*)'*** Error: ',EvalErrMsg ()
	  IF(EvalErrType > 0) THEN
          !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          !ERROR
		iSkipCurrentStage = 1
		iEvaluateFormula = EvalErrType
		IF(iProgramLocation.EQ.4) RETURN

          !Send error message
          OPEN(UNIT=20,FILE='err.msg')
          WRITE(20,*)'Calculation math error'
          WRITE(20,*)'Continue or Stop?'
          CLOSE(20)
          status=ACCESS('resume.tmp',' ')
          IF(status.EQ.0) THEN
            OPEN(UNIT=20,FILE='resume.tmp')
            CLOSE(20,STATUS='DELETE')
          END IF
          OPEN(UNIT=20,FILE='cpause.tmp')
          WRITE(20,*)'?'
          CLOSE(20)
          !Check if continue('resume.tmp') or end('end.tmp')
          DOWHILE(.TRUE.)
            status=ACCESS('resume.tmp',' ')
            IF(status.EQ.0) RETURN
            status=ACCESS('end.tmp',' ')
            IF(status.EQ.0) THEN
              CLOSE(2)
              IF(xxdotflag.EQ.1) CLOSE(1)
              STOP ''
            END IF
          END DO
          !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	  END IF
	  iSkipCurrentStage = 0
	  iEvaluateFormula=0  !Indicate no error
        RETURN
	END
       
c-------------------------------------------------------------------------------------------.

      INTEGER FUNCTION iCalculateX3(x1,x2,x4,HH,x3)
        DOUBLE PRECISION x1,x2,x4,HH,x3
!       function CalculateX3
!       This function calculates the unknown X3 using numerical methods or a specified formula.
!       output: =0 :Successful ,result in x3
!               >0 :Unable to calculate x3

	  PARAMETER(MAX_NUM_OF_ITERATIONS = 2000000)
	  DOUBLE PRECISION CalculationPrecision,LastFoundRoot
	  DOUBLE PRECISION RootTemp, X3Temp1, X3Temp2
	  INTEGER(4) Index
	  LOGICAL LastRootAvailable
	  STATIC :: LastFoundRoot,LastRootAvailable
	  INTEGER iCalcStatus

      COMMON xxdotflag, NumOfIniSteps, NumOfRKSteps, x3FormulaFlag,
	&	   x2IniFlag, x4IniFlag, MainStepFactor, RK78StepFactor,
	&	   XVarNo, YVarNo, PCalcStatus, x3CalcStatus, X1DotTemp,
     &	   iInternalFormulaIndex, iProgramLocation, iSkipCurrentStage,
	&	   YVarMultFactor, YDotFormulaIndex

	INTEGER xxdotflag, NumOfIniSteps, NumOfRKSteps, x3FormulaFlag
	INTEGER x2IniFlag, x4IniFlag, MainStepFactor, RK78StepFactor
	INTEGER XVarNo, YVarNo, PCalcStatus, x3CalcStatus
	INTEGER iInternalFormulaIndex, iProgramLocation, iSkipCurrentStage
	INTEGER YDotFormulaIndex
	DOUBLE PRECISION X1DotTemp, YVarMultFactor

	  !It is not necessary to check iSkipCurrentStage in this function because
	  ! it is checked indirectly as iCalculateX3 in the main program block.

	  iProgramLocation = 4

        IF(x3FormulaFlag.NE.0) then
          !Calculate x3 using the specified formula
          iCalcStatus=iEvaluateFormula(22,x1,x2,0.0d0,x4,HH,x3)
          iCalculateX3=iCalcStatus
        ELSE
          !Calculate x3 using numerical methods
          !x3=2.d0*HH-x2**2-x4**2+2.d0*x2**3/3.d0
	    !Calculate unknown variable using Newton-Raphson method
	    CalculationPrecision = EPSILON(CalculationPrecision)
	    IF(LastRootAvailable) then
	      RootTemp = LastFoundRoot
	    ELSE
	      RootTemp = HH
	    END IF
          iCalculateX3 = 1
		LastRootAvailable = .FALSE.

	    DO Index = 1,MAX_NUM_OF_ITERATIONS
	      iCalcStatus = iEvaluateFormula(1,x1,x2,RootTemp,x4,0.0d0,
	&	  X3Temp1)
		  IF(iSkipCurrentStage.EQ.1) RETURN
	      iCalcStatus = iEvaluateFormula(4,x1,x2,RootTemp,x4,0.0d0,
	&	  X3Temp2)
      	  IF(iSkipCurrentStage.EQ.1) RETURN
		  IF(X3Temp2.EQ.0.0d0) THEN
			RETURN
		  END IF
	      X3Temp1 = RootTemp - (X3Temp1 - HH) / X3Temp2
		  IF((DABS(RootTemp - X3Temp1)).LE.CalculationPrecision) THEN
			LastRootAvailable = .TRUE.
			LastFoundRoot = X3Temp1
			x3 = X3Temp1
			iCalculateX3 = 0
			RETURN
		  END IF
		  RootTemp = X3Temp1
	    END DO
        END IF
        RETURN
      END

c-------------------------------------------------------------------------------------------.

	!Runtime math error handling
	SUBROUTINE MATHERRQQ( name, length, info, retcode)
	USE MSFLIB
	INTEGER(2) length, retcode
	CHARACTER(length) name
	RECORD /MTH$E_INFO/ info

        !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        !Send error message and terminate the program
	  OPEN(UNIT=20,FILE='err.msg')
        WRITE(20,*)'An invalid floating point operation occurred.',
	&	' Calculation stopped.'
	  CLOSE(20)
        OPEN(UNIT=20,FILE='cpause.tmp')
        WRITE(20,*)'?'
        CLOSE(20)
	  CALL SLEEP(3)	!Delay for 3 seconds
        !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	  retcode = 0 !Return with error to terminate the program
	END

c-------------------------------------------------------------------------------------------.

	!Runtime floating point exception handling
	! Establish the name of the exception handler as the
	! function to be invoked if an exception happens. 
	! The exception handler hand_fpe is attached below.

	! Exception handler routine hand_fpe
	FUNCTION hand_fpe (signum, excnum)
	!MS$ATTRIBUTES C :: hand_fpe
	INTEGER(2)  signum, excnum

        !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        !Send error message and terminate the program
	  OPEN(UNIT=20,FILE='err.msg')
        WRITE(20,*)'An invalid floating point operation occurred.',
	&	' Calculation stopped.'
	  CLOSE(20)
        OPEN(UNIT=20,FILE='cpause.tmp')
        WRITE(20,*)'?'
        CLOSE(20)
	  CALL SLEEP(3)	!Delay for 3 seconds
        !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	  hand_fpe = 1
	END

c-------------------------------------------------------------------------------------------.

	SUBROUTINE FlushStatus
	  REAL(8) , STATIC :: Old_Flush_Time /0.0d0/
	  REAL(8) Temp
	  PARAMETER(MIN_FLUSH_DELAY_SCNDS = 3.0d0)
	  !Flush the file to disk every 3 seconds
	  REAL(8) TIMEF

	  Temp = TIMEF()
	  IF((Old_Flush_Time - Temp).GE.MIN_FLUSH_DELAY_SCNDS) THEN
		CALL FLUSH(10)	!10 is the unit number of the file status.tmp.
		Old_Flush_Time = TIMEF()
	  END IF
	END