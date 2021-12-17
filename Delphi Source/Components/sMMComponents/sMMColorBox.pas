{
****************************************************************
  Info               :  RogerColorComboBox - Freeware
  Homepage           :  http://rogersoft.zzn.com
  Author             :  Rogerio Olimpio Lourenço de Oliveira
  E-mail             :  Rogerio.olimpio@rogersoft.zzn.com
  Compiler           :  Delphi 3
****************************************************************
 }

unit sMMColorBox;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, sComboBox;

type

//  TRogerColorComboBox = class(TsComboBox)
  TsMMColorBox = class(TsComboBox)
    { Private declarations }
        ColorDlg: TColorDialog;
  private
    FColorValue : TColor;
    FHTMLColor: shortstring;
    procedure SetColorValue(Cor: TColor);
    procedure SetHTMLColor(Value: shortstring);
  protected
    { Protected declarations }
    procedure CreateWnd; override;
    Function WebColor(Cor:TColor): String;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Change; override;
    procedure DrawItem(Index: Integer; ARect: TRect; State: TOwnerDrawState); override;
  published
    { Published declarations }
    property HTMLcolor : shortString read FHTMLColor write SetHTMLColor;
    property Selected : TColor read FColorValue write SetColorValue;
    property Color;
    property Ctl3D;
    property DragMode;
    property DragCursor;
    property Enabled;
    property Font;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick;
    property OnChange;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnDropDown;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnStartDrag;
  end;

procedure Register;

implementation
const
  ColorsInList = 16;
  ActiveColors: array [0..ColorsInList] of TColor = (
        clBlack, clMaroon, clGreen, clOlive, clNavy, clPurple, clTeal, clGray,
    clSilver, clRed, clLime, clYellow, clBlue, clFuchsia, clAqua, clWhite, clWhite);

  EnglishColors: array [0..ColorsInList ] of String=(
  'Black','Maroon','Green', 'Olive', 'Navy', 'Purple', 'Teal', 'Gray',
  'Silver', 'Red', 'Lime', 'Yellow', 'Blue', 'Fuchsia', 'Aqua', 'White', 'Custom...');




constructor TsMMColorBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Style := csOwnerDrawFixed;
  width := 120;
  FHTMLColor:='#000000';
end;

procedure TsMMColorBox.CreateWnd;
var
   a: shortint;
begin
  inherited CreateWnd;
  Items.Clear;
  with Items do
    begin
      for a:=0 to ColorsInList do add(colortostring(ActiveColors[a]));
    end;
  itemindex:=0;
end;

destructor TsMMColorBox.Destroy;
begin
  inherited Destroy;
end;

procedure TsMMColorBox.DrawItem(Index: Integer;
  ARect: TRect; State: TOwnerDrawState);
var
      novorect: trect;
      Texto: array[0..255] of Char;
      Safer: TColor;
begin
    with Canvas do
    begin
      safer:=Brush.Color;
      FillRect(ARect);
      novorect:= rect(arect.Left+4, arect.Top+1, 24, arect.bottom-1);
      Brush.Color := stringtocolor(Items[Index]);
      FillRect(novorect);
      Pen.Color := clblack;
      Rectangle(Novorect.Left, Novorect.Top, Novorect.Right, Novorect.Bottom);
      novoRect := rect(ARect.Left + 30, arect.top, arect.right, arect.bottom);
      StrPCopy(Texto, EnglishColors[Index]);
      Brush.Color := safer;
      DrawText(Canvas.Handle, texto, StrLen(texto), novoRect, DT_SINGLELINE or DT_VCENTER or DT_NOPREFIX);
    end;
end;

FUNCTION TsMMColorBox.WebColor(Cor:TColor): String;
var
     Temp : Integer;
     Temp2: String;
begin
     temp := ColorToRGB(Cor);
     Temp2 := IntToHex(temp,6);
     Result := '#'+Copy(Temp2,5,2)+Copy(Temp2,3,2)+Copy(Temp2,1,2);
end;

procedure TsMMColorBox.SetHTMLColor(Value: shortstring);
var
   InList: boolean;
   a, AIndex: integer;
   Temp: shortstring;
   Temp2: shortString;
begin
   InList:=false;
   Value := uppercase(Value);
   temp:=FHTMLColor;
   try
     if (Value = '') then Value:='#000000';
     temp2 := '$00' + Copy(Value,6,2)+ Copy(Value,4,2) + Copy(Value,2,2);
     If strtoint(temp2) <> FColorValue then SetcolorValue(strtoint(temp2));
     FHTMLColor := value;
   except
     FHTMLColor := temp;
   end;
end;

procedure TsMMColorBox.Change;
begin
  if ItemIndex=16 then
     begin
        ColorDlg:=TColorDialog.Create(self);
        ColorDlg.Options:=[cdFullOpen];
        colorDlg.Color:= stringtocolor(text);
        if colorDlg.Execute then SetColorValue(colorDlg.Color);
        ColorDlg.free;
     end
  else
     setcolorvalue(ActiveColors[itemindex]);
  inherited change;
end;

procedure TsMMColorBox.SetColorValue(Cor: TColor);
var
   InList: boolean;
   a, AIndex: integer;
   Temp: TColor;
begin
   InList:=false;
   temp:=FColorValue;
   try
     for a:=0 to items.Count do
            if items[a] = ColorToString(Cor) then
               begin
                  InList:=true;
                  AIndex:=a;
               end;
     if not InList then
         begin
            Items[16]:=ColorToString(Cor);
            ItemIndex:=16;
         end
     else
         begin
            ItemIndex:=AIndex;
         end;
     FColorValue:= Cor;
     SetHtmlColor(webcolor(Cor));
   except
     FColorValue := Temp;
   end;
end;


procedure Register;
begin
  RegisterComponents('AlphaLite', [TsMMColorBox]);
end;

end.
