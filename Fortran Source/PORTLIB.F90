!***************************************************************************
!*
!* Fortran 90 Module: PORTLIB.F90
!*
!* This module provides interface descriptions for the routines
!* in the Microsoft Fortran PortLib Library.
!*
!* Copyright (c) 1995  Microsoft Corporation
!*
!***************************************************************************

module portlib

!****
!**** Bessel functions
!****

interface
  real(4) function besj0(x)
    real(4) x
  end function

  real(8) function dbesj0(x)
    real(8) x
  end function

  real(4) function besj1(x)
    real(4) x
  end function

  real(8) function dbesj1(x)
    real(8) x
  end function

  real(4) function besjn(n,x)
    integer(4) n
    real(4) x
  end function

  real(8) function dbesjn(n,x)
    real(8) x
    integer(4) n
  end function

  real(4) function besy0(x)
    real(4) x
  end function

  real(8) function dbesy0(x)
    real(8) x
  end function

  real(4) function besy1(x)
    real(4) x
  end function

  real(8) function dbesy1(x)
    real(8) x
  end function

  real(4) function besyn(n,x)
    integer(4) n
    real(4) x
  end function

  real(8) function dbesyn(n,x)
    real(8) x
    integer(4) n
  end function
end interface

!****
!**** ierrno Error routines
!**** 

integer(4), parameter :: EPERM = 1	! Insufficient Permission for Operation
integer(4), parameter :: ENOENT = 2	! No Such File or Directory
integer(4), parameter :: ESRCH = 3	! No Such Process
integer(4), parameter :: E2BIG = 7	! Argument List Too Long
integer(4), parameter :: ENOEXEC = 8	! File Is Not Executable
integer(4), parameter :: ENOMEM = 12	! Not Enough Resources
integer(4), parameter :: EACCES = 13	! Permission Denied
integer(4), parameter :: EXDEV = 18	! Cross Device Link
integer(4), parameter :: ENOTDIR = 20	! Not a Directory
integer(4), parameter :: EINVAL = 22	! Invalid Argument

integer(4), parameter :: MAX_GERROR_LENGTH = 37

interface
  integer(4) function ierrno()
  end function

  subroutine gerror( str )
    character(len=*) str
  end subroutine

  subroutine perror( str )
    character(len=*) str 
  end subroutine
end interface

!****
!**** Date and Time routines
!****

interface
  character(len=8) function clock()
  end function

  subroutine idate( iarray )
    integer(4) iarray(3)
  end subroutine

  real(8) function rtc()
  end function

  real(4) function secnds( offset )
    real(4) offset
  end function

  character(len=24) function ctime( stime )
    integer(4) stime
  end function

  character(len=24) function fdate()
  end function

  subroutine gmtime( stime, tarray )
    integer(4) stime, tarray(9)
  end subroutine

  subroutine ltime( stime, tarray )
    integer(4) stime, tarray(9)
  end subroutine

  character(len=8) function jdate()
  end function

  real(4) function dtime(tarray)
    real(4) tarray(2)
  end function

  real(4) function etime(tarray)
    real(4) tarray(2)
  end function

  subroutine itime( iarray )
    integer(4) iarray(3)
  end subroutine

  real(8) function timef()
  end function
end interface

interface time
  integer(4) function $$msportlib$time()
!MS$ATTRIBUTES alias:'_TIME@0' :: $$msportlib$time
  end function
  subroutine $$msportlib$time$s( string )
!MS$ATTRIBUTES alias:'_TIME@8' :: $$msportlib$time$s
    character(len=8) string
  end subroutine
end interface

interface date
  character(len=8) function $$msportlib$date()
!MS$ATTRIBUTES alias:'_DATE@8' :: $$msportlib$date
  end function
  subroutine $$msportlib$date$s( string )
!MS$ATTRIBUTES alias:'_DATE@8' :: $$msportlib$date$s
    character(len=9) string
  end subroutine
end interface

!****
!**** File System 
!****

! Bits for 'mode' (stat(3))
integer(4), parameter :: S_IFMT   = 8#0170000
integer(4), parameter :: S_IFDIR  = 8#0040000
integer(4), parameter :: S_IFCHR  = 8#0020000 
integer(4), parameter :: S_IFBLK  = 8#0060000 
integer(4), parameter :: S_IFREG  = 8#0100000 
integer(4), parameter :: S_IFLNK  = 8#0120000
integer(4), parameter :: S_IFSOCK = 8#0140000 
integer(4), parameter :: S_ISUID  = 8#0004000 
integer(4), parameter :: S_ISGID  = 8#0002000 
integer(4), parameter :: S_ISVTX  = 8#0001000 
integer(4), parameter :: S_IRWXU  = 8#0000700 
integer(4), parameter :: S_IRUSR  = 8#0000400 
integer(4), parameter :: S_IREAD  = 8#0000400 
integer(4), parameter :: S_IWUSR  = 8#0000200 
integer(4), parameter :: S_IWRITE = 8#0000200 
integer(4), parameter :: S_IXUSR  = 8#0000100 
integer(4), parameter :: S_IEXEC  = 8#0000100 
integer(4), parameter :: S_IRWXG  = 8#0000070 
integer(4), parameter :: S_IRGRP  = 8#0000040 
integer(4), parameter :: S_IWGRP  = 8#0000020 
integer(4), parameter :: S_IXGRP  = 8#0000010 
integer(4), parameter :: S_IRWXO  = 8#0000007 
integer(4), parameter :: S_IROTH  = 8#0000004 
integer(4), parameter :: S_IWOTH  = 8#0000002 
integer(4), parameter :: S_IXOTH  = 8#0000001 

integer(4), parameter :: MAX_GETCWD_LENGTH = 260

interface 
  integer(4) function chmod( fname, mode )
    character(len=*) fname, mode
  end function

  integer(4) function access( fname, mode )
    character(len=*) fname, mode
  end function

  integer(4) function rename( from, to )
    character(len=*) from, to
  end function

  integer(4) function unlink( file )
    character(len=*) file
  end function

  integer(4) function chdir( dirname )
    character(len=*) dirname
  end function

  integer(4) function getcwd( dirname )
    character(len=*) dirname
  end function

  integer(4) function lstat( name, statb )
    character(len=*) name
    integer(4) statb(12)
  end function

  integer(4) function stat( name, statb )
    character(len=*) name
    integer(4) statb(12)
  end function
end interface

!****
!**** Bit Manipulation
!****

interface
  subroutine bic( bitnum, target )
    integer(4) bitnum, target
  end subroutine

  subroutine bis( bitnum, target )
    integer(4) bitnum, target
  end subroutine

  logical(4) function bit( bitnum, target )
    integer(4) bitnum, target
  end function
end interface 

!****
!**** Type conversion
!****

interface
  integer(2) function short( i )
    integer(4) i
  end function

  integer(4) function long( i )
    integer(2) i
  end function
end interface
  
!****
!**** Process Environment 
!****

integer(4), parameter :: MAX_HOSTNAM_LENGTH = 40

integer(4), parameter :: MAX_GETLOG_LENGTH = 20

interface
  integer(4) function getgid()
  end function

  integer(4) function getuid()
  end function

  integer(4) function getpid()
  end function

  integer(4) function iargc()
  end function

  integer(4) function hostnam( name )
    character(len=*) name
  end function

  subroutine getlog( name )
    character(len=*) name
  end subroutine

  subroutine getenv( variable, string )
    character(len=*) variable, string
  end subroutine
end interface

!****
!**** String Manipulation
!****
  
interface
  integer(4) function lnblnk( string )
    character(len=*) string
  end function

  integer(4) function rindex( string, substr )
    character(len=*) string, substr
  end function
end interface

!****
!**** Quick Sort
!****

! Qsort can take ANY type for the type of 'array', but because of 
! Fortran 90's strict rules about data typing, you need to declare
! each type you wish to use.  Included here are declarations for all
! the intrinsic data types.  To add a data type, overload the generic
! interface 'qsort' with your own data type, just as was done below. 
!
! For example, if you wanted to sort an array of type(foo), you would
! include the following in your program:
!
!      module goo
!        use portlib
!        type foo 
!          integer a, b
!        end type
!        interface qsort
!          subroutine qsort_typefoo( array, len, isize, compar )
!            !ms$attributes alias:'_QSORT@16' :: qsort_typefoo
!            !* NOTE you must either include another copy of the declaration
!            !* for foo here, or place foo in a separate module and USE
!            !* here and in module goo.  This is because Fortran 90 does
!            !* allow a declaration from outside the interface to be seen.
!            type foo
!              integer a, b
!            end type
!            type(foo) array(*)
!            integer len, isize
!            integer(2), external :: compar
!          end subroutine
!        end interface
!      contains
!        ! ... you can use qsort with type(foo) in here ...
!      end module

interface qsort
  subroutine $$msportlib$qsorti1( array, len, isize, compar )
    !ms$attributes alias:'_QSORT@16' :: $$msportlib$qsorti1
    integer(1) array(*); integer len, isize; integer(2), external :: compar
  end subroutine
  subroutine $$msportlib$qsorti2( array, len, isize, compar )
    !ms$attributes alias:'_QSORT@16' :: $$msportlib$qsorti2
    integer(2) array(*); integer len, isize; integer(2), external :: compar
  end subroutine
  subroutine $$msportlib$qsorti4( array, len, isize, compar )
    !ms$attributes alias:'_QSORT@16' :: $$msportlib$qsorti4
    integer(4) array(*); integer len, isize; integer(2), external :: compar
  end subroutine
  subroutine $$msportlib$qsortr4( array, len, isize, compar )
    !ms$attributes alias:'_QSORT@16' :: $$msportlib$qsortr4
    real(4) array(*); integer len, isize; integer(2), external :: compar
  end subroutine
  subroutine $$msportlib$qsortr8( array, len, isize, compar )
    !ms$attributes alias:'_QSORT@16' :: $$msportlib$qsortr8
    real(8) array(*); integer len, isize; integer(2), external :: compar
  end subroutine
  subroutine $$msportlib$qsortc4( array, len, isize, compar )
    !ms$attributes alias:'_QSORT@16' :: $$msportlib$qsortc4
    complex(4) array(*); integer len, isize; integer(2), external :: compar
  end subroutine
  subroutine $$msportlib$qsortc8( array, len, isize, compar )
    !ms$attributes alias:'_QSORT@16' :: $$msportlib$qsortc8
    complex(8) array(*); integer len, isize; integer(2), external :: compar
  end subroutine
  subroutine $$msportlib$qsortl1( array, len, isize, compar )
    !ms$attributes alias:'_QSORT@16' :: $$msportlib$qsortl1
    logical(1) array(*); integer len, isize; integer(2), external :: compar
  end subroutine
  subroutine $$msportlib$qsortl2( array, len, isize, compar )
    !ms$attributes alias:'_QSORT@16' :: $$msportlib$qsortl2
    logical(2) array(*); integer len, isize; integer(2), external :: compar
  end subroutine
  subroutine $$msportlib$qsortl4( array, len, isize, compar )
    !ms$attributes alias:'_QSORT@16' :: $$msportlib$qsortl4
    logical(4) array(*); integer len, isize; integer(2), external :: compar
  end subroutine
  subroutine $$msportlib$qsortchar( array, len, isize, compar )
    ! NOTE the 20 in the following line, because of the hidden length arg
    !ms$attributes alias:'_QSORT@20' :: $$msportlib$qsortchar    
    character(*) array(*); integer len, isize; integer(2), external :: compar
  end subroutine
end interface

!****
!**** Stream I/O
!****

integer(4), parameter :: SEEK_SET = 0 
integer(4), parameter :: SEEK_CUR = 1 
integer(4), parameter :: SEEK_END = 2 

interface 
  integer(4) function fseek( unit, position, seekfrom )
    integer(4) unit, position, seekfrom
  end function

  integer(4) function fgetc( unit, char )
    integer(4) unit
    character char
  end function

  integer(4) function getc( char )
    character char
  end function

  integer(4) function fputc( unit, char )
    integer(4) unit
    character char
  end function

  integer(4) function putc( char )
    character char
  end function

  integer(4) function ftell( unit )
    integer(4) unit
  end function

  subroutine flush( unit )
    integer(4) unit
  end subroutine

  integer(4) function fstat( unit, statb )
    integer(4) unit
    integer(4) statb(12)
  end function

end interface

!****
!**** Random numbers
!****

interface random
  real(4) function $$msportlib$random( iflag )
!MS$ATTRIBUTES ALIAS:'_$$MSPORTLIB$RANDOM@4' :: $$msportlib$random
    integer(4) iflag
  end function
end interface

interface
  integer(4) function irandm( iflag )
    integer(4) iflag
  end function

  real(8) function drand( iflag )
    integer(4) iflag
  end function

  real(8) function drandm( iflag )
    integer(4) iflag
  end function

  real(4) function ran( seed )
    integer(4) seed
  end function
end interface

interface rand
  real(4) function $$msportlib$rand$i( iflag )
!MS$ATTRIBUTES alias:'_RAND@4' :: $$msportlib$rand$i
    integer(4) iflag
  end function
  real(4) function $$msportlib$rand()
!MS$ATTRIBUTES alias:'_RAND@0' :: $$msportlib$rand
  end function
end interface

interface irand
  real(4) function $$msportlib$irand$i( iflag )
!MS$ATTRIBUTES alias:'_IRAND@4' :: $$msportlib$irand$i
    integer(4) iflag
  end function
  real(4) function $$msportlib$irand()
!MS$ATTRIBUTES alias:'_IRAND@0' :: $$msportlib$irand
  end function
end interface

interface srand
  subroutine $$msportlib$srand$i( iseed )
!MS$ATTRIBUTES alias:'_SRAND@4' :: $$msportlib$srand$i
    integer(4) iseed
  end subroutine
  subroutine $$msportlib$srand$r( rseed )
!MS$ATTRIBUTES alias:'_SRAND@4' :: $$msportlib$srand$r
    real(4) rseed
  end subroutine
end interface

!****
!**** Process control
!****

integer(4), parameter :: SIGABRT = 6	! Abnormal termination
integer(4), parameter :: SIGFPE = 8	! Floating Point error
integer(4), parameter :: SIGILL = 4	! Illegal instruction
integer(4), parameter :: SIGINT = 2	! CTRL+C signal
integer(4), parameter :: SIGKILL = 9	! Kill Process
integer(4), parameter :: SIGTERM = 15	! Termination request
integer(4), parameter :: SIGSEGV = 11	! Illegal storage access

interface
  integer(4) function signal( signum, proc, flag )
    integer(4) signum, flag
    external proc
  end function

  integer(4) function kill( pid, signum )
    integer(4) pid, signum
  end function

  integer(4) function alarm( time, proc )
    integer(4) time
    external proc
  end function

  integer(4) function system( command )
    character(len=*) command
  end function

  subroutine sleep( n )
    integer(4) n
  end subroutine
end interface

interface abort
  subroutine $$msportlib$abort
!MS$ATTRIBUTES alias:'_ABORT@0' :: $$msportlib$abort
  end subroutine
  subroutine $$msportlib$abort$s( string )
!MS$ATTRIBUTES alias:'_ABORT@8' :: $$msportlib$abort$s
    character(len=*) string
  end subroutine
end interface
  
end module portlib

!***************************************************************************
!* End of module portlib
!***************************************************************************
