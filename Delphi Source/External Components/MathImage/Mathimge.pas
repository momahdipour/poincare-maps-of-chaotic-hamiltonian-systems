unit MathImge;

interface

uses
  SysUtils, Winprocs, WinTypes,Messages, Classes, Graphics,
  Controls, Forms, Dialogs;



type

{: <New topic=MAIN@Mathimage Main>
   <B=Mathimage Component, version 5.0><par><par>
   <B=Author: Renate Schaaf><par>
   renates@xmission.com<par>
   schaaf@math.usu.edu<par> <par>
   For info and upgrades see<par>
   http://www.xmission.com/~renates/delphi.html<par><par>
   <B=Component unit:> MathImge.pas<par>
   <B=Delphi versions:> 1-5, but 1-3 have not been tested very much.
   <par>
   <B=License:> The use of the component is free for educational, academic
   or noncommercial applications. For more details read the file MathImge.txt which
   comes with the component.<par> <par>
   <See=Overview><par>
   <See=Thanks>
}
{: <New topic=Overview@Overview>
   <B=Overview>

   <See class=TMathImage> is a component which helps displaying mathematical graphics
   objects in 2 or 3 dimensions. It used to be derived from TImage (hence the name),
   but is now a descendant of TGraphicControl, for better flexibility and better control
   of drawing speed. The component implements many TCanvas-drawing routines under similar
   names, but you can pass the coordinates as float types (world coordinates). Below is a
   selection of drawing routines:
   <Par>
   <LI=<See method=TMathImage@DrawLineTo> >
   <LI=<See method=TMathImage@MoveToPoint> >
   <LI=<See method=TMathImage@DrawLine> >
   <LI=<See method=TMathImage@DrawPoint> >
   <LI=<See method=TMathImage@DrawPolyline> >
   <LI=<See method=TMathImage@d3DrawLineTo> >
   <LI=<See method=TMathImage@d3MoveToPoint> >
   <LI=<See method=TMathImage@d3DrawLine> >
   <LI=<See method=TMathImage@d3PolyLine> >
   <LI=<See method=TMathImage@d3DrawSurface> >
   <LI=<See method=TMathImage@d3DrawLitSurface> >
   <Par>
   To set the world-to-pixel scalings, use the following methods
   at run time:
   <Par>
   <LI=<See method=TMathImage@SetWorld> >
   <LI=<See method=TMathImage@d3SetWorld> >
   <Par>
   The world bounds and more world settings can also be set
   using the following properties:
   <Par>
   <LI=<See property=TMathImage@d2WorldX1> >
   <LI=<See property=TMathImage@d2WorldXW> >
   <LI=<See property=TMathImage@d2WorldY1> >
   <LI=<See property=TMathImage@d2WorldYW> >
   <LI=<See property=TMathImage@d3WorldX1> >
   <LI=<See property=TMathImage@d3WorldXW> >
   <LI=<See property=TMathImage@d3WorldY1> >
   <LI=<See property=TMathImage@d3WorldYW> >
   <LI=<See property=TMathImage@d3WorldZ1> >
   <LI=<See property=TMathImage@d3WorldZW> >
   <LI=<See property=TMathImage@d3ViewDist> >
   <LI=<See property=TMathImage@d3ViewAngle> >
   <LI=<See property=TMathImage@d3ZRotation> >
   <LI=<See property=TMathImage@d3YRotation> >
   <LI=<See property=TMathImage@d3AspectRatio> >
   <LI=<See property=TMathImage@d3XScale> >
   <LI=<See property=TMathImage@d3YScale> >
   <LI=<See property=TMathImage@d3ZScale> >
   <Par>
   For an explanation of how D-3-graphics is implemented, see
   <see=D3_Graphics_Explanation>.
   <Par>
   TMathimage also has a <see property=TMathimage@Canvas> property, which you can use to
   add to the drawing using all (pixel) routines of TCanvas. To translate between world and
   pixel coordinates, use the routines
   <Par>
   <LI=<See method=TMathImage@WindowX> >
   <LI=<See method=TMathImage@WindowY> >
   <LI=<See method=TMathImage@WorldX> >
   <LI=<See method=TMathImage@WorldY> >
   <LI=<See method=TMathImage@d3Window> >
   <Par>
   For convenient loading, saving, etc., TMathImage has a <see property=TMAthImage@Bitmap>
   property. The bitmap holds the current drawing. (TMathimage.Canvas is actually
   TMathImage.Bitmap.Canvas).
   <Par>
   Use the <see property=TMAthImage@Brush> and <see property=TMathImage@Pen>
   properties of TMathImage to set drawing- and fill- colors and -styles.
   Use the <see property=TMathImage@Font> property to set the font used for
   labelling axes and for TMathImage.Canvas.TextOut.
   <Par>
   Use
   <Par>
   <LI=<see method=TMathImage@Clear> >
   <LI=<see method=TMathImage@ClearClipped> >
   to erase drawings.
   <Par> <Par>
   <B=Helper Objects> <Par>
   For drawing polylines in 2-D or 3-D use the following helper classes
   to store points:
   <Par>
   <LI=<see class=TFloatPointList> >
   <LI=<see class=Td3FloatPointList> >
   <LI=<see class=TFloatPointListList> >
   <LI=<see class=Td3FloatPointListList> >
   <Par>
   For storing points that define a 3-D surface use the
   <see class=TSurface> class.
   <Par>
   TMathImage can raise exceptions <see class=EMathImageError> and
   <see class=ESurfaceError>.

   }

{: This exception is raised whenever the world settings of TMathImage
   create an EMathError exception, for example if a division by zero occurs, because
   the world-width is zero. In this case the old settings
   are restored and an EMathImageError is raised.
   The exception is also raised if the pointlist for <See method=TMathImage@DrawPolyline>
   and <See method=TMathImage@D3Polyline>
   is too long to be converted to an open array (only under
   Delphi 1)
}
    EMathImageError=class(Exception);


{: ESurfaceError is raised whenever a construction of a <see class=TSurface>
   object fails, or if a value is being assigned to a nonexisting
   grid point
}
   ESurfaceError=Class(Exception);


  PD3FloatPoint=^TD3FloatPoint;
  TD3FloatPoint=record
              x,y,z:extended;
              next:PD3FloatPoint;
              end;
  PSurfPoint=^TSurfPoint;
  TSurfPoint=record
         x,y,z:extended;
         end;
  {$IFDEF WINDOWS}
  PSurfPointArray=^TSurfPointarray;
  TSurfPointArray=array[0..500] of PSurfPoint;
  {$ENDIF}

  {: Surface Object to be passed to <See Method=TMathImage@D3DrawSurface>. It's a matrix scheme of
  3D-Points (<see type=TSurfPoint>) Think of the surface being made up of cells whose
  corner (grid) points
  sit at location (i,j),)(i+1,j),(i,j+1),(i+1,j+1) in the scheme. Use
  <See method=TSurface@Make> to fill the scheme with 3D-Points of your surface.

  <B=Note:> TSurface Objects need to be created and freed as needed.
  }
  TSurface=class(TObject)
    private
      Ferror:boolean;
      Fxm,Fym:integer;
      {$IFDEF WINDOWS}
      FFloatsurface:array[0..500] of PSurfPointArray;
      {$ENDIF}
      {$IFDEF WIN32}
      FFloatsurface:array[0..500,0..500] of PSurfPoint;
      {$ENDIF}
    public
      {: The Error property can be read to determine whether
      or not the surface has been created right and can be
      accessed.
      }
      property Error:boolean read Ferror;
      {: Xmesh is the number of surface cells in x- (or i-)
      direction. There are Xmesh+1 grid points in this direction,
      numbered from i=0 to i=Xmesh.
      }
      property Xmesh:integer read Fxm;
      {: Ymesh is the number of surface cells in y- (or j-)
      direction. There are Ymesh+1 grid points in this direction,
      numbered from j=0 to j=Ymesh.
      }
      property Ymesh:integer read Fym;

     {: The Surface has (xgrid+1) by (ygrid+1) grid (matrix) points.
      grids number from 0 to xgrid etc.. A created surface always has
       to be freed, too.
      }
      constructor Create(xgrid,ygrid:integer); virtual;

      {:Assigns the point (x,y,z) to grid (i,j).
      }
      procedure Make(i,j:integer;x,y,z:extended);

      {:Returns the 3-D-point (<See Type=TSurfPoint>) at grid (i,j.)
      }
      function D3Point(i,j:integer):TSurfPoint;

      {: Frees the memory allocated by the surface object.
      }
      destructor destroy; override;
    end;

  PFloatPoint=^TFloatpoint;
  TFloatPoint=record
     x,y:extended;
     next:PFloatPoint;
     end;

  {:FloatPointList object to be passed to <See Method=TMathImage@DrawPolyline>.
   The intended use is to fill a FloatPointList object sequentially with
   pairs of number (float points) (see <See Method=TFloatPointList@Add>), then pass it to DrawPolyline
   to
   connect all points in the list sequentially by lines.
  <B=Note:> You have to create and free these lists as needed.
  }
  TFloatPointList=class(TObject)
  private
    Fcount:longint;
    fFirstpoint,fCurrentpoint:PFloatpoint;
    fnext:TFloatPointList;
  public
    {:Use to read the first point of the list. The type of FirstPoint is a
    pointer to <See Type=TFloatPoint>.
    }
    property FirstPoint:PFloatpoint read fFirstPoint;
    {:Use to read the current(i.e. last) point. The type of CurrentPoint is a
    pointer to <See Type=TFloatPoint>.
    }
    property CurrentPoint:PFloatpoint read fCurrentPoint;
    {:The Next property can be used to build lists of FloatPointLists.
     <See Type=TFloatPointListList>
     }
    property Next:TFloatPointList read fnext;
    {:Use to read the number of points currently in the list.
    }
    property Count:longint read Fcount;
    {: Create a list before you use it. Call MyList.free to
    deallocate its memory after use.
    }
    constructor Create; virtual;
    {: Destroy a list after use. Each created list needs to
    be freed, too.
    }
    destructor Destroy; override;
    {:Add a point (x,y) to the end of the list.
    }
    procedure Add(x,y:extended);
    {:Copy AFloatPointList to this instance. AFloatPointList must have been
    created and is still around as another instance after assign.
    }
    procedure assign(AFloatPointList:TFloatpointlist); virtual;
    
  end;

  {:FloatPointListList object: list of FloatPointLists. Intended to be passed to
  <See Method=TMathImage@DrawPolyPolyLine>. PolyPolyLines can have breaks in them.
  The points in each list form a Polyline. Use <See method=TFloatPointListList@Add>
  to add a new list (break). Use <See method=TFloatPointListList@AddToCurrent> to
  add a point at the end of the current (last) list.

  <B=Note:> You have to create and free this list class as needed;

  <B=Note:> The intended usage of the object is to sequentially
    fill it with the 1st, 2nd etc. list of points to be drawn.
    It you want more functionality (addressing a particular item
    in the list, moving back & forth) (and slower performance) use a
    TList descendent instead, and fill a FloatpointListList with the points
    before drawing. Or use <See method=TMathImage@WindowX> and
    <See method=TMathImage@WindowY> on the points and do <See property=TMathImage@Canvas>.polyline's.
  }
  TFloatPointListList=class(TObject)
  private
    FCount,FTotalCount:longint;
    fFirstlist,fCurrentlist:TFloatPointList;
  public
    {:Returns the first point list
    }
    property FirstList:TFloatPointList read fFirstlist;
    {:Returns the current (i.e. last) list.
    }
    property Currentlist:TFloatPointList read fCurrentlist;
    {:Returns the number of <B=lists>.
    }
    property Count:longint read FCount;
    {:Returns the total number of points in all lists.
    }
    property TotalCount:longint read FTotalcount;
    {: Create the list before you use it. Sublists are created
    automatically when you call <see property=TFloatPointListList@Add>.
    You need to call ..listlist.free when done.
    }
    constructor create; virtual;
    {: Deallocates memory for the listlist object. Called by free.
    Memory for all sub lists is automatically freed.
    }
    destructor destroy; override;
    {:Start a new point list.
    }
    procedure Add;
    {:Add the point (x,y) to the current (last) list.
    }
    procedure AddToCurrent(x,y:extended);


  end;

  {:D3FloatPointList object to be passed to <See Method=TMathImage@D3Polyline>.
   The intended use is to fill a D3FloatPointList object sequentially with
   triplets of numbers (D3-float points) (see <See Method=TD3FloatPointList@Add>), then pass it to D3DrawPolyline
   to
   connect all points in the list sequentially by lines.

  <B=Note:> You have to create and free these lists as needed.
  }
  TD3FloatPointList=class(TObject)
  private
    Fcount:longint;
    fFirstpoint,fCurrentpoint:PD3Floatpoint;
    fnext:TD3FloatPointList;
  public
  {:Use to read the first point of the list. The type of FirstPoint is a
    pointer to <See Type=TD3FloatPoint>.
    }
    property FirstPoint:PD3FloatPoint read fFirstPoint;
    {:Use to read the current(i.e. last) point. The type of CurrentPoint is a
    pointer to <See Type=TD3FloatPoint>.
    }
    property CurrentPoint:PD3FloatPoint read fCurrentPoint;
    {:The Next property can be used to build lists of D3FloatPointLists.
     <See Type=TD3FloatPointListList>}
    property Next: TD3FloatPointList read fnext;
     {:Use to read the number of points currently in the list.
    }
    property Count:longint read Fcount;
    constructor Create; virtual;
    destructor Destroy; override;
    {:Add a point (x,y) to the end of the list.
    }
    procedure Add(x,y,z:extended);
    {:Copy AFloatPointList to this instance. AFloatPointList must have been
    created and is still around as another instance after assign.
    }
    procedure Assign(AFloatPointList:TD3Floatpointlist); virtual;
  end;

  {:D3FloatPointListList object: list of D3FloatPointLists. Intended to be passed to
  <See Method=TMathImage@D3PolyPolyLine>. PolyPolyLines can have breaks in them.
  The points in each list form a Polyline. Use <See method=TD3FloatPointListList@Add>
  to add a new list (break). Use <See method=TD3FloatPointListList@AddToCurrent> to
  add a point at the end of the current (last) list.

  <B=Note:> You have to create and free this list class as needed;

  <B=Note:> The intended usage of the object is to sequentially
    fill it with the 1st, 2nd etc. list of points to be drawn.
    It you want more functionality (addressing a particular item
    in the list, moving back & forth) (and slower performance) use a
    TList descendent instead, and fill a FloatpointListList with the points
    before drawing. Or use <See method=TMathImage@D3Window> on the points and do <See property=TMathImage@Canvas>.polyline's.
  }
  TD3FloatPointListList=class(TObject)
  private
    FCount,FTotalCount:longint;
    fFirstlist,fCurrentlist:TD3FloatPointList;
  public
    {:Returns the first point list
    }
    property Firstlist:TD3FloatPointlist read fFirstlist;
    property Currentlist:TD3FloatPointlist read fCurrentlist;
    {:Returns the current (i.e. last) list.
    }
    property Count:longint read FCount;
    {:Returns the number of <B=lists>.
    }
    property TotalCount:longint read FTotalcount;
    {:Returns the total number of points in all lists.
    }
    constructor Create; virtual;
    destructor Destroy; override;
    {:Start a new point list.
    }
    procedure Add;
    {:Add the point (x,y,z) to the current (last) list.
    }
    procedure AddToCurrent(x,y,z:extended);
  end;

  {:constants for D3-axes-positions
  }
  const MinMin=0; MinMax=1; MaxMin=2; MaxMax=3;
  

type

  {: TMathImage is the main object in the MathImge unit. It is a TGraphicControl
   descendant and can as such be installed in the Delphi component palette. The component contains
   properties, methods and events for doing graphics in world coordinates. 2-D and
   3-D graphics are supported. Browse through the properties, methods and events to
   get an idea. Best way to learn is to look at the included demos.
   }

  TMathImage = class(TGraphicControl)
  private
    x1d2,xwd2,y1d2,ywd2,ax,bx,ay,by,
    axm,bxm,aym,bym:extended;
    axisglb,ard3:boolean;
    x1d3,xwd3,y1d3,ywd3,z1d3,zwd3,alpha,
    zrd3,yrd3,xscale,yscale,zscale:extended;
    basex,basey,basez,frontx,fronty,frontz,vd:extended;
    arad,tana,thetaz,thetay,sinz,siny,cosz,cosy,
    axd3,ayd3,azd3,bxd3,byd3,bzd3,ap,bxp,byp:extended;
    rightz, righty:extended;
    maxth,maxxtw,maxytw:integer;
    FClipRect,FClipRectM:TRect;
    fversion:string;
    FDrawing,Rotating,Zooming,Moving,FRecordMetafile:boolean;
    FOnRotating,FOnEndRotate,FOnMoving,FOnEndMove,
    FOnZooming,FOnEndZoom,FOnResize:TNotifyEvent;
    FOrgFontChanged,FOrgPenChanged,FOrgBrushChanged:TNotifyEvent;
    {$IFDEF WIN32}
    FMetafileCanvas:TMetafilecanvas;
    FMetafile:TMetafile;
    FBitmap:TBitmap;
    FLockUpdate:boolean;
    {$ENDIF}
    function getcanvas:TCanvas;
    procedure fbrushchanged(sender:tobject);
    procedure fpenchanged(sender:tobject);
    procedure ffontchanged(sender:tobject);
    procedure fbitmapchanged(sender:tobject);
    procedure setversion(x:string);
    procedure resetworld;
    procedure d3resetworld;
    procedure setaxisglb(a:boolean);
    procedure setx1d2(x:extended);
    procedure setxwd2(x:extended);
    procedure sety1d2(x:extended);
    procedure setywd2(x:extended);
    procedure setx1d3(x:extended);
    procedure sety1d3(x:extended);
    procedure setxwd3(x:extended);
    procedure setywd3(x:extended);
    procedure setz1d3(x:extended);
    procedure setzwd3(x:extended);
    procedure setvd(x:extended);
    procedure setzrd3(x:extended);
    procedure setyrd3(x:extended);
    procedure setalpha(x:extended);
    procedure setard3(x:boolean);
    procedure setXscale(x:extended);
    procedure setYscale(x:extended);
    procedure setZscale(x:extended);
    procedure setfont(x:tfont);
    procedure setbrush(x:tbrush);
    procedure setpen(x:tpen);
    procedure setrecordmetafile(x:boolean);
    function getd2worldx2:extended;
    function getd2worldy2:extended;
    function getd3worldx2:extended;
    function getd3worldy2:extended;
    function getd3worldz2:extended;
    function getbrush:TBrush;
    function getpen:TPen;
    function getfont:TFont;
    procedure scalar(xb,yb,zb:extended; var r:extended);
    procedure blockx(x:extended;var xb:extended);
    procedure blocky(y:extended;var yb:extended);
    procedure blockz(z:extended;var zb:extended);
    procedure project(xb,yb,zb:extended; var u,v:extended);
    procedure makeradians;
    procedure dist(xb,yb,zb:extended; var r:extended);
    procedure findbase(var i1,i2,i3:integer);
    procedure initworld;
    procedure drawoneaxis(x1,y1,z1,x2,y2,z2:extended);
    function bright(p1,p2,p3:TSurfPoint):extended;
     procedure ReadD2WorldX1(Reader: TReader);
    procedure WriteD2WorldX1(Writer:TWriter);
    procedure ReadD2WorldXw(Reader: TReader);
    procedure WriteD2WorldXW(Writer:TWriter);
    procedure ReadD2WorldY1(Reader: TReader);
    procedure WriteD2WorldY1(Writer:TWriter);
    procedure ReadD2WorldYW(Reader: TReader);
    procedure WriteD2WorldYW(Writer:TWriter);
    procedure ReadD3WorldX1(Reader: TReader);
    procedure WriteD3WorldX1(Writer:TWriter);
    procedure ReadD3WorldY1(Reader: TReader);
    procedure WriteD3WorldY1(Writer:TWriter);
    procedure ReadD3WorldZ1(Reader: TReader);
    procedure WriteD3WorldZ1(Writer:TWriter);
    procedure ReadD3WorldXW(Reader: TReader);
    procedure WriteD3WorldXW(Writer:TWriter);
    procedure ReadD3WorldYW(Reader: TReader);
    procedure WriteD3WorldYW(Writer:TWriter);
    procedure ReadD3WorldZW(Reader: TReader);
    procedure WriteD3WorldZW(Writer:TWriter);
    procedure ReadD3Yrotation(Reader: TReader);
    procedure WriteD3Yrotation(Writer:TWriter);
    procedure ReadD3Zrotation(Reader: TReader);
    procedure WriteD3Zrotation(Writer:TWriter);
    { Private declarations, never mind }
  protected
  
    {: Had to be overridden just so float properties get stored right.
    }
    procedure DefineProperties(Filer: TFiler); override;

    {: Trapping this message makes it possible to respond to resizing of the control.
    Whenever this happens the underlying bitmap is resized, and an event
    <see property=TMAthImage@OnResize> fires.
    }
    procedure WMWindowPosChanged(var Msg:TMessage); message WM_WINDOWPOSCHANGED;

    {: Paint updates the screen with the current content of the underlying bitmap on
    which drawing takes place
    }
    procedure Paint; override;
    { Protected declarations }
{---------------------*********************************--------------------------}
{                               THE IMPORTANT STUFF                                                 }
{---------------------*********************************--------------------------}
  public
    {: The current clipping region. See Win-API help, if you want to use it somehow.
    It is used internally to clip drawings in 2-D when axes are present.
    }
    hRegion:HRgn;

    {: The clipping region of the metafilecanvas, in case <See property=TMathImage@RecordMetafile>
    is true.
    }
    hRegionm:HRgn;

    {: The Canvas, on which drawing takes place. You can use all usual canvas
    methods, e.g.
    TextOut, to add to the world coordinate drawings.
    }
    property Canvas read getcanvas;


    {: Use the Bitmap property to read the underlying bitmap on which drawing takes place.
    For example you can use TMathimage.Bitmap.SaveToFile to save the drawing, or
    Clipboard.assign(MyMathImage.Bitmap) to copy it to the Windows Clipboard. (You need to
    have "Clipbrd" in your uses list though.)
    }
    property Bitmap:TBitmap read fBitmap;

     {: If <See property=TMathImage@RecordMetafile> is true, you can read the Metafile
     thus far recorded, using the Metafile property.
     }
    {$IFDEF WIN32}
    property Metafile:TMetafile read fmetafile;
    {$ENDIF}

    {: If true, space is reserved in a 2-D drawing to include axes. You need to call
    <see method=TMathImage@DrawAxes> in order to actually draw any. A call to DrawAxes
    automatically makes D2Axes true. So use this property if for some reason you want
    to draw the axes after the curves.
    }
    property D2Axes:boolean read axisglb write setaxisglb;

    {: Upper bounds for D2world rectangle and D3world box.
    Those used to be published, but were causing unnecessary exceptions.
    They are kept as public and read only for backwards compatability.
    For the new published properties see <see property=TMathImage@D2WorldX1>,
    <See Property=TMathImage@D2WorldXW>, etc.
    }
    property D2Worldx2:extended read GetD2Worldx2;
    {: Upper bounds for D2world rectangle and D3world box.
    Those used to be published, but were causing unnecessary exceptions.
    They are kept as public and read only for backwards compatability.
    For the new published properties see <see property=TMathImage@D2WorldX1>,
    <See Property=TMathImage@D2WorldXW>, etc.
    }
    property D2Worldy2:extended read GetD2Worldy2;
    {: Upper bounds for D2world rectangle and D3world box.
    Those used to be published, but were causing unnecessary exceptions.
    They are kept as public and read only for backwards compatability.
    For the new published properties see <see property=TMathImage@D2WorldX1>,
    <See Property=TMathImage@D2WorldXW>, etc.
    }
    property D3Worldx2:extended read GetD3Worldx2;
    {: Upper bounds for D2world rectangle and D3world box.
    Those used to be published, but were causing unnecessary exceptions.
    They are kept as public and read only for backwards compatability.
    For the new published properties see <see property=TMathImage@D2WorldX1>,
    <See Property=TMathImage@D2WorldXW>, etc.
    }
    property D3Worldy2:extended read GetD3Worldy2;
    {: Upper bounds for D2world rectangle and D3world box.
    Those used to be published, but were causing unnecessary exceptions.
    They are kept as public and read only for backwards compatability.
    For the new published properties see <see property=TMathImage@D2WorldX1>,
    <See Property=TMathImage@D2WorldXW>, etc.
    }
    property D3Worldz2:extended read GetD3Worldz2;


    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;

    {: Erases the current drawing and sets the background to the current
    <see property=TMathImage@brush> color.
    }
    procedure Clear;

    {: Erases the area inside of the axes in a 2-D drawing.
    }
    procedure ClearClipped;

    {: Prevent the screen from updating until <see method=TMathImage@UnlockUpdate>
     is called.
    }
    procedure LockUpdate;

    {:Enable drawing to screen. Surround compound graphics statements
    with <see method=TMathImage@LockUpdate> and UnLockUpdate for faster drawing. If on the other
    hand you want to update the screen right now on the spot, use invalidate
    as usual.
    }
    procedure UnLockUpdate;


    {The following are the methods for 2-d graphing:}

    {: Set the world range of a 2-D drawing in one step
    (to be preferred at runtime). x1,y1 are the lower bounds
    of the world rectangle, x2,y2 are the <B=upper bounds>.
    If x2<<=x1 or y2<<=y1, an exception is raised.
     <par>
     Compare to published properties <see property=TMathImage@D2Worldx1>,
     <see property=TMathImage@D2Worldxw>, etc., where D2WorldxW is
     the <B=x-width> of the world rectangle.
     }
    procedure SetWorld(x1,y1,x2,y2:extended);


    {: Short(?) for <See property=TMathImage@pen>.color:=color.
    Has been kept for compatability.
    }
    procedure SetColor(color:TColor);

    {: Short(?) for result:=<See property=TMathImage@pen>.color.
    Has been kept for compatability.
    }
    function GetColor:TColor;


    {: In 2-D, translates world coordinate x to pixel-x.
    Main use is internally.
    }
    function WindowX(x : extended):longint;

    {: In 2-D, translates world coordinate y to pixel-y. Main use
    is internally.
    }
    function WindowY(y : extended):longint;

    {: In 2-D, translates world coordinate x to pixel-x on the metafilecanvas. Main use
    is internally. See <see property=TMathImage@RecordMetafile>.
    }
    function WindowXM(x: extended):longint;

    {: In 2-D, translates world coordinate y to pixel-y on the metafilecanvas. Main use
    is internally. See <see property=TMathImage@RecordMetafile>.
    }
    function WindowYM(y: extended):longint;

    {: In 2-D, translates pixel coordinate xs to world-x. Useful for reading the world
    coordinates of a clicked point, or a point the mouse is over.
    }
    function WorldX(xs:longint):extended;

    {: In 2-D, translates pixel coordinate ys to world-y. Useful for reading the world
    coordinates of a clicked point, or a point the mouse is over.
    }
    function WorldY(ys:longint):extended;

    {: Length of vector (x,y).
    }
    function Norm(x,y:extended):extended;

    {: Puts a pixel with world coordinates (x,y) on the screen. Color
    is the currently selected <see property=TMathImage@Pen> color.
    }
    procedure DrawPoint(x,y : extended);

    {: Moves the graphics cursor to the point with D2-world coordinates (x,y).
    }
    procedure MovetoPoint(x,y:extended);

    {: Draws a line from (x1,y1) to (x2,y2) in D2-world coordinates.
    Both end pixels are drawn, in contrast to a <see method=TMathImage@MovetoPoint>-
    <see method=TMAthImage@DrawLineto> combination.
    }
    procedure DrawLine(x1,y1,x2,y2 : extended);

    {: Draws a line from the current graphics cursor position
    (see <see method=TMathImage@MovetoPoint>) to
   point (x,y) in D2-world coordinates. DrawLineto never draws
   the endpixel (Win-default).
   }
    procedure DrawLineto(x,y:extended);

    {: Draws an ellipse in the D2-world rectangle between (x1,y1) (lower left)
     and (x2,y2) (upper right) and fills it with the current brush.
     }
    procedure DrawEllipse(x1,y1,x2,y2:extended);

    {: Draws a D2-world rectangle between (x1,y1) (lower left)
     and (x2,y2) (upper right) and fills it with the current brush.
     }
    procedure DrawRectangle(x1,y1,x2,y2:extended);


    {: Puts axes at the left and bottom boundary of the drawing. Ticks and
     labelling of numeric values are done automatically. xlabel, ylabel is
     text that goes to the end of the axes. Zerolines=true draws lines x=0,
     y=0. Axescolor,ZerolinesColor are selfexplaining.
     }
    procedure DrawAxes(xlabel,ylabel:string;
                        zerolines:boolean;
                        axescolor,zerolinescolor:TColor);

    {: Draws a vector (a,b) at base point(x,y) (D2-world).
    }
    procedure DrawVector(x,y,a,b:extended);

    {: Draws a curve by sequentially connecting the points in FloatPointList.
    Faster than individual lines. See <See type=TFloatPointList>.
    }
    procedure DrawPolyline(FloatPointList:TFloatpointlist);

    {: Draws a curve connecting the points in FloatPointList, closes the
    shape and fills it with the current brush. See <See type=TFloatPointList>.
    }
    procedure DrawPolygon(FloatPointList:TFloatPointlist);


    {: Draws all point lists in the ListList as Polylines. Use if you want to draw curves
    with "breaks". See <See type=TFloatPointListList>.
    }
    procedure DrawPolyPolyLine(FloatPointListList:TFLoatPointListList);
    


   {D3Graphics procedures:}

    {: Sets all D3-world bounds in one step. *1 are the lower bounds, *2 the <B=upper bounds>.
    Lower bounds must be strictly less than upper bounds.
    This method is to be preferred
    at run time over using the published properties <see Property=TMathImage@D3Worldx1>, etc..
    Notice the difference: Using the published properties, you need to set the <B=width> of the
    world instead of the upper bound.
    }
    procedure d3SetWorld(x1,y1,z1,x2,y2,z2:extended);


    {: This procedure translates D3-world-(x,y,z) to pixel-(xs,ys), using the current
    world bounds, view distance, view angle and view point location. Mostly for internal
    use.
    }
    procedure d3Window(x,y,z:extended; var xs,ys:longint);


    {: This procedure translates D3-world-(x,y,z) to pixel-(xs,ys) on the metafilecanvas, using the current
    world bounds, view distance, view angle and view point location. Mostly for internal
    use.
    }
    procedure d3Windowm(x,y,z:extended; var xs,ys:longint);

    {: Returns 3D-world coordinates x,y,z for screen coordinates
     xs,ys, assuming that (x,y,z) lies in the plane through the
     center of the world pependicular to the viewer's direction.
     Can be used in a limited way to "Click on a point" in the
     3D-world. See DataPlot demo part.
     }
    procedure PseudoD3World(xs,ys:longint; var x,y,z:extended);

    {: Moves the graphics cursor to the point with D3-world coordinates (x,y,z).
    }
    procedure d3Moveto(x,y,z:extended);

    {: Puts a pixel with D3-world coordinates (x,y,z) on the screen. Color
    is the currently selected <see property=TMathImage@Pen> color.
    }
    procedure d3DrawPoint(x,y,z:extended);

    {: Draws a line from (x1,y1,z1) to (x2,y2,z2) in D3-world coordinates.
    Both end pixels are drawn, in contrast to a <see method=TMathImage@D3Moveto>-
    <see method=TMAthImage@D3DrawLineto> combination.
    }
    procedure d3DrawLine(x1,y1,z1,x2,y2,z2:extended);

    {: Draws a line from the current graphics cursor position
    (see <see method=TMathImage@d3Moveto>) to
   point (x,y,z) in D3-world coordinates. DrawLineto never draws
   the endpixel (Win-default).
   }
    procedure d3DrawLineto(x,y,z:extended);


    {: Draws axes at the bondary of the world box
    and puts xlabel,ylabel,zlabel on their ends.
    xticks,yticks,zticks specify the number of ticks on the axes. Each
    can be set to 0.
    xpos,ypos,zpos specifies the position of the axis. These parameters
    can have the values MinMin(=0), MinMax(=1) or MaxMax(=2).
    A position MinMin places the axis at the minimum of both of the
    remaining variables. MinMax places it at the minimum/maximum of
    the other variables (alphabetical order), etc.
    Example: If your D3-World is (-1,-1,-1,1,1,1) then
    D3DrawAxes('x','y','z',4,4,4,MinMin,MaxMin,MinMin) draws axes with
    (about) 4 ticks. The x-axis is displayed along the line y=z=-1,
    the y-axis along x=1,z=-1, and the z-axis along x=y=-1.
    }
    procedure d3DrawAxes(Xlabel,Ylabel,Zlabel:string;
             XTicks,Yticks,ZTicks,Xpos,Ypos,Zpos:byte);


    {: Draws the box the current D3-world resides in as a wire frame, with the 3 sides facing
    the viewer left open. Also see <see property=TMAthImage@d3DrawFullWorldBox>.
    }
    procedure d3DrawWorldbox;


    {: Draws a wire frame box between D3-points(x1,y1,z1) (lower) and
    (x2,y2,z2) (upper).
    }
    procedure d3DrawBox(x1,y1,z1,x2,y2,z2:extended);

    {: Draws the full box the 3D-world resides in as a wire frame.
    Also see <see property=TMAthImage@d3DrawWorldBox>.
    }
    procedure d3DrawFullWorldBox;


    {: In 3-D, draws lines x=y=0, x=z=0, y=z=0.
    }
    procedure d3drawZeroCross;

    {: Draws a 3D-curve by sequentially connecting the points in FloatPointList.
    Faster than individual lines. See <See type=TD3FloatPointList>.
    }
    procedure D3Polyline(FloatPointList:TD3Floatpointlist);


    {: Draws all point lists in the ListList as Polylines. Use if you want to draw curves
    with "breaks". See <See type=TD3FloatPointListList>.
    }
    procedure D3PolyPolyline(FloatPointListList:TD3Floatpointlistlist);


    {: Returns the (uniformly scaled) distance of the viewpoint to D3-point(x,y,z).
    Mostly for internal use.
    }
    procedure d3DistanceToViewer(x,y,z:extended; var r:extended);

    {: Rotates the viewpoint (not the object) to the left in
     the specified angle increment at a time. Note: The rotation goes
     on until you call <see method=TMathImage@d3StopRotating> in some event handler (like OnMouseUp).
     The event <see property=TMathImage@OnRotating> fires at each increment. Use it to
     make rotating visible. See the demo project for usage.
     }
    procedure D3StartRotatingLeft(increment:extended);

    {: Rotates the viewpoint (not the object) to the right in
     the specified angle increment at a time. Note: The rotation goes
     on until you call <see method=TMathImage@d3StopRotating> in some event handler (like OnMouseUp).
     The event <see property=TMathImage@OnRotating> fires at each increment. Use it to
     make rotating visible. See the demo project for usage.
     }
    procedure D3StartRotatingRight(increment:extended);

    {: Rotates the viewpoint (not the object) up in
     the specified angle increment at a time. Note: The rotation goes
     on until you call <see method=TMathImage@d3StopRotating> in some event handler (like OnMouseUp).
     The event <see property=TMathImage@OnRotating> fires at each increment. Use it to
     make rotating visible. See the demo project for usage.
     }
    procedure D3StartRotatingUp(increment:extended);

    {: Rotates the viewpoint (not the object) down in
     the specified angle increment at a time. Note: The rotation goes
     on until you call <see method=TMathImage@d3StopRotating> in some event handler (like OnMouseUp).
     The event <see property=TMathImage@OnRotating> fires at each increment. Use it to
     make rotating visible. See the demo project for usage.
     }
    procedure D3StartRotatingDown(increment:extended);

    {: This method must be called to stop any rotation started by the methods
    <see method=TMathImage@d3StartRotatingLeft>, <see methode=TMAthImage@d3StartRotatingRight>,
    <see method=TMathImage@d3StartRotatingUp> and <see method=TMathimage@d3StartRotatingDown>.
    The Event <see property=TMathImage@OnRotateStop> fires, so you can redraw your picture as necessary.
    See demo project for usage.
    }
    procedure D3StopRotating;


    {: Decreases the viewdistance by by increment*<see property=TMathImage@d3ViewDist> at a time.
    (Relative decrease makes more sense).
     Note: The moving goes
     on until you call <see method=TMathImage@d3StopMoving> in some event handler (like OnMouseUp).
     The event <see property=TMathImage@OnMoving> fires at each increment. Use it to
     make moving visible. See the demo project for usage.
     }
    procedure D3StartMovingIn(increment:extended);


    {: Increases the viewdistance by by increment*<see property=TMathImage@d3ViewDist> at a time.
    (Relative increase makes more sense).
     Note: The moving goes
     on until you call <see method=TMathImage@d3StopMoving> in some event handler (like OnMouseUp).
     The event <see property=TMathImage@OnMoving> fires at each increment. Use it to
     make moving visible. See the demo project for usage.
     }
    procedure D3StartMovingOut(increment:extended);


    {: This method must be called to stop any moving started by the methods
    <see method=TMathImage@d3StartMovingIn> or <see methode=TMAthImage@d3StartMovingOut>.
    The event <see property=TMathImage@OnMoveStop> fires, so you can redraw your picture as necessary.
    See demo project for usage.
    }
    procedure D3StopMoving;


    {: Decreases the view angle by by increment*<see property=TMathImage@d3ViewAngle> at a time.
    (Relative decrease makes more sense).
     Note: The zooming goes
     on until you call <see method=TMathImage@d3StopZooming> in some event handler (like OnMouseUp).
     The event <see property=TMathImage@OnZooming> fires at each increment. Use it to
     make zooming visible. See the demo project for usage.
     }
    procedure D3StartZoomingIn(increment:extended);


    {: Increases the view angle by by increment*<see property=TMathImage@d3ViewAngle> at a time.
    (Relative increase makes more sense).
     Note: The zooming goes
     on until you call <see method=TMathImage@d3StopZooming> in some event handler (like OnMouseUp).
     The event <see property=TMathImage@OnZooming> fires at each increment. Use it to
     make zooming visible. See the demo project for usage.
     }
    procedure D3StartZoomingOut(increment:extended);


    {: This method must be called to stop any zooming started by the methods
    <see method=TMathImage@d3StartZoomingIn> or <see methode=TMAthImage@d3StartZoomingOut>.
    The event <see property=TMathImage@OnZoomStop> fires, so you can redraw your picture as necessary.
    See demo project for usage.
    }
    procedure D3StopZooming;


    {Surface Routines:}

    {: Draw a surface (a 2-dimensional curved object, like a graph or a sphere)
    in the 3-D-world. Surface (see <see type=TSurface>)
     must have been created and
    filled with the world coordinates of the gridpoints.
    Fill=false gives a wire frame in the current pen color,
    Fill=true displays it filled with
    the current brush color, invisible parts hidden.
    NoUpdate=true: Display the surface all at once (fastest),
             false: Show some drawing steps in between.
    See demo project for usage. It's easiest to first understand how the
    graph is drawn. The knot surface is only there to show off the
    possibilities.
    }
    procedure d3DrawSurface(surface:TSurface; fill, NoUpdate:boolean);


    {: Analogous to the <see method=TMathimage@d3DrawSurface> procedure,
    but lighting is used to display the
    filled surface, and no wireframe is drawn. There are 2 light sources:
    Diffuse light, which lights up the whole surface evenly, and focussed
    light which is a beam having its source at the viewpoint (thats easiest
    and enough to see the surface). The basecolor of the surface is
    the current brush color. Diffuse, focussed set the strength of the light
    sources. A total strength 1 displays the exact brush color on a
    maximally lit surface part (one that's perpendicular to the viewpoint).
    }
    procedure d3DrawLitSurface
        (surface:TSurface; diffuse,focussed:extended;NoUpdate:boolean);

    {: Draws a cube with lower  edge (x1,y1,z1) und upper edge (x2,y2,z2). It is
    necessary that x1<<x2, y1<<y2, z1<<z2. Fill=true fills the sides with the current
     brush color. Fill=false is the same as <see method=TMathImage@d3DrawBox>.
    }
    procedure d3DrawCube(x1,y1,z1,x2,y2,z2:extended; fill:boolean);
    

    {procedure d3DrawLitCube(x1,y1,z1,x2,y2,z2:extended; diffuse,focussed:extended);}
    {Same as above with light source from the viewpoint}


    {: Use to save the drawing as a metafile, provided you have recorded one by setting
    <see property=TMathImage@RecordMetafile> to true.
    }
    {$IFDEF WIN32}
    Procedure SaveAsMetafile(const filename:string);
    {$ENDIF}

    { Public declarations }

  published
    property Align;
    property Hint;
    property ShowHint;
    property ParentShowHint;
    property PopUpMenu;

    {: Fake property to display the version of the component in the object
    inspector.
    }
    property Version:string read fversion write setversion;

    {: Font of the component's drawing canvas.
    }
    property Font:TFont read GetFont write Setfont;

    {: Pen of the component's drawing canvas.
    }
    property Pen:TPen read GetPen write SetPen;

    {: Brush of the component's drawing canvas.
    }
    property Brush:TBrush read GetBrush write SetBrush;


    {$IFDEF WIN32}
    {: When set true, this property causes a metafile to be recorded in the background,
    on which the same drawing operations are performed as in the visible component. Recording a metafile
    slows down drawing a little. Metafiles have advantages over bitmaps in that they scale better, and
    give better printouts. To further enhance the quality, metafiles are being written at twice the resolution
    of the visible drawing. This option is not available under Delphi 1.
    }
    property RecordMetafile:Boolean read fRecordMetafile write setRecordMetafile;
    {$ENDIF}


    {: The properties D2WorldX1, D2WorldXW, D2WorldY1, D2WorldYW set the
    boundary for the 2-d-drawing world. Analogous to
    the top, left, width, height properties of a control, you set the left
    boundary of the world with D2WorldX1 and the width of the x-range with
    D2WorldXW etc...
    }
    property D2WorldX1: extended read x1d2 write setx1d2 stored false;

    {: The properties D2WorldX1, D2WorldXW, D2WorldY1, D2WorldYW set the
    boundary for the 2-d-drawing world. Analogous to
    the top, left, width, height properties of a control, you set the left
    boundary of the world with D2WorldX1 and the width of the x-range with
    D2WorldXW etc...
    }
    property D2WorldXW: extended read xwd2 write setxwd2 stored false;

    {: The properties D2WorldX1, D2WorldXW, D2WorldY1, D2WorldYW set the
    boundary for the 2-d-drawing world. Analogous to
    the top, left, width, height properties of a control, you set the left
    boundary of the world with D2WorldX1 and the width of the x-range with
    D2WorldXW etc...
    }
    property D2WorldY1: extended read y1d2 write sety1d2 stored false;

    {: The properties D2WorldX1, D2WorldXW, D2WorldY1, D2WorldYW set the
    boundary for the 2-d-drawing world. Analogous to
    the top, left, width, height properties of a control, you set the left
    boundary of the world with D2WorldX1 and the width of the x-range with
    D2WorldXW etc...
    }
    property D2WorldYW: extended read ywd2 write setywd2 stored false;

    {Don't worry about the stored false in all of these. They get stored:
    see override of DefineProperties. The default storing process never
    writes a value 0 of a float property to the dfm-file and the default
    value set in the constructor is used instead. So if that default is
    <>0, a value 0 can never be set. Overriding DefineProperties fixes it.
    Stored false is used so the property is not stored twice. (Thanks to
    Joe Herb for the tip)}


    {: D3WorldX1, D3WorldY1, D3WorldZ1 and D3WorldXW, D3WorldYW, D3WorldZW set
     the boundaries for the 3-d-drawing world. ...X1 etc. is the
    lower bound, ...XW etc. is the range <B=width>. It's analogous to setting
    the left, top, width, height properties of a control.
    See <See=D3_Graphics_Explanation>
    }
    {: <New topic=D3_Graphics_Explanation@D3 Graphics Explanation>
    <B=Explanation of the 3D-graphics process:>

     When graphed,
     the world box is scaled so its longest edge has length 2, and
     the other edges have lengthes according to the true aspect ratio of
     the bounds you specify. If you set the property <see property=TMathImage@D3AspectRatio>
     to false,
     the edges have all the same length 2. The box is then projected onto the
     picture according to the settings of <see property=TMathimage@D3ViewDist>,
     <see property=TMathImage@D3ViewAngle>, <see property=TMathImage@D3Zrotation>,
     <see property=TMathImage@D3Yrotation> as follows:

     Everything is projected from the viewer location onto
     the plane through the center of the box which is perpendicular to the
     viewer direction. The part of the plane which you see, is what the
     view angle can sweep out from the view distance. The viewpoint moves on
     a spherical grid around the center of the world box, with the north and
     south poles of the sphere along the z-axis. The viewer always looks
     at the center of the box, and can't tilt her head.., enough for my math applications.
     }
    property D3WorldX1: extended read x1d3 write setx1d3 stored false;

    {: D3WorldX1, D3WorldY1, D3WorldZ1 and D3WorldXW, D3WorldYW, D3WorldZW set
     the boundaries for the 3-d-drawing world. ...X1 etc. is the
    lower bound, ...XW etc. is the range <B=width>. It's analogous to setting
    the left, top, width, height properties of a control.
    See <See=D3_Graphics_Explanation>
    }
    property D3WorldXW: extended read xwd3 write setxwd3 stored false;

    {: D3WorldX1, D3WorldY1, D3WorldZ1 and D3WorldXW, D3WorldYW, D3WorldZW set
     the boundaries for the 3-d-drawing world. ...X1 etc. is the
    lower bound, ...XW etc. is the range <B=width>. It's analogous to setting
    the left, top, width, height properties of a control.
    See <See=D3_Graphics_Explanation>
    }
    property D3WorldY1: extended read y1d3 write sety1d3 stored false;

    {: D3WorldX1, D3WorldY1, D3WorldZ1 and D3WorldXW, D3WorldYW, D3WorldZW set
     the boundaries for the 3-d-drawing world. ...X1 etc. is the
    lower bound, ...XW etc. is the range <B=width>. It's analogous to setting
    the left, top, width, height properties of a control.
    See <See=D3_Graphics_Explanation>
    }
    property D3WorldYW: extended read ywd3 write setywd3 stored false;

    {: D3WorldX1, D3WorldY1, D3WorldZ1 and D3WorldXW, D3WorldYW, D3WorldZW set
     the boundaries for the 3-d-drawing world. ...X1 etc. is the
    lower bound, ...XW etc. is the range <B=width>. It's analogous to setting
    the left, top, width, height properties of a control.
    See <See=D3_Graphics_Explanation>
    }
    property D3WorldZ1: extended read z1d3 write setz1d3 stored false;

    {: D3WorldX1, D3WorldY1, D3WorldZ1 and D3WorldXW, D3WorldYW, D3WorldZW set
     the boundaries for the 3-d-drawing world. ...X1 etc. is the
    lower bound, ...XW etc. is the range <B=width>. It's analogous to setting
    the left, top, width, height properties of a control.
    See <See=D3_Graphics_Explanation>.
    }
    property D3WorldZW: extended read zwd3 write setzwd3 stored false;

    {: If D3AspectRatio is true, these are scale factors for the
     D3-world display.
     }
    Property D3Xscale: extended read xscale write setXscale;
    Property D3Yscale: extended read yscale write setYscale;
    Property D3Zscale: extended read zscale write setZscale;

    {: Angle of viewpoint with the x-axis. ("How much it's rotated
     about the z-axis", I know it's a bad name, but can't change it now.))
     }
    property D3Zrotation: extended read zrd3 write setzrd3 stored false;
    
    {: Angle of viewpoint with the z-axis. ("How much the viewpoint is
     rotated about the y-axis". Bad name, sorry.)
     }
    property D3Yrotation: extended read yrd3 write setyrd3 stored false;
    
    {: Uniformly scaled distance of the viewpoint to the center of the d3-world.
     See <see=D3_Graphics_Explanation>
    }
    property D3ViewDist: extended read vd write setvd;
    
    {: Opening angle of the lens of the viewpoint. Large D3ViewAngle combined with
     small <see property=TMathImage@D3ViewDist> give a fish eye effect. The opposite gives almost no perspective
     effect at all.
     }
    property D3ViewAngle:extended read alpha write setalpha;
    
    {: When true (default) the true aspect ratio of the data axes
    is used for the worldbox (modulo scaling factors). Otherwise,
    the box is a perfect cube.
    }
    property D3AspectRatio:boolean read ard3 write setard3;
    

    {: Events}
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    {$IFDEF Delphi4}
    property OnEndDock;
    {$ENDIF}
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;

    {: Event which fires at each increment of the angle in
     <see method=TMathImage@D3StartRotatingLeft>, etc.. Use
     it to update you drawing or part of it, to make rotation
     visible.

     <B=Note:> The event is not called when you just
     alter values of <see property=TMathImage@D3ZRotation>, etc.
     }
    property OnRotating:TNotifyEvent read FOnRotating write FOnRotating;
    
    {: Event which fires in <see method=TMAthImage@D3StopRotating>. Use it
    to redraw everything after the rotation is complete.
    }
    property OnRotateStop:TNotifyEvent read FOnEndRotate write FOnEndRotate;
    
    {: Event which fires at each increment in <see method=TMathImage@D3StartMovingIn>
    and  -Out. Use it to update your drawing, or part of it, to make moving
    visible.

    <B=Note:> The event does not fire
    when you justchange <see property=TMathImage@D3Viewdist>.
    }
    property OnMoving:TNotifyEvent read FOnMoving write FOnMoving;

    {: Event which fires in <see method=TMAthImage@D3StopMoving>. Use it
    to redraw everything after the move in/out is complete.
    }
    property OnMoveStop:TNotifyEvent read FOnEndMove write FOnEndMove;

    {: Event which fires at each increment in <see method=TMathImage@D3StartZoomingIn>
    and  -Out. Use it to update your drawing, or part of it, to make zooming
    visible.

    <B=Note:> The event does not fire
    when you justchange <see property=TMathImage@D3ViewAngle>.
    }
    property OnZooming:TNotifyEvent read FOnZooming write FOnZooming;

    {: Event which fires in <see method=TMAthImage@D3StopZooming>. Use it
    to redraw everything after the zoom in/out is complete.
    }
    property OnZoomStop:TNotifyEvent read FOnEndZoom write FOnEndZoom;
    {analogous}


    {: Code you wish to perform each time the control's width or
      height change.
     You can use it e.g. to redraw what you had before under the
     new scaling, or to just plain erase the drawing. Note: At each resize of
     the control, the underlying bitmap is resized accordingly, and
     the world-to-picture scalings are reset. This avoids flicker in drawing
     and makes sure that MouseEvents of the control get translated in
     the right way. Since there is no (easy) way to know what the
     picture contained previous to resizing, you have to write the
     code in OnResize that restores the picture drawn so far, if you
     want to do so. If you don't assign OnResize, the picture under the
     previous scale is preserved, but any new drawing is done under
     the new scale.
     }

     {: <New topic=Thanks@Thanks>
     <B=Thanks:><par><par>
     <LI=<B=Team-B> at the Compuserve Delphi Forum, and later at the Borland News Groups,
     for donating part of their free time to giving incredibly accurate and knowledgable help
     to all of us Delphi users. I am particularly indepted for critical pointers to (in no particular order)
     <par><LI=Steve Schafer><Li=Kurt Bartholomess><Li=Ralph Friedman><Li=Peter Below> >
     <par>
     <LI=<B=Atanas Stoyanov> for making his MemProof program available for free. It is supposedly a beta
     version, but is very reliable in my experience. It helped to find memory leaks in the component.>
     <par>
     <LI=<B=GpProfile (Open Source)> Thanks to the development team. This profiler helped
     to speed up things.>
     <par>
     <Li=<B=Joe Herb> (Borland Newsgroups) for pointing out a way to properly store published float properties.>
     <par>
     <Li=<B=Piero Valagussa> for his free help creator, which translated the commented component interface into
     a component help file.>
     <par>
     last not least
     <par>
     <Li=<B=Component Users> for pointing out flaws and asking for new features.>
     }

    property OnResize:TNotifyEvent read FOnResize write FOnResize;

     { Published declarations }

  end;


procedure Register;


implementation

procedure Register;
begin
  RegisterComponents('Samples', [TMathImage]);
end;


{TSurface}

constructor TSurface.create(xgrid,ygrid:integer);
var i,j:integer; l:longint;
begin
  inherited create;
  Fxm:=-1; Fym:=-1;
  Ferror:=true;
  l:=xgrid;
  l:=l*ygrid;
  if (xgrid>=0) and (xgrid<=500) and (ygrid>=0) and (ygrid<=500)
  {$IFDEF WINDOWS}
    and (2*l<16381)
  {$ENDIF}
  then
  begin
    ferror:=false;
    Fxm:=xgrid; Fym:=ygrid;
    For i:=0 to Fxm do
    begin
      {$IFDEF WINDOWS}
      New(FFloatSurface[i]);
      {$ENDIF}
      For j:=0 to Fym do
      begin
        {$IFDEF WINDOWS}
        New(FFloatSurface[i]^[j]);
        with FFloatSurface[i]^[j]^ do
        {$ENDIF}
        {$IFDEF WIN32}
        New(FFloatSurface[i,j]);
        with FFloatSurface[i,j]^ do
        {$ENDIF}
        begin
          x:=0; y:=0; z:=0;
        end;
      end;
    end;
  end else
  raise ESurfaceError.Create('Surface grid size out of bounds');
end;

procedure TSurface.Make(i,j:integer;x,y,z:extended);
begin
  if (i>=0) and (i<=Fxm) and (j>=0) and (j<=Fym)
  then
  begin
    {$IFDEF WINDOWS}
    FFloatSurface[i]^[j]^.x:=x;
    FFloatSurface[i]^[j]^.y:=y;
    FFloatSurface[i]^[j]^.z:=z;
    {$ENDIF}
    {$IFDEF WIN32}
    FFloatSurface[i,j]^.x:=x;
    FFloatSurface[i,j]^.y:=y;
    FFloatSurface[i,j]^.z:=z;
    {$ENDIF}
  end else
  raise ESurfaceError.Create('Surface gridpoint does not exist');
end;

function TSurface.D3Point(i,j:integer):TSurfPoint;
var p:TSurfPoint;
begin
  if (i>=0) and (i<=Fxm) and (j>=0) and (j<=Fym) then
  {$IFDEF WINDOWS}
    p:=FFloatSurface[i]^[j]^
  {$ENDIF}
  {$IFDEF WIN32}
    p:=FFloatSurface[i,j]^
  {$ENDIF}
  else with p do
  begin
    x:=0; y:=0; z:=0;
    raise ESurfaceError.Create('Surface Gridpoint does not exist');
  end;
  result:=p;
end;

destructor TSurface.destroy;
var i,j:integer;
begin
  for i:=0 to Fxm do
  begin
    for j:=0 to Fym do
    {$IFDEF WINDOWS}
    dispose(FFloatSurface[i]^[j]);
    dispose(FFloatSurface[i]);
    {$ENDIF}
    {$IFDEF WIN32}
    dispose(FFLoatSurface[i,j]);
    {$ENDIF};
  end;
  inherited destroy;
end;

{TFloatPointList}

constructor TFloatPointList.create;
begin
  inherited create;
  fFirstpoint:=nil;
  Fcount:=0;
  fCurrentpoint:=nil;
  fnext:=nil;
end;

procedure TFloatPointList.add(x,y:extended);
var p:PFloatPoint;
begin
  new(p);
  p^.x:=x; p^.y:=y; p^.next:=nil;
  inc(Fcount);
  if fFirstpoint=nil then
  begin
    fFirstpoint:=p;
    fCurrentpoint:=p;
  end
  else
  begin
    fcurrentpoint^.next:=p;
    fcurrentpoint:=p;
  end;
end;

procedure TFloatPointList.assign;
var p:PFloatpoint; i:longint;
begin
  If AFloatPointlist.count>0 then
  begin
    p:=AFloatPointList.firstpoint;
    for i:=1 to AFloatPointlist.count do
    begin
      add(p^.x,p^.y);
      p:=p^.next;
    end;
  end;
end;


destructor TFloatPointList.destroy;
var p,q:PFloatPoint;
begin
  if fFirstPoint<>nil then
  begin
    p:=fFirstpoint;
    while p^.next<>nil do
    begin
      q:=p^.next;
      dispose(p);
      p:=q;
    end;
    dispose(p);
  end;
  ffirstpoint:=nil;
  fCurrentpoint:=nil;
  inherited destroy;
end;


{TFloatPointListList}

constructor TFloatPointListList.create;
begin
  inherited create;
  fFirstlist:=nil;
  Fcount:=0;
  FTotalCount:=0;
  fCurrentlist:=nil;
end;

procedure TFloatPointListList.add;
var p:TFloatPointList;
begin
  p:=TFloatPointList.create;
  inc(Fcount);
  if fFirstlist=nil then
  begin
    fFirstlist:=p;
    fCurrentlist:=p;
  end
  else
  begin
    fcurrentlist.fnext:=p;
    fcurrentlist:=p;
  end;
end;

procedure TFloatPointListList.AddToCurrent(x,y:extended);
begin
  fcurrentlist.add(x,y);
  inc(FTotalcount);
end;

destructor TFloatPointListList.destroy;
var p,q:TFloatPointList;
begin
  if fFirstList<>nil then
  begin
    p:=fFirstList;
    while p.next<>nil do
    begin
      q:=p.next;
      p.free;
      p:=q;
    end;
    p.free;
  end;
  ffirstlist:=nil;
  fCurrentlist:=nil;
  inherited destroy;
end;

{TD3FloatPointList}

constructor TD3FloatPointList.create;
begin
  inherited create;
  fFirstpoint:=nil;
  Fcount:=0;
  fCurrentpoint:=nil;
  fnext:=nil;
end;

procedure TD3FloatPointList.add(x,y,z:extended);
var p:PD3FloatPoint;
begin
  new(p);
  p^.x:=x; p^.y:=y; p^.z:=z; p^.next:=nil;
  inc(Fcount);
  if fFirstpoint=nil then
  begin
    fFirstpoint:=p;
    fCurrentpoint:=p;
  end
  else
  begin
    fcurrentpoint^.next:=p;
    fcurrentpoint:=p;
  end;
end;

procedure TD3FloatPointList.assign;
var p:PD3Floatpoint; i:longint;
begin
  If AFloatPointlist.count>0 then
  begin
    p:=AFloatPointList.firstpoint;
    for i:=1 to AFloatPointlist.count do
    begin
      add(p^.x,p^.y,p^.z);
      p:=p^.next;
    end;
  end;
end;

destructor TD3FloatPointList.destroy;
var p,q:PD3FloatPoint;
begin
  if fFirstPoint<>nil then
  begin
    p:=fFirstpoint;
    while p^.next<>nil do
    begin
      q:=p^.next;
      dispose(p);
      p:=q;
    end;
    dispose(p);
  end;
  ffirstpoint:=nil;
  fCurrentpoint:=nil;
  inherited destroy;
end;

{TD3FloatPointListList}

constructor TD3FloatPointListList.create;
begin
  inherited create;
  fFirstlist:=nil;
  Fcount:=0;
  FTotalCount:=0;
  fCurrentlist:=nil;
end;

procedure TD3FloatPointListList.add;
var p:TD3FloatPointList;
begin
  p:=TD3FloatPointList.create;
  inc(Fcount);
  if fFirstlist=nil then
  begin
    fFirstlist:=p;
    fCurrentlist:=p;
  end
  else
  begin
    fcurrentlist.fnext:=p;
    fcurrentlist:=p;
  end;
end;

procedure TD3FloatPointListList.AddToCurrent(x,y,z:extended);
begin
  fcurrentlist.add(x,y,z);
  inc(FTotalcount);
end;

destructor TD3FloatPointListList.destroy;
var p,q:TD3FloatPointList;
begin
  if fFirstList<>nil then
  begin
    p:=fFirstList;
    while p.next<>nil do
    begin
      q:=p.next;
      p.free;
      p:=q;
    end;
    p.free;
  end;
  ffirstlist:=nil;
  fCurrentlist:=nil;
  inherited destroy;
end;




{TMathImage}
procedure TMathImage.fbrushchanged(sender:tobject);
begin
  //if not (csdesigning in componentstate) then
  //if assigned(fbitmap) then
  begin
    fOrgBrushchanged(sender);
    {$IFDEF WIN32}
    if frecordmetafile then
    fmetafilecanvas.brush.assign(canvas.brush);
    {$ENDIF}
  end;
end;

procedure TMathImage.fpenchanged(sender:tobject);
begin
  //if not (csdesigning in componentstate) then
  //if assigned(fbitmap) then
  begin
    fOrgpenchanged(sender);
    {$IFDEF WIN32}
    if frecordmetafile then
    fmetafilecanvas.Pen.assign(fbitmap.canvas.pen);
    {$ENDIF}
  end;
end;

procedure TMathImage.fbitmapchanged(sender:TObject);
begin
  if not FLockUpdate then if not fdrawing then invalidate //else update;
end;

procedure TMathImage.ffontchanged(sender:tobject);
begin
  //if not (csDesigning in componentstate) then
  //if assigned(fbitmap) then
  begin
    fOrgfontchanged(sender);
    {$IFDEF WIN32}
    if frecordmetafile then
    begin
      fmetafilecanvas.font.assign(fbitmap.canvas.font);
      with fmetafilecanvas.font do size:=size*2;
    end;
    {$ENDIF}
  end;
end;

procedure TMathImage.setversion;
begin
  {fversion:=x};
end;

procedure TMathImage.setrecordmetafile;
begin
  {$IFDEF WIN32}
  frecordmetafile:=x;
  if x then
  begin
    FMetafile:=TMetafile.create;
    fmetafile.enhanced:=true;
    fmetafile.height:=2*height;
    fmetafile.width:=2*width;
    FMetafileCanvas:=TMetafileCanvas.Create(FMetafile,0);
    with fbitmap.canvas do
    begin
      font.onchange:=ffontchanged;
      brush.onchange:=fbrushchanged;
      pen.onchange:=fpenchanged;
    end;
    ffontchanged(nil); fpenchanged(nil); fbrushchanged(nil);
  end else
  begin
    if fmetafilecanvas<>nil then fmetafilecanvas.free;
    if fmetafile<>nil then fmetafile.free;
    fmetafile:=nil;
    fmetafilecanvas:=nil;
    with fbitmap.canvas do
    begin
      font.onchange:=fOrgfontchanged;
      brush.onchange:=fOrgbrushchanged;
      pen.onchange:=fOrgpenchanged;
    end;
  end;
  {$ENDIF}
end;



procedure TMathImage.setx1d2;
begin
  setworld(x,y1d2,x+xwd2,y1d2+ywd2);
end;
procedure TMathImage.setxwd2;
begin
  if x>0 then
  setworld(x1d2,y1d2,x1d2+x,y1d2+ywd2)
  else
    raise EMathImageError.Create('x-worldwidth must be positive');
end;
procedure TMathImage.sety1d2;
begin
  setworld(x1d2,x,x1d2+xwd2,x+ywd2);
end;
procedure TMathImage.setywd2;
begin
  if x>0 then
  setworld(x1d2,y1d2,x1d2+xwd2,y1d2+x)
  else raise EMathImageError.Create('y-worldwidth must be positive');
end;
procedure TMathImage.setx1d3;
begin
  d3setworld(x,y1d3,z1d3,x+xwd3,y1d3+ywd3,z1d3+zwd3);
end;
procedure TMathImage.setxwd3;
begin
  If x>0 then
  d3setworld(x1d3,y1d3,z1d3,x1d3+x,y1d3+ywd3,z1d3+zwd3)
  else raise EMathImageError.Create('x-worldwidth must be positive');
end;
procedure TMathImage.sety1d3;
begin
  d3setworld(x1d3,x,z1d3,x1d3+xwd3,x+ywd3,z1d3+zwd3);
end;
procedure TMathImage.setywd3;
begin
  if x>0 then
  d3setworld(x1d3,y1d3,z1d3,x1d3+xwd3,y1d3+x,z1d3+zwd3)
  else raise EMathImageError.Create('y-worldwidth must be positive');
end;
procedure TMathImage.setz1d3;
begin
  d3setworld(x1d3,y1d3,x,x1d3+xwd3,y1d3+ywd3,x+zwd3);
end;
procedure TMathImage.setzwd3;
begin
  if x>0 then
  d3setworld(x1d3,y1d3,z1d3,x1d3+xwd3,y1d3+ywd3,z1d3+x)
  else raise EMathImageError.Create('z-worldwidth must be positive');
end;

procedure TMathImage.setvd;
begin
  vd:=x;
  if not (csdesigning in componentstate) then
  initworld;
end;
procedure TMathImage.setalpha;
begin
  alpha:=x;
  if not (csdesigning in componentstate) then
  initworld;
end;
procedure TMathImage.setzrd3;
begin
  zrd3:=x;
  if not (csdesigning in componentstate) then
  initworld;
end;
procedure TMathImage.setyrd3;
begin
  yrd3:=x;
  if not (csdesigning in componentstate) then
  initworld;
end;

procedure TMathImage.setard3;
begin
  ard3:=x;
  if not (csdesigning in componentstate) then
  initworld;
end;

procedure TMathImage.setXscale;
begin
  xscale:=x;
  if not (csDesigning in componentstate) then
  initworld;
end;

procedure TMathImage.setYscale;
begin
  yscale:=x;
  if not (csDesigning in componentstate) then
  initworld;
end;

procedure TMathImage.setZscale;
begin
  zscale:=x;
  if not (csDesigning in componentstate) then
  initworld;
end;

procedure TMathImage.setfont(x:tfont);
begin
  fbitmap.canvas.font.Assign(x);
end;
procedure TMathImage.setbrush(x:tbrush);
begin
  fbitmap.canvas.brush.assign(x);
end;
procedure TMathImage.setpen(x:tpen);
begin
  fbitmap.canvas.pen.assign(x);
end;

function TMathImage.getd2worldx2;
begin
  result:=x1d2+xwd2;
end;

function TMathImage.getd2worldy2;
begin
  result:=y1d2+ywd2;
end;

function TMathImage.getd3worldx2;
begin
  result:=x1d3+xwd3;
end;

function TMathImage.getd3worldy2;
begin
  result:=y1d3+ywd3;
end;
function TMathImage.getd3worldz2;
begin
  result:=z1d3+zwd3;
end;


{All the following tedious code is just so a value 0 can be set for
the properties... Maybe I get it more elegant in a later version, right
now I'm glad it works}
procedure TMathImage.ReadD2WorldX1(Reader: TReader);
begin
  x1d2:=Reader.ReadFloat;
end;
procedure TMathImage.WriteD2WorldX1(Writer:TWriter);
begin
  Writer.WriteFloat(x1d2);
end;
procedure TMathImage.ReadD2WorldXW(Reader: TReader);
begin
  xwd2:=Reader.ReadFloat;
end;
procedure TMathImage.WriteD2WorldXW(Writer:TWriter);
begin
  Writer.WriteFloat(xwd2);
end;
procedure TMathImage.ReadD2WorldY1(Reader: TReader);
begin
  y1d2:=Reader.ReadFloat;
end;
procedure TMathImage.WriteD2WorldY1(Writer:TWriter);
begin
  Writer.WriteFloat(y1d2);
end;
procedure TMathImage.ReadD2WorldYW(Reader:TReader);
begin
  ywd2:=Reader.ReadFloat;
end;
procedure TMathImage.WriteD2WorldYW(Writer:TWriter);
begin
  Writer.WriteFloat(ywd2);
end;
procedure TMathImage.ReadD3WorldX1(Reader: TReader);
begin
  x1d3:=Reader.ReadFloat;
end;
procedure TMathImage.WriteD3WorldX1(Writer:TWriter);
begin
  Writer.WriteFloat(x1d3);
end;
procedure TMathImage.ReadD3WorldY1(Reader: TReader);
begin
  y1d3:=Reader.ReadFloat;
end;
procedure TMathImage.WriteD3WorldY1(Writer:TWriter);
begin
  Writer.WriteFloat(y1d3);
end;
procedure TMathImage.ReadD3WorldZ1(Reader: TReader);
begin
  z1d3:=Reader.ReadFloat;
end;
procedure TMathImage.WriteD3WorldZ1(Writer:TWriter);
begin
  Writer.WriteFloat(z1d3);
end;
procedure TMathImage.ReadD3WorldXW(Reader: TReader);
begin
  xwd3:=Reader.ReadFloat;
end;
procedure TMathImage.WriteD3WorldXW(Writer:TWriter);
begin
  Writer.WriteFloat(xwd3);
end;
procedure TMathImage.ReadD3WorldYW(Reader: TReader);
begin
  ywd3:=Reader.ReadFloat;
end;
procedure TMathImage.WriteD3WorldYW(Writer:TWriter);
begin
  Writer.WriteFloat(ywd3);
end;
procedure TMathImage.ReadD3WorldZW(Reader: TReader);
begin
  zwd3:=Reader.ReadFloat;
end;
procedure TMathImage.WriteD3WorldZW(Writer:TWriter);
begin
  Writer.WriteFloat(zwd3);
end;
procedure TMathImage.ReadD3Yrotation(Reader: TReader);
begin
  yrd3:=Reader.ReadFloat;
end;
procedure TMathImage.WriteD3Yrotation(Writer:TWriter);
begin
  Writer.WriteFloat(yrd3);
end;
procedure TMathImage.ReadD3Zrotation(Reader: TReader);
begin
  zrd3:=Reader.ReadFloat;
end;
procedure TMathImage.WriteD3Zrotation(Writer:TWriter);
begin
  Writer.WriteFloat(zrd3);
end;

procedure TMathImage.DefineProperties(Filer: TFiler);
begin
  inherited DefineProperties(Filer);
  with Filer do
  begin
    DefineProperty('D2WorldX1',ReadD2WorldX1,WriteD2WorldX1,true);
    DefineProperty('D2WorldXW',ReadD2WorldXW,WriteD2WorldXW,true);
    DefineProperty('D2WorldY1',ReadD2WorldY1,WriteD2WorldY1,true);
    DefineProperty('D2WorldYW',ReadD2WorldYW,WriteD2WorldYW,true);
    DefineProperty('D3WorldX1',ReadD3WorldX1,WriteD3WorldX1,true);
    DefineProperty('D3WorldY1',ReadD3WorldY1,WriteD3WorldY1,true);
    DefineProperty('D3WorldZ1',ReadD3WorldZ1,WriteD3WorldZ1,true);
    DefineProperty('D3WorldXW',ReadD3WorldXW,WriteD3WorldXW,true);
    DefineProperty('D3WorldYW',ReadD3WorldYW,WriteD3WorldYW,true);
    DefineProperty('D3WorldZW',ReadD3WorldZW,WriteD3WorldZW,true);
    DefineProperty('D3Zrotation',ReadD3Zrotation,WriteD3Zrotation,true);
    DefineProperty('D3Yrotation',ReadD3Yrotation,WriteD3Yrotation,true);
  end;
end;
{Tedious part over, the important stuff comes next}

Constructor TMathImage.Create(AOwner:TComponent);
begin
  inherited create(AOWner);
  controlstyle:=controlstyle+[csOpaque];
  hregion:=0; hregionm:=0;
  x1d2:=-1; xwd2:=2; y1d2:=-1; ywd2:=2;
  x1d3:=-1; xwd3:=2; y1d3:=-1; ywd3:=2;
  z1d3:=-1; zwd3:=2; axisglb:=false; alpha:=6;
  vd:=6.4; zrd3:=45; yrd3:=45; ard3:=true;
  xscale:=1; yscale:=1; zscale:=1;
  fversion:='5.0 August 99 ';
  fBitmap:=TBitmap.create;
  fbitmap.onchange:=fbitmapchanged;
  fLockUpdate:=false;
  frecordmetafile:=false;
  fdrawing:=false;
  fmetafile:=nil;
  fmetafilecanvas:=nil;
  with fbitmap.Canvas do
  begin
    fOrgFontchanged:=font.Onchange;
    fOrgBrushchanged:=brush.Onchange;
    fOrgPenchanged:=pen.onchange;
  end;
  width:=30;
  height:=30;
end;



Destructor TMathImage.Destroy;
begin
  if hregion<>0 then deleteobject(hregion);
  if hregionm<>0 then deleteobject(hregionm);
  fbitmap.free;
  {$IFDEF WIN32}
  if fmetafilecanvas<>nil then FMetafilecanvas.free;
  if fmetafile<>nil then FMetafile.free;
  {$ENDIF}
  inherited destroy;
end;

procedure TMathImage.WMWindowPosChanged(var Msg:TMessage);
begin
  inherited;
  if not (csDesigning in Componentstate) then
  if assigned(parent) then
  if assigned(fbitmap) then
  if (width<>fbitmap.width) or
  (height<>fbitmap.height) then
  begin
    fbitmap.height:=height;
    fbitmap.width:=width;
    {$IFDEF WIN32}
    if frecordmetafile then
    begin
      fmetafilecanvas.free;
      fmetafile.width:=2*Width;
      fmetafile.height:=2*height;
      fmetafilecanvas:=tmetafilecanvas.create(fmetafile,0);
      fmetafilecanvas.draw(0,0,fmetafile);
    end;
    {$ENDIF}
    setaxisglb(axisglb);
    d3resetworld;
    fbrushchanged(nil); fpenchanged(nil); ffontchanged(nil);
    if assigned(FOnResize) then FOnResize(self);
  end;
end;

procedure TMathImage.Paint;
var savedrawing:boolean;
begin
  inherited Paint;
  savedrawing:=fdrawing;
  fdrawing:=true;
  try
    if csDesigning in ComponentState then
    with inherited Canvas do
    begin
      Pen.Style := psDash;
      Brush.Style := bsClear;
      Rectangle(0, 0, Width, Height);
    end;
    //with inherited canvas do
   // BitBlt(Handle, 0, 0, width,
          //  height, fbitmap.Canvas.Handle, 0, 0, SRCCOPY);
    inherited canvas.draw(0,0,fbitmap);
  finally
    fdrawing:=savedrawing;
  end;
end;

procedure TMathImage.LockUpdate;
begin
  fLockUpdate:=true;
  fBitmap.OnChange:=nil;
end;

procedure TMathImage.UnLockUpdate;
begin
  fLockUpdate:=false;
  fBitmap.OnChange:=fBitmapchanged;
  invalidate;
end;

function TMathImage.GetCanvas;
begin
  result:=fbitmap.canvas;
  {if not ((CSDesigning in Componentstate)
         or (CSReading in Componentstate))  then
  begin
    if Picture.Graphic = nil then
    begin
      Bitmap := TBitmap.Create;
      try
        Bitmap.Width := Width;
        Bitmap.Height := Height;
        Picture.Graphic := Bitmap;
        with picture.bitmap.canvas do
        begin
          font.assign(Ffont);
          pen.assign(Fpen);
          brush.assign(Fbrush);
        end;}
        {$IFDEF WIN32}
        {if frecordmetafile then
        with fmetafilecanvas do
        begin
          font.assign(ffont);
          pen.assign(fpen);
          brush.assign(fbrush);
        end; }
        {$ENDIF}
      {finally
        Bitmap.Free;
      end;
    end;
    if Picture.Graphic is TBitmap then
      Result := TBitmap(Picture.Graphic).Canvas
    else
      raise EInvalidOperation.Create('Draw needs Bitmap for Drawing');
  end }{If not (Designing or Reading)}
  {else result:=FCanvas;}
end;

function TMathImage.getbrush:TBrush;
begin
  result:=fbitmap.canvas.brush;
end;

function TMathImage.getpen:TPen;
begin
  result:=fbitmap.canvas.pen;
end;

function TMathImage.getfont:TFont;
begin
  result:=fbitmap.canvas.font;
end;      





procedure TMathImage.setaxisglb;
begin
  axisglb:=a;
  resetworld;
  if hregion<>0 then deleteobject(hregion);
  hregion:=0;
  if hregionm<>0 then deleteobject(hregionm);
  hregionm:=0;
  if a then
  begin
    FCliprect:=rect(windowx(x1d2)+1,windowy(y1d2+ywd2),
         windowx(x1d2+xwd2)+1,windowy(y1d2));
    With FCliprect do
    hregion:=CreateRectRgn(Left,Top,Right,Bottom);
    SelectClipRgn(canvas.handle,hregion);
    {$IFDEF WIN32}
    if frecordmetafile then
    begin
      FCliprectM:=rect(windowxm(x1d2)+1,windowym(y1d2+ywd2),
         windowxm(x1d2+xwd2)+1,windowym(y1d2));
      With FCliprectM do
      hregionM:=CreateRectRgn(Left,Top,Right,Bottom);
      SelectClipRgn(fmetafilecanvas.handle,hregionm);
    end;
    {$ENDIF}
  end else
  begin
    SelectClipRgn(canvas.handle,0);
    FClipRect:=rect(0,0,width,height);
    {$IFDEF WIN32}
    if frecordmetafile then
    begin
      SelectClipRgn(fmetafilecanvas.handle,0);
      FClipRectM:=rect(0,0,2*width,2*height);
    end;
    {$ENDIF}
  end;
end;


procedure TMathImage.setworld;
var Smaxxtw, Smaxytw, Smaxth:integer;
    Sax, Sbx, Say, Sby:extended;
 function max(i,j:integer):integer;
 begin
   if i<j then result:=j else result:=i;
 end;

 function maxtextwidth(xx1,xx2:extended):integer;
 var itemp,xtick:extended;
     i,istart,ticks,w:longint;
 begin
   itemp:=ln(abs(xx2-xx1)/8)/ln(10);
   if itemp>=0 then i:=trunc(itemp) else i:=trunc(itemp)-1;
   xtick:=exp(i*ln(10));
   istart:=round(xx1/xtick);
   while istart*xtick<xx1 do inc(istart);
   ticks:=round((xx2-xx1)/xtick);
   font.size:=font.size-1;
   w:=canvas.textwidth(floattostrf(istart*xtick,ffgeneral,3,3));
   for i:=1 to 4 do
   w:=max(w,canvas.textwidth(floattostrf((istart+i*(ticks div 4))*xtick,ffgeneral,3,3)));
   result:=w;
   font.size:=font.size+1;
 end;
begin
  Smaxxtw:=maxxtw; Smaxytw:=maxytw;
  Sax:=Ax; Say:=Ay;
  Sbx:=Bx; Sby:=By;
  Smaxth:=maxth;
  try
    if axisglb then
    begin
      maxxtw:=maxtextwidth(x1,x2);
      maxytw:=maxtextwidth(y1,y2);
      maxth:=canvas.textheight('-1.234567');
      Bx := (width-9-maxytw-(maxxtw div 2))/(x2 - x1);
      Ax :=8+maxytw-x1*Bx;
      By:=(height-7-2*maxth)/(y1-y2);
      Ay:=maxth-By*y2;
      Bxm := (2*width-17-2*maxytw-maxxtw)/(x2 - x1);
      Axm :=16+2*maxytw-x1*Bxm;
      Bym:=(2*height-13-4*maxth)/(y1-y2);
      Aym:=2*maxth-Bym*y2;
    end else
    begin
      Bx:=(width-1)/(x2-x1);
      Ax :=  - x1d2*Bx;
      By :=(height-1)/(y1-y2);
      Ay := -y2*By;
      Bxm:=(2*width-1)/(x2-x1);
      Axm :=  - x1d2*Bxm;
      Bym :=(2*height-1)/(y1-y2);
      Aym := -y2*Bym;
    end;
    x1d2:=x1; xwd2:=x2-x1; y1d2:=y1; ywd2:=y2-y1;
  except
    on E:EMathError do
    begin
      maxxtw:=Smaxxtw; maxytw:=Smaxytw; maxth:=Smaxth;
      Ax:=Sax; Ay:=Say; Bx:=Sbx; By:=Sby;
      raise EMathImageError.Create('Invalid D2-world bounds');
    end;
  end;
end;

procedure TMathImage.resetworld;
begin
  setworld(x1d2,y1d2,x1d2+xwd2,y1d2+ywd2);
end;

procedure TMathImage.setcolor;
begin
  pen.color:=color;
end;

function TMathImage.getcolor;
begin
  result:=pen.color;
end;

function TMathImage.WindowX;
var Temp: extended;
begin
   Temp := Ax + Bx * x;
   if abs(temp)<16000 then
    result:= round(Temp)
   else
    if temp<0 then result:=-16000 else result:=16000;
end;

function TMathImage.WindowY;
var Temp : extended;
begin
    Temp := Ay + By * y;
    if abs(temp)<16000 then
      result:= round(Temp)
    else
      if temp<0 then result:=-16000 else result:=16000;
end;

function TMathImage.WindowXM;
var Temp: extended;
begin
   Temp := Axm + Bxm * x;
   if abs(temp)<16000 then
    result:= round(Temp)
   else
    if temp<0 then result:=-16000 else result:=16000;
end;

function TMathImage.WindowYM;
var Temp : extended;
begin
    Temp := Aym + Bym * y;
    if abs(temp)<16000 then
      result:= round(Temp)
    else
      if temp<0 then result:=-16000 else result:=16000;
end;

function TMathImage.norm;
begin
  result:=sqrt(sqr(x)+sqr(y));
end;

function TMathImage.worldx;
begin
  try
    result:=(xs-Ax)/Bx;
  except
    On E:EMathError do
    begin
      result:=0;
      raise EMathImageError.Create('Can''t convert to world-x');
    end;
  end;
end;

function TMathImage.worldy;
begin
  try
    result:=(ys-ay)/by;
  except
    On E:EMathError do
    begin
      raise EMathImageError.Create('Can''t convert to world-y');
    end;
  end;
end;

procedure TMathImage.clear;
var clipped:boolean;
begin
  clipped:=(hregion<>0);
  {$IFDEF WIN32}
  if frecordmetafile then
  begin
    fmetafilecanvas.free;
    fmetafile.free;
    fmetafile:=TMetafile.create;
    fmetafile.enhanced:=true;
    fmetafile.height:=2*height;
    fmetafile.width:=2*width;
    fmetafilecanvas:=TMetafilecanvas.create(FMetafile,0);
    with fmetafilecanvas do
    begin
      brush.Assign(fbitmap.canvas.brush);
      pen.assign(fbitmap.canvas.pen);
      font.assign(fbitmap.canvas.font);
    end;
  end;
  {$ENDIF}
  If clipped then
  begin
    deleteobject(hregion);
    hregion:=0;
    selectcliprgn(canvas.handle,0);
    canvas.fillrect(rect(0,0,width,height));
    {$IFDEF WIN32}
    if frecordmetafile then
    begin
      deleteobject(hregionm);
      hregionm:=0;
      selectcliprgn(fmetafilecanvas.handle,0);
      fmetafilecanvas.fillrect(
      rect(0,0,2*width,2*height));
    end;
    {$ENDIF}
    With FClipRect do
    hregion:=CreateRectRgn(Left,Top,Right,Bottom);
    selectcliprgn(canvas.handle,hregion);
    {$IFDEF WIN32}
    If frecordmetafile then
    begin
      With FClipRectM do
      hregionM:=CreateRectRgn(Left,Top,Right,Bottom);
      selectcliprgn(fmetafilecanvas.handle,hregionM);
    end;
    {$ENDIF}
  end else
    canvas.fillrect(rect(0,0,width,height));
    {$IFDEF WIN32}
    if frecordmetafile then
    fmetafilecanvas.fillrect(
    rect(0,0,2*width,2*height));
    {$ENDIF}
  {invalidate;}
  {This is better than the method suggested in the documentation,
   because it keeps the previous settings for pen, brush etc. }
end;

procedure TMathImage.clearClipped;
begin
  canvas.fillrect(FCliprect);
  {$IFDEF WIN32}
  if frecordmetafile then
  fmetafilecanvas.fillrect(FCliprectM);
  {$ENDIF}
end;

procedure TMathImage.DrawPoint;
begin
   SelectClipRgn(canvas.handle,hregion);
  canvas.pixels[windowx(x),windowy(y)]:=canvas.pen.color;
  {$IFDEF WIN32}
  If fRecordMetafile then
  begin
  SelectClipRgn(fmetafilecanvas.handle,hregionm);
  fmetafilecanvas.pixels[windowxm(x),windowym(y)]:=canvas.pen.color;
  end;
  {$ENDIF}
end;

procedure TMathImage.MovetoPoint;
begin
  SelectClipRgn(canvas.handle,hregion);
  canvas.moveto(windowx(x),windowy(y));
  {$IFDEF WIN32}
  If fRecordMetafile then
  begin
  SelectClipRgn(fmetafilecanvas.handle,hregionm);
  fmetafilecanvas.moveto(windowxm(x),windowym(y));
  end;
  {$ENDIF}
end;

procedure TMathImage.DrawLine;
var p1,p2:TPoint;
begin
  p1:=point(windowx(x1),windowy(y1));
  p2:=point(windowx(x2),windowy(y2));
  {canvas.moveto(windowx(x1),windowy(y1));
  canvas.lineto(xw,yw);
  canvas.pixels[xw,yw]:=canvas.pen.color;}
  SelectClipRgn(canvas.handle,hregion);
  canvas.polyline([p1,p2,p1]);
  {Faster than the commented above. Note that moveto / lineto
   doesn't do what you want (or at least what I want), because
   it never draws the endpixel of the line}
   {$IFDEF WIN32}
   If fRecordMetafile then
  begin
   p1:=point(windowxm(x1),windowym(y1));
  p2:=point(windowxm(x2),windowym(y2));
   SelectClipRgn(fmetafilecanvas.handle,hregionm);
  fmetafilecanvas.polyline([p1,p2,p1]);
  end;
  {$ENDIF}
end;


procedure TMathImage.DrawLineto(x,y:extended);
begin
  SelectClipRgn(canvas.handle,hregion);
  canvas.Lineto(windowx(x),windowy(y));
  {$IFDEF WIN32}
  If fRecordMetafile then
  begin
  SelectClipRgn(fmetafilecanvas.handle,hregionm);
  fmetafilecanvas.Lineto(windowxm(x),windowym(y));
  end;
  {$ENDIF}
end;

procedure TMathImage.DrawEllipse(x1,y1,x2,y2:extended);
begin
  SelectClipRgn(canvas.handle,hregion);
  canvas.ellipse(windowx(x1),windowy(y2),windowx(x2),windowy(y1));
  {$IFDEF WIN32}
  If fRecordMetafile then
  begin
  SelectClipRgn(fmetafilecanvas.handle,hregionm);
  fmetafilecanvas.ellipse(windowxm(x1),windowym(y2),windowx(x2),windowy(y1));
  end;
  {$ENDIF}
end;

procedure TMathImage.DrawRectangle;
begin
  SelectClipRgn(canvas.handle,hregion);
  canvas.rectangle(windowx(x1),windowy(y2),windowx(x2)+1,windowy(y1)+1);
  {Note: the one is added to make the rectangle come out the same as
  it would by using the canvas.polygon method. I don't know why the
  standard canvas rectangle is always a pixel too short. Or maybe it's
  my video driver?}
  {$IFDEF WIN32}
  If fRecordMetafile then
  begin
  SelectClipRgn(fmetafilecanvas.handle,hregionm);
  fmetafilecanvas.rectangle(windowxm(x1),windowym(y2),windowxm(x2)+1,windowym(y1)+1);
  end;
  {$ENDIF}
end;

procedure TMathImage.drawaxes;
var xs,ys,xsm,ysm,i,istart,ticks:longint;
    savepen:TPen; SaveBrush:TBrush;
    t:string; itemp,xtick,ytick:extended;
    save:boolean;   SaveEvent:TNotifyEvent;

   function min(i,j:longint):longint;
   begin
     if i<j then result:=i else result:=j;
   end;

begin
  save:=FLockUpdate;
  FLockUpdate:=true;
  SaveEvent:=fBitmap.OnChange;
  fBitmap.OnChange:=nil;
  try
  savebrush:=TBrush.create;
  savepen:=TPen.create;
  try
    xsm:=0; ysm:=0;
    savepen.assign(pen);
    savebrush.assign(brush);
    setaxisglb(true);
    if hregion<>0 then deleteobject(hregion);
    hregion:=0;
    if hregionm<>0 then deleteobject(hregionm);
    hregionm:=0;
    //ffontchanged(nil);
    brush.style:=bsclear;
    pen.style:=psSolid;
    pen.width:=1;
    setcolor(axescolor);
    drawline(x1d2,y1d2,x1d2+xwd2,y1d2);
    itemp:=ln(xwd2/8)/ln(10);
    if itemp>=0 then
    i:=trunc(itemp) else i:=trunc(itemp)-1;
    xtick:=exp(i*ln(10));
    itemp:=ln(ywd2/8)/ln(10);
    if itemp>=0 then
      i:=trunc(itemp) else i:=trunc(itemp)-1;
    ytick:=exp(i*ln(10));
    if xtick>0 then
    begin
      istart:=round(x1d2/xtick);
      while istart*xtick<x1d2 do inc(istart);
      i:=istart;
      ticks:=round(xwd2/xtick);
      with font do
      size:=size-1;
      if ticks<=2000 then
      repeat
        xs:=windowx(i*xtick);
        ys:=windowy(y1d2);
        canvas.moveto(xs,ys);
        canvas.lineto(xs,ys+4);
        {$IFDEF WIN32}
        If fRecordMetafile then
        begin
        xsm:=windowxm(i*xtick);
        ysm:=windowym(y1d2);
        fmetafilecanvas.moveto(xsm,ysm);
        fmetafilecanvas.lineto(xsm,ysm+8);
        end;
        {$ENDIF}
        if (i-istart) mod (ticks div 4) =0 then
        begin
          t:=floattostrf(i*xtick,ffgeneral,3,3);
          with canvas do
          begin
            textout(xs-(textwidth(t) div 2), ys+6,t);
            moveto(xs,ys);
            lineto(xs,ys+6);
          end;
          {$IFDEF WIN32}
          If fRecordMetafile then
          with fmetafilecanvas do
          begin
            textout(xsm-(textwidth(t) div 2), ysm+12,t);
            moveto(xsm,ysm);
            lineto(xsm,ysm+12);
          end;
          {$ENDIF}
        end;
        inc(i)
      until i*xtick>x1d2+xwd2-xtick;
      with font do size:=size+1;
    end;
    xs:=windowx(x1d2+xwd2);
    ys:=windowy(y1d2);
    {$IFDEF WIN32}
    If fRecordMetafile then
    begin
    xsm:=windowxm(x1d2+xwd2);
    ysm:=windowym(y1d2);
    end;
    {$ENDIF}
    canvas.moveto(xs-6,ys-6);
    canvas.lineto(xs,ys);
    canvas.moveto(xs-6,ys+6);
    canvas.lineto(xs,ys);
    canvas.textout(min(xs+1,width-canvas.textwidth(xlabel)),ys-canvas.textheight(xlabel)-6,xlabel);
    {$IFDEF WIN32}
    If fRecordMetafile then
    with fmetafilecanvas do
    begin
      moveto(xsm-12,ysm-12);
      lineto(xsm,ysm);
      moveto(xsm-12,ysm+12);
      lineto(xsm,ysm);
      textout(min(xsm+1,2*width-2*canvas.textwidth(xlabel)),ysm-2*canvas.textheight(xlabel)-12,xlabel);
    end;
    {$ENDIF}
    drawline(x1d2,y1d2,x1d2,y1d2+ywd2);
    if ytick>0 then
    begin
      istart:=round(y1d2/ytick);
      while istart*ytick<y1d2 do inc(istart);
      i:=istart;
      ticks:=round(ywd2/ytick);
      with font do
        size:=size-1;
      if ticks <=2000 then
      repeat
        xs:=windowx(x1d2);
        ys:=windowy(i*ytick);
        {$IFDEF WIN32}
        If fRecordMetafile then
        begin
        xsm:=windowxm(x1d2);
        ysm:=windowym(i*ytick);
        end;
        {$ENDIF}
        canvas.moveto(xs,ys);
        canvas.lineto(xs-4,ys);
        {$IFDEF WIN32}
        If fRecordMetafile then
        begin
        fmetafilecanvas.moveto(xsm,ysm);
        fmetafilecanvas.lineto(xsm-8,ysm);
        end;
        {$ENDIF}
        if (i-istart) mod (ticks div 4) =0 then
        begin
          t:=floattostrf(i*ytick,ffgeneral,3,3);
          with canvas do
          begin
            textout(xs-textwidth(t)-6,ys-textheight(t) div 2,t);
            moveto(xs,ys);
            lineto(xs-6,ys);
          end;
          {$IFDEF WIN32}
          If fRecordMetafile then
          with fmetafilecanvas do
          begin
            textout(xsm-textwidth(t)-12,ysm-textheight(t) div 2,t);
            moveto(xsm,ysm);
            lineto(xsm-12,ysm);
          end;
          {$ENDIF}
        end;
        inc(i);
      until i*ytick>y1d2+ywd2-ytick;
      with font do
      size:=size+1;
    end;
    xs:=windowx(x1d2);
    ys:=windowy(y1d2+ywd2);
    {$IFDEF WIN32}
    If fRecordMetafile then
    begin
    xsm:=windowxm(x1d2);
    ysm:=windowym(y1d2+ywd2);
    end;
    {$ENDIF}
    canvas.moveto(xs+6,ys+6);
    canvas.lineto(xs,ys);
    canvas.moveto(xs-6,ys+6);
    canvas.lineto(xs,ys);
    canvas.textout(xs+6,0,ylabel);
    {$IFDEF WIN32}
    If fRecordMetafile then
    begin
    fmetafilecanvas.moveto(xsm+12,ysm+12);
    fmetafilecanvas.lineto(xsm,ysm);
    fmetafilecanvas.moveto(xsm-12,ysm+12);
    fmetafilecanvas.lineto(xsm,ysm);
    fmetafilecanvas.textout(xsm+12,0,ylabel);
    end;
    {$ENDIF}
    with FClipRect do
    hregion:=CreateRectRgn(Left,Top,Right,Bottom);
    selectclipRgn(canvas.handle,hregion);
    {$IFDEF WIN32}
    If fRecordMetafile then
    begin
    with FClipRectM do
    hregionM:=CreateRectRgn(Left,Top,Right,Bottom);
    selectclipRgn(fmetafilecanvas.handle,hregionM);
    end;
    {$ENDIF}
    if zerolines then
    begin
      pen.color:=zerolinescolor;
      drawline(0,y1d2,0,y1d2+ywd2);
      drawline(x1d2,0,x1d2+xwd2,0);
    end;
    brush.assign(savebrush);
    pen.assign(savepen);
  finally
    savebrush.free;
    savepen.free;
  end;
  finally
  FLockUpdate:=save;
  fBitmap.OnChange:=SaveEvent;
  end;
  if not FLockUpdate then
  invalidate;
end;

procedure TMathImage.drawvector;
var aw,bw,xw,yw,u1,u2,v1,v2:longint; n:extended;
    save:boolean;  SaveEvent:TNotifyEvent;
begin
  save:=FLockUpdate;
  FLockUpdate:=true;
  SaveEvent:=fBitmap.OnChange;
  fBitmap.OnChange:=nil;
  try
  SelectClipRgn(canvas.handle,hregion);
  {$IFDEF WIN32}
  if frecordmetafile then
  SelectClipRgn(fmetafilecanvas.handle,hregionm);
  {$ENDIF}
  v1:=windowx(a+x);
  v2:=windowy(b+y);
  xw:=windowx(x);
  yw:=windowy(y);
  aw:=v1-xw;
  bw:=v2-yw;
  n:=norm(bw-aw,aw+bw);
  if n>0 then
  begin
  canvas.moveto(xw,yw);
  canvas.lineto(v1,v2);
  u1:=round(8.0*(bw-aw)/n);
  u2:=round(8.0*(-bw-aw)/n);
  canvas.moveto(v1,v2);
  canvas.lineto(v1+u1,v2+u2);
  u1:=round(8.0*(-aw-bw)/n);
  u2:=round(8.0*(aw-bw)/n);
  canvas.moveto(v1,v2);
  canvas.lineto(v1+u1,v2+u2);
  end;
  {$IFDEF WIN32}
  If fRecordMetafile then
  begin
  v1:=windowxm(a+x);
  v2:=windowym(b+y);
  xw:=windowxm(x);
  yw:=windowym(y);
  aw:=v1-xw;
  bw:=v2-yw;
  n:=norm(bw-aw,aw+bw);
  if n>0 then
  with fmetafilecanvas do
  begin
  moveto(xw,yw);
  lineto(v1,v2);
  u1:=round(8.0*(bw-aw)/n);
  u2:=round(8.0*(-bw-aw)/n);
  moveto(v1,v2);
  lineto(v1+u1,v2+u2);
  u1:=round(8.0*(-aw-bw)/n);
  u2:=round(8.0*(aw-bw)/n);
  moveto(v1,v2);
  lineto(v1+u1,v2+u2);
  end;
  end;
  {$ENDIF}
  finally
  fLockUpdate:=save;
  fBitmap.OnChange:=SaveEvent;
  end;
  if not fLockUpdate then
  invalidate;
end;


procedure TMathImage.DrawPolyline(FloatPointList:TFloatpointlist);
{$IFDEF WINDOWS}
type  TPointArray=array[0..16320] of TPoint;
{$ENDIF}
{$IFDEF WIN32}
type TPointArray=array[0..1000000] of TPoint;
{$ENDIF}
var p:PFloatPoint; i:longint; pointarray:^TPointArray;
begin
  SelectClipRgn(canvas.handle,hregion);
  {$IFDEF WIN32}
  if frecordmetafile then
  SelectClipRgn(fmetafilecanvas.handle,hregionm);
  {$ENDIF}
  if assigned(floatpointlist) then
  with FloatPointList do
  begin
    {$IFDEF WINDOWS}
    if count>16320 then
    begin
      raise EMathImageError.Create('Pointlist too long');
      exit;
    end;
    {$ENDIF}
    getmem(pointarray,count*SizeOf(TPoint));
    p:=firstpoint;
    for i:=1 to count do
    with pointarray^[i-1] do
    begin
      x:=windowx(p^.x); y:=windowy(p^.y);
      p:=p^.next;
    end;
    canvas.polyline(slice(pointarray^,count));
    freemem(pointarray,count*SizeOf(TPoint));
    {$IFDEF WIN32}
    If fRecordMetafile then
    begin
    getmem(pointarray,count*SizeOf(TPoint));
    p:=firstpoint;
    for i:=1 to count do
    with pointarray^[i-1] do
    begin
      x:=windowxm(p^.x); y:=windowym(p^.y);
      p:=p^.next;
    end;
    polyline(fmetafilecanvas.handle,pointarray^,count);
    freemem(pointarray,count*SizeOf(TPoint));
    end;
    {$ENDIF}
  end;
end;

procedure TMathImage.DrawPolygon(FloatPointList:TFloatpointlist);
{$IFDEF WINDOWS}
type  TPointArray=array[0..16320] of TPoint;
{$ENDIF}
{$IFDEF WIN32}
type TPointArray=array[0..1000000] of TPoint;
{$ENDIF}
var p:PFloatPoint; i:longint; pointarray:^TPointArray;
begin
  SelectClipRgn(canvas.handle,hregion);
  {$IFDEF WIN32}
  if frecordmetafile then
  SelectClipRgn(fmetafilecanvas.handle,hregionm);
  {$ENDIF}
  if Assigned(FloatPointlist) then
  with FloatPointList do
  begin
    {$IFDEF WINDOWS}
    if count>16320 then
    begin
      raise EMathImageError.Create('Pointlist too long');
      exit;
    end;
    {$ENDIF}
    getmem(pointarray,count*SizeOf(TPoint));
    p:=firstpoint;
    for i:=1 to count do
    with pointarray^[i-1] do
    begin
      x:=windowx(p^.x); y:=windowy(p^.y);
      p:=p^.next;
    end;
    canvas.polygon(slice(pointarray^,count));
    freemem(pointarray,count*SizeOf(TPoint));
    {$IFDEF WIN32}
    If fRecordMetafile then
    begin
    getmem(pointarray,count*SizeOf(TPoint));
    p:=firstpoint;
    for i:=1 to count do
    with pointarray^[i-1] do
    begin
      x:=windowxm(p^.x); y:=windowym(p^.y);
      p:=p^.next;
    end;
    polygon(fmetafilecanvas.handle,pointarray^,count);
    freemem(pointarray,count*SizeOf(TPoint));
    end;
    {$ENDIF}
  end;
end;

procedure TMathImage.DrawPolyPolyline(FloatPointListList:TFloatpointlistlist);
{type  TPointArray=array[0..1000000] of TPoint;
      TCountArray=array[0..1000000] of Integer;
var p:PFloatPoint; q:TFloatPointList; i,j,k:longint;
        pointarray:^TPointArray; countarray:^TCountArray;
begin
  SelectClipRgn(canvas.handle,hregion);
  with FloatPointListList do
  begin
    getmem(pointarray,totalcount*SizeOf(TPoint));
    getmem(countarray,count*SizeOf(Integer));
    q:=firstlist; k:=0;
    for i:=1 to count do
    begin
      p:=q.firstpoint;
      for j:=1 to  q.count do
      begin
        with pointarray^[k] do
        begin
          x:=windowx(p^.x); y:=windowy(p^.y);
        end;
        inc(k);
        p:=p^.next;
      end;
      countarray^[i-1]:=q.count;
      q:=q.next;
    end;
    polypolyline(canvas.handle,pointarray^,countarray^,count);
    invalidate;
    freemem(pointarray,totalcount*SizeOf(TPoint));
    freemem(countarray,count*SizeOf(Integer));
  end;
end; }

var q:TFloatPointList; i:longint;
    save:boolean;  SaveEvent:TNotifyEvent;
begin
  save:=FLockUpdate;
  FLockUpdate:=true;
  SaveEvent:=fBitmap.OnChange;
  fBitmap.OnChange:=nil;
  try
  if assigned(floatpointlistlist) then
  If FloatPointListList.count>0 then
  with FloatPointListList do
  begin
    q:=Firstlist;
    For i:=1 to count do
    begin
      DrawPolyline(q);
      q:=q.next;
    end;
  end;
  finally
  fLockUpdate:=save;
  fBitmap.OnChange:=SaveEvent;
  end;
  if not fLockUpdate then
  invalidate;
end;



function max(x,y:extended):extended;
begin
  if x<y then result:=y else result:=x;
end;

function min(x,y:extended):extended;
begin
  if x<y then result:=x else result:=y;
end;


procedure TMathImage.makeradians;
var a:extended;
begin
  thetaz:=pi*zrd3/180;
  thetay:=pi*yrd3/180;
  arad:=pi*alpha/360;
  sinz:=sin(thetaz); cosz:=cos(thetaz);
  siny:=sin(thetay); cosy:= cos(thetay);
  tana:=sin(arad)/cos(arad);
  rightz:=(zrd3+90) - 180*round((zrd3+90.0)/180);
  righty:=yrd3 - 180*round(yrd3/180);
  axd3:=xwd3;
  ayd3:=ywd3;
  azd3:=zwd3;
  if not ard3 then
  begin
    axd3:=2/axd3;
    ayd3:=2/ayd3;
    azd3:=2/azd3;
  end else
  begin
    a:=2/max(max(xscale*axd3,yscale*ayd3),zscale*azd3);
    ayd3:=yscale*a; axd3:=xscale*a; azd3:=zscale*a;
  end;
  bxd3:=-axd3*(x1d3+xwd3/2);
  byd3:=-ayd3*(y1d3+ywd3/2);
  bzd3:=-azd3*(z1d3+zwd3/2);
  ap:=min(height,width)/2/tana/vd;
  bxp:=width/2; byp:=height/2;
end;

procedure TMathImage.scalar(xb,yb,zb:extended; var r:extended);
begin
  r:=yb*sinz*siny+zb*cosy+xb*siny*cosz;
end;

procedure TMathImage.dist(xb,yb,zb:extended; var r:extended);
begin
  scalar(xb,yb,zb,r);
  r:=d3viewdist-r;
end;

procedure TMathImage.d3distancetoviewer(x,y,z:extended; var r:extended);
var xb,yb,zb:extended;
begin
  blockx(x,xb); blocky(y,yb); blockz(z,zb);
  r:=sqrt(sqr(d3viewdist*siny*sinz-yb)+
    sqr(d3viewdist*cosy-zb)+sqr(d3viewdist*siny*cosz-xb));
end;


procedure TMathImage.findbase(var i1,i2,i3:integer);
var dmax,d:extended; i,j,k:integer;
begin
  i1:=-1;i2:=-1;i3:=-1;
  dmax:=0;
  for i:=0 to 1 do
  for j:=0 to 1 do
  for k:=0 to 1 do
  begin
    dist(-1+2*i,-1+2*j,-1+2*k,d);
    dmax:=max(dmax,d);
    if d=dmax then
    begin
      i1:=-1+2*i;i2:=-1+2*j;i3:=-1+2*k;
    end;
  end;
end;

procedure TMathImage.initworld;
var i1,i2,i3:integer;
begin
  if d3viewdist<0.0001 then d3viewdist:=0.0001;
  if alpha > 179 then alpha:=179;
  if alpha <0.01 then alpha:=0.01;
  makeradians;
  findbase(i1,i2,i3);
    if i1=-1 then basex:=x1d3 else basex:=x1d3+xwd3;
    if i2=-1 then basey:=y1d3 else basey:=y1d3+ywd3;
    if i3=-1 then basez:=z1d3 else basez:=z1d3+zwd3;
    if i1=1 then frontx:=x1d3 else frontx:=x1d3+xwd3;
    if i2=1 then fronty:=y1d3 else fronty:=y1d3+ywd3;
    if i3=1 then frontz:=z1d3 else frontz:=z1d3+zwd3;
end;

procedure TMathImage.d3setworld;
var sx1,sxw,sy1,syw,sz1,szw:extended;
begin
  sx1:=x1d3; sxw:=xwd3; sy1:=y1d3;
  syw:=ywd3; sz1:=z1d3; szw:=zwd3;
  try
    x1d3:=x1;
    xwd3:=x2-x1;
    y1d3:=y1;
    ywd3:=y2-y1;
    z1d3:=z1;
    zwd3:=z2-z1;
    initworld;
  except
    on E:EMatherror do
    begin
      raise EMathImageError.Create('Invalid D3-world bounds');
      x1d3:=sx1; xwd3:=sxw; y1d3:=sy1; ywd3:=syw; z1d3:=sz1; zwd3:=szw;
      initworld;
    end;
  end;
end;

procedure TMathImage.d3resetworld;
begin
  initworld;
end;

procedure TMathImage.blockx(x:extended;var xb:extended);
begin
  xb:=bxd3+axd3*x;
end;

procedure TMathImage.blocky(y:extended;var yb:extended);
begin
  yb:=byd3+ayd3*y;
end;

procedure TMathImage.blockz(z:extended;var zb:extended);
begin
  zb:=bzd3+azd3*z;
end;

procedure TMathImage.d3window(x,y,z:extended; var xs,ys:longint);
var xb,yb,zb,tempx,tempy,u,v:extended;
begin
  try
  blockx(x,xb);
  blocky(y,yb);
  blockz(z,zb);
  project(xb,yb,zb,u,v);
  tempx:=bxp+ap*u;
  if abs(tempx)<16000 then xs:=round(tempx)
  else if tempx<0 then xs:=-16000 else xs:=16000;
  tempy:=byp-ap*v;
  if abs(tempy)<16000 then ys:=round(tempy)
  else if tempy <0 then ys:=-16000 else ys:=16000;
  except
    on E:EMathError do
    begin
      raise EMathImageError.Create('D3-World to pixel transform fails');
      xs:=16000; ys:=16000;
    end;
  end;
end;

procedure TMathImage.d3windowM(x,y,z:extended; var xs,ys:longint);
var xb,yb,zb,tempx,tempy,u,v:extended;
begin
  try
  blockx(x,xb);
  blocky(y,yb);
  blockz(z,zb);
  project(xb,yb,zb,u,v);
  tempx:=2*(bxp+ap*u);
  if abs(tempx)<16000 then xs:=round(tempx)
  else if tempx<0 then xs:=-16000 else xs:=16000;
  tempy:=2*(byp-ap*v);
  if abs(tempy)<16000 then ys:=round(tempy)
  else if tempy <0 then ys:=-16000 else ys:=16000;
  except
    on E:EMathError do
    begin
      raise EMathImageError.Create('D3-World to pixel transform fails');
      xs:=16000; ys:=16000;
    end;
  end;
end;

procedure TMathImage.PseudoD3World;
var u,v,xb,yb,zb:extended;
begin
  u:=(xs-bxp)/ap*vd;
  v:=(byp-ys)/ap*vd;
  zb:=siny*v;
  yb:=cosz*u-sinz*cosy*v;
  xb:=-sinz*u-cosy*cosz*v;
  x:=(xb-bxd3)/axd3;
  y:=(yb-byd3)/ayd3;
  z:=(zb-bzd3)/azd3;
end;

procedure TMathImage.project;
var scal,d:extended;
begin
  scalar(xb,yb,zb,scal);
  d:=d3viewdist-scal;
  if righty<>0 then
      v:=(zb-scal*cosy)/siny
  else
      v:=-(yb*sinz+xb*cosz)/cosy;
  if rightz<>0 then
  u:=(Yb+sinz*(v*cosy-scal*siny))/cosz
    else
      u:=-Xb*sinz;
  if d<=0 then d:=1.e-10;
  u:=u/d;
  v:=v/d;
end;

procedure TMathImage.d3moveto(x,y,z:extended);
var xs,ys:longint;
begin
  d3window(x,y,z,xs,ys);
  canvas.moveto(xs,ys);
  {$IFDEF WIN32}
  If FRecordMetafile then
  begin
  d3windowm(x,y,z,xs,ys);
  fmetafilecanvas.moveto(xs,ys);
  end;
  {$ENDIF}
end;

procedure TMathImage.d3drawpoint(x,y,z:extended);
var xs,ys:longint;
begin
  d3window(x,y,z,xs,ys);
  canvas.pixels[xs,ys]:=canvas.pen.color;
  {$IFDEF WIN32}
  If fRecordMetafile then
  begin
  d3windowm(x,y,z,xs,ys);
  fmetafilecanvas.pixels[xs,ys]:=canvas.pen.color;
  end;
  {$ENDIF}
end;

procedure TMathImage.d3drawline(x1,y1,z1,x2,y2,z2:extended);
var u1,v1,u2,v2:longint;
    save:boolean;  SaveEvent:TNotifyEvent;
begin
  save:=FLockUpdate;
  FLockUpdate:=true;
  SaveEvent:=fBitmap.OnChange;
  fBitmap.OnChange:=nil;
  try
  d3window(x1,y1,z1,u1,v1);
  d3window(x2,y2,z2,u2,v2);
  canvas.polyline([point(u1,v1),point(u2,v2),point(u1,v1)]);
  {$IFDEF WIN32}
  If fRecordMetafile then
  begin
  d3windowm(x1,y1,z1,u1,v1);
  d3windowm(x2,y2,z2,u2,v2);
  fmetafilecanvas.polyline([point(u1,v1),point(u2,v2),point(u1,v1)]);
  end;
  {$ENDIF}
  finally
   FLockUpdate:=save;
   fBitmap.OnChange:=SaveEvent;
  end;
  if not FLockUpdate then
  invalidate;
end;

procedure TMathImage.d3drawlineto(x,y,z:extended);
var xs,ys:longint;
begin
    d3window(x,y,z,xs,ys);
    canvas.lineto(xs,ys);
    {$IFDEF WIN32}
    If fRecordMetafile then
    begin
    d3windowm(x,y,z,xs,ys);
    fmetafilecanvas.lineto(xs,ys);
    end;
    {$ENDIF}
end;


procedure TMathImage.drawoneaxis(x1,y1,z1,x2,y2,z2:extended);
var norms,wx,wy:extended;
    xs1,ys1,xs2,ys2:longint; vsx,vsy:extended;
    save:boolean;
begin
  save:=FLockUpdate;
  FLockUpdate:=true;
  try
  d3drawline(x1,y1,z1,x2,y2,z2);
  d3window(x1,y1,z1,xs1,ys1);
  d3window(x2,y2,z2,xs2,ys2);
  vsx:=(xs2-xs1); vsy:=(ys2-ys1);
  norms:=sqrt(vsx*vsx+vsy*vsy);
  if norms>0 then
  begin
    vsx:=vsx/norms; vsy:=vsy/norms;
    wx:=(-vsx+vsy)/sqrt(2); wy:=(-vsy-vsx)/sqrt(2);
    canvas.moveto(xs2,ys2);
    canvas.lineto(xs2+round(8*wx),ys2+round(8*wy));
    wx:=(-vsx-vsy)/sqrt(2); wy:=(-vsy+vsx)/sqrt(2);
    canvas.moveto(xs2,ys2);
    canvas.lineto(xs2+round(8*wx),ys2+round(8*wy));
  end;
  {$IFDEF WIN32}
  If fRecordMetafile then
  begin
  d3windowm(x1,y1,z1,xs1,ys1);
  d3windowm(x2,y2,z2,xs2,ys2);
  vsx:=(xs2-xs1); vsy:=(ys2-ys1);
  norms:=sqrt(vsx*vsx+vsy*vsy);
  if norms>0 then
  begin
    vsx:=vsx/norms; vsy:=vsy/norms;
    wx:=(-vsx+vsy)/sqrt(2); wy:=(-vsy-vsx)/sqrt(2);
    fmetafilecanvas.moveto(xs2,ys2);
    fmetafilecanvas.lineto(xs2+round(8*wx),ys2+round(8*wy));
    wx:=(-vsx-vsy)/sqrt(2); wy:=(-vsy+vsx)/sqrt(2);
    fmetafilecanvas.moveto(xs2,ys2);
    fmetafilecanvas.lineto(xs2+round(8*wx),ys2+round(8*wy));
  end;
  end;
  {$ENDIF}
  finally
  fLockUpdate:=save;
  end;
  fBitmapchanged(nil);
end;


procedure TMathImage.d3drawaxes;
var xs,ys,i,istart,ticks:longint;
    SaveBrush:TBrush;
    SavePen:TPen;
    t:string;
    itemp,tick,yx,zx,xy,zy,xz,yz:extended;
    save:boolean;  saveevent:TNotifyEvent;


begin   {******* drawd3axes ******}
  Save:=FLockUpdate;
  SaveEvent:=fBitmap.OnChange;
  FLockUpdate:=true;
  fbitmap.OnChange:=nil;
  try
  SavePen:=TPen.Create;
  SaveBrush:=TBrush.Create;
  SavePen.assign(pen);
  savebrush.assign(brush);
  brush.style:=bsclear;
  yx:=y1d3; zx:=z1d3;
  xy:=x1d3; zy:=z1d3;
  xz:=x1d3; yz:=y1d3;
  case xpos of
    MinMin: begin yx:=y1d3; zx:=z1d3; end;
    MinMax: begin yx:=y1d3; zx:=z1d3+zwd3; end;
    MaxMin: begin yx:=y1d3+ywd3; zx:=z1d3; end;
    MaxMax: begin yx:=y1d3+ywd3; zx:=z1d3+zwd3; end;
  end;
  case ypos of
    MinMin: begin xy:=x1d3; zy:=z1d3; end;
    MinMax: begin xy:=x1d3; zy:=z1d3+zwd3; end;
    MaxMin: begin xy:=x1d3+xwd3; zy:=z1d3; end;
    MaxMax: begin xy:=x1d3+xwd3; zy:=z1d3+zwd3; end;
  end;
  case zpos of
    MinMin: begin xz:=x1d3; yz:=y1d3; end;
    MinMax: begin xz:=x1d3; yz:=y1d3+ywd3; end;
    MaxMin: begin xz:=x1d3+xwd3; yz:=y1d3; end;
    MaxMax: begin xz:=x1d3+xwd3; yz:=y1d3+ywd3; end;
  end;
  drawoneaxis(x1d3,yx,zx,x1d3+xwd3,yx,zx);
  d3window(x1d3+xwd3,yx,zx,xs,ys);
  with canvas do
  textout(xs-textwidth(xlabel)-3,ys+6,xlabel);
  {$IFDEF WIN32}
  If fRecordMetafile then
  begin
  d3windowm(x1d3+xwd3,yx,zx,xs,ys);
  with fmetafilecanvas do
  textout(xs-textwidth(xlabel)-3,ys+6,xlabel);
  end;
  {$ENDIF}
  drawoneaxis(xy,y1d3,zy,xy,y1d3+ywd3,zy);
  d3window(xy,y1d3+ywd3,zy,xs,ys);
  canvas.textout(xs+3,ys+6,ylabel);
  {$IFDEF WIN32}
  If fRecordMetafile then
  begin
  d3windowm(xy,y1d3+ywd3,zy,xs,ys);
  fmetafilecanvas.textout(xs+3,ys+6,ylabel);
  end;
  {$ENDIF}
  drawoneaxis(xz,yz,z1d3,xz,yz,z1d3+zwd3);
  d3window(xz,yz,z1d3+zwd3,xs,ys);
  with canvas do
  textout(xs,ys-6-textheight(zlabel),zlabel);
  {$IFDEF WIN32}
  If fRecordMetafile then
  begin
  d3windowm(xz,yz,z1d3+zwd3,xs,ys);
  with fmetafilecanvas do
  textout(xs,ys-6-textheight(zlabel),zlabel);
  end;
  {$ENDIF}
  if XTicks>0 then
  begin
    itemp:=ln(abs(xwd3)/8)/ln(10);
    if itemp>=0 then
     i:=trunc(itemp) else i:=trunc(itemp)-1;
    tick:=exp(i*ln(10));
    with font do size:=size-1;
    if tick>0 then
    begin
      istart:=round(x1d3/tick);
      while istart*tick<=x1d3 do inc(istart);
      ticks:=round(xwd3/tick) div XTicks;
      i:=istart;
      if ticks<=500 then
      repeat
        d3window(i*tick,yx,zx,xs,ys);
        t:=floattostrf(i*tick,ffgeneral,3,3);
        with canvas do
        begin
          textout(xs-(textwidth(t) div 2), ys+6,t);
          moveto(xs,ys);
          lineto(xs,ys+6);
        end;
        {$IFDEF WIN32}
        If fRecordMetafile then
        begin
        d3windowm(i*tick,yx,zx,xs,ys);
        with fmetafilecanvas do
        begin
          textout(xs-(textwidth(t) div 2), ys+6,t);
          moveto(xs,ys);
          lineto(xs,ys+6);
        end;
        end;
        {$ENDIF}
        i:=i+ticks;
      until i*tick>=x1d3+xwd3;
    end;
    with font do size:=size+1;
  end;
  if YTicks>0 then
  begin
    itemp:=ln(abs(ywd3)/8)/ln(10);
    if itemp>=0 then
     i:=trunc(itemp) else i:=trunc(itemp)-1;
    tick:=exp(i*ln(10));
    with font do size:=size-1;
    if tick>0 then
    begin
      istart:=round(y1d3/tick);
      while istart*tick<=y1d3 do inc(istart);
      ticks:=round(ywd3/tick) div YTicks;
      i:=istart;
      if ticks<=500 then
      repeat
        d3window(xy,i*tick,zy,xs,ys);
        t:=floattostrf(i*tick,ffgeneral,3,3);
        with canvas do
        begin
          textout(xs-(textwidth(t) div 2), ys+6,t);
          moveto(xs,ys);
          lineto(xs,ys+6);
        end;
        {$IFDEF WIN32}
        If fRecordMetafile then
        begin
        d3windowm(xy,i*tick,zy,xs,ys);
        with fmetafilecanvas do
        begin
          textout(xs-(textwidth(t) div 2), ys+6,t);
          moveto(xs,ys);
          lineto(xs,ys+6);
        end;
        end;
        {$ENDIF}
        i:=i+ticks;
      until i*tick>=y1d3+ywd3;
    end;
    with font do size:=size+1;
  end;
  if ZTicks>0 then
  begin
    itemp:=ln(abs(zwd3)/8)/ln(10);
    if itemp>=0 then
     i:=trunc(itemp) else i:=trunc(itemp)-1;
    tick:=exp(i*ln(10));
    with font do size:=size-1;
    if tick>0 then
    begin
      istart:=round(z1d3/tick);
      while istart*tick<=z1d3 do inc(istart);
      ticks:=round(zwd3/tick) div ZTicks;
      i:=istart;
      if ticks<=500 then
      repeat
        d3window(xz,yz,i*tick,xs,ys);
        t:=floattostrf(i*tick,ffgeneral,3,3);
        with canvas do
        begin
          textout(xs-textwidth(t)-6, ys-(textheight(t) div 2),t);
          moveto(xs,ys);
          lineto(xs-6,ys);
        end;
        {$IFDEF WIN32}
        If fRecordMetafile then
        begin
        d3windowm(xz,yz,i*tick,xs,ys);
        with fmetafilecanvas do
        begin
          textout(xs-textwidth(t)-6, ys-(textheight(t) div 2),t);
          moveto(xs,ys);
          lineto(xs-6,ys);
        end;
        end;
        {$ENDIF}
        i:=i+ticks;
      until i*tick>=z1d3+zwd3;
    end;
    with font do size:=size+1;
  end;
  brush.assign(savebrush);
  pen.assign(savepen);
  savebrush.free;
  savepen.free;
  finally
  FLockUpdate:=save;
  fBitmap.OnChange:=SaveEvent;
  end;
  if not FLockUpdate then
    Invalidate;
end;

procedure TMathImage.d3drawzerocross;
var save:boolean;  SaveEvent:TNotifyEvent;
begin
  save:=fLockUpdate;
  fLockUpdate:=true;
  SaveEvent:=fBitmap.OnChange;
  fBitmap.OnChange:=nil;
  try
   if 0>=x1d3 then if 0<=x1d3+xwd3 then if 0>=z1d3 then if 0<=z1d3+zwd3 then
   d3drawline(0,y1d3,0,0,y1d3+ywd3,0);
   if 0>=z1d3 then if 0<=z1d3+zwd3 then if 0>=y1d3 then if 0<=y1d3+ywd3 then
   d3drawline(x1d3,0,0,x1d3+xwd3,0,0);
   if 0>=y1d3 then if 0<=y1d3+ywd3 then if 0>=x1d3 then if 0<=x1d3+xwd3 then
   d3drawline(0,0,z1d3,0,0,z1d3+zwd3);
  finally
   fLockUpdate:=save;
   fBitmap.OnChange:=SaveEvent;
  end;
  if not fLockUpdate then
  invalidate;
end;

procedure TMathImage.d3drawworldbox;
var save:boolean;  SaveEvent:TNotifyEvent;
begin
  save:=fLockUpdate;
  fLockUpdate:=true;
  saveEvent:=fBitmap.OnChange;
  fBitmap.OnChange:=nil;
  try
    d3drawline(basex,basey,basez,frontx,basey,basez);
    d3drawline(basex,basey,basez,basex,fronty,basez);
    d3drawline(basex,basey,basez,basex,basey,frontz);
    d3drawline(basex,fronty,basez,frontx,fronty,basez);
    d3drawline(basex,fronty,basez,basex,fronty,frontz);
    d3drawline(basex,basey,frontz,frontx,basey,frontz);
    d3drawline(basex,basey,frontz,basex,fronty,frontz);
    d3drawline(frontx,basey,basez,frontx,fronty,basez);
    d3drawline(frontx,basey,basez,frontx,basey,frontz);
  finally
    fLockUpdate:=save;
    fBitmap.OnChange:=SaveEvent;
  end;
  if not fLockUpdate then
  invalidate;
end;

procedure TMathImage.D3DrawBox;
  procedure makepoint(x,y,z:extended; var p:TPoint);
  var xs,ys:longint;
  begin
    d3Window(x,y,z,xs,ys);
    p:=Point(xs,ys);
  end;
  procedure makepointm(x,y,z:extended; var p:TPoint);
  var xs,ys:longint;
  begin
    d3Windowm(x,y,z,xs,ys);
    p:=Point(xs,ys);
  end;
var p11,p12,p13,p14,p21,p22,p23,p24:TPoint;
    save:boolean;  SaveEvent:TNotifyEvent;
begin
  save:=FLockUpdate;
  FLockUpdate:=true;
  SaveEvent:=FBitmap.OnChange;
  fBitmap.OnChange:=nil;
  try
  makepoint(x1,y1,z1,p11);
  makepoint(x2,y1,z1,p12);
  makepoint(x2,y2,z1,p13);
  makepoint(x1,y2,z1,p14);
  makepoint(x1,y1,z2,p21);
  makepoint(x2,y1,z2,p22);
  makepoint(x2,y2,z2,p23);
  makepoint(x1,y2,z2,p24);
  with canvas do
  begin
    polyline([p11,p12,p13,p14,p11]);
    polyline([p21,p22,p23,p24,p21]);
    moveto(p11.x,p11.y); lineto(p21.x,p21.y);
    moveto(p12.x,p12.y); lineto(p22.x,p22.y);
    moveto(p13.x,p13.y); lineto(p23.x,p23.y);
    moveto(p14.x,p14.y); lineto(p24.x,p24.y);
  end;
  {$IFDEF WIN32}
  If fRecordMetafile then
  begin
  makepointm(x1,y1,z1,p11);
  makepointm(x2,y1,z1,p12);
  makepointm(x2,y2,z1,p13);
  makepointm(x1,y2,z1,p14);
  makepointm(x1,y1,z2,p21);
  makepointm(x2,y1,z2,p22);
  makepointm(x2,y2,z2,p23);
  makepointm(x1,y2,z2,p24);
  with fmetafilecanvas do
  begin
    polyline([p11,p12,p13,p14,p11]);
    polyline([p21,p22,p23,p24,p21]);
    moveto(p11.x,p11.y); lineto(p21.x,p21.y);
    moveto(p12.x,p12.y); lineto(p22.x,p22.y);
    moveto(p13.x,p13.y); lineto(p23.x,p23.y);
    moveto(p14.x,p14.y); lineto(p24.x,p24.y);
  end;
  end;
  {$ENDIF}
  finally
  FLockUpdate:=save;
  fBitmap.OnChange:=SaveEvent;
  end;
  if not FLockUpdate then
  invalidate;
end;

procedure TMathImage.D3DrawFullWorldbox;
begin
  D3DrawBox(x1d3,y1d3,z1d3,x1d3+xwd3,y1d3+ywd3,z1d3+zwd3);
end;

procedure TMathImage.D3Polyline(FloatPointList:TD3Floatpointlist);
{$IFDEF WINDOWS}
type  TPointArray=array[0..16320] of TPoint;
{$ENDIF}
{$IFDEF WIN32}
type TPointArray=array[0..1000000] of TPoint;
{$ENDIF}
var p:PD3FloatPoint; xw,yw,i:longint; pointarray:^TPointArray;
begin
  if assigned(floatpointlist) then
  with FloatPointList do
  begin
    {$IFDEF WINDOWS}
    if count>16320 then begin {Output error message} exit; end;
    {$ENDIF}
    getmem(pointarray,count*SizeOf(TPoint));
    p:=firstpoint;
    for i:=1 to count do
    with pointarray^[i-1] do
    begin
      D3window(p^.x,p^.y,p^.z,xw,yw);
      x:=xw; y:=yw;
      p:=p^.next;
    end;
    canvas.polyline(slice(pointarray^,count));
    freemem(pointarray,count*SizeOf(TPoint));
    {$IFDEF WIN32}
    If fRecordMetafile then
    begin
    getmem(pointarray,count*SizeOf(TPoint));
    p:=firstpoint;
    for i:=1 to count do
    with pointarray^[i-1] do
    begin
      D3windowm(p^.x,p^.y,p^.z,xw,yw);
      x:=xw; y:=yw;
      p:=p^.next;
    end;
    polyline(fmetafilecanvas.handle,pointarray^,count);
    freemem(pointarray,count*SizeOf(TPoint));
    end;
    {$ENDIF}
  end;
  
end;

procedure TMathImage.D3PolyPolyline(FloatPointListList:TD3Floatpointlistlist);
{
type  TPointArray=array[0..1000000] of TPoint;
      TCountArray=array[0..1000000] of integer;
var p:PD3FloatPoint; q:TD3FloatPointList; xw,yw:longint;
    i,j,k:longint;
    pointarray:^TPointArray;
    countarray:^TCountArray;
begin
  SelectClipRgn(canvas.handle,hregion);
  with FloatPointListList do
  begin
    getmem(pointarray,totalcount*SizeOf(TPoint));
    getmem(countarray,count*SizeOf(Integer));
    q:=firstlist; k:=0;
    for i:=1 to count do
    begin
      p:=q.firstpoint;
      for j:=1 to  q.count do
      begin
        with pointarray^[k] do
        begin
          d3window(p^.x,p^.y,p^.z,xw,yw);
          x:=xw; y:=yw;
        end;
        inc(k);
        p:=p^.next;
      end;
      countarray^[i-1]:=Integer(q.count);
      q:=q.next;
    end;
    polypolyline(canvas.handle,pointarray^,countarray^,Integer(count));
    refresh;
    freemem(pointarray,totalcount*SizeOf(TPoint));
    freemem(countarray,count*SizeOf(Integer));
  end;
end;
}

var q:TD3FloatPointList; i:longint;
var save:boolean;  SaveEvent:TNotifyEvent;
begin
  save:=FLockUpdate;
  FLockUpdate:=true;
  SaveEvent:=fBitmap.OnChange;
  fBitmap.OnChange:=nil;
  try
  If Assigned(FloatPointListList) then
  If FloatPointListList.count>0 then
  with FloatPointListList do
  begin
    q:=Firstlist;
    For i:=1 to count do
    begin
      D3Polyline(q);
      q:=q.next;
    end;
  end;
  finally
  fLockUpdate:=save;
  fBitmap.OnChange:=SaveEvent;
  end;
  if not fLockUpdate then
  invalidate;
end;





procedure TMathImage.D3StartRotatingleft(increment:extended);
var inc:extended;
begin
  rotating:=true;
  inc:=increment;
  if ((d3yrotation>0) and (trunc(d3yrotation/180) mod 2=1))
     or ((d3yrotation<=0) and (trunc(d3yrotation/180) mod 2=0))
  then inc:=-inc;
  while rotating do
  begin
    d3zrotation:=d3zrotation-inc;
    if Assigned(FOnRotating) then FOnRotating(self);
    application.processmessages;
  end;
end;

procedure TMathImage.D3StartRotatingright(increment:extended);
var inc:extended;
begin
  rotating:=true;
  inc:=increment;
  if ((d3yrotation>0) and (trunc(d3yrotation/180) mod 2=1))
     or ((d3yrotation<=0) and (trunc(d3yrotation/180) mod 2=0))
  then inc:=-inc;
  while rotating do
  begin
    d3zrotation:=d3zrotation+inc;
    if Assigned(FOnRotating) then FOnRotating(self);
    application.processmessages;
  end;
end;

procedure TMathImage.D3StartRotatingup(increment:extended);
begin
  rotating:=true;
  while rotating do
  begin
    d3yrotation:=d3yrotation-increment;
    if assigned(FOnRotating) then FOnRotating(self);
    application.processmessages;
  end;
end;

procedure TMathImage.D3StartRotatingdown(increment:extended);
begin
  rotating:=true;
  while rotating do
  begin
    d3yrotation:=d3yrotation+increment;
    if assigned(FOnRotating) then FOnRotating(self);
    application.processmessages;
  end;
end;

procedure TMathImage.D3StopRotating;
begin
  Rotating:=false;
  If Assigned(FOnEndRotate) then FOnEndRotate(self);
end;

procedure TMathImage.D3StartMovingIn(increment:extended);
begin
  Moving:=true;
  While moving do
  begin
    d3viewdist:=d3viewdist*(1-increment);
    if assigned(FOnMoving) then FOnMoving(self);
    application.processmessages;
  end;
end;

procedure TMathImage.D3StartMovingOut(increment:extended);
begin
  Moving:=true;
  While moving do
  begin
    d3viewdist:=d3viewdist*(1+increment);
    if assigned(FOnMoving) then FOnMoving(self);
    application.processmessages;
  end;
end;

procedure TMathImage.D3StopMoving;
begin
  moving:=false;
  if assigned(FOnEndMove) then FOnEndMove(self);
end;

procedure TMathImage.D3StartZoomingIn(increment:extended);
begin
  Zooming:=true;
  while zooming do
  begin
    d3viewangle:=d3viewangle*(1-increment);
    if assigned(FOnZooming) then FOnZooming(self);
    application.processmessages;
  end;
end;

procedure TMathImage.D3StartZoomingOut(increment:extended);
begin
  zooming:=true;
  while zooming do
  begin
    d3viewangle:=d3viewangle*(1+increment);
    if assigned(FOnZooming) then FOnZooming(self);
    application.processmessages;
  end;
end;

procedure TMathImage.D3StopZooming;
begin
  Zooming := False;
  if assigned(FOnEndZoom) then FOnEndZoom(self);
end;

{Surface}

type
     PD3Point=^TD3Point;
     TD3point=record
             pt:TPoint;
             dist:extended;
            end;
     {$IFDEF WINDOWS}
     PD3PointArray=^TD3PointArray;
     TD3PointArray=array[0..500] of PD3Point;
     {$ENDIF}

     PCell=^TCell;
     TCell=record
             vertex:array[0..3] of TPoint;
             dist:extended;
           end;
     P3Cell=^T3Cell;
     T3Cell=record
             vertex:array[0..2] of TPoint;
             dist,brightness:extended;
           end;
     TListCompare=function(item1,item2:pointer):integer;

function Compare(item1,item2:pointer):integer; far;
var Cell1,Cell2:PCell;
begin
  Cell1:=PCell(item1);
  Cell2:=PCell(item2);
  if Cell1^.dist>Cell2^.dist then result:=-1
  else if Cell1^.dist<Cell2^.dist then result:=1
  else result:=0;
end;

function Compare3(item1,item2:pointer):integer; far;
var Cell1,Cell2:P3Cell;
begin
  Cell1:=P3Cell(item1);
  Cell2:=P3Cell(item2);
  if Cell1^.dist>Cell2^.dist then result:=-1
  else if Cell1^.dist<Cell2^.dist then result:=1
  else result:=0;
end;

{$IFDEF WINDOWS}
procedure sort(var AList:Tlist; compare: TListCompare);

  procedure QuickSort(var AList:TList; compare: TListCompare; iLo,iHi:integer);
  var Lo, Hi:integer; Mid: pointer;
  begin
    with AList do
    begin
      Lo := iLo;
      Hi := iHi;
      Mid := items[(Lo + Hi) div 2];
      repeat
        while Compare(items[Lo],Mid)<0 do Inc(Lo);
        while Compare(items[Hi],Mid)>0 do Dec(Hi);
        if Lo <= Hi then
        begin
          Exchange(Lo,Hi);
          Inc(Lo);
          Dec(Hi);
        end;
      until Lo > Hi;
      if Hi > iLo then QuickSort(AList,Compare,iLo, Hi);
      if Lo < iHi then QuickSort(AList,Compare, Lo, iHi);
    end;
  end;
begin
  Quicksort(Alist,Compare,0,Alist.count-1);
end;
{$ENDIF}

function odd(i:integer):boolean;
begin
  result:=((i mod 2)=0);
end;

function even(i:integer):boolean;
begin
  result:=not odd(i);
end;

procedure TMathImage.d3drawsurface(surface:TSurface; fill,NoUpdate:boolean);
var i,j,xw,yw:longint;
    Alist:Tlist;
    ACell:PCell;
    Apoint:TSurfPoint;
    p0,p1,p2,p3:PD3Point;
    save:boolean;  SaveEvent:TNotifyEvent;
    {$IFDEF WINDOWS}
    Screensurface:array[0..500] of PD3PointArray;
    {$ENDIF}
    {$IFDEF WIN32}
    ScreenSurface:array[0..500,0..500] of PD3Point;
    {$ENDIF}

begin
  save:=fLockUpdate;
  fLockUpdate:=true;
  SaveEvent:=fBitmap.OnChange;
  fBitmap.OnChange:=nil;
  try
  if assigned(surface) then
  begin
  if not surface.error then
  with surface do
  begin
    for i:=0 to xmesh do
    begin
      {$IFDEF WINDOWS}
      new(screensurface[i]);
      {$ENDIF}
      for j:=0 to ymesh do
      begin
        Apoint:=D3Point(i,j);
        {$IFDEF WINDOWS}
        new(screensurface[i]^[j]);
        with screensurface[i]^[j]^ do
        {$ENDIF}
        {$IFDEF WIN32}
        new(screensurface[i,j]);
        with screensurface[i,j]^ do
        {$ENDIF}
        with Apoint do
        begin
          D3Window(x,y,z,xw,yw);
          pt.x:=xw; pt.y:=yw;
          d3distancetoviewer(x,y,z,dist);
        end;
      end;
    end;
    if fill then
    begin
      Alist:=Tlist.create;
      Alist.Capacity:=xmesh*ymesh;
      for i:=0 to xmesh-1 do
      for j:=0 to ymesh-1 do
      begin
        if not NoUpdate then application.processmessages;
        p0:={$IFDEF WINDOWS}screensurface[i]^[j];{$ENDIF}
            {$IFDEF WIN32}  screensurface[i,j];{$ENDIF}
        p1:={$IFDEF WINDOWS}screensurface[i+1]^[j];{$ENDIF}
            {$IFDEF WIN32}  screensurface[i+1,j];{$ENDIF}
        p2:={$IFDEF WINDOWS}screensurface[i+1]^[j+1];{$ENDIF}
            {$IFDEF WIN32}  screensurface[i+1,j+1];{$ENDIF}
        p3:={$IFDEF WINDOWS}screensurface[i]^[j+1];{$ENDIF}
             {$IFDEF WIN32} screensurface[i,j+1];{$ENDIF}
        New(ACell);
        ACell^.vertex[0]:=p0^.pt;
        ACell^.vertex[1]:=p1^.pt;
        ACell^.vertex[2]:=p2^.pt;
        ACell^.vertex[3]:=p3^.pt;
        ACell^.dist:=(p0^.dist+p1^.dist+p2^.dist+p3^.dist)/4;
        AList.add(ACell);
      end;
      {$IFDEF WINDOWS}
      Sort(Alist,Compare);
      {$ENDIF}
      {$IFDEF WIN32}
      Alist.Sort(Compare);
      {$ENDIF}
      with AList do
      begin
        {repaint;}
        for i:=0 to count-1 do
        begin
          ACell:=PCell(items[i]);
          with ACell^ do
          begin
            canvas.polygon(vertex);
          end;
          if not NoUpdate then if i mod 20 =0 then
          begin
            invalidate;
            application.processmessages;
          end;
        end;
        for i:=0 to count-1 do
        begin
          Acell:=PCell(items[i]);
          dispose(Acell);
        end;
      end;
      Alist.free;
    end {if fill}
    else
    begin
      for i:=0 to xmesh do
      begin
        if not NoUpdate then
        begin
          invalidate;
          application.processmessages;
        end;
        for j:=0 to ymesh do
        begin
          {$IFDEF WINDOWS}
          with screensurface[i]^[j]^ do
          begin
            canvas.moveto(pt.x,pt.y);
          end;
          if j<ymesh then
          with screensurface[i]^[j+1]^ do
          begin
            canvas.lineto(pt.x,pt.y);
          end;
          with screensurface[i]^[j]^ do
          begin
            canvas.moveto(pt.x,pt.y);
          end;
          if i<xmesh then
          with screensurface[i+1]^[j]^ do
          begin
            canvas.lineto(pt.x,pt.y);
          end;
          {$ENDIF}
          {$IFDEF WIN32}
          with screensurface[i,j]^ do
          begin
            canvas.moveto(pt.x,pt.y);
          end;
          if j<ymesh then
          with screensurface[i,j+1]^ do
          begin
            canvas.lineto(pt.x,pt.y);
          end;
          with screensurface[i,j]^ do
          begin
            canvas.moveto(pt.x,pt.y);
          end;
          if i<xmesh then
          with screensurface[i+1,j]^ do
          begin
            canvas.lineto(pt.x,pt.y);
          end;
          {$ENDIF}
        end; {for j}
      end; {for i}
    end; {if not fill}
    for i:=0 to xmesh do
    begin
      for j:=0 to ymesh do
      {$IFDEF WINDOWS}
      Dispose(ScreenSurface[i]^[j]);
      Dispose(ScreenSurface[i]);
      {$ENDIF}
      {$IFDEF WIN32}
      Dispose(ScreenSurface[i,j]);
      {$ENDIF}
    end;
    {$IFDEF WIN32}
    if FRecordMetafile then
    begin
      for i:=0 to xmesh do
      begin
        {$IFDEF WINDOWS}
        new(screensurface[i]);
        {$ENDIF}
        for j:=0 to ymesh do
        begin
          Apoint:=D3Point(i,j);
          {$IFDEF WINDOWS}
          new(screensurface[i]^[j]);
          with screensurface[i]^[j]^ do
          {$ENDIF}
          {$IFDEF WIN32}
          new(screensurface[i,j]);
          with screensurface[i,j]^ do
          {$ENDIF}
          with Apoint do
          begin
            D3WindowM(x,y,z,xw,yw);
            pt.x:=xw; pt.y:=yw;
            d3distancetoviewer(x,y,z,dist);
          end;
        end;
      end;
      if fill then
      begin
        Alist:=Tlist.create;
        Alist.Capacity:=xmesh*ymesh;
        for i:=0 to xmesh-1 do
        for j:=0 to ymesh-1 do
        begin
          p0:={$IFDEF WINDOWS}screensurface[i]^[j];{$ENDIF}
            {$IFDEF WIN32}  screensurface[i,j];{$ENDIF}
          p1:={$IFDEF WINDOWS}screensurface[i+1]^[j];{$ENDIF}
            {$IFDEF WIN32}  screensurface[i+1,j];{$ENDIF}
          p2:={$IFDEF WINDOWS}screensurface[i+1]^[j+1];{$ENDIF}
            {$IFDEF WIN32}  screensurface[i+1,j+1];{$ENDIF}
          p3:={$IFDEF WINDOWS}screensurface[i]^[j+1];{$ENDIF}
             {$IFDEF WIN32} screensurface[i,j+1];{$ENDIF}
          New(ACell);
          ACell^.vertex[0]:=p0^.pt;
          ACell^.vertex[1]:=p1^.pt;
          ACell^.vertex[2]:=p2^.pt;
          ACell^.vertex[3]:=p3^.pt;
          ACell^.dist:=(p0^.dist+p1^.dist+p2^.dist+p3^.dist)/4;
          AList.add(ACell);
        end;
        {$IFDEF WINDOWS}
        Sort(Alist,Compare);
        {$ENDIF}
        {$IFDEF WIN32}
        Alist.Sort(Compare);
        {$ENDIF}
        with AList do
        begin
          {repaint;}
          for i:=0 to count-1 do
          begin
            ACell:=PCell(items[i]);
            with ACell^ do
            begin
              fmetafilecanvas.polygon(vertex);
            end;
          end;
          for i:=0 to count-1 do
          begin
            Acell:=PCell(items[i]);
            dispose(Acell);
          end;
        end;
        Alist.free;
      end {if fill}
      else
      begin
        for i:=0 to xmesh do
        begin
          for j:=0 to ymesh do
          begin
          {$IFDEF WINDOWS}
            with screensurface[i]^[j]^ do
            begin
              fmetafilecanvas.moveto(pt.x,pt.y);
            end;
            if j<ymesh then
            with screensurface[i]^[j+1]^ do
            begin
              fmetafilecanvas.lineto(pt.x,pt.y);
            end;
            with screensurface[i]^[j]^ do
            begin
              fmetafilecanvas.moveto(pt.x,pt.y);
            end;
            if i<xmesh then
            with screensurface[i+1]^[j]^ do
            begin
              fmetafilecanvas.lineto(pt.x,pt.y);
            end;
            {$ENDIF}
            {$IFDEF WIN32}
            with screensurface[i,j]^ do
            begin
              fmetafilecanvas.moveto(pt.x,pt.y);
            end;
            if j<ymesh then
            with screensurface[i,j+1]^ do
            begin
              fmetafilecanvas.lineto(pt.x,pt.y);
            end;
            with screensurface[i,j]^ do
            begin
              fmetafilecanvas.moveto(pt.x,pt.y);
            end;
            if i<xmesh then
            with screensurface[i+1,j]^ do
            begin
              fmetafilecanvas.lineto(pt.x,pt.y);
            end;
            {$ENDIF}
          end; {for j}
        end; {for i}
      end; {if not fill}
      for i:=0 to xmesh do
      begin
        for j:=0 to ymesh do
        {$IFDEF WINDOWS}
        Dispose(ScreenSurface[i]^[j]);
        Dispose(ScreenSurface[i]);
        {$ENDIF}
        {$IFDEF WIN32}
        Dispose(ScreenSurface[i,j]);
        {$ENDIF}
      end;
    end; {if FRecordMetafile}
    {$ENDIF}
  end {if not surface.error} else
  raise ESurfaceError.Create('Surface has not been created right');
  end else
  raise ESurfaceError.Create('Surface has not been created');
  finally
  fLockUpdate:=save;
  fBitmap.OnChange:=SaveEvent;
  end;
  if not fLockUpdate then
  invalidate;
end;

procedure Cross(x1,y1,z1,x2,y2,z2:extended; var u1,u2,u3:extended);
begin
      u1:=y1*z2-z1*y2;
      u2:=z1*x2-x1*z2;
      u3:=x1*y2-y1*x2;
end;

function TMathimage.Bright(p1,p2,p3:TSurfPoint):extended;
var xb1,xb2,xb3,yb1,yb2,yb3,zb1,zb2,zb3,u1,u2,u3,norm:extended;
begin
      Blockx(p1.x,xb1); Blocky(p1.y,yb1); Blockz(p1.z,zb1);
      Blockx(p2.x,xb2); Blocky(p2.y,yb2); Blockz(p2.z,zb2);
      Blockx(p3.x,xb3); Blocky(p3.y,yb3); Blockz(p3.z,zb3);
      Cross(xb2-xb1,yb2-yb1,zb2-zb1,xb3-xb1,yb3-yb1,zb3-zb1,u1,u2,u3);
      norm:=sqrt(sqr(u1)+sqr(u2)+sqr(u3));
      if norm>0 then
      begin
        u1:=u1/norm; u2:=u2/norm; u3:=u3/norm;
      end else
      begin
        result:=0; exit;
      end;
      result:=abs(u1*cosz*siny+u2*sinz*siny+u3*cosy);
     
end;

procedure TMathImage.d3drawLitSurface(surface:TSurface; diffuse,focussed:extended;NoUpdate:boolean);
var i,j,xw,yw,color,basecolor:longint;
    red,green,blue:integer;
    r,g,b,sum,b1,b2,b3,b4,rr,gg,bb,light:extended;
    savebrush:TBrush;
    savepen:TPen;
    Alist:Tlist;
    ACell:P3Cell;
    Apoint:TSurfPoint;
    p0,p1,p2,p3:PD3Point;
    save:boolean; SaveEvent:TNotifyEvent;
    {$IFDEF WINDOWS}
    Screensurface:array[0..500] of PD3PointArray;
    {$ENDIF}
    {$IFDEF WIN32}
    ScreenSurface:array[0..500,0..500] of PD3Point;
    {$ENDIF}




begin
  save:=FLockUpdate;
  FLockUpdate:=true;
  SaveEvent:=fBitmap.OnChange;
  fBitmap.OnChange:=nil;
  try
  if assigned(surface) then
  begin
    if not surface.error then
    with surface do
    begin
      savebrush:=TBrush.create;
      savepen:=TPen.create;
      savebrush.assign(brush);
      savepen.assign(pen);
      for i:=0 to xmesh do
      begin
        {$IFDEF WINDOWS}
        new(screensurface[i]);
        {$ENDIF}
        for j:=0 to ymesh do
        begin
          Apoint:=D3Point(i,j);
          {$IFDEF WINDOWS}
          new(screensurface[i]^[j]);
          with screensurface[i]^[j]^ do
          {$ENDIF}
          {$IFDEF WIN32}
          new(screensurface[i,j]);
          with screensurface[i,j]^ do
          {$ENDIF}
          with Apoint do
          begin
            D3Window(x,y,z,pt.x,pt.y);
            d3distancetoviewer(x,y,z,dist);
          end;
        end;
      end;
      Alist:=Tlist.create;
      Alist.Capacity:=2*xmesh*ymesh;
      for i:=0 to xmesh-1 do
      for j:=0 to ymesh-1 do
      begin
        //if not NoUpdate then application.processmessages;
        p0:={$IFDEF WINDOWS}screensurface[i]^[j];{$ENDIF}
            {$IFDEF WIN32}  screensurface[i,j];{$ENDIF}
        p1:={$IFDEF WINDOWS}screensurface[i+1]^[j];{$ENDIF}
            {$IFDEF WIN32}  screensurface[i+1,j];{$ENDIF}
        p2:={$IFDEF WINDOWS}screensurface[i+1]^[j+1];{$ENDIF}
            {$IFDEF WIN32}  screensurface[i+1,j+1];{$ENDIF}
        p3:={$IFDEF WINDOWS}screensurface[i]^[j+1];{$ENDIF}
             {$IFDEF WIN32} screensurface[i,j+1];{$ENDIF}
        New(ACell);
        if (even(i) and even(j)) or (odd(i) and odd(j)) then
        begin
          ACell^.vertex[0]:=p0^.pt;
          ACell^.vertex[1]:=p1^.pt;
          ACell^.vertex[2]:=p3^.pt;
          ACell^.dist:=(p0^.dist+p1^.dist+p3^.dist)/3;
          ACell^.brightness:=Bright(D3Point(i,j),D3Point(i,j+1),D3Point(i+1,j));
        end else
        begin
          ACell^.vertex[0]:=p0^.pt;
          ACell^.vertex[1]:=p3^.pt;
          ACell^.vertex[2]:=p2^.pt;
          ACell^.dist:=(p0^.dist+p2^.dist+p3^.dist)/3;
          ACell^.brightness:=Bright(D3Point(i,j+1),D3Point(i+1,j+1),D3Point(i,j));
        end;
        AList.add(ACell);
        New(ACell);
        if (even(i) and even(j)) or (odd(i) and odd(j)) then
        begin
          ACell^.vertex[0]:=p2^.pt;
          ACell^.vertex[1]:=p1^.pt;
          ACell^.vertex[2]:=p3^.pt;
          ACell^.dist:=(p2^.dist+p1^.dist+p3^.dist)/3;
          ACell^.brightness:=Bright(D3Point(i+1,j+1),D3Point(i+1,j),D3Point(i,j+1));
        end else
        begin
          ACell^.vertex[0]:=p1^.pt;
          ACell^.vertex[1]:=p0^.pt;
          ACell^.vertex[2]:=p2^.pt;
          ACell^.dist:=(p0^.dist+p2^.dist+p1^.dist)/3;
          ACell^.brightness:=Bright(D3Point(i+1,j),D3Point(i,j),D3Point(i+1,j+1));
        end;
        AList.add(ACell);
      end;
      {$IFDEF WINDOWS}
      Sort(Alist,Compare3);
      {$ENDIF}
      {$IFDEF WIN32}
      Alist.Sort(Compare3);
      {$ENDIF}
      with AList do
      begin
        basecolor:=ColorToRGB(brush.color);
        red:=GetRValue(basecolor);
        green:=GetGValue(basecolor);
        blue:=GetBValue(basecolor);
        r:=(red+0.1);
        g:=(green+0.1);
        b:=(blue+0.1);
        pen.style:=psclear;
        for i:=0 to count-1 do
        begin
          ACell:=P3Cell(items[i]);
          with ACell^ do
          begin
            light:=diffuse+focussed*brightness;
            rr:=r*light;
            if rr>255 then rr:=255 ;
            red:=round(rr);
            gg:=g*light;
            if gg>255 then gg:=255;
            green:=round(gg);
            bb:=b*light;
            if bb>255 then bb:=255;
            blue:=round(bb);
            brush.color:=RGB(red,green,blue);
            canvas.polygon(vertex);
          end;
          if not NoUpdate then if i mod 20 =0 then
          begin
            invalidate;
            application.processmessages;
          end;
        end;
        for i:=0 to count-1 do
        begin
          Acell:=P3Cell(items[i]);
          dispose(Acell);
        end;
      end;
      Alist.free;
      for i:=0 to xmesh do
      begin
        for j:=0 to ymesh do
        {$IFDEF WINDOWS}
        Dispose(ScreenSurface[i]^[j]);
        Dispose(ScreenSurface[i]);
        {$ENDIF}
        {$IFDEF WIN32}
        Dispose(ScreenSurface[i,j]);
        {$ENDIF}
      end;
      brush.assign(savebrush);
      pen.assign(savepen);
      {$IFDEF WIN32}
      if FRecordMetafile then
      begin
        for i:=0 to xmesh do
        begin
        {$IFDEF WINDOWS}
          new(screensurface[i]);
        {$ENDIF}
          for j:=0 to ymesh do
          begin
            Apoint:=D3Point(i,j);
          {$IFDEF WINDOWS}
            new(screensurface[i]^[j]);
            with screensurface[i]^[j]^ do
          {$ENDIF}
          {$IFDEF WIN32}
            new(screensurface[i,j]);
            with screensurface[i,j]^ do
          {$ENDIF}
            with Apoint do
            begin
              D3WindowM(x,y,z,xw,yw);
              pt.x:=xw; pt.y:=yw;
              d3distancetoviewer(x,y,z,dist);
            end;
          end;
        end;
        Alist:=Tlist.create;
        Alist.Capacity:=2*xmesh*ymesh;
        for i:=0 to xmesh-1 do
        for j:=0 to ymesh-1 do
        begin
          p0:={$IFDEF WINDOWS}screensurface[i]^[j];{$ENDIF}
            {$IFDEF WIN32}  screensurface[i,j];{$ENDIF}
          p1:={$IFDEF WINDOWS}screensurface[i+1]^[j];{$ENDIF}
            {$IFDEF WIN32}  screensurface[i+1,j];{$ENDIF}
          p2:={$IFDEF WINDOWS}screensurface[i+1]^[j+1];{$ENDIF}
            {$IFDEF WIN32}  screensurface[i+1,j+1];{$ENDIF}
          p3:={$IFDEF WINDOWS}screensurface[i]^[j+1];{$ENDIF}
             {$IFDEF WIN32} screensurface[i,j+1];{$ENDIF}
          New(ACell);
          if (even(i) and even(j)) or (odd(i) and odd(j)) then
          begin
            ACell^.vertex[0]:=p0^.pt;
            ACell^.vertex[1]:=p1^.pt;
            ACell^.vertex[2]:=p3^.pt;
            ACell^.dist:=(p0^.dist+p1^.dist+p3^.dist)/3;
            ACell^.brightness:=Bright(D3Point(i,j),D3Point(i+1,j),D3Point(i,j+1));
          end else
          begin
            ACell^.vertex[0]:=p0^.pt;
            ACell^.vertex[1]:=p3^.pt;
            ACell^.vertex[2]:=p2^.pt;
            ACell^.dist:=(p0^.dist+p2^.dist+p3^.dist)/3;
            ACell^.brightness:=Bright(D3Point(i,j),D3Point(i+1,j+1),D3Point(i,j+1));
          end;
          AList.add(ACell);
          New(ACell);
          if (even(i) and even(j)) or (odd(i) and odd(j)) then
          begin
            ACell^.vertex[0]:=p2^.pt;
            ACell^.vertex[1]:=p1^.pt;
            ACell^.vertex[2]:=p3^.pt;
            ACell^.dist:=(p2^.dist+p1^.dist+p3^.dist)/3;
            ACell^.brightness:=Bright(D3Point(i+1,j+1),D3Point(i+1,j),D3Point(i,j+1));
          end else
          begin
            ACell^.vertex[0]:=p1^.pt;
            ACell^.vertex[1]:=p0^.pt;
            ACell^.vertex[2]:=p2^.pt;
            ACell^.dist:=(p0^.dist+p2^.dist+p1^.dist)/3;
            ACell^.brightness:=Bright(D3Point(i,j),D3Point(i+1,j),D3Point(i+1,j+1));
          end;
          AList.add(ACell);
        end;
        {$IFDEF WINDOWS}
        Sort(Alist,Compare3);
        {$ENDIF}
        {$IFDEF WIN32}
        Alist.Sort(Compare3);
        {$ENDIF}
        with AList do
        begin
          basecolor:=ColorToRGB(brush.color);
          red:=GetRValue(basecolor);
          green:=GetGValue(basecolor);
          blue:=GetBValue(basecolor);
          r:=(red+0.1);
          g:=(green+0.1);
          b:=(blue+0.1);
          for i:=0 to count-1 do
          begin
            ACell:=P3Cell(items[i]);
            with ACell^ do
            begin
              light:=diffuse+focussed*brightness;
              rr:=r*light;
              if rr>255 then rr:=255;
              red:=round(rr);
              gg:=g*light;
              if gg>255 then gg:=255;
              green:=round(gg);
              bb:=b*light;
              if bb>255 then bb:=255;
              blue:=round(bb);
              brush.color:=RGB(red,green,blue);
              pen.style:=psClear;
              fmetafilecanvas.polygon(vertex);
            end;
          end;
          for i:=0 to count-1 do
          begin
            Acell:=P3Cell(items[i]);
            dispose(Acell);
          end;
        end;
        Alist.free;
        for i:=0 to xmesh do
        begin
          for j:=0 to ymesh do
        {$IFDEF WINDOWS}
          Dispose(ScreenSurface[i]^[j]);
          Dispose(ScreenSurface[i]);
        {$ENDIF}
        {$IFDEF WIN32}
          Dispose(ScreenSurface[i,j]);
        {$ENDIF}
        end;
        brush.assign(savebrush);
        pen.assign(savepen);
      end; {if RecordMetafile}
      {$ENDIF}
      savebrush.free;
      savepen.free;
    end {if not surface.error} else
    raise ESurfaceError.Create('Surface has not been created right');
  end else
  raise ESurfaceError.Create('Surface has not been created');
  finally
  fLockupdate:=save;
  fBitmap.OnChange:=SaveEvent;
  end;
  if not fLockupdate then
  invalidate;
end;

procedure TMathImage.d3DrawCube;
var  ACell:PCell;
     AList:TList;
     p1,p2,p3,p4,p5,p6,p7,p8:TPoint;
     d1,d2,d3,d4,d5,d6,d7,d8:extended;
     i:integer;
     save:boolean;
begin
  if x1<x2 then
  if y1<y2 then
  if z1<z2 then
  begin
    save:=FLockUpdate;
    FLockUpdate:=true;
    try
      if not fill then
        d3DrawBox(x1,y1,z1,x2,y2,z2)
      else
      begin
        d3Window(x1,y1,z1,p1.x,p1.y);
        d3distancetoviewer(x1,y1,z1,d1);
        d3Window(x2,y1,z1,p2.x,p2.y);
        d3distancetoviewer(x2,y1,z1,d2);
        d3Window(x2,y2,z1,p3.x,p3.y);
        d3distancetoviewer(x2,y2,z1,d3);
        d3Window(x1,y2,z1,p4.x,p4.y);
        d3distancetoviewer(x1,y2,z1,d4);
        d3Window(x1,y1,z2,p5.x,p5.y);
        d3distancetoviewer(x1,y1,z2,d5);
        d3Window(x1,y2,z2,p6.x,p6.y);
        d3distancetoviewer(x1,y2,z2,d6);
        d3Window(x2,y2,z2,p7.x,p7.y);
        d3distancetoviewer(x2,y2,z2,d7);
        d3Window(x2,y1,z2,p8.x,p8.y);
        d3distancetoviewer(x2,y1,z2,d8);
        AList:=TList.Create;
        New(ACell);
        with ACell^ do
        begin
          vertex[0]:=p5;
          vertex[1]:=p6;
          vertex[2]:=p7;
          vertex[3]:=p8;
          dist:=d5+d6+d7+d8;
        end;
        AList.add(ACell);
        New(ACell);
        with ACell^ do
        begin
          vertex[0]:=p6;
          vertex[1]:=p4;
          vertex[2]:=p3;
          vertex[3]:=p7;
          dist:=d6+d4+d3+d7;
        end;
        AList.add(ACell);
        New(ACell);
        with ACell^ do
        begin
          vertex[0]:=p6;
          vertex[1]:=p5;
          vertex[2]:=p1;
          vertex[3]:=p4;
          dist:=d6+d5+d1+d4;
        end;
        AList.add(ACell);
        New(ACell);
        with ACell^ do
        begin
          vertex[0]:=p4;
          vertex[1]:=p1;
          vertex[2]:=p2;
          vertex[3]:=p3;
          dist:=d4+d1+d2+d3;
        end;
        AList.add(ACell);
        New(ACell);
        with ACell^ do
        begin
          vertex[0]:=p3;
          vertex[1]:=p2;
          vertex[2]:=p8;
          vertex[3]:=p7;
          dist:=d3+d2+d8+d7;
        end;
        AList.add(ACell);
        New(ACell);
        with ACell^ do
        begin
          vertex[0]:=p1;
          vertex[1]:=p5;
          vertex[2]:=p8;
          vertex[3]:=p2;
          dist:=d1+d5+d8+d2;
        end;
        AList.add(ACell);
        {$IFDEF WINDOWS}
        Sort(Alist,Compare);
        {$ENDIF}
        {$IFDEF WIN32}
        Alist.Sort(Compare);
        {$ENDIF}
        with AList do
        begin
          for i:=0 to count-1 do
          begin
            ACell:=PCell(items[i]);
            with ACell^ do
            canvas.polygon(vertex);
          end;
          for i:=0 to count-1 do
          begin
            Acell:=PCell(items[i]);
            dispose(Acell);
          end;
        end;
        Alist.free;
      end;
    finally
      FLockUpdate:=save;
    end;
    If not FLockUpdate then
    invalidate;
  end;
end;

{procedure TMathImage.d3DrawLitCube;
begin
end;}



{$IFDEF WIN32}
Procedure TMathImage.SaveAsMetafile(const filename:string);
var clipped:boolean;
begin
  If fRecordMetafile then
  begin
  clipped:=hregionm<>0;
  if clipped then
  begin
    deleteobject(hregionm);
    SelectClipRgn(fmetafilecanvas.handle,0);
  end;
  fmetafilecanvas.free;
  fmetafile.SaveToFile(filename);
  fmetafilecanvas:=tmetafilecanvas.create(fmetafile,0);
  fmetafilecanvas.draw(0,0,fmetafile);
  if clipped then
  begin
    with FClipRectM do
    hregionm:=CreateRectRgn(Left,Top,Right,Bottom);
    SelectClipRgn(fmetafilecanvas.handle,hregionm);
  end;
  end;
end;
{$ENDIF}

end.
