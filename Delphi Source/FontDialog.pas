unit FontDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FontDialogFrame, sSkinProvider;

type
  TFontDialogForm = class(TForm)
    sSkinProvider1: TsSkinProvider;
    FontDialogFrame1: TFontDialogFrame;
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  TFontDialog=class(TComponent)
  private
    FFont:TFont;
  protected
  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
    function Execute:Boolean;
  published
    property Font:TFont read FFont write FFont;
  end;


implementation

{$R *.dfm}

{ TFontDialog }

constructor TFontDialog.Create(AOwner: TComponent);
begin
  inherited;
  FFont:=TFont.Create;
end;

destructor TFontDialog.Destroy;
begin
  FFont.Destroy;
  inherited;
end;

function TFontDialog.Execute: Boolean;
var
  FontDialogForm:TFontDialogForm;
  Index:Integer;
  B:Boolean;
begin
  FontDialogForm:=TFontDialogForm.Create(nil);
  with FontDialogForm.FontDialogFrame1 do
  begin
    SamplePanel.Font.Assign(FFont);
    NameList.ItemIndex:=NameList.Items.IndexOf(SamplePanel.Font.Name);
    B:=(fsBold in SamplePanel.Font.Style) and (fsItalic in SamplePanel.Font.Style);
    ColorCombo.Selected:=SamplePanel.Font.Color;
    if B then
      StyleEdit.Text:='Bold Italic'
    else if fsBold in SamplePanel.Font.Style then
      StyleEdit.Text:='Bold'
    else if fsItalic in SamplePanel.Font.Style then
      StyleEdit.Text:='Italic'
    else
      StyleEdit.Text:='Regular';
    StyleList.ItemIndex:=StyleList.Items.IndexOf(StyleEdit.Text);
    B:=(fsUnderline in SamplePanel.Font.Style);
    Index:=SamplePanel.Font.Size;
    StrikeCheck.Checked:=(fsStrikeOut in SamplePanel.Font.Style);
    UnderLineCheck.Checked:=B;
    SizeEdit.Text:=IntToStr(Index);
    if FontDialogForm.ShowModal=mrOk then
    begin
      Result:=True;
      FFont.Assign(SamplePanel.Font);
    end
    else
      Result:=False;
  end;
  FontDialogForm.Free;
end;

end.
