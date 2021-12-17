{
  TsMMComboBoxEx Component
  Author: M. Mehdipour
  An implementation of TsComboBoxEx using TsComboBox in AlphaControls Lite Edition
  Can be applied to a TComboBox to make it a TComboBoxEx with a few more features.
}

unit sMMComboBoxEx;

interface

uses
  SysUtils, Classes, Controls, StdCtrls, sComboBox, ComCtrls, Types,
  Graphics, Windows, Messages;

type
  TsMMComboBoxEx = class(TsComboBox)
  private
    { Private declarations }
    FImages: TImageList;
    FHightlightColor, FHighlightTextColor: TColor;
    FNormalColor, FNormalTextColor: TColor;
    procedure WMPaint(var msg: TWMPaint); message WM_PAINT;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure DrawItem(Index: Integer;
      Rect: TRect; State: TOwnerDrawState); override;
  published
    { Published declarations }
    property Images: TImageList read FImages write FImages;
    property HighlightColor: TColor read FHightlightColor write FHightlightColor;
    property HighlightTextColor: TColor read FHighlightTextColor write FHighlightTextColor;
    property NormalColor: TColor read FNormalColor write FNormalColor;
    property NormalTextColor: TColor read FNormalTextColor write FNormalTextColor;
  end;

procedure Register;

implementation

const
  EMPTY_ITEM_TEXT = ' ';

procedure Register;
begin
  RegisterComponents('AlphaLite', [TsMMComboBoxEx]);
end;

{ TsMMComboBoxEx }

constructor TsMMComboBoxEx.Create(AOwner: TComponent);
begin
  inherited;
  Self.Style := csOwnerDrawFixed;
  ItemHeight := 22;
  FImages := nil;
  FNormalColor := clWhite;
  FNormalTextColor := clBlack;
  FHightlightColor := clHighlight;
  FHighlightTextColor := clHighlightText;
end;

procedure TsMMComboBoxEx.DrawItem(Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
  ItemBitmap: Graphics.TBitmap;
  PG, PT: TPoint;
begin
  Canvas.Font.Assign(Font);
  if ItemHeight < (Canvas.TextHeight(Items.Strings[Index]) + 4) then
    ItemHeight := Canvas.TextHeight(Items.Strings[Index]) + 4;
  ItemBitmap := Graphics.TBitmap.Create;
  if Assigned(FImages) and (FImages.Count > Index) then
  begin
    ItemBitmap.Width := FImages.Width;
    ItemBitmap.Height := FImages.Height;
    FImages.GetBitmap(Index,ItemBitmap);
    if ItemHeight < (ItemBitmap.Height + 4) then
      ItemHeight := ItemBitmap.Height + 4;
    Canvas.Brush.Color := clWhite;
    Canvas.FillRect(Rect);
    PG.Y := Trunc((Rect.Top + Rect.Bottom)/2 - ItemBitmap.Height/2);
    PG.X := Rect.Left + 1;
    if odFocused in State then
      Canvas.DrawFocusRect(Types.Rect(PG.X-1,PG.Y-1,PG.X+ItemBitmap.Width+1,PG.Y+ItemBitmap.Height+1));
    if (odComboBoxEdit in State) and (Items.Strings[Index] <> EMPTY_ITEM_TEXT) then
      Canvas.DrawFocusRect(Types.Rect(PG.X-1,PG.Y-1,PG.X+ItemBitmap.Width+1,PG.Y+ItemBitmap.Height+1));
    Canvas.Draw(PG.X,PG.Y,ItemBitmap);
  end;
  if (odSelected in State) and (Items.Strings[Index] = EMPTY_ITEM_TEXT) then
  begin
    Canvas.DrawFocusRect(Rect);
    ItemBitmap.Free;
    Exit;
  end;
  if ItemBitmap.Width > 0 then
    PT.X := Rect.Left + ItemBitmap.Width + 5
  else if odComboBoxEdit in State then
    PT.X := Rect.Left + 1
  else
    PT.X := Rect.Left + 5;
  PT.Y := Trunc((Rect.Bottom+Rect.Top)/2 - Canvas.TextHeight(Items.Strings[Index])/2);
    Canvas.Brush.Color := clWhite;
  Canvas.FillRect(Types.Rect(PT.X-1,PT.Y-1,PT.X+Canvas.TextWidth(Items.Strings[Index])+1,PT.Y+Canvas.TextHeight(Items.Strings[Index])+1));
  if (odSelected in State) and (Items.Strings[Index] <> EMPTY_ITEM_TEXT) then
  begin
    Canvas.Brush.Color := FHightlightColor;
    Canvas.Font.Color := FHighlightTextColor;
  end
  else
  begin
    Canvas.Brush.Color := FNormalColor;
    Canvas.Font.Color := FNormalTextColor;
  end;
  Canvas.FillRect(Types.Rect(PT.X,PT.Y,PT.X+Canvas.TextWidth(Items.Strings[Index]),PT.Y+Canvas.TextHeight(Items.Strings[Index])));
  if odFocused in State then
  begin
    Canvas.DrawFocusRect(Rect);
    Canvas.DrawFocusRect(Types.Rect(PT.X-1,PT.Y-1,PT.X+Canvas.TextWidth(Items.Strings[Index])+1,PT.Y+Canvas.TextHeight(Items.Strings[Index])+1));
  end;
  if Items.Strings[Index] <> EMPTY_ITEM_TEXT then
    Canvas.TextOut(PT.X,PT.Y,Items.Strings[Index]);
  ItemBitmap.Free;
end;

procedure TsMMComboBoxEx.WMPaint(var Msg: TWMPaint);
var
  ItemBitmap: Graphics.TBitmap;
  PG, PT: TPoint;
  Rect: TRect;
begin
  inherited;
  Msg.Result := 0;
  if Style <> csOwnerDrawFixed then
    Exit;
  if Assigned(FImages) then
    if ItemHeight < (FImages.Height + 4) then
      ItemHeight := FImages.Height + 4;
  if ItemIndex >= 0 then
  begin
    Rect := Types.Rect(3,0,Width,Height);
    ItemBitmap := Graphics.TBitmap.Create;
    if Assigned(FImages) then
    begin
      ItemBitmap.Width := FImages.Width;
      ItemBitmap.Height := FImages.Height;
      FImages.GetBitmap(ItemIndex,ItemBitmap);
    end
    else
      ItemBitmap.Width := 0;
    Canvas.Brush.Color := clWhite;
    Canvas.FillRect(Rect);
    PG.Y := Trunc((Rect.Top + Rect.Bottom)/2 - ItemBitmap.Height/2);
    PG.X := Rect.Left + 1;
    Canvas.Draw(PG.X,PG.Y,ItemBitmap);
    if Items.Strings[ItemIndex] = EMPTY_ITEM_TEXT then
    begin
      ItemBitmap.Free;
      Exit;
    end;  
    if ItemBitmap.Width > 0 then
      PT.X := Rect.Left + ItemBitmap.Width + 5
    else
      PT.X := Rect.Left + 1;
    PT.Y := Trunc((Rect.Bottom+Rect.Top)/2 - Canvas.TextHeight(Items.Strings[ItemIndex])/2);
    Canvas.Brush.Color := FNormalColor;
    Canvas.Font.Color := FNormalTextColor;
    Canvas.FillRect(Types.Rect(PT.X,PT.Y,PT.X+Canvas.TextWidth(Items.Strings[ItemIndex]),PT.Y+Canvas.TextHeight(Items.Strings[ItemIndex])));
    Canvas.TextOut(PT.X,PT.Y,Items.Strings[ItemIndex]);
    ItemBitmap.Free;
  end;
end;

end.
