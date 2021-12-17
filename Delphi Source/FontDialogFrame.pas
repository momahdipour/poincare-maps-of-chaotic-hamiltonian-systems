unit FontDialogFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sButton, ExtCtrls, sPanel, sEdit, sAlphaListBox,
  sCheckBox, Buttons,
  sBitBtn, sComboBox, sMMColorBox, sLabel;

type
  TFontDialogFrame = class(TFrame)
    sPanel1: TsPanel;
    NameList: TsListBox;
    StyleEdit: TsEdit;
    StyleList: TsListBox;
    SizeEdit: TsEdit;
    SizeList: TsListBox;
    OKBtn: TsBitBtn;
    CancelBtn: TsBitBtn;
    sPanel2: TsPanel;
    SamplePanel: TsPanel;
    sLabel1: TsLabel;
    sPanel3: TsPanel;
    StrikeCheck: TsCheckBox;
    UnderLineCheck: TsCheckBox;
    ColorCombo: TsMMColorBox;
    sLabel2: TsLabel;
    procedure SizeEditChange(Sender: TObject);
    procedure StyleEditChange(Sender: TObject);
    procedure StyleListClick(Sender: TObject);
    procedure SizeListClick(Sender: TObject);
    procedure NameListClick(Sender: TObject);
    procedure UnderLineCheckClick(Sender: TObject);
    procedure StrikeCheckClick(Sender: TObject);
    procedure ColorComboChange(Sender: TObject);
  private
    { Private declarations }
    procedure RefreshSampleFont;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);override;
  end;

implementation

{$R *.dfm}

procedure TFontDialogFrame.SizeEditChange(Sender: TObject);
begin
  if SizeList.Items.IndexOf(SizeEdit.Text)>=0 then
    SizeList.ItemIndex:=SizeList.Items.IndexOf(SizeEdit.Text);
  RefreshSampleFont;
end;

procedure TFontDialogFrame.StyleEditChange(Sender: TObject);
begin
  if StyleList.Items.IndexOf(StyleEdit.Text)>=0 then
    StyleList.ItemIndex:=StyleList.Items.IndexOf(StyleEdit.Text);
end;

procedure TFontDialogFrame.StyleListClick(Sender: TObject);
begin
  if StyleList.ItemIndex>=0 then
    StyleEdit.Text:=StyleList.Items.Strings[StyleList.ItemIndex];
  RefreshSampleFont;  
end;

procedure TFontDialogFrame.RefreshSampleFont;
var
  fs:TFontStyles;
  i,ErrCode:Integer;
begin
  SamplePanel.Font.Name:=NameList.Items.Strings[NameList.ItemIndex];
  fs:=[];
  if StrikeCheck.Checked then fs:=fs+[fsStrikeOut];
  if UnderLineCheck.Checked then fs:=fs+[fsUnderline];
  if StyleList.ItemIndex=1 then
    fs:=fs+[fsItalic]
  else if StyleList.ItemIndex=2 then
    fs:=fs+[fsBold]
  else if StyleList.ItemIndex=3 then
    fs:=fs+[fsItalic,fsBold];
  SamplePanel.Font.Style:=fs;
  SamplePanel.Font.Color:=ColorCombo.Selected;
  val(SizeEdit.Text,i,ErrCode);
  if ErrCode<>0 then Exit;
  SamplePanel.Font.Size:=i;
end;

procedure TFontDialogFrame.SizeListClick(Sender: TObject);
begin
  if SizeList.ItemIndex>=0 then
    SizeEdit.Text:=SizeList.Items.Strings[SizeList.ItemIndex];
end;

procedure TFontDialogFrame.NameListClick(Sender: TObject);
begin
  RefreshSampleFont;
end;


procedure TFontDialogFrame.UnderLineCheckClick(Sender: TObject);
begin
  RefreshSampleFont;
end;

procedure TFontDialogFrame.StrikeCheckClick(Sender: TObject);
begin
  RefreshSampleFont;
end;

procedure TFontDialogFrame.ColorComboChange(Sender: TObject);
begin
  RefreshSampleFont;
end;

constructor TFontDialogFrame.Create(AOwner: TComponent);
begin
  inherited;
  NameList.Items.Assign(Screen.Fonts);
  NameList.Sorted:=True;
end;

end.


