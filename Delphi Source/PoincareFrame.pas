unit PoincareFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, sPanel, JLAqua, Buttons,
  sBitBtn, sLabel, sEdit, sCheckBox,
  Menus, Spin, sMMDialogs, sComboBox, ImgList, sMMComboBoxEx,
  ScrollingSections, sEquationEditor, sScrollBar, Parser10;

type
  TPoincareSectionCalculationSetupFrame = class(TFrame)
    Label1: TLabel;
    sPanel1: TsPanel;
    DefaultValuesPopup1: TPopupMenu;
    N1: TMenuItem;
    DefaultValues1: TMenuItem;
    N2: TMenuItem;
    X203X402H161: TMenuItem;
    N3: TMenuItem;
    X203X402H171: TMenuItem;
    MainPanel: TsPanel;
    InitialConditionsHeader: TJLAqua;
    DefaultValuesBtn1: TsBitBtn;
    CalculationOptionsHeader: TJLAqua;
    N4: TMenuItem;
    X203X402H162: TMenuItem;
    N5: TMenuItem;
    X203X402H163: TMenuItem;
    EquationSettingsBody: TsPanel;
    EquationSettingsHeader: TJLAqua;
    OtherOptionsHeader: TJLAqua;
    VariableImages1: TImageList;
    VariableImages2: TImageList;
    SurfaceComboPanel: TsPanel;
    sLabel12: TsLabel;
    SurfaceComboBox: TsMMComboBoxEx;
    UVarPanel: TsPanel;
    sLabel13: TsLabel;
    UVarComboBox: TsMMComboBoxEx;
    UVarFormulaCheckBox: TsCheckBox;
    UVarNumericalCheckBox: TsCheckBox;
    UVarFormulaEdit: TsEdit;
    YComboPanel: TsPanel;
    Image9: TImage;
    sLabel15: TsLabel;
    YComboBox: TsMMComboBoxEx;
    Image10: TImage;
    sLabel14: TsLabel;
    sLabel16: TsLabel;
    YDotx1Image: TImage;
    InitialConditionsBody: TsPanel;
    CalculationOptionsBody: TsPanel;
    OtherOptionsBody: TsPanel;
    IniPanel1: TsPanel;
    Image1: TImage;
    sLabel1: TsLabel;
    X1Label: TsLabel;
    IniPanel2: TsPanel;
    Image2: TImage;
    sLabel2: TsLabel;
    x2IniEdit: TsEdit;
    IniPanel3: TsPanel;
    Image3: TImage;
    sLabel3: TsLabel;
    X3Label: TsLabel;
    IniPanel4: TsPanel;
    Image4: TImage;
    sLabel4: TsLabel;
    x4IniEdit: TsEdit;
    sPanel6: TsPanel;
    Image5: TImage;
    sLabel5: TsLabel;
    HIniEdit: TsEdit;
    sPanel7: TsPanel;
    sLabel8: TsLabel;
    sLabel9: TsLabel;
    sLabel10: TsLabel;
    x2IniImage: TImage;
    x4IniImage: TImage;
    Image8: TImage;
    StepsSpin: TSpinEdit;
    x2IniChangeEdit: TsEdit;
    x4IniChangeEdit: TsEdit;
    x2IniDefaultCheck: TsCheckBox;
    x4IniDefaultCheck: TsCheckBox;
    sPanel8: TsPanel;
    sLabel11: TsLabel;
    RK78Spin: TSpinEdit;
    sPanel10: TsPanel;
    ErrorMessagesCheck: TsCheckBox;
    sPanel14: TsPanel;
    sPanel15: TsPanel;
    sPanel16: TsPanel;
    LogFileCheckBox: TsCheckBox;
    LogFileLabel: TsLabel;
    LogFileEdit: TsEdit;
    LogFileOpenBtn: TsBitBtn;
    SaveToDiskCheckBox: TsCheckBox;
    SaveToDiskMinutesSpin: TSpinEdit;
    OutputFileLabel: TsLabel;
    OutputFileEdit: TsEdit;
    OutputFileOpenBtn: TsBitBtn;
    TurnOffCheckBox: TsCheckBox;
    BackgroundProcCheckBox: TsCheckBox;
    MinimizeToTtrayCheckBox: TsCheckBox;
    BottomPanel: TsPanel;
    ViewPoincareBtn: TsBitBtn;
    StartPoincareBtn: TsBitBtn;
    UVarx3Image: TImage;
    SaveDialog1: TSaveDialog;
    sScrollBar1: TsScrollBar;
    UVarx1Image: TImage;
    UVarx2Image: TImage;
    UVarx4Image: TImage;
    YDotx2Image: TImage;
    YDotx3Image: TImage;
    YDotx4Image: TImage;
    x3IniImage: TImage;
    x1IniImage: TImage;
    procedure FrameResize(Sender: TObject);
    procedure x2IniDefaultCheckClick(Sender: TObject);
    procedure x4IniDefaultCheckClick(Sender: TObject);
    procedure StartPoincareBtnClick(Sender: TObject);
    procedure Parser1ParserError(Sender: TObject; E: Exception);
    procedure N1AdvancedDrawItem(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; State: TOwnerDrawState);
    procedure DefaultValuesBtn1Click(Sender: TObject);
    procedure X203X402H171Click(Sender: TObject);
    procedure CalculationOptionsHeaderClick(Sender: TObject);
    procedure OtherOptionsHeaderClick(Sender: TObject);
    procedure EquationSettingsHeaderClick(Sender: TObject);
    procedure InitialConditionsHeaderClick(Sender: TObject);
    procedure UVarFormulaCheckBoxClick(Sender: TObject);
    procedure LogFileCheckBoxClick(Sender: TObject);
    procedure SaveToDiskCheckBoxClick(Sender: TObject);
    procedure LogFileOpenBtnClick(Sender: TObject);
    procedure OutputFileOpenBtnClick(Sender: TObject);
    procedure sScrollBar1Change(Sender: TObject);
    procedure MainPanelResize(Sender: TObject);
    procedure UVarFormulaEditChange(Sender: TObject);
    procedure UVarComboBoxChange(Sender: TObject);
    procedure SurfaceComboBoxChange(Sender: TObject);
    procedure YComboBoxChange(Sender: TObject);
    procedure UVarFormulaEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    ParserError:Boolean;
    SS: TScrollingSections;
    CheckingCheckBoxGroup: Boolean;
    UVarParser: Parser10.TParser;
    UVarImages: array[0..3] of TImage;
    YDotImages: array[0..3] of TImage;
    XIniImages: array[0..3] of TImage;
    procedure ResetScrollBar;
    procedure ResetIniImages;
    procedure RearrangeIniEdits;
    function GetX2VarNo: Integer;
    function GetX4VarNo: Integer;
    function GetYVarNo: Integer;
    procedure SetEditMode(EditMode: Boolean);
    procedure MouseWheel(var msg: TWMMouseWheel); message WM_MOUSEWHEEL;
  public
    { Public declarations }
    ValidParameters:Boolean;
    UVarFormula: String;
    UseUVarFormula: Boolean;
    X2,X4,H,X2IniChangeValue,X4IniChangeValue:Extended;
    NumOfInitSteps,NumOfRK78Steps:Integer;
    X2DefaultIni,X4DefaultIni:Boolean;
    UVarExternalEquationEditor: TsEquationEditor;
    IniConditionPanels: array[0..3] of TWinControl;
    procedure SetDefaultValues1(Index:Integer);
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure EnableEditing;
    procedure DisableEditing;
    property X2VarNo: Integer read GetX2VarNo;
    property X4VarNo: Integer read GetX4VarNo;
    property YVarNo: Integer read GetYVarNo;
  end;

implementation

uses
  MainUnit, Math;

{$R *.dfm}

procedure TPoincareSectionCalculationSetupFrame.FrameResize(
  Sender: TObject);
begin
  StartPoincareBtn.Left:=Width-160;
  ViewPoincareBtn.Left:=Width-337;
end;

procedure TPoincareSectionCalculationSetupFrame.x2IniDefaultCheckClick(
  Sender: TObject);
begin
  x2IniChangeEdit.Enabled:=not x2IniDefaultCheck.Checked;
end;

procedure TPoincareSectionCalculationSetupFrame.x4IniDefaultCheckClick(
  Sender: TObject);
begin
  x4IniChangeEdit.Enabled:=not x4IniDefaultCheck.Checked;
end;

procedure TPoincareSectionCalculationSetupFrame.StartPoincareBtnClick(
  Sender: TObject);
var
  Parser1:Parser10.TParser;
  ErrCode:Integer;
begin
  ValidParameters:=False;
  {Unknown variable}
  UseUVarFormula := UVarFormulaCheckBox.Checked;
  if UseUVarFormula then
  begin
    if MainForm.TokenExits(1,UVarFormulaEdit.Text,'x'+IntToStr(UVarComboBox.ItemIndex+1)) then
    begin
      sMMShowMessage('The unknown variable ('+'X'+IntToStr(UVarComboBox.ItemIndex+1)+') can not appear in the unknown variable formula.');
      UVarFormulaEdit.SetFocus;
      Exit;
    end;
    ParserError := False;
    UVarParser.Expression := UVarFormulaEdit.Text;
    if ParserError then
    begin
      sMMShowMessage('Please enter a valid formula for the unknown variable X' + IntToStr(UVarComboBox.ItemIndex + 1) + '.');
      UVarFormulaEdit.SetFocus;
      Exit;
    end;
    UVarFormula := UVarFormulaEdit.Text;
  end;
  Parser1:=Parser10.TParser.Create(nil);
  Parser1.OnParserError:=Parser1ParserError;
  Parser1.ClearVariables;
  ParserError:=False;
  {x2}
  Parser1.Expression:=x2IniEdit.Text;
  if Length(Parser1.Expression)=0 then
  begin
    sMMShowMessage('Please define an initial value for X' + IntToStr(GetX2VarNo) + '.');
    x2IniEdit.SetFocus;
    Parser1.Destroy;
    Exit;
  end;
  if ParserError then
  begin
    sMMShowMessage('Please enter a valid value for initial condition of X' + IntToStr(GetX2VarNo) + '.');
    x2IniEdit.SelectAll;
    x2IniEdit.SetFocus;
    Parser1.Destroy;
    Exit;
  end;
  X2:=Parser1.Value;
  {x4}
  Parser1.Expression:=x4IniEdit.Text;
  if Length(Parser1.Expression)=0 then
  begin
    sMMShowMessage('Please define an initial value for X' + IntToStr(GetX4VarNo) + '.');
    x4IniEdit.SetFocus;
    Parser1.Destroy;
    Exit;
  end;
  if ParserError then
  begin
    sMMShowMessage('Please enter a valid value for initial condition of X' + IntToStr(GetX4VarNo) + '.');
    x4IniEdit.SelectAll;
    x4IniEdit.SetFocus;
    Parser1.Destroy;
    Exit;
  end;
  X4:=Parser1.Value;
  {H}
  Parser1.Expression:=HIniEdit.Text;
  if Length(Parser1.Expression)=0 then
  begin
    sMMShowMessage('Please define an initial value for H.');
    HIniEdit.SetFocus;
    Parser1.Destroy;
    Exit;
  end;
  if ParserError then
  begin
    sMMShowMessage('Please enter a valid value for initial condition of H.');
    HIniEdit.SelectAll;
    HIniEdit.SetFocus;
    Parser1.Destroy;
    Exit;
  end;
  H:=Parser1.Value;
  {X2DefaultIni}
  X2DefaultIni:=x2IniDefaultCheck.Checked;
  {X4DefaultIni}
  X4DefaultIni:=x4IniDefaultCheck.Checked;
  {X2IniChangeValue}
  if not X2DefaultIni then
  begin
    Parser1.Expression:=x2IniChangeEdit.Text;
    if Length(Parser1.Expression)=0 then
    begin
      if sMMMessageDlg('You have not defined an initial condition changing value for X'+IntToStr(GetX2VarNo)+'.'+Chr(13)
         +'Do you want to use default value?',mtConfirmation,[mbYes,mbNo],0)=mrNo then
      begin
        x2IniChangeEdit.SetFocus;
        Parser1.Destroy;
        Exit;
      end;
      x2IniDefaultCheck.Checked:=True;
      X2DefaultIni:=True;
    end;
    if ParserError then
    begin
      sMMShowMessage('Please enter a valid value for initial condition changing value of X'+IntToStr(GetX2VarNo)+'.');
      x2IniChangeEdit.SelectAll;
      x2IniChangeEdit.SetFocus;
      Parser1.Destroy;
      Exit;
    end;
    X2IniChangeValue:=Parser1.Value;
  end;
  {X4IniChangeValue}
  if not X4DefaultIni then
  begin
    Parser1.Expression:=x4IniChangeEdit.Text;
    if Length(Parser1.Expression)=0 then
    begin
      if sMMMessageDlg('You have not defined an initial condition changing value for X'+IntToStr(GetX4VarNo)+'.'+Chr(13)
         +'Do you want to use default value?',mtConfirmation,[mbYes,mbNo],0)=mrNo then
      begin
        x4IniChangeEdit.SetFocus;
        Parser1.Destroy;
        Exit;
      end;
      x4IniDefaultCheck.Checked:=True;
      X4DefaultIni:=True;
    end;
    if ParserError then
    begin
      sMMShowMessage('Please enter a valid value for initial condition changing value of X'+IntToStr(GetX2VarNo)+'.');
      x4IniChangeEdit.SelectAll;
      x4IniChangeEdit.SetFocus;
      Parser1.Destroy;
      Exit;
    end;
    X4IniChangeValue:=Parser1.Value;
  end;
  {numOfInitSteps}
  if Length(StepsSpin.Text)=0 then
  begin
    sMMShowMessage('Please define the number of used initial conditions.');
    StepsSpin.SetFocus;
    Parser1.Destroy;
    Exit;
  end;
  val(StepsSpin.Text,NumOfInitSteps,ErrCode);
  if ErrCode<>0 then
  begin
    sMMShowMessage('Please enter a valid value for the number of used initial conditions.');
    StepsSpin.SetFocus;
    Parser1.Destroy;
    Exit;
  end;
  NumOfInitSteps:=StepsSpin.Value;
  {NumOfRK78Steps}
  if Length(RK78Spin.Text)=0 then
  begin
    sMMShowMessage('Please define the number of runge-kutta integrals.');
    RK78Spin.SetFocus;
    Parser1.Destroy;
    Exit;
  end;
  val(RK78Spin.Text,NumOfRK78Steps,ErrCode);
  if ErrCode<>0 then
  begin
    sMMShowMessage('Please enter a valid value for the number of runge-kutta integrals.');
    RK78Spin.SetFocus;
    Parser1.Destroy;
    Exit;
  end;
  NumOfRK78Steps:=RK78Spin.Value;
  ValidParameters:=True;
  Parser1.Destroy;
end;

procedure TPoincareSectionCalculationSetupFrame.Parser1ParserError(
  Sender: TObject; E: Exception);
begin
  ParserError:=True;
end;

procedure TPoincareSectionCalculationSetupFrame.N1AdvancedDrawItem(
  Sender: TObject; ACanvas: TCanvas; ARect: TRect; State: TOwnerDrawState);
var
  S:String;
begin
  ACanvas.Pen.Color:=$00E1EAEB;
  ACanvas.Brush.Color:=$00E1EAEB;
  ACanvas.Rectangle(ARect.Left,ARect.Top,ARect.Right,ARect.Bottom);
  ACanvas.Brush.Style:=bsClear;
  ACanvas.Font.Color:=clBlue;
  ACanvas.Font.Style:=[fsBold];
  ACanvas.Font.Size:=10;
  S:='Default Initial Conditions';
  ACanvas.TextOut(Trunc(ARect.Left+(ARect.Right-ARect.Left)/2-ACanvas.TextWidth(S)/2)
                  ,Trunc(ARect.Top+(ARect.Bottom-ARect.Top)/2-ACanvas.TextHeight(S)/2)
                  ,S);
  ACanvas.Pen.Color:=clRed;
  ACanvas.Rectangle(ARect.Left,ARect.Bottom-1,ARect.Right,ARect.Bottom);
end;

procedure TPoincareSectionCalculationSetupFrame.DefaultValuesBtn1Click(
  Sender: TObject);
var
  P:TPoint;
begin
  P:=DefaultValuesBtn1.Parent.ClientToScreen(Point(DefaultValuesBtn1.Left,DefaultValuesBtn1.Top+DefaultValuesBtn1.Height));
  DefaultValuesPopup1.Popup(P.X,P.Y);
end;

procedure TPoincareSectionCalculationSetupFrame.SetDefaultValues1(
  Index: Integer);
var
  X2s,X4s,Hs:String;
begin
  case Index of
    0: begin X2s:='-0.3'; X4s:='-0.2'; Hs:='0.1'; end;
    1: begin X2s:='-0.3'; X4s:='-0.2'; Hs:='1/12'; end;
    2: begin X2s:='-0.3'; X4s:='-0.2'; Hs:='1/8'; end;
    3: begin X2s:='-0.3'; X4s:='-0.2'; Hs:='1/7'; end;
    4: begin X2s:='-0.3'; X4s:='-0.2'; Hs:='1/6'; end;
  end;
  x2IniEdit.Text:=X2s;
  x4IniEdit.Text:=X4s;
  HIniEdit.Text:=Hs;
end;

procedure TPoincareSectionCalculationSetupFrame.X203X402H171Click(
  Sender: TObject);
begin
  SetDefaultValues1((Sender as TMenuItem).Tag);
end;

constructor TPoincareSectionCalculationSetupFrame.Create(
  AOwner: TComponent);
var
  i: Integer;
begin
  inherited;
  CheckingCheckBoxGroup := False;
  //Initialize SS (ScrollingSections manager)
  SS := TScrollingSections.Create(nil);
  SS.ScrollSpeed := 80;
  SS.AddSection(EquationSettingsHeader,EquationSettingsBody,EquationSettingsBody.Height,1);
  SS.AddSection(InitialConditionsHeader,InitialConditionsBody,InitialConditionsBody.Height,2);
  SS.AddSection(CalculationOptionsHeader,CalculationOptionsBody,CalculationOptionsBody.Height,3);
  SS.AddSection(OtherOptionsHeader,OtherOptionsBody,OtherOptionsBody.Height,4);
  SS.AllowMultipleSections := True;
  SS.AnimatedScrolling := True;
  SS.PopupSection(1);
  SS.PopupSection(2);
  SS.PopupSection(3);
  //Initialize UVarParser
  UVarParser := Parser10.TParser.Create(nil);
  MainForm.InitializeParser(UVarParser);
  UVarParser.SetVariable('H',0);
  UVarParser.OnParserError := Parser1ParserError;
  //
  LogFileEdit.Text := ExtractFilePath(Application.ExeName)+'calculation.log';
  OutputFileEdit.Text := ExtractFilePath(Application.ExeName)+'output.dat';
  //Arrange UVarxnImages
  UVarImages[0] := UVarx1Image;
  UVarImages[1] := UVarx2Image;
  UVarImages[2] := UVarx3Image;
  UVarImages[3] := UVarx4Image;
  for i:=0 to 3 do
  begin
    UVarImages[i].Left := UVarImages[0].Left;
    UVarImages[i].Top := UVarImages[0].Top;
    UVarImages[i].Hide;
  end;
  UVarImages[UVarComboBox.ItemIndex].Show;
  //Arrange YDotxnImages
  YDotImages[0] := YDotx1Image;
  YDotImages[1] := YDotx2Image;
  YDotImages[2] := YDotx3Image;
  YDotImages[3] := YDotx4Image;
  for i:=0 to 3 do
  begin
    YDotImages[i].Left := YDotImages[0].Left;
    YDotImages[i].Top := YDotImages[0].Top;
    YDotImages[i].Hide;
  end;
  YDotImages[YComboBox.ItemIndex].Show;
  //Initialize XIniImages
  XIniImages[0] := x1IniImage;
  XIniImages[1] := x2IniImage;
  XIniImages[2] := x3IniImage;
  XIniImages[3] := x4IniImage;
  for i:=0 to 3 do
    XIniImages[i].Left := 268;
  //Initialize IniConditionPanels
  IniConditionPanels[0] := IniPanel1;
  IniConditionPanels[1] := IniPanel2;
  IniConditionPanels[2] := IniPanel3;
  IniConditionPanels[3] := IniPanel4;
end;

destructor TPoincareSectionCalculationSetupFrame.Destroy;
begin
  UVarParser.Free;
  SS.Free;
  inherited;
end;

procedure TPoincareSectionCalculationSetupFrame.CalculationOptionsHeaderClick(
  Sender: TObject);
begin
  MainForm.SideMenu.CloseMenu;
  SS.PopupSection(3);
  ResetScrollBar;
end;

procedure TPoincareSectionCalculationSetupFrame.OtherOptionsHeaderClick(
  Sender: TObject);
begin
  MainForm.SideMenu.CloseMenu;
  SS.PopupSection(4);
  ResetScrollBar;
end;

procedure TPoincareSectionCalculationSetupFrame.EquationSettingsHeaderClick(
  Sender: TObject);
begin
  MainForm.SideMenu.CloseMenu;
  SS.PopupSection(1);
  ResetScrollBar;
end;

procedure TPoincareSectionCalculationSetupFrame.InitialConditionsHeaderClick(
  Sender: TObject);
begin
  MainForm.SideMenu.CloseMenu;
  SS.PopupSection(2);
  ResetScrollBar;
end;

procedure TPoincareSectionCalculationSetupFrame.UVarFormulaCheckBoxClick(
  Sender: TObject);
begin
  if CheckingCheckBoxGroup then
    Exit;
  CheckingCheckBoxGroup := True;
  UVarFormulaCheckBox.Checked := False;
  UVarNumericalCheckBox.Checked := False;
  (Sender as TsCheckBox).Checked := True;
  UVarFormulaEdit.Enabled := UVarFormulaCheckBox.Checked;
  UVarExternalEquationEditor.Enabled := UVarFormulaCheckBox.Checked;
  UVarExternalEquationEditor.ShowHint := UVarFormulaCheckBox.Checked;
  CheckingCheckBoxGroup := False;
end;

procedure TPoincareSectionCalculationSetupFrame.LogFileCheckBoxClick(
  Sender: TObject);
begin
  LogFileLabel.Enabled := LogFileCheckBox.Checked;
  LogFileEdit.Enabled := LogFileCheckBox.Checked;
  LogFileOpenBtn.Enabled := LogFileCheckBox.Checked;
end;

procedure TPoincareSectionCalculationSetupFrame.SaveToDiskCheckBoxClick(
  Sender: TObject);
begin
  with SaveToDiskCheckBox do
  begin
    SaveToDiskMinutesSpin.Enabled := Checked;
    OutputFileLabel.Enabled := Checked;
    OutputFileEdit.Enabled := Checked;
    OutputFileOpenBtn.Enabled := Checked;
    OutputFileOpenBtn.Enabled := Checked;
    TurnOffCheckBox.Enabled := Checked;
  end;
end;

procedure TPoincareSectionCalculationSetupFrame.LogFileOpenBtnClick(
  Sender: TObject);
var
  S: String;
begin
  SaveDialog1.Title := 'Select Log File';
  SaveDialog1.Filter := '*.txt|*.txt|All Files(*.*)|*.*';
  if SaveDialog1.Execute then
  begin
    S := SaveDialog1.FileName;
    if (Length(ExtractFileExt(S))=0) and (SaveDialog1.FilterIndex=1) then
      S := S + '.txt';
    LogFileEdit.Text := S;
  end;
end;

procedure TPoincareSectionCalculationSetupFrame.OutputFileOpenBtnClick(
  Sender: TObject);
var
  S: String;
begin
  SaveDialog1.Title := 'Select Output File';
  SaveDialog1.Filter := '*.dat|*.dat|*.txt|*.txt|All Files(*.*)|*.*';
  if SaveDialog1.Execute then
  begin
    S := SaveDialog1.FileName;
    if Length(ExtractFileExt(S))=0 then
    begin
      if SaveDialog1.FilterIndex = 1 then
        S := S + '.dat'
      else if SaveDialog1.FilterIndex = 2 then
        S := S + '.txt';
    end;
    OutputFileEdit.Text := S;
  end;
end;

procedure TPoincareSectionCalculationSetupFrame.sScrollBar1Change(
  Sender: TObject);
begin
  if sScrollBar1.Width = 0 then  //If the scrollbar is invisible, take no action.
  begin
    sScrollBar1.Position := 1;
    Exit;
  end;
  MainPanel.ScrollBy(0,sScrollBar1.Tag - sScrollBar1.Position);
  sScrollBar1.Tag := sScrollBar1.Position;
  if sScrollBar1.Position = 1 then
     MainPanel.ScrollBy(0,-EquationSettingsHeader.Top+4);
  ResetScrollBar;
  MainPanel.Repaint;
end;

procedure TPoincareSectionCalculationSetupFrame.MainPanelResize(
  Sender: TObject);
begin
  ResetScrollBar;
end;

procedure TPoincareSectionCalculationSetupFrame.ResetScrollBar;
var
  ScrollActive: Boolean;
  ScrollHeightUp, ScrollHeightDown: Integer;
begin
  ScrollHeightUp := -EquationSettingsHeader.Top + 4;
  if ScrollHeightUp < 0 then
    ScrollHeightUp := 0;
  ScrollHeightDown := OtherOptionsBody.Top + OtherOptionsBody.Height + 6 - MainPanel.Height;
  if ScrollHeightDown < 0 then
    ScrollHeightDown := 0;
  ScrollActive := (ScrollHeightUp > 0) or (ScrollHeightDown > 0);
  if ScrollActive then
  begin
    sScrollBar1.Width := 17;  //Show the scrollbar
    sScrollBar1.OnChange := nil;
    sScrollBar1.Max := ScrollHeightUp + ScrollHeightDown;
    sScrollBar1.Position := ScrollHeightUp;
    sScrollBar1.Tag := sScrollBar1.Position;
    sScrollBar1.OnChange := sScrollBar1Change;
  end
  else
    sScrollBar1.Width := 0;  //Hide the scrollbar
  MainPanel.Repaint;
end;

procedure TPoincareSectionCalculationSetupFrame.UVarFormulaEditChange(
  Sender: TObject);
begin
  ParserError := False;
  UVarParser.Expression := UVarFormulaEdit.Text;
  if ParserError then
    //Indicate error; do nothing in this version
  else
    //Indicate no error; do nothing in this version
end;

procedure TPoincareSectionCalculationSetupFrame.UVarComboBoxChange(
  Sender: TObject);
var
  i: Integer;
  C: TWinControl;
begin
  if UVarComboBox.ItemIndex = SurfaceComboBox.ItemIndex then
  begin
    sMMMessageDlg('The unknown variable cannot be the same as the surface variable.',mtError,[mbOK],0);
    UVarComboBox.ItemIndex := UVarComboBox.Tag;
  end
  else
  begin
    UVarComboBox.Tag := UVarComboBox.ItemIndex;
    for i:=0 to 3 do
      UVarImages[i].Hide;
    UVarImages[UVarComboBox.ItemIndex].Show;
    C := X3Label.Parent;
    X3Label.Parent := IniConditionPanels[UVarComboBox.ItemIndex];
    if x2IniEdit.Parent = X3Label.Parent then
      x2IniEdit.Parent := C
    else if x4IniEdit.Parent = X3Label.Parent then
      x4IniEdit.Parent := C;
    RearrangeIniEdits;  
    ResetIniImages;
  end;
end;

procedure TPoincareSectionCalculationSetupFrame.SurfaceComboBoxChange(
  Sender: TObject);
var
  C: TWinControl;
begin
  if UVarComboBox.ItemIndex = SurfaceComboBox.ItemIndex then
  begin
    sMMMessageDlg('The unknown variable cannot be the same as the surface variable.',mtError,[mbOK],0);
    SurfaceComboBox.ItemIndex := SurfaceComboBox.Tag;
  end
  else
  begin
    SurfaceComboBox.Tag := SurfaceComboBox.ItemIndex;
    C := X1Label.Parent;
    X1Label.Parent := IniConditionPanels[SurfaceComboBox.ItemIndex];
    if x2IniEdit.Parent = X1Label.Parent then
      x2IniEdit.Parent := C
    else if x4IniEdit.Parent = X1Label.Parent then
      x4IniEdit.Parent := C;
    RearrangeIniEdits;
    ResetIniImages;
  end;
end;

procedure TPoincareSectionCalculationSetupFrame.YComboBoxChange(
  Sender: TObject);
var
  i: Integer;
begin
  for i:=0 to 3 do
    YDotImages[i].Hide;
  YDotImages[YComboBox.ItemIndex].Show;
end;

procedure TPoincareSectionCalculationSetupFrame.ResetIniImages;
var
  i: Integer;
begin
  for i:=0 to 3 do
    XIniImages[i].Hide;
  XIniImages[GetX2VarNo - 1].Top := 29;
  XIniImages[GetX4VarNo - 1].Top := 67;
  XIniImages[GetX2VarNo - 1].Show;
  XIniImages[GetX4VarNo - 1].Show;
end;

function TPoincareSectionCalculationSetupFrame.GetX2VarNo: Integer;
var
  i: Integer;
begin
  for i:=0 to 3 do
    if x2IniEdit.Parent = IniConditionPanels[i] then
    begin
      Result := i + 1;
      Exit;
    end;
end;

function TPoincareSectionCalculationSetupFrame.GetX4VarNo: Integer;
var
  i: Integer;
begin
  for i:=0 to 3 do
    if x4IniEdit.Parent = IniConditionPanels[i] then
    begin
      Result := i + 1;
      Exit;
    end;
end;

function TPoincareSectionCalculationSetupFrame.GetYVarNo: Integer;
begin
  Result := YComboBox.ItemIndex + 1;
end;

procedure TPoincareSectionCalculationSetupFrame.UVarFormulaEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if (Key = ' ') or (Ord(Key) = VK_RETURN) or
     (Ord(Key) = VK_ESCAPE) then
    Key := Chr(0);
end;

procedure TPoincareSectionCalculationSetupFrame.DisableEditing;
begin
  SetEditMode(False);
end;

procedure TPoincareSectionCalculationSetupFrame.EnableEditing;
begin
  SetEditMode(True);
end;

procedure TPoincareSectionCalculationSetupFrame.SetEditMode(
  EditMode: Boolean);
begin
  EquationSettingsBody.Enabled := EditMode;
  InitialConditionsBody.Enabled := EditMode;
  CalculationOptionsBody.Enabled := EditMode;
  OtherOptionsBody.Enabled := EditMode;
end;

procedure TPoincareSectionCalculationSetupFrame.MouseWheel(
  var msg: TWMMouseWheel);
begin
  if sScrollBar1.Width = 0 then  //(sScrollBar1.Width = 0) means that the scrollbar is hidden
    Exit;
  if Msg.WheelDelta < 0 then
  begin
    if (sScrollBar1.Position - Trunc(Msg.WheelDelta/30)) <= sScrollBar1.Max then
      sScrollBar1.Position := sScrollBar1.Position - Trunc(Msg.WheelDelta/30)
    else
      sScrollBar1.Position := sScrollBar1.Max;
  end
  else if Msg.WheelDelta > 0 then
  begin
    if (sScrollBar1.Position + Trunc(Msg.WheelDelta/30)) >= sScrollBar1.Min then
      sScrollBar1.Position := sScrollBar1.Position - Trunc(Msg.WheelDelta/30)
    else
      sScrollBar1.Position := sScrollBar1.Min;
  end;      
end;

procedure TPoincareSectionCalculationSetupFrame.RearrangeIniEdits;
var
  C: TWinControl;
begin
  if (SurfaceComboBox.ItemIndex <> 3) and
     (UVarComboBox.ItemIndex <> 3) and
     (x4IniEdit.Parent <> IniConditionPanels[3]) then
  begin
    C := x4IniEdit.Parent;
    x4IniEdit.Parent := IniConditionPanels[3];
    X2IniEdit.Parent := C;
    Exit;
  end;
  if (SurfaceComboBox.ItemIndex <> 1) and
     (UVarComboBox.ItemIndex <> 1) and
     (x2IniEdit.Parent <> IniConditionPanels[1]) then
  begin
    C := x2IniEdit.Parent;
    x2IniEdit.Parent := IniConditionPanels[1];
    X4IniEdit.Parent := C;
  end;
end;

end.
