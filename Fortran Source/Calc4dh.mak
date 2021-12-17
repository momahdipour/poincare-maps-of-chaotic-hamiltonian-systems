# Microsoft Developer Studio Generated NMAKE File, Format Version 4.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

!IF "$(CFG)" == ""
CFG=Calc4dh - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to Calc4dh - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "Calc4dh - Win32 Release" && "$(CFG)" !=\
 "Calc4dh - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "Calc4dh.mak" CFG="Calc4dh - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "Calc4dh - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "Calc4dh - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 
################################################################################
# Begin Project
F90=fl32.exe
RSC=rc.exe

!IF  "$(CFG)" == "Calc4dh - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
OUTDIR=.
INTDIR=.

ALL : "$(OUTDIR)\Calc4dh.exe"

CLEAN : 
	-@erase ".\Calc4dh.exe"
	-@erase ".\Calc4dh.obj"
	-@erase ".\PORTLIB.OBJ"
	-@erase ".\parameters.obj"
	-@erase ".\FPARSER.OBJ"

# ADD BASE F90 /Ox /c /nologo
# ADD F90 /Ox /c /nologo
F90_PROJ=/Ox /c /nologo 
# ADD BASE RSC /l 0x429 /d "NDEBUG"
# ADD RSC /l 0x429 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/Calc4dh.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:console /machine:I386
LINK32_FLAGS=kernel32.lib /nologo /subsystem:console /incremental:no\
 /pdb:"$(OUTDIR)/Calc4dh.pdb" /machine:I386 /out:"$(OUTDIR)/Calc4dh.exe" 
LINK32_OBJS= \
	"$(INTDIR)/Calc4dh.obj" \
	"$(INTDIR)/PORTLIB.OBJ" \
	"$(INTDIR)/parameters.obj" \
	"$(INTDIR)/FPARSER.OBJ"

"$(OUTDIR)\Calc4dh.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Calc4dh - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
OUTDIR=.
INTDIR=.

ALL : "$(OUTDIR)\Calc4dh.exe"

CLEAN : 
	-@erase ".\Calc4dh.exe"
	-@erase ".\Calc4dh.obj"
	-@erase ".\PORTLIB.OBJ"
	-@erase ".\parameters.obj"
	-@erase ".\FPARSER.OBJ"
	-@erase ".\Calc4dh.ilk"
	-@erase ".\Calc4dh.pdb"

# ADD BASE F90 /Zi /c /nologo
# ADD F90 /Zi /c /nologo
F90_PROJ=/Zi /c /nologo /Fd"Calc4dh.pdb" 
# ADD BASE RSC /l 0x429 /d "_DEBUG"
# ADD RSC /l 0x429 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/Calc4dh.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:console /debug /machine:I386
LINK32_FLAGS=kernel32.lib /nologo /subsystem:console /incremental:yes\
 /pdb:"$(OUTDIR)/Calc4dh.pdb" /debug /machine:I386 /out:"$(OUTDIR)/Calc4dh.exe" 
LINK32_OBJS= \
	"$(INTDIR)/Calc4dh.obj" \
	"$(INTDIR)/PORTLIB.OBJ" \
	"$(INTDIR)/parameters.obj" \
	"$(INTDIR)/FPARSER.OBJ"

"$(OUTDIR)\Calc4dh.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 

.for.obj:
   $(F90) $(F90_PROJ) $<  

.f.obj:
   $(F90) $(F90_PROJ) $<  

.f90.obj:
   $(F90) $(F90_PROJ) $<  

################################################################################
# Begin Target

# Name "Calc4dh - Win32 Release"
# Name "Calc4dh - Win32 Debug"

!IF  "$(CFG)" == "Calc4dh - Win32 Release"

!ELSEIF  "$(CFG)" == "Calc4dh - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\Calc4dh.for
DEP_F90_CALC4=\
	".\parameters.mod"\
	".\fparser.mod"\
	".\PORTLIB.mod"\
	

"$(INTDIR)\Calc4dh.obj" : $(SOURCE) $(DEP_F90_CALC4) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\PORTLIB.F90

!IF  "$(CFG)" == "Calc4dh - Win32 Release"

F90_MODOUT=\
	"portlib"


"$(INTDIR)\PORTLIB.OBJ" : $(SOURCE) "$(INTDIR)"
   $(F90) $(F90_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Calc4dh - Win32 Debug"

F90_MODOUT=\
	"portlib"


"$(INTDIR)\PORTLIB.OBJ" : $(SOURCE) "$(INTDIR)"
   $(F90) $(F90_PROJ) $(SOURCE)


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\parameters.f90

!IF  "$(CFG)" == "Calc4dh - Win32 Release"

F90_MODOUT=\
	"parameters
"


"$(INTDIR)\parameters.obj" : $(SOURCE) "$(INTDIR)"
   $(F90) $(F90_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Calc4dh - Win32 Debug"

F90_MODOUT=\
	"parameters
"


"$(INTDIR)\parameters.obj" : $(SOURCE) "$(INTDIR)"
   $(F90) $(F90_PROJ) $(SOURCE)


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\FPARSER.F90
NODEP_F90_FPARS=\
	".\parameters.mod"\
	

!IF  "$(CFG)" == "Calc4dh - Win32 Release"

F90_MODOUT=\
	"fparser
"


"$(INTDIR)\FPARSER.OBJ" : $(SOURCE) "$(INTDIR)"
   $(F90) $(F90_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "Calc4dh - Win32 Debug"

F90_MODOUT=\
	"fparser
"


"$(INTDIR)\FPARSER.OBJ" : $(SOURCE) "$(INTDIR)"
   $(F90) $(F90_PROJ) $(SOURCE)


!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
