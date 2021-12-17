unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, MathImge, ExtCtrls, Menus, ExtDlgs, Clipbrd,
  Printers, CustomLoad;

type
  TForm1 = class(TForm)
    MathImage1: TMathImage;
    PopupMenu1: TPopupMenu;
    ZommIn1: TMenuItem;
    ControlBar1: TControlBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ResetBtn: TButton;
    Button2: TButton;
    ColorDialog1: TColorDialog;
    OpenPictureDialog1: TOpenPictureDialog;
    BitBtn3: TBitBtn;
    SpeedButton1: TSpeedButton;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    SaveDialog1: TSaveDialog;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    PrinterSetupDialog1: TPrinterSetupDialog;
    OpenDialog1: TOpenDialog;
    ZeroLinesCheck: TCheckBox;
    BitBtn9: TBitBtn;
    procedure MathImage1Resize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ZommIn1Click(Sender: TObject);
    procedure MathImage1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure MathImage1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure MathImage1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ResetBtnClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure ZeroLinesCheckClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DrawMathImage;
    procedure StartZoom;
    procedure ZoomIn(P1,P2:TPoint);
    procedure ConvertPointToValues(P:TPoint;var vx,vy:Extended);
    procedure NormalizePoints(var P1, P2: TPoint);
    procedure LoadPointsFromFile(const fname:String);
  end;

var
  Form1: TForm1;
  x,y:array of extended;
  Size:Integer;
  ZoomReady:Boolean=True;
  P1,P2:TPoint;
  Boxing:Boolean=False;
  bkcolor:TColor=clWhite;
  PanningMode:Boolean=False;
  AllowPanning:Boolean=False;
  PanOldPoint:TPoint;

implementation

{$R *.dfm}

procedure TForm1.DrawMathImage;
const
  Title:String='Poincare Section Of The Henon-Heiles Hamiltonian';
var
 i:Integer;
 minx,maxx,miny,maxy:Extended;
 c:TColor;
begin
//  MathImage1.Enabled:=False;
  MathImage1.Canvas.Brush.Color:=bkcolor;
  MathImage1.Hide;
  MathImage1.Canvas.Font.Size:=15;
  MathImage1.Canvas.Font.Color:=clBlack;
  MathImage1.Clear;
{  minx:=x[0];
  maxx:=0;
  miny:=y[0];
  maxy:=0;
  maxx:=minx;
  maxy:=miny;
  for i:=1 to Size do
  begin
    if x[i-1]<minx then
      minx:=x[i-1]
    else if maxx<x[i-1] then
      maxx:=x[i-1];
    if y[i-1]<miny then
      miny:=y[i-1]
    else if maxy<y[i-1] then
      maxy:=y[i-1];
    end;}
//  closefile(f);
//  MathImage1.SetWorld(minx,miny,maxx,maxy);
//  MathImage1.Pen.Color:=clLime;
  MathImage1.Font.Color:=clGreen;
  MathImage1.DrawAxes('','',ZeroLinesCheck.Checked,clBlack,clRed);
//  reset(f);
{  while(not(eof(f))) do
  begin
    readln(f,xv,yv);
    MathImage1.DrawPoint(xv,yv);
  end;     }
  for i:=1 to Size do
    with MathImage1 do
      if (x[i-1]<=D2Worldx2) and (x[i-1]>=D2WorldX1)
         and (y[i-1]>=D2WorldY1) and (y[i-1]<=D2Worldy2) then
        MathImage1.DrawPoint(x[i-1],y[i-1]);
  MathImage1.Enabled:=True;
  MathImage1.Show;
  MathImage1.Canvas.Font.Color:=clBlue;
  MathImage1.Canvas.TextOut(Trunc(MathImage1.Width/2-MathImage1.Canvas.TextWidth(Title)/2),0,Title);
  //Draw Box
  i:=MathImage1.Canvas.Pen.Width;
  MathImage1.Canvas.Pen.Width:=2;
  c:=MathImage1.Canvas.Pen.Color;
  MathImage1.Canvas.Pen.Color:=clBlack;
  with MathImage1 do
  begin
    Canvas.MoveTo(WindowX(D2WorldX1),WindowY(D2WorldY1));
    Canvas.LineTo(WindowX(D2WorldX1),WindowY(D2Worldy2));
    Canvas.LineTo(WindowX(D2Worldx2),WindowY(D2Worldy2));
    Canvas.LineTo(WindowX(D2Worldx2),WindowY(D2WorldY1));
    Canvas.LineTo(WindowX(D2WorldX1),WindowY(D2WorldY1));
  end;
//  ShowMessage(IntToStr(i));
  MathImage1.Canvas.Pen.Width:=i;
  MathImage1.Canvas.Pen.Color:=c;
//  Image1.Picture.Bitmap.Assign(MathImage1.Bitmap);
end;

procedure TForm1.MathImage1Resize(Sender: TObject);
begin
//  DrawMathImage;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Size:=0;
  SetLength(x,Size);
  SetLength(y,Size);
  MathImage1.Canvas.Font.Size:=20;
  MathImage1.SetWorld(0,0,2,2);
  DrawMathImage;
end;

procedure TForm1.ZommIn1Click(Sender: TObject);
begin
  StartZoom;
end;

procedure TForm1.StartZoom;
begin
end;

procedure TForm1.MathImage1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  P1temp,P2temp:TPoint;
  PanP:TPoint;
  Pandx,Pandy:Extended;
begin
  if PanningMode then
  begin
    if not AllowPanning then Exit;
    if (abs(PanOldPoint.X-x)<5) and (abs(PanOldPoint.Y-y)<5) then Exit;
    PanP:=Point(x,y);
    with MathImage1 do
    begin
      Pandx:=WorldX(PanOldPoint.X)-WorldX(PanP.X);
      Pandy:=WorldY(PanOldPoint.Y)-WorldY(PanP.Y);
      PanOldPoint:=PanP;
      SetWorld(D2WorldX1+Pandx,D2WorldY1+Pandy,D2Worldx2+Pandx,D2Worldy2+Pandy);
    end;
    DrawMathImage;
    Exit;
  end;
  if not Boxing then Exit;
  P1temp:=P1;
  P2temp:=P2;
  NormalizePoints(P1temp,P2temp);
  MathImage1.Canvas.DrawFocusRect(Rect(P1temp,P2temp));
  P2.X:=x;
  P2.Y:=y;
  P1temp:=P1;
  P2temp:=P2;
  NormalizePoints(P1temp,P2temp);
  MathImage1.Canvas.DrawFocusRect(Rect(P1temp,P2temp));
end;

procedure TForm1.MathImage1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
//  Label1.Caption:='Mouse Down';
  AllowPanning:=True;
  if PanningMode then
  begin
    PanOldPoint:=Point(x,y);
    Exit;
  end;  
  if ZoomReady and (x>=MathImage1.WindowX(MathImage1.D2WorldX1))
     and (x<=MathImage1.WindowX(MathImage1.D2Worldx2))
     and (y>=MathImage1.WindowY(MathImage1.D2Worldy2))
     and (y<=MathImage1.WindowY(MathImage1.D2WorldY1)) then
  begin
    Boxing:=True;
    P1.X:=x;
    P1.Y:=y;
    P2:=P1;
    MathImage1.Canvas.DrawFocusRect(Rect(P1,P1));
//    ShowMessage('x='+IntToStr(x)+'y='+IntToStr(y));
  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    LoadPointsFromFile(OpenDialog1.FileName);
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  ZoomReady:=True;
end;

procedure TForm1.MathImage1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  P1temp,P2temp:TPoint;
begin
//  Label1.Caption:='Mouse Up';
  AllowPanning:=False;
  if PanningMode then Exit;
  if not Boxing then Exit;
  Boxing:=False;
  P1temp:=P1;
  P2temp:=P2;
  NormalizePoints(P1temp,P2temp);
  MathImage1.Canvas.DrawFocusRect(Rect(P1temp,P2temp));
  Application.ProcessMessages;
{  if ZoomReady and (x>=MathImage1.WindowX(MathImage1.D2WorldX1))
     and (x<=MathImage1.WindowX(MathImage1.D2Worldx2))
     and (y<=MathImage1.WindowY(MathImage1.D2Worldy1))
     and (y>=MathImage1.WindowY(MathImage1.D2WorldY2)) then}
  if ZoomReady then   
  begin
    P2.X:=x;
    P2.Y:=y;
    ZoomReady:=False;
//    ShowMessage('P1=('+IntToStr(P1.X)+','+IntToStr(P1.Y)+') P2=('+IntToStr(P2.X)+','+IntToStr(P2.Y)+')');
    NormalizePoints(P1,P2);
//    if (P1.X>0) and (P1.Y>0) then
      ZoomIn(P1,P2);
    ZoomReady:=True;
//    ShowMessage('x='+IntToStr(x)+'y='+IntToStr(y));
  end;
end;

procedure TForm1.ZoomIn(P1, P2: TPoint);
var
  x1,y1,x2,y2:Extended;
begin
  if (P1.X<P2.X) and (P1.Y<P2.Y) then
  begin
    if P1.X<MathImage1.WindowX(MathImage1.D2WorldX1) then
      P1.X:=MathImage1.WindowX(MathImage1.D2WorldX1);
    if P1.Y<MathImage1.WindowY(MathImage1.D2Worldy2) then
      P1.Y:=MathImage1.WindowY(MathImage1.D2Worldy2);
    if P2.X>MathImage1.WindowX(MathImage1.D2Worldx2) then
      P2.X:=MathImage1.WindowX(MathImage1.D2Worldx2);
    if P2.Y>MathImage1.WindowY(MathImage1.D2WorldY1) then
      P2.Y:=MathImage1.WindowY(MathImage1.D2WorldY1);
    ConvertPointToValues(P1,x1,y1);
    ConvertPointToValues(P2,x2,y2);
    MathImage1.SetWorld(x1,y2,x2,y1);
{    rx:=MathImage1.D2Worldx2/(MathImage1.WindowX(MathImage1.D2Worldx2)-MathImage1.WindowX(MathImage1.D2WorldX1));
    ry:=MathImage1.D2Worldy2/(MathImage1.WindowY(MathImage1.D2Worldy1)-MathImage1.WindowY(MathImage1.D2Worldy2));
    MathImage1.SetWorld((P1.X-MathImage1.WindowX(MathImage1.D2WorldX1))*rx,
                        (MathImage1.WindowY(MathImage1.D2WorldY1)-P2.Y)*ry,
                        (P2.X-MathImage1.WindowX(MathImage1.D2WorldX1))*rx,
                        (MathImage1.WindowY(MathImage1.D2WorldY1)-P1.Y)*ry);}
    DrawMathImage;
  end;
end;

procedure TForm1.ConvertPointToValues(P: TPoint;var vx,vy: Extended);
var
  XL,XR,YL,YH:Extended;
  XPL,XPC,XPR:Integer;
  YPL,YPC,YPH:Integer;
begin
  XL:=MathImage1.D2WorldX1;
  XR:=MathImage1.D2Worldx2;

  YL:=MathImage1.D2WorldY1;
  YH:=MathImage1.D2Worldy2;

  XPL:=MathImage1.WindowX(MathImage1.D2WorldX1);
  XPC:=MathImage1.WindowX(0);
  XPR:=MathImage1.WindowX(MathImage1.D2Worldx2);

  YPL:=MathImage1.WindowY(MathImage1.D2WorldY1);
  YPC:=MathImage1.WindowY(0);
  YPH:=MathImage1.WindowY(MathImage1.D2Worldy2);

  if P.X>XPC then
    vx:=(P.X-XPC)*(XR/(XPR-XPC))
  else if P.X<XPC then
    vx:=(XPC-P.X)*(XL/(XPC-XPL))
  else
    vx:=0;
  if P.Y<YPC then
    vy:=(YPC-P.Y)*(YH/(YPC-YPH))
  else if P.Y>YPC then
    vy:=(P.Y-YPC)*(YL/(YPL-YPC))
  else
    vy:=0;
end;

procedure TForm1.ResetBtnClick(Sender: TObject);
var
  minx,maxx,miny,maxy:Extended;
  i:Integer;
begin
  minx:=x[0];
  maxx:=x[0];
  miny:=y[0];
  maxy:=y[0];
  for i:=1 to High(x) do
  begin
    if x[i]>maxx then maxx:=x[i] else if x[i]<minx then minx:=x[i];
    if y[i]>maxy then maxy:=y[i] else if y[i]<miny then miny:=y[i];
  end;
  if ((maxx-minx)<0.1) and ((maxy-miny)<0.1) then
  begin
    ShowMessage('Maximum and minimum values are equal.');
    Exit;
    DrawMathImage;
  end;
  MathImage1.SetWorld(minx,miny,maxx,maxy);
  DrawMathImage;
end;

procedure TForm1.NormalizePoints(var P1, P2: TPoint);
var
  temp:Integer;
begin
  if P1.X>P2.X then
  begin
    temp:=P1.X;
    P1.X:=P2.X;
    P2.X:=temp;
  end;
  if P1.Y>P2.Y then
  begin
    temp:=P1.Y;
    P1.Y:=p2.Y;
    P2.Y:=temp;
  end;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
//  MathImage1.SetBounds(MathImage1.Left,MathImage1.Top,Image1.Width,Image1.Height);
  DrawMathImage;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
  begin
    bkcolor:=ColorDialog1.Color;
    DrawMathImage;
  end;  
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
  begin
    MathImage1.Canvas.Pen.Color:=ColorDialog1.Color;
    DrawMathImage;
  end;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  PanningMode:=(Sender as TSpeedButton).Down;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
    MathImage1.Bitmap.SaveToFile(SaveDialog1.FileName+'.bmp');
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    MathImage1.RecordMetafile:=True;
    DrawMathImage;
    MathImage1.SaveAsMetafile(SaveDialog1.FileName+'.wmf');
    MathImage1.RecordMetafile:=False;
  end;  
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
  Clipboard.Assign(MathImage1.Bitmap);
end;

procedure TForm1.BitBtn7Click(Sender: TObject);
var
  i,j:Integer;
begin
  with Printer do
  begin
    if printing then Exit;
    if not PrinterSetupDialog1.Execute then Exit;
    BeginDoc;
    Canvas.TextOut(0,0,'Printing...');
    Canvas.Draw(1,10,MathImage1.Bitmap);
    ShowMessage(IntToStr(PageWidth));
    with MathImage1 do
      for j:=0 to Bitmap.Height-1 do
        for i:=0 to Bitmap.Width-1 do
          Printer.Canvas.Pixels[i,j]:=Bitmap.Canvas.Pixels[i,j];
//    Printer.Canvas.CopyRect(Rect(0,0,PageWidth-1,PageHeight-1),
//                    MathImage1.Bitmap.Canvas,Rect(0,0,MathImage1.Bitmap.Width-1,MathImage1.Bitmap.Height-1));
    EndDoc;
  end;
end;

procedure TForm1.LoadPointsFromFile(const fname: String);
var
  f:TextFile;
  xv,yv:Extended;
begin
  AssignFile(f,fname);
  reset(f);
  Size:=0;
  while(not(eof(f))) do
  begin
    Inc(Size);
    SetLength(x,Size);
    SetLength(y,Size);
    readln(f,xv,yv);
    x[Size-1]:=xv;
    y[Size-1]:=yv;
  end;
  CloseFile(f);
  ResetBtn.Click;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  SetLength(x,0);
  SetLength(y,0);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Application.BringToFront;
end;

procedure TForm1.BitBtn9Click(Sender: TObject);
begin
  CustomLoadForm.Show;
end;

procedure TForm1.ZeroLinesCheckClick(Sender: TObject);
begin
  DrawMathImage;
end;

end.
