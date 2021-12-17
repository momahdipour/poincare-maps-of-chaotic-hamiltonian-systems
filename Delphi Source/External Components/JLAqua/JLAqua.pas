{JLAqua version 1.2 Copyright 2000 Mavrick Designs (delphi@mavrick.co.uk)}
unit JLAqua;

interface

uses
  Windows, Messages, Classes, Controls, Graphics,
   dialogs;

type
  TJLButtonState = (jlUp, jlDown, jlFixed, jlOver);
  TJLColorShade = (jlQuiteDark, jlDark, jlDarkish, jlDarkest, jlhardlydark, jlNone,
                   jlQuitePale, jlPale, jlPaleish, jlPalest);
  TJLCustomColor = (ccNone,ccPaleBlue,ccNeonBlue,ccNeonGreen,ccNeonPink,ccOrange,ccViolet,ccRose,ccPepermint,ccBurntOrange,ccBrown);
  TJLAquaType = (bsOrb, bsButton);
  TJLAqua = class(TGraphicControl)
  private
    FEnabled: boolean;
    FCaptionMouseOver: Boolean;
    FButtonActive: boolean;
    FButtonColor: TColor;
//    FButtonPulse: TColor;
    FButtonShape: TJLAquaType;
    FFont: TFont;
    FCaption: string;
    FCustomColor: TJLCustomColor;
//    FCustomPulse: TJLCustomColor;
    FFontColor: TColor;
    FBackgroundError: TColor;
    FSmallCorners: boolean;
    procedure SetEnabled(const Value: boolean);
    procedure SetButtonActive(const Value: boolean);
    procedure SetButtonColor(const Value: TColor);
//    procedure SetButtonPulse(const Value: TColor);
    procedure SetButtonShape(const Value: TJLAquaType);
    procedure SetCaptionMouseOver(const Value: Boolean);
    function getcolor(syscolor:TColor):TColor;
    function GetNewColor(oldColor: Tcolor; alter: TJLColorShade): TColor;
    procedure SetFont(const Value: TFont);
    procedure SetCaption(const Value: string);
    function IsInsideButton(X, Y: Integer): boolean;
    procedure WMMOUSEMOVE (var Message: TWMMouseMove); Message WM_MOUSEMOVE;
    procedure WMLMOUSEDOWN (var Message: TMessage); Message WM_LBUTTONDOWN;
    procedure WMLMOUSEUP (var Message: TMessage); Message WM_LBUTTONUP;
    procedure WMMOUSELEAVE (var Message: TMessage); Message CM_MOUSELEAVE;
    procedure SetCustomColor(const Value: TJLCustomColor);
    function GetCustomColor:TColor;
//    procedure SetCustomPulse(const Value: TJLCustomColor);
    procedure SetFontColor(const Value: TColor);
    procedure SetBackgroundError(const Value: TColor);
    procedure SetSmallCorners(const Value: boolean);
  protected
    FCol:integer;
    FButtonState:TJLButtonState;
    FMouseDown:boolean;
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure OnTimerClick;
  published
    property CaptionMouseOver:Boolean read FCaptionMouseOver write SetCaptionMouseOver;
    property ButtonActive:boolean read FButtonActive write SetButtonActive;
    property BackgroundError:TColor read FBackgroundError write SetBackgroundError;
    property ButtonColor:TColor read FButtonColor write SetButtonColor;
    property ButtonShape:TJLAquaType read FButtonShape write SetButtonShape;
    property align;
    property Caption:string read FCaption write SetCaption;
    property Enabled:boolean read FEnabled write SetEnabled;
    property Font: TFont read FFont write SetFont;
    property FontColor:TColor read FFontColor write SetFontColor;
    property CustomColor:TJLCustomColor read FCustomColor write SetCustomColor;
    property SmallCorners:boolean read FSmallCorners write SetSmallCorners;
    property ShowHint;

    property OnClick;
  end;

procedure Register;

implementation

{ TJLAqua }

procedure Register;
begin
  RegisterComponents('J-L.Aqua', [TJLAqua]);
end;

constructor TJLAqua.Create(AOwner: TComponent);
begin
  inherited;
  ControlStyle := ControlStyle-[csOpaque];
  CaptionMouseOver:=false;
  ButtonActive:=false;
  ButtonColor:=clBlue;
  ButtonShape:=bsButton;
  enabled:=true;
  FFont:=TFont.Create;
  FFont.size:=10;
  FFont.Style:=[fsBold];
  FButtonState:=jlUp;
  FMouseDown:=false;
  FCustomColor:=ccNone;
  FFontColor:=clBlack;
  FBackgroundError:=clBtnFace;
  FSmallCorners:=false;
  FCol:=0;

  width:=75;
  height:=25;
end;

procedure TJLAqua.OnTimerClick;
begin
  if (buttonactive)and not((FButtonState=jlOver)or(FButtonState=jlDown)) then begin
    inc(Fcol);
    if fcol>14 then FCol:=1;
    if enabled then invalidate;
  end;
end;

destructor TJLAqua.Destroy;
begin
  inherited;
  FFont.Free;
end;

function TJLAqua.GetCustomColor:TColor;
var
  gcol:TColor;
begin
  gcol:=0;
  case FCustomColor of
    ccNeonBlue:gcol:=rgb(0,100,255);
    ccPaleBlue:gcol:=rgb(114,156,252);
    ccNeonGreen:gcol:=rgb(166,246,26);
    ccNeonPink:gcol:=rgb(247,128,207);
    ccOrange:gcol:=rgb(246,187,26);
    ccViolet:gcol:=rgb(194,8,247);
    ccRose:gcol:=rgb(247,53,122);
    ccPepermint:gcol:=rgb(163,249,210);
    ccBurntOrange:gcol:=rgb(244,138,33);
    ccBrown:gcol:=rgb(146,89,7);
  end;
  GetCustomColor:=gcol;
end;

procedure TJLAqua.Paint;
var
  dc:hdc;
  hand:hwnd;
  BackColor,orbcolor:TColor;
  ox,oy:integer;
  tx,ty:integer;
  bx,by:integer;
  FBuffer:TBitmap;
  Corners:integer;
begin
  if parent.HandleAllocated then begin
  hand:=parent.Handle;
  DC:=GetDc(hand);
  Fbuffer := TBitmap.Create;
  Fbuffer.Width := width;
  Fbuffer.Height := height;

  if GetPixel(DC,left,top)=Clr_Invalid then
    backcolor:=GetNewColor(backgroundError,jlnone)
  else
    backcolor:=GetNewColor(GetPixel(DC,left,top),jlnone);
  FBuffer.canvas.brush.color:=backcolor;
  Fbuffer.canvas.fillrect(rect(0,0,width,height));

  if enabled then begin
    orbColor:=ButtonColor;
    if (orbcolor=clFuchsia)or(orbcolor=clAqua)or(orbcolor=clBlue)or(orbcolor=clYellow)or(orbcolor=clLime)or(orbcolor=clRed)then
      orbcolor:=GetNewColor(orbColor,jlquiteDark);
    if FCustomColor<>ccNone then orbcolor:=GetCustomColor;

    if (FCol>0)and (FButtonState<>jlDown) then case FCol of
      1,8:OrbColor:=GetNewColor(orbColor,jlNone);
      2,7:OrbColor:=GetNewColor(orbColor,jlquitepale);
      3,6:OrbColor:=GetNewColor(orbColor,jlPale);
      4,5:OrbColor:=GetNewColor(orbColor,jlPalest);
      9,14:OrbColor:=GetNewColor(orbColor,jlquitedark);
      10,13:OrbColor:=GetNewColor(orbColor,jlDark);
      11,12:OrbColor:=GetNewColor(orbColor,jlDarkest);
    end;
    if (FButtonState=jlOver)and(not(captionmouseover)) then orbcolor:=GetNewColor(orbColor,jlpalest);
  end else
    orbcolor:=backcolor;
  orbcolor:=getnewcolor(orbcolor,jlnone);
  if FSmallCorners then
    corners:=8
  else
    corners:=height;
  if FButtonState=jlDown then begin
    bx:=2;
    by:=2;
  end else begin
    bx:=0;
    by:=0;
  end;

  ox:=width-2;
  oy:=height-3;
  case ButtonShape of
    bsButton:begin
      Fbuffer.canvas.brush.color:=GetNewColor(BackColor,jlHardlyDark); //shadow
      Fbuffer.canvas.pen.color:=GetNewColor(BackColor,jlHardlyDark);
      RoundRect(Fbuffer.canvas.Handle,0,0,width,height,corners, corners);
      Fbuffer.canvas.brush.color:=GetNewColor(BackColor,jlDarkish);
      Fbuffer.canvas.pen.color:=GetNewColor(BackColor,jlDarkish);
      RoundRect(Fbuffer.canvas.Handle,0,0,width-1,height-1,corners, corners);
      Fbuffer.canvas.brush.color:=GetNewColor(BackColor,jlDarkest); //shadow
      Fbuffer.canvas.pen.color:=GetNewColor(BackColor,jlDarkest);
      RoundRect(Fbuffer.canvas.Handle,0,0,width-2,height-2,corners, corners);

      Fbuffer.canvas.brush.color:=GetNewColor(orbcolor,jldarkest);  //basecolor
      Fbuffer.canvas.pen.color:=GetNewColor(orbcolor,jlDarkest);
      RoundRect(Fbuffer.canvas.Handle,0,0,ox,oy,corners,corners);
      Fbuffer.canvas.brush.color:=GetNewColor(orbcolor,jldark);     //inner shadow
      Fbuffer.canvas.pen.color:=GetNewColor(orbcolor,jlDark);
      RoundRect(Fbuffer.canvas.Handle,1,1,ox,oy,corners,corners);
      Fbuffer.canvas.brush.color:=GetNewColor(orbcolor,jlquitedark);
      Fbuffer.canvas.pen.color:=GetNewColor(orbcolor,jlquiteDark);
      RoundRect(Fbuffer.canvas.Handle,2,2,ox,oy,corners-2,corners-2);
      Fbuffer.canvas.brush.color:=orbcolor;
      Fbuffer.canvas.pen.color:=orbcolor;
      RoundRect(Fbuffer.canvas.Handle,3,3,ox-1,oy-1,corners-4,corners-4);

      if FSmallcorners then begin
        Fbuffer.canvas.brush.color:=GetNewColor(orbcolor,jlquitepale);  //top hilight
        Fbuffer.canvas.pen.color:=GetNewColor(orbcolor,jlquitepale);
        RoundRect(Fbuffer.canvas.Handle,bx+3,by+3,ox-1,(oy div 3)+2,corners,corners);
        Fbuffer.canvas.brush.color:=GetNewColor(orbcolor,jlpale);
        Fbuffer.canvas.pen.color:=GetNewColor(orbcolor,jlpale);
        RoundRect(Fbuffer.canvas.Handle,bx+4,by+3,ox-2,(oy div 3)+1,corners,corners);
        Fbuffer.canvas.brush.color:=GetNewColor(orbcolor,jlpalest);
        Fbuffer.canvas.pen.color:=GetNewColor(orbcolor,jlpaleish);
        RoundRect(Fbuffer.canvas.Handle,bx+4,by+3,ox-2,(oy div 3),corners,corners);

        Fbuffer.canvas.brush.color:=GetNewColor(orbcolor,jlquitepale);  //bottom hilight
        Fbuffer.canvas.pen.color:=GetNewColor(orbcolor,jlquitepale);
        RoundRect(Fbuffer.canvas.Handle,bx+3,by+(oy div 2),ox-3,oy-2,corners,corners);
        Fbuffer.canvas.brush.color:=GetNewColor(orbcolor,jlpale);
        Fbuffer.canvas.pen.color:=GetNewColor(orbcolor,jlpale);
        RoundRect(Fbuffer.canvas.Handle,bx+4,by+(oy div 2)+1,ox-3,oy-2,3,3);
        Fbuffer.canvas.brush.color:=GetNewColor(orbcolor,jlpaleish);
        Fbuffer.canvas.pen.color:=GetNewColor(orbcolor,jlpaleish);
        RoundRect(Fbuffer.canvas.Handle,bx+5,by+(oy div 2)+2,ox-3,oy-2,3,3);
        Fbuffer.canvas.brush.color:=GetNewColor(orbcolor,jlpalest);
        Fbuffer.canvas.pen.color:=GetNewColor(orbcolor,jlpalest);
        RoundRect(Fbuffer.canvas.Handle,bx+6,by+(oy div 2)+3,ox-4,oy-4,4,4);
      end else begin
        Fbuffer.canvas.brush.color:=GetNewColor(orbcolor,jlquitepale);  //top hilight
        Fbuffer.canvas.pen.color:=GetNewColor(orbcolor,jlquitepale);
        RoundRect(Fbuffer.canvas.Handle,bx+5,by+3,ox-5,(oy div 3)+2,corners,corners);
        Fbuffer.canvas.brush.color:=GetNewColor(orbcolor,jlpale);
        Fbuffer.canvas.pen.color:=GetNewColor(orbcolor,jlpale);
        RoundRect(Fbuffer.canvas.Handle,bx+7,by+3,ox-7,(oy div 3)+1,corners,corners);
        Fbuffer.canvas.brush.color:=GetNewColor(orbcolor,jlpalest);
        Fbuffer.canvas.pen.color:=GetNewColor(orbcolor,jlpaleish);
        RoundRect(Fbuffer.canvas.Handle,bx+8,by+3,ox-8,(oy div 3),corners,corners);

        Fbuffer.canvas.brush.color:=GetNewColor(orbcolor,jlquitepale);  //bottom hilight
        Fbuffer.canvas.pen.color:=GetNewColor(orbcolor,jlquitepale);
        RoundRect(Fbuffer.canvas.Handle,bx+3,by+(oy div 2),ox-3,oy-2,corners,corners);
        Fbuffer.canvas.brush.color:=GetNewColor(orbcolor,jlpale);
        Fbuffer.canvas.pen.color:=GetNewColor(orbcolor,jlpale);
        RoundRect(Fbuffer.canvas.Handle,bx+5,by+(oy div 2)+1,ox-5,oy-2,corners,corners);
        Fbuffer.canvas.brush.color:=GetNewColor(orbcolor,jlpaleish);
        Fbuffer.canvas.pen.color:=GetNewColor(orbcolor,jlpaleish);
        RoundRect(Fbuffer.canvas.Handle,bx+7,by+(oy div 2)+2,ox-7,oy-2,corners,corners);
        Fbuffer.canvas.brush.color:=GetNewColor(orbcolor,jlpalest);
        Fbuffer.canvas.pen.color:=GetNewColor(orbcolor,jlpalest);
        RoundRect(Fbuffer.canvas.Handle,bx+9,by+(oy div 2)+3,ox-9,oy-4,corners,corners);
      end;
    end;
    bsOrb:begin
      Fbuffer.canvas.brush.color:=GetNewColor(BackColor,jlQuiteDark); //shadow
      Fbuffer.canvas.pen.color:=GetNewColor(BackColor,jlQuiteDark);
      Fbuffer.canvas.Ellipse(0,0,width,height);
      Fbuffer.canvas.brush.color:=GetNewColor(BackColor,jlDarkish);
      Fbuffer.canvas.pen.color:=GetNewColor(BackColor,jlDarkish);
      Fbuffer.canvas.Ellipse(0,0,width-1,height-1);
      Fbuffer.canvas.brush.color:=GetNewColor(BackColor,jlDarkest);
      Fbuffer.canvas.pen.color:=GetNewColor(BackColor,jlDarkest);
      Fbuffer.canvas.Ellipse(0,0,width-2,height-2);

      Fbuffer.canvas.brush.color:=GetNewColor(orbcolor,jldarkest);  //basecolor
      Fbuffer.canvas.pen.color:=GetNewColor(orbcolor,jlDarkest);
      Fbuffer.canvas.Ellipse(0,0,ox,oy);
      Fbuffer.canvas.brush.color:=GetNewColor(orbcolor,jldark);     //inner shadow
      Fbuffer.canvas.pen.color:=GetNewColor(orbcolor,jlDark);
      Fbuffer.canvas.Ellipse(1,1,ox,oy);
      Fbuffer.canvas.brush.color:=GetNewColor(orbcolor,jlquitedark);
      Fbuffer.canvas.pen.color:=GetNewColor(orbcolor,jlquiteDark);
      Fbuffer.canvas.Ellipse(2,2,ox,oy);
      Fbuffer.canvas.brush.color:=orbcolor;
      Fbuffer.canvas.pen.color:=orbcolor;
      Fbuffer.canvas.Ellipse(3,3,ox-1,oy-1);

      Fbuffer.canvas.brush.color:=GetNewColor(orbcolor,jlquitepale);  //top hilight
      Fbuffer.canvas.pen.color:=GetNewColor(orbcolor,jlquitepale);
      Fbuffer.canvas.Ellipse(bx+5,by+3,ox-5,(oy div 3)+2);
      Fbuffer.canvas.brush.color:=GetNewColor(orbcolor,jlpale);
      Fbuffer.canvas.pen.color:=GetNewColor(orbcolor,jlpale);
      Fbuffer.canvas.Ellipse(bx+6,by+3,ox-6,(oy div 3)+1);
      Fbuffer.canvas.brush.color:=GetNewColor(orbcolor,jlpalest);
      Fbuffer.canvas.pen.color:=GetNewColor(orbcolor,jlpaleish);
      Fbuffer.canvas.Ellipse(bx+7,by+3,ox-7,(oy div 3));

      Fbuffer.canvas.brush.color:=GetNewColor(orbcolor,jlquitepale);  //bottom hilight
      Fbuffer.canvas.pen.color:=GetNewColor(orbcolor,jlquitepale);
      Fbuffer.canvas.Ellipse(bx+3,by+(oy div 2),ox-3,oy-2);
      Fbuffer.canvas.brush.color:=GetNewColor(orbcolor,jlpale);
      Fbuffer.canvas.pen.color:=GetNewColor(orbcolor,jlpale);
      Fbuffer.canvas.Ellipse(bx+4,by+(oy div 2)+1,ox-4,oy-2);
      Fbuffer.canvas.brush.color:=GetNewColor(orbcolor,jlpaleish);
      Fbuffer.canvas.pen.color:=GetNewColor(orbcolor,jlpaleish);
      Fbuffer.canvas.Ellipse(bx+5,by+(oy div 2)+2,ox-5,oy-2);
      Fbuffer.canvas.brush.color:=GetNewColor(orbcolor,jlpalest);
      Fbuffer.canvas.pen.color:=GetNewColor(orbcolor,jlpalest);
      Fbuffer.canvas.Ellipse(bx+7,by+(oy div 2)+2,ox-7,oy-4);
    end;
  end;

  if (Fcaption<>'')and (not(captionmouseover))or((captionmouseover)and((FButtonState=jlOver)or(FButtonState=jlDown))) then begin
    Fbuffer.Canvas.Font.Name:=FFont.Name;
    Fbuffer.Canvas.Font.Size:=FFont.Size;
    Fbuffer.Canvas.Font.Style:=FFont.Style;
    Fbuffer.canvas.Brush.Style := bsClear;

    ty:=(((oy+2)-Fbuffer.Canvas.TextExtent(Fcaption).cy)div 2);
    if ty<0 then ty:=0;
    tx:=(((ox+2)-Fbuffer.Canvas.TextExtent(Fcaption).cx)div 2);
    if FButtonState=jlDown then begin
      inc(tx,1);
      inc(ty,1);
    end;

    if enabled then begin
      Fbuffer.canvas.font.color:=GetNewColor(orbcolor,jlPale);
      if FButtonState=jlDown then
        Fbuffer.canvas.textout(tx,ty-1,caption)
      else
        Fbuffer.canvas.textout(tx,ty+1,caption);
      Fbuffer.canvas.font.color:=GetNewColor(FFontColor,jlNone);
    end else begin
      Fbuffer.canvas.font.color:=GetNewColor(Backcolor,jlquiteDark);
    end;
      Fbuffer.canvas.textout(tx,ty-1,caption);
  end;
//  Canvas.Draw(0,0, Fbuffer);
  bitBlt(canvas.handle,0,0,width,height,Fbuffer.canvas.handle,0,0,srccopy);

  releaseDC(hand,DC);
  Fbuffer.Free;
  end;
end;

function TJLAqua.GetNewColor(oldColor: Tcolor; alter: TJLColorShade): TColor;
var
  rr,gg,bb:integer;
  al:integer;
  SysColor:TColor;
begin
  al:=0;
  case alter of
    jlDarkest:al:=60;
    jlDarkish:al:=45;
    jlDark:al:=30;
    jlQuiteDark:al:=15;
    jlhardlydark:al:=6;
    jlNone:al:=0;
    jlQuitePale:al:=15;
    jlPale:al:=30;
    jlPaleish:al:=45;
    jlPalest:al:=60;
  end;

  SysColor:=GetColor(oldColor);

  rr:=getRvalue(sysColor);
  gg:=getgvalue(sysColor);
  bb:=getbvalue(sysColor);

  if alter<>jlNone then begin
    if (Alter=jlPale)or(alter=jlPalest)or(alter=jlquitepale)or(alter=jlpaleish) then begin
      rr:=rr+round(((255-rr)/100)*al);
      gg:=gg+round(((255-gg)/100)*al);
      bb:=bb+round(((255-bb)/100)*al);
    end else begin
      rr:=rr-round((rr/100)*al);
      gg:=gg-round((gg/100)*al);
      bb:=bb-round((bb/100)*al);
    end;
    if rr>255 then rr:=255;
    if rr<0 then rr:=0;
    if gg>255 then gg:=255;
    if gg<0 then gg:=0;
    if bb>255 then bb:=255;
    if bb<0 then bb:=0;
  end;

  GetNewColor:=rgb(byte(rr),byte(gg),byte(bb));
end;

function TJLAqua.getcolor(syscolor:TColor):TColor;
begin
  case sysColor of
    clBackground:SysColor:=GetSysColor(COLOR_BACKGROUND);
    clActiveCaption:SysColor:=GetSysColor(COLOR_ACTIVECAPTION);
    clInactiveCaption:SysColor:=GetSysColor(COLOR_INACTIVECAPTION);
    clMenu:SysColor:=GetSysColor(COLOR_MENU);
    clWindow:SysColor:=GetSysColor(COLOR_WINDOW);
    clWindowFrame:SysColor:=GetSysColor(COLOR_WINDOWFRAME);
    clMenuText:SysColor:=GetSysColor(COLOR_MENUTEXT);
    clWindowText:SysColor:=GetSysColor(COLOR_WINDOWTEXT);
    clCaptionText:SysColor:=GetSysColor(COLOR_CAPTIONTEXT);
    clActiveBorder:SysColor:=GetSysColor(COLOR_ACTIVEBORDER);
    clInactiveBorder:SysColor:=GetSysColor(COLOR_INACTIVEBORDER);
    clAppWorkspace:SysColor:=GetSysColor(COLOR_APPWORKSPACE);
    clHighlight:SysColor:=GetSysColor(COLOR_HIGHLIGHT);
    clHighlightText:SysColor:=GetSysColor(COLOR_HIGHLIGHTTEXT);
    clBtnFace:SysColor:=GetSysColor(COLOR_BTNFACE);
    clBtnShadow:SysColor:=GetSysColor(COLOR_BTNSHADOW);
    clGrayText:SysColor:=GetSysColor(COLOR_GRAYTEXT);
    clBtnText:SysColor:=GetSysColor(COLOR_BTNTEXT);
    clInactiveCaptionText:SysColor:=GetSysColor(COLOR_INACTIVECAPTIONTEXT);
    clBtnHighlight:SysColor:=GetSysColor(COLOR_BTNHIGHLIGHT);
    cl3dDkShadow:SysColor:=GetSysColor(COLOR_3DDKSHADOW);
    cl3dLight:SysColor:=GetSysColor(COLOR_3DLIGHT);
    clInfoBk:SysColor:=GetSysColor(COLOR_INFOBK);
    clInfoText:SysColor:=GetSysColor(COLOR_INFOTEXT);
  end;
  GetColor:=syscolor;
end;

procedure TJLAqua.SetButtonActive(const Value: boolean);
begin
  FButtonActive := Value;
  invalidate;
end;

procedure TJLAqua.SetButtonColor(const Value: TColor);
begin
  FButtonColor := Value;
  invalidate;
end;

//procedure TJLAqua.SetButtonPulse(const Value: TColor);
//begin
//  FButtonPulse := Value;
//end;

procedure TJLAqua.SetButtonShape(const Value: TJLAquaType);
begin
  FButtonShape := Value;
  invalidate;
end;

procedure TJLAqua.SetCaptionMouseOver(const Value: Boolean);
begin
  FCaptionMouseOver := Value;
end;

procedure TJLAqua.SetEnabled(const Value: boolean);
begin
  FEnabled := Value;
  invalidate;
end;

procedure TJLAqua.SetFont(const Value: TFont);
begin
  FFont.Assign(Value);
  invalidate;
end;

procedure TJLAqua.SetCaption(const Value: string);
begin
  FCaption := Value;
  invalidate;
end;

function TJLAqua.IsInsideButton(X, Y: Integer): boolean;
var
  BtnEllipse : HRgn;
begin
  case FButtonShape of
    bsOrb:BtnEllipse := CreateEllipticRgn(1,1,Width-2,Height-3);
    bsButton:BtnEllipse:= createRoundRectRgn(2,2,width-1,height-2,height-2,height-2);
  end;
  Result := PtInRegion(BtnEllipse,X,Y);
  DeleteObject(BtnEllipse);
end;

procedure TJLAqua.WMLMOUSEDOWN(var Message: TMessage);
var
  mousepos:TPoint;
  temp:TJLButtonState;
begin
  GetCursorPos(MousePos);
  MousePos:=ScreenToClient(MousePos);

  if (Enabled and IsInsideButton(mousepos.X,mousepos.Y)) then begin
    temp:=FButtonState;
    FButtonState:=jlDown;
    if temp<>FButtonState then paint;
  end;
  FMouseDown:=true;
end;

procedure TJLAqua.WMLMOUSEUP(var Message: TMessage);
//var
//  temp:TJLButtonState;
begin
  inherited;
  if enabled then if FMouseDown then begin
//    temp:=FButtonState;
    FButtonState:=jlUp;
    FMouseDown:=false;
    click;
  end;
end;

procedure TJLAqua.WMMOUSEMOVE(var Message: TWMMouseMove);
var
  temp:TJLButtonState;
//  tb:TMouseButton;
  mousepos:TPoint;
begin
  GetCursorPos(MousePos);
  MousePos:=ScreenToClient(MousePos);

  if (FmouseDown)then begin
    if enabled then begin
      temp:=FButtonState;
      if IsInsideButton(mousepos.x,mousepos.y) then FButtonState:=jldown else FButtonState:=jlUp;
      if temp<>FButtonState then paint;
    end;
  end else if (enabled) then begin
    temp:=FButtonState;
    if IsInsideButton(mousepos.x,mousepos.y) then begin
      FButtonState:=jlover
    end else begin
      FButtonState:=jlUp;
    end;
    if temp<>FButtonState then paint;
  end;
end;

procedure TJLAqua.SetCustomColor(const Value: TJLCustomColor);
begin
  FCustomColor := Value;
  invalidate;
end;

//procedure TJLAqua.SetCustomPulse(const Value: TJLCustomColor);
//begin
//  FCustomPulse := Value;
//  invalidate;
//end;

procedure TJLAqua.SetFontColor(const Value: TColor);
begin
  FFontColor := Value;
  invalidate;
end;

procedure TJLAqua.WMMOUSELEAVE(var Message: TMessage);
var
  temp:TJLButtonState;
begin
  temp:=FButtonState;
  FButtonState:=jlUp;
  FmouseDown:=false;
  if temp<>FButtonState then paint;
end;

procedure TJLAqua.SetBackgroundError(const Value: TColor);
begin
  FBackgroundError := Value;
end;

procedure TJLAqua.SetSmallCorners(const Value: boolean);
begin
  FSmallCorners := Value;
  invalidate;
end;

end.
