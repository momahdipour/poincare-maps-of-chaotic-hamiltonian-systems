unit sMMColorSelector;

interface

uses
  SysUtils, Classes, Controls, Buttons, sBitBtn, Graphics, Dialogs;

type
  TsMMColorSelector = class(TsBitBtn)
  private
    { Private declarations }
    FImgWidth:Integer;
    FImgHeight:Integer;
    FColorValue:TColor;
    FOnChange:TNotifyEvent;

    procedure SetImgWidth(AImgWidth:Integer);
    procedure SetImgHeight(AImgHeight:Integer);
    procedure SetColorValue(AColorValue:TColor);
    procedure ButtonClick(Sender:TObject);
    procedure UpdateGlyph;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
  published
    { Published declarations }
    property ImgWidth:Integer read FImgWidth write SetImgWidth default 15;
    property ImgHeight:Integer read FImgHeight write SetImgHeight default 15;
    property ColorValue:TColor read FColorValue write SetColorValue default clBlack;

    property OnChange:TNotifyEvent read FOnChange write FOnChange;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('AlphaLite', [TsMMColorSelector]);
end;

{ TsMMColorSelector }

procedure TsMMColorSelector.ButtonClick(Sender: TObject);
var
  ColorDialog:TColorDialog;
begin
  ColorDialog:=TColorDialog.Create(nil);
  ColorDialog.Color:=FColorValue;
  ColorDialog.Options:=[cdFullOpen];
  Down:=not Down;
  if ColorDialog.Execute then
  begin
    FColorValue:=ColorDialog.Color;
    if Assigned(FOnChange) then
      FOnChange(Self);
  end;
  Down:=not Down;
  ColorDialog.Destroy;
  SetColorValue(FColorValue);
end;

constructor TsMMColorSelector.Create(AOwner: TComponent);
begin
  inherited;
  FImgWidth:=15;
  FImgHeight:=15;
  Glyph.Height:=FImgHeight;
  Glyph.Width:=FImgWidth;
  SetColorValue(clBlack);
  ColorValue:=clBlack;
  OnClick:=ButtonClick;
end;

destructor TsMMColorSelector.Destroy;
begin
  Glyph.FreeImage;
  inherited;
end;

procedure TsMMColorSelector.SetColorValue(AColorValue: TColor);
begin
  FColorValue:=AColorValue;
  Glyph.Canvas.Brush.Color:=FColorValue;
  Glyph.Canvas.Brush.Style:=bsSolid;
  Glyph.Canvas.FillRect(Rect(0,0,Glyph.Width-1,Glyph.Height-1));
  UpdateGlyph;
end;

procedure TsMMColorSelector.SetImgHeight(AImgHeight: Integer);
begin
  FImgHeight:=AImgHeight;
  Glyph.Height:=FImgHeight;
  Glyph.Canvas.Brush.Color:=FColorValue;
  Glyph.Canvas.Brush.Style:=bsSolid;
  Glyph.Canvas.FillRect(Rect(0,0,Glyph.Width-1,Glyph.Height-1));
  UpdateGlyph;
end;

procedure TsMMColorSelector.SetImgWidth(AImgWidth: Integer);
begin
  FImgWidth:=AImgWidth;
  Glyph.Width:=FImgWidth;
  Glyph.Canvas.Brush.Color:=FColorValue;
  Glyph.Canvas.Brush.Style:=bsSolid;
  Glyph.Canvas.FillRect(Rect(0,0,Glyph.Width-1,Glyph.Height-1));
  UpdateGlyph;
end;

procedure TsMMColorSelector.UpdateGlyph;
begin
  Visible:=not Visible;
  Glyph.Canvas.Pixels[0,Glyph.Height-1]:=FColorValue+1;
  Visible:=not Visible;
  Invalidate;
end;

end.
