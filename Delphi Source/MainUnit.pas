unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sSkinProvider, sSkinManager, StdCtrls, sLabel, ExtCtrls, sPanel,
  ComCtrls, Buttons, SideMenu, PoincareFrame,
  PoincareCalculationFrame, PoincareGraphOptionsFrame, ImgList, MathImge,
  FontDialog, IntroductionFrame, AboutFrame, sMMDialogs, sBitBtn, AppEvnts,
  LinearizationCalculationFrameUnit, Menus, sEdit, sEquationEditor,
  Parser10, DiffExpress, sMMEdit, shellAPI, HelpFrame;

type
  TSampleEquation = record
    DisplayName: String;
    HExpression: String;
    UVarExpression: String;
    X1VarNo, X2VarNo, X3VarNo, X4VarNo: Integer;
    DefaultYVarNo: Integer;
    RK78Steps, MainSteps: Integer;
    IniValue1, IniValue2, IniValueH: Extended;
    DefaultIniValue1 {for x2}, DefaultIniValue2 {for x4}: Extended;
    UseDefaultIniValue1, UseDefaultIniValue2: Boolean;
    x2IniEditPos, x4IniEditPos: Integer;
  end;

const
  WM_TRAYICON = WM_USER + 1;
  MainAboutStr = #241#93#57#109#117#49#69#57#26#130#209#74#130#213#97#109#93#121#125#57#53#97#109#85#125#73#130#98#205#74#181#117#74#94#206#193#57#69#101#57#125#77#77#109#57#26#130#205#74#130#205#109#97#113#93#65#69#45#57#130#78#130#205#69#74#205#109#97#113#93#65#69#45#57#1#101#77#125#93#81#74#117#69#77#206#1#153#125#73#89#125#73#130#173#73#93#41#109#57#53#93#49#29;
  crZoomInCursor = 1;
  crPanUpCursor = 2;
  crPanDownCursor = 3;
  SAMPLE_EQUATIONS_COUNT = 1;
  SampleEquations:array[1..SAMPLE_EQUATIONS_COUNT] of TSampleEquation = (
      {First sample equation: Henon-Heiles Hamiltonian System}
      (
       DisplayName: '1)  Henon-Heiles Hamiltonian System';
       HExpression: '(x1^2+x2^2+x3^2+x4^2)/2+x1^2*x2-x2^3/3';
       UVarExpression: 'sqrt(2*h-x4^2-x2^2+(2*x2^3)/3)';
       X1VarNo: 1; X2VarNo: 2; X3VarNo: 3; X4VarNo: 4;
       DefaultYVarNo: 2;
       RK78Steps: 900000; MainSteps: 80;
       IniValue1: -0.3; IniValue2: -0.2; IniValueH: 0.1;
       DefaultIniValue1: 0.003; DefaultIniValue2: 0.003;
       UseDefaultIniValue1: True; UseDefaultIniValue2: True;
       x2IniEditPos: 1; x4IniEditPos: 3
      )
    );

type
  TMainForm = class(TForm)
    sSkinManager1: TsSkinManager;
    sSkinProvider1: TsSkinProvider;
    MainHeaderPanel: TsPanel;
    SidePanel: TsPanel;
    PopupFormGlyphs: TImageList;
    IntroductionFrame1: TIntroductionFrame;
    PoincareSectionCalculationSetupFrame1: TPoincareSectionCalculationSetupFrame;
    PoincareSectionCalculationFrame1: TPoincareSectionCalculationFrame;
    AboutFrame1: TAboutFrame;
    StatusBarPanel: TsPanel;
    IntroductionSideBtn: TsBitBtn;
    PoincareSideBtn: TsBitBtn;
    AboutSideBtn: TsBitBtn;
    ApplicationEvents1: TApplicationEvents;
    SideBtnSeparator1: TsPanel;
    GreenBtn: TSpeedButton;
    GoldenBtn: TSpeedButton;
    PopupMenu1: TPopupMenu;
    ViewIncompletePage1: TMenuItem;
    PointPanel: TsPanel;
    sLabel1: TsLabel;
    Image1: TImage;
    SampleEquationsBtn: TsBitBtn;
    SampleEquationsPopupMenu: TPopupMenu;
    N1: TMenuItem;
    HEquationEdit: TsMMEdit;
    TrayPopupMenu: TPopupMenu;
    Open1: TMenuItem;
    StopCalculation1: TMenuItem;
    N2: TMenuItem;
    MenusItemsImageList: TImageList;
    HelpFrame1: THelpFrame;
    HelpSideBtn: TsBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure PoincareSectionCalculationFrame1GraphOptionsBtnClick(
      Sender: TObject);
    procedure IntroductionSideBtnClick(Sender: TObject);
    procedure PoincareSideBtnClick(Sender: TObject);
    procedure PoincareSectionCalculationSetupFrame1ViewPoincareBtnClick(
      Sender: TObject);
    procedure PoincareSectionCalculationFrame1sBitBtn2Click(
      Sender: TObject);
    procedure PoincareSectionCalculationFrame1BackToSetupBtnClick(
      Sender: TObject);
    procedure PoincareSectionCalculationSetupFrame1StartPoincareBtnClick(
      Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure AboutSideBtnClick(Sender: TObject);
    procedure IntroductionSideBtnMouseEnter(Sender: TObject);
    procedure IntroductionSideBtnMouseLeave(Sender: TObject);
    procedure PoincareSideBtnMouseEnter(Sender: TObject);
    procedure PoincareSideBtnMouseLeave(Sender: TObject);
    procedure AboutSideBtnMouseEnter(Sender: TObject);
    procedure PoincareSectionCalculationSetupFrame1ViewPoincareBtnMouseEnter(
      Sender: TObject);
    procedure PoincareSectionCalculationSetupFrame1ViewPoincareBtnMouseLeave(
      Sender: TObject);
    procedure PoincareSectionCalculationSetupFrame1StartPoincareBtnMouseEnter(
      Sender: TObject);
    procedure PoincareSectionCalculationSetupFrame1StartPoincareBtnMouseLeave(
      Sender: TObject);
    procedure PoincareSectionCalculationSetupFrame1DefaultValuesBtn1MouseEnter(
      Sender: TObject);
    procedure PoincareSectionCalculationSetupFrame1DefaultValuesBtn1MouseLeave(
      Sender: TObject);
    procedure PoincareSectionCalculationSetupFrame1DefaultValuesBtn1MouseDown(
      Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure PoincareSectionCalculationFrame1GraphOptionsBtnMouseEnter(
      Sender: TObject);
    procedure PoincareSectionCalculationFrame1GraphOptionsBtnMouseDown(
      Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure PoincareSectionCalculationFrame1ZoomBtnMouseEnter(
      Sender: TObject);
    procedure PoincareSectionCalculationFrame1ZoomBtnMouseLeave(
      Sender: TObject);
    procedure PoincareSectionCalculationFrame1FitBtnMouseEnter(
      Sender: TObject);
    procedure PoincareSectionCalculationFrame1FitBtnMouseLeave(
      Sender: TObject);
    procedure PoincareSectionCalculationFrame1ZoomOutBtnMouseEnter(
      Sender: TObject);
    procedure PoincareSectionCalculationFrame1ZoomOutBtnMouseLeave(
      Sender: TObject);
    procedure PoincareSectionCalculationFrame1PanBtnMouseLeave(
      Sender: TObject);
    procedure PoincareSectionCalculationFrame1PanBtnMouseEnter(
      Sender: TObject);
    procedure PoincareSectionCalculationFrame1SaveFileBtnMouseEnter(
      Sender: TObject);
    procedure PoincareSectionCalculationFrame1SaveFileBtnMouseLeave(
      Sender: TObject);
    procedure PoincareSectionCalculationFrame1CopyBtnMouseEnter(
      Sender: TObject);
    procedure PoincareSectionCalculationFrame1CopyBtnMouseLeave(
      Sender: TObject);
    procedure PoincareSectionCalculationFrame1sBitBtn1MouseEnter(
      Sender: TObject);
    procedure PoincareSectionCalculationFrame1sBitBtn1MouseLeave(
      Sender: TObject);
    procedure PoincareSectionCalculationFrame1BackToSetupBtnMouseEnter(
      Sender: TObject);
    procedure PoincareSectionCalculationFrame1BackToSetupBtnMouseLeave(
      Sender: TObject);
    procedure PoincareGraphOptionsFrame1ApplyBtn2MouseEnter(
      Sender: TObject);
    procedure PoincareGraphOptionsFrame1ApplyBtn2MouseLeave(
      Sender: TObject);
    procedure PoincareGraphOptionsFrame1BKColorSelectorMouseEnter(
      Sender: TObject);
    procedure PoincareGraphOptionsFrame1BKColorSelectorMouseLeave(
      Sender: TObject);
    procedure PoincareGraphOptionsFrame1PointsColorSelectorMouseEnter(
      Sender: TObject);
    procedure PoincareGraphOptionsFrame1PointsColorSelectorMouseLeave(
      Sender: TObject);
    procedure PoincareGraphOptionsFrame1FrameColorSelectorMouseEnter(
      Sender: TObject);
    procedure PoincareGraphOptionsFrame1FrameColorSelectorMouseLeave(
      Sender: TObject);
    procedure PoincareGraphOptionsFrame1AxesColorSelectorMouseEnter(
      Sender: TObject);
    procedure PoincareGraphOptionsFrame1AxesColorSelectorMouseLeave(
      Sender: TObject);
    procedure PoincareGraphOptionsFrame1LabelsColorSelectorMouseEnter(
      Sender: TObject);
    procedure PoincareGraphOptionsFrame1LabelsColorSelectorMouseLeave(
      Sender: TObject);
    procedure PoincareGraphOptionsFrame1sBitBtn1MouseEnter(
      Sender: TObject);
    procedure ApplicationEvents1Activate(Sender: TObject);
    procedure PoincareSectionCalculationFrame1LoadPointsBtnMouseEnter(
      Sender: TObject);
    procedure PoincareSectionCalculationFrame1LoadPointsBtnMouseLeave(
      Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure LinearizationSideBtnClick(Sender: TObject);
    procedure GreenBtnClick(Sender: TObject);
    procedure GoldenBtnClick(Sender: TObject);
    procedure LinearizationSideBtnMouseEnter(Sender: TObject);
    procedure LinearizationSideBtnMouseLeave(Sender: TObject);
    procedure ApplicationEvents1ShowHint(var HintStr: String;
      var CanShow: Boolean; var HintInfo: THintInfo);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AboutSideBtnMouseLeave(Sender: TObject);
    procedure HEquationEditChange(Sender: TObject);
    procedure N1AdvancedDrawItem(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; State: TOwnerDrawState);
    procedure SampleEquationsBtnClick(Sender: TObject);
    procedure HEquationEditMouseEnter(Sender: TObject);
    procedure HEquationEditMouseLeave(Sender: TObject);
    procedure HEquationEditKeyPress(Sender: TObject; var Key: Char);
    procedure SampleEquationsBtnMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SampleEquationsBtnMouseEnter(Sender: TObject);
    procedure SampleEquationsBtnMouseLeave(Sender: TObject);
    procedure ApplicationEvents1Minimize(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure StopCalculation1Click(Sender: TObject);
    procedure HelpSideBtnMouseEnter(Sender: TObject);
    procedure HelpSideBtnMouseLeave(Sender: TObject);
    procedure HelpSideBtnClick(Sender: TObject);
    procedure SidePanelMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SidePanelClick(Sender: TObject);
    procedure ApplicationEvents1Restore(Sender: TObject);
  private
    { Private declarations }
    MainHHP,MainHP:Integer;
    EquationEditor1, UVarEquationEditor: TsEquationEditor;
    ParserError: Boolean;
    ParserErrorMessage: String;
    SampleEquationsMenuItems: array[1..SAMPLE_EQUATIONS_COUNT] of TMenuItem;
    MainAboutStringLocation: Integer;
    procedure SampleEquationMenuItemClick(Sender: TObject);
    procedure SelectSideBtn(SideBtn:TsBitBtn);
    procedure ParserErrorEvent(Sender: TObject; E: Exception);
    procedure EquationEditor1MouseEnter(Sender: TObject);
    procedure EquationEditor1MouseLeave(Sender: TObject);
    procedure EquationEditor1MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SetEditMode(EditMode: Boolean);
    function GetMainAboutString(Dummy1, Dummy2, Dummy3: Integer): String;
    procedure ShowTrayIcon;
    procedure HideTrayIcon;
    procedure TrayIconEvent(var Msg: TMessage); message WM_TRAYICON;
  public
    { Public declarations }
    SideMenu:TSideMenu;
    LastPoint:Integer;
    CanExit:Boolean;  //False=Exit True=Ask to save calculation results before exiting
    sPanels:record
              Panels:array of TsPanel;
              Count:Integer;
            end;
    PointsValidation:array[1..5] of Boolean;  //1=T,2=X,3=XDot,4=Y,5=YDot
    MinimizeToTrayActive: Boolean;
    ExePath: String;
    procedure PopupFormOnShow(Sender: TObject);
    procedure HidePopupForm(Sender: TObject);
    function GetGraphPoint(Index:Integer):TExtendedPoint;
    function GetPointsHighBound:Integer;
    procedure DrawPoints(AMathImage:TMathImage);
    procedure InitializeParser(Parser: Parser10.TParser);
    function CheckHEquationSyntax(var HEquation: String; var ErrorMsg: String): Boolean;
    function ExistsAllVariables(const Expression: String): Integer;
    procedure GetNextToken(var StartPos: Integer; const Expression: String; var Token: String);
    function TokenExits(StartPos: Integer; const Expression, Token: String): Boolean;
    function CheckSampleEquation(const AHExpression, AUVarExpresion: String;
      AUseUVarExpression: Boolean;
      AX1VarNo, AX2VarNo, AX3VarNo, AX4VarNo: Integer): Integer;
    procedure EnableEditing;
    procedure DisableEditing;
    procedure MinimizeTotray;
    procedure RestoreFromTray;  
    procedure OnCalculationFinished;
    procedure OnCalculationProgress(AMinValue, AMaxValue,
      AProgress, NumofPoints: Integer);
    function OnlyOneProgramInstance: Boolean;  
  end;

var
  MainForm: TMainForm;
  PoincarePoints:TPoincarePointsArray;
  XXDotPoints:TXXDotPoints;
  VariableBitmaps: array[1..4] of TBitmap;

implementation

uses StrUtils, Math, PopupFormUnit;

{$R *.dfm}

{$R ImageResources.res}

procedure TMainForm.FormCreate(Sender: TObject);
var
//  tempf:TextFile;  //Used for debugging
//  xv,yv:Extended;  //Used for debugging
  i:Integer;
begin
  ExePath := ExtractFilePath(Application.ExeName);
  MainAboutStringLocation := 0;
  MinimizeToTrayActive := False;
  {Create smaple equations menu items}
  for i:= 1 to SAMPLE_EQUATIONS_COUNT do
  begin
    SampleEquationsMenuItems[i] := TMenuItem.Create(nil);
    SampleEquationsMenuItems[i].Caption := SampleEquations[i].DisplayName;
    SampleEquationsMenuItems[i].OnClick := SampleEquationMenuItemClick;
    SampleEquationsMenuItems[i].Tag := i;
    SampleEquationsPopupMenu.Items.Add(SampleEquationsMenuItems[i]);
  end;
  {Load VariableBitmaps , Bitmap images of hamiltonian equation variables}
  for i:=1 to 4 do
  begin
    VariableBitmaps[i] := TBitmap.Create;
//    VariableBitmaps[i].LoadFromResourceName(HInstance,'');
  end;
  {Initialize EquationEditor1}
  EquationEditor1:=TsEquationEditor.Create(Self);
  EquationEditor1.SetBounds(710,24,42,23);
  EquationEditor1.EquationEditBox:=HEquationEdit;
  EquationEditor1.Glyph.LoadFromResourceName(HInstance,'EQUATION_EDITOR');
  EquationEditor1.Hint:='Equation Editor';
  EquationEditor1.ShowHint:=True;
  EquationEditor1.ShowFocus:=False;
  EquationEditor1.KeyPad.hButton := False;
  EquationEditor1.OnMouseEnter := EquationEditor1MouseEnter;
  EquationEditor1.OnMouseDown := EquationEditor1MouseDown;
  EquationEditor1.OnMouseLeave := EquationEditor1MouseLeave;
  EquationEditor1.Parent:=MainHeaderPanel;
  Tag := 1;  //Indicate that the component is accessible in the OnResize procedure
  {Initialize UVarEquationEditor}
  UVarEquationEditor:=TsEquationEditor.Create(Self);
  UVarEquationEditor.SetBounds(571,57,43,23);
  UVarEquationEditor.EquationEditBox:=PoincareSectionCalculationSetupFrame1.UVarFormulaEdit;
  UVarEquationEditor.Enabled := PoincareSectionCalculationSetupFrame1.UVarFormulaEdit.Enabled;
  UVarEquationEditor.Glyph.LoadFromResourceName(HInstance,'EQUATION_EDITOR');
  UVarEquationEditor.Hint:='Equation Editor';
  UVarEquationEditor.ShowHint:=True;
  UVarEquationEditor.ShowFocus:=False;
  UVarEquationEditor.KeyPad.hButton := True;
  UVarEquationEditor.Parent:=PoincareSectionCalculationSetupFrame1.UVarPanel;
  PoincareSectionCalculationSetupFrame1.UVarExternalEquationEditor := UVarEquationEditor;
  {Initialize PopupForm}
  PopupForm:=TPopupForm.Create(Application);
  PopupForm.AutoSize:=False;
  PopupForm.BorderStyle:=bsNone;
  PopupForm.Hide;
  PopupForm.OnDeactivate:=HidePopupForm;
  PopupForm.OnShow:=PopupFormOnShow;
  PopupFormGlyphs.GetBitmap(0,PoincareSectionCalculationFrame1.GraphOptionsBtn.Glyph);

  IntroductionSideBtn.Click;
  SidePanel.BringToFront;
  CanExit:=True;
  {Add sPanels to be repaint in application OnActivate event}
  sPanels.Count:=2;
  SetLength(sPanels.Panels,sPanels.Count);
  sPanels.Panels[0]:=IntroductionFrame1.sPanel1;
  sPanels.Panels[1]:=PoincareSectionCalculationSetupFrame1.MainPanel;
  {Initialize SideMenu}
  SideMenu:=TSideMenu.Create(Self);
  SideMenu.SideControl:=SidePanel;
  SideMenu.ClosingTime:=4;
  SideMenu.OpenedWidth:=115;
  SideMenu.ClosedWidth:=13;
  SideMenu.AnimatedOpen:=False;
  SideMenu.AnimatedClose:=True;
  SideMenu.MenuSensitivity:=80;
  SideMenu.Active:=True;
  {Initialize PointsValidation array}
  for i:=1 to 5 do
    PointsValidation[i]:=False;
  {Load cursor resources}
  Screen.Cursors[crZoomInCursor]:=LoadCursor(HInstance,'ZOOM_IN_CURSOR');
  Screen.Cursors[crPanUpCursor] := LoadCursor(HInstance,'PAN_DOWN_CURSOR');
  Screen.Cursors[crPanDownCursor] := LoadCursor(HInstance,'PAN_UP_CURSOR');
  {Preserve main values of HHP and HP properties of the application}
  MainHHP:=Application.HintHidePause;
  MainHP:=Application.HintPause;
  {Read Poincare Points from a file(for Testing)}
//  AssignFile(tempf,MainForm.ExePath + 'xxdot.dat');
//  reset(tempf);
  SetLength(PoincarePoints,0);
  SetLength(XXDotPoints,0);
//  while(not(eof(tempf))) do
//  begin
//    SetLength(PoincarePoints,High(PoincarePoints)+2);
//    readln(tempf,xv,yv);
//    PoincarePoints[High(PoincarePoints)].X:=xv;
//    PoincarePoints[High(PoincarePoints)].Y:=yv;
//  end;
//  CloseFile(tempf);
  {Initialize PoincareSectionCalculationFrame}
  PoincareSectionCalculationFrame1.OnDrawPoints:=DrawPoints;
  PoincareSectionCalculationFrame1.RefreshMathImage;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
var
  i: Integer;
begin
  {Destroy smaple equations menu items}
  for i:= 1 to SAMPLE_EQUATIONS_COUNT do
    SampleEquationsMenuItems[i].Free;
  {Destroy Equationeditor1}
  EquationEditor1.Free;
  {Destroy UVarEquationEditor}
  UVarEquationEditor.Free;
  {Destroy SideMenu}
  SideMenu.Active:=False;
  SideMenu.Free;
  {Destroy PopupForm}
  PopupForm.Hide;
  {PoincarePoints Array}
  SetLength(PoincarePoints,0);
  {XXDotPoints Array}
  SetLength(XXDotPoints,0);
  {sPanels.Panels}
  sPanels.Count:=0;
  SetLength(sPanels.Panels,0);
  {Free VariableBitmaps , Bitmap images of hamiltonian equation variables}
  for i:=1 to 4 do
    VariableBitmaps[i].Free;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  SidePanel.Height:=MainForm.Height-108;
  HelpSideBtn.Top := SidePanel.Height - 182;
  AboutSideBtn.Top:=SidePanel.Height-100;
  SideBtnSeparator1.Top:=SidePanel.Height-26;
  GreenBtn.Top:=SidePanel.Height-22;
  GoldenBtn.Top:=GreenBtn.Top;
  HEquationEdit.Width := MainHeaderPanel.Width - 201;
  if Tag > 0 then  //Check if the component is ready to use; this flag is set in the OnCreate procedure
    EquationEditor1.Left := MainHeaderPanel.Width - 75;
  SampleEquationsBtn.Left := MainHeaderPanel.Width - 33;
//  PoincareSectionCalculationFrame1.ResizeMathImage;
  PoincareSectionCalculationFrame1.SetWorld:=False;
  PoincareSectionCalculationFrame1.RefreshMathImage;
  PoincareSectionCalculationFrame1.SetWorld:=True;
  PointPanel.Left:=StatusBarPanel.Width-242;
end;

procedure TMainForm.HidePopupForm(Sender: TObject);
begin
  PopupFormGlyphs.GetBitmap(0,PoincareSectionCalculationFrame1.GraphOptionsBtn.Glyph);
  PopupForm.Hide;
  PoincareSectionCalculationFrame1.PoincareGraphOptionsFrame1.UpdateFields;
end;

procedure TMainForm.PopupFormOnShow(Sender: TObject);
begin
  if PoincareSectionCalculationFrame1.PoincareGraphOptionsFrame1.Visible then
  begin
    PopupFormGlyphs.GetBitmap(2,PoincareSectionCalculationFrame1.GraphOptionsBtn.Glyph);
    PoincareSectionCalculationFrame1.PoincareGraphOptionsFrame1.UpdateFields;
    PoincareSectionCalculationFrame1.GraphOptionsBtn.Refresh;
  end;
end;

procedure TMainForm.PoincareSectionCalculationFrame1GraphOptionsBtnClick(
  Sender: TObject);
var
  P:TPoint;
  i:Integer;
begin
  if PopupForm.Showing and PoincareSectionCalculationFrame1.PoincareGraphOptionsFrame1.Showing then Exit;
//  PopupForm.Hide;
  for i:=1 to PopupForm.ControlCount do
    PopupForm.Controls[i-1].Hide;
  PoincareSectionCalculationFrame1.PoincareGraphOptionsFrame1.Parent:=PopupForm;
  PoincareSectionCalculationFrame1.PoincareGraphOptionsFrame1.Show;
  PoincareSectionCalculationFrame1.PoincareGraphOptionsFrame1.Left:=0;
  PoincareSectionCalculationFrame1.PoincareGraphOptionsFrame1.Top:=0;
  P:=(Sender as TControl).Parent.ClientToScreen(Point(
     (Sender as TControl).Left,(Sender as TControl).Top+
     (Sender as TControl).Height));
  PopupForm.Left:=P.X;
  PopupForm.Top:=P.Y;
  PopupForm.Show;
end;

procedure TMainForm.DrawPoints(AMathImage:TMathImage);
var
  i:Integer;
  Point:TExtendedPoint;
  HighBound:Integer;
begin
  if LastPoint<0 then LastPoint:=0;
  HighBound:=GetPointsHighBound;
  with AMathImage do
  for i:=LastPoint to HighBound do
  begin
    Point:=GetGraphPoint(i);
    with Point do
      if (X<=D2Worldx2) and (X>=D2WorldX1) and
       (Y>=D2WorldY1) and (Y<=D2Worldy2) then
        DrawPoint(X,Y);
  end;
  LastPoint:=HighBound;
end;

procedure TMainForm.IntroductionSideBtnClick(Sender: TObject);
begin
  SelectSideBtn(IntroductionSideBtn);
  PoincareSectionCalculationFrame1.Hide;
  PoincareSectionCalculationSetupFrame1.Hide;
  HelpFrame1.Hide;
  AboutFrame1.Hide;
  IntroductionFrame1.Show;
  IntroductionFrame1.OnResize(IntroductionFrame1);
end;

procedure TMainForm.PoincareSideBtnClick(Sender: TObject);
begin
  if PoincareSideBtn.Down then Exit;
  SelectSideBtn(PoincareSideBtn);
  IntroductionFrame1.Hide;
  HelpFrame1.Hide;
  AboutFrame1.Hide;
  if PoincareSectionCalculationFrame1.Tag=1 then
  begin
    PoincareSectionCalculationFrame1.Show;
    PoincareSectionCalculationFrame1.OnResize(PoincareSectionCalculationFrame1);
    PointPanel.Show;
  end
  else
  begin
    PoincareSectionCalculationSetupFrame1.Show;
    PoincareSectionCalculationSetupFrame1.OnResize(PoincareSectionCalculationSetupFrame1);
  end;  
  MainForm.OnResize(Self);
end;

procedure TMainForm.PoincareSectionCalculationSetupFrame1ViewPoincareBtnClick(
  Sender: TObject);
begin
  SideMenu.CloseMenu;
  PoincareSectionCalculationSetupFrame1.Hide;
  PoincareSectionCalculationFrame1.Show;
  PoincareSectionCalculationFrame1.OnResize(PoincareSectionCalculationFrame1);
  PointPanel.Show;
  PoincareSectionCalculationFrame1.RefreshMathImage;
  PoincareSectionCalculationFrame1.Tag:=1;
  PoincareSectionCalculationSetupFrame1.Tag:=0;
  SideMenu.Active := True;
end;

procedure TMainForm.PoincareSectionCalculationFrame1sBitBtn2Click(
  Sender: TObject);
begin
  PoincareSectionCalculationFrame1.Hide;
  PoincareSectionCalculationSetupFrame1.Show;
end;

procedure TMainForm.PoincareSectionCalculationFrame1BackToSetupBtnClick(
  Sender: TObject);
begin
  PoincareSectionCalculationFrame1.Hide;
  PointPanel.Hide;
  PoincareSectionCalculationSetupFrame1.Show;
  PoincareSectionCalculationSetupFrame1.Tag:=1;
  PoincareSectionCalculationFrame1.Tag:=0;
  SideMenu.Active := True;
end;

procedure TMainForm.PoincareSectionCalculationSetupFrame1StartPoincareBtnClick(
  Sender: TObject);
resourcestring
  ErrMsgHeader = 'Invalid Hamiltonian System equation:' + Chr(13);
var
  HEquation, S: String;
  i: Integer;
begin
  SideMenu.CloseMenu;
  HEquation := HEquationEdit.Text;
  if Length(Trim(HEquation)) = 0 then
  begin
    sMMShowMessage('You must enter a hamiltonian system equation to start the calculation.');
    HEquationEdit.SelectAll;
    HEquationEdit.SetFocus;
    Exit;
  end;
  if not CheckHEquationSyntax(HEquation,S) then
  begin
    sMMMessageDlg(ErrMsgHeader + S,mtError,[mbOK],0);
    Exit;
  end;
  i:=1;
  if not TokenExits(i,HEquation,'x1') and
     not TokenExits(i,HEquation,'x2') and
     not TokenExits(i,HEquation,'x3') and
     not TokenExits(i,HEquation,'x4') then
  begin
    sMMMessageDlg('The specified hamiltonian system equation does not contain any of the four variables (x1,x2,x3,x4).',mtError,[mbOK],0);
    HEquationEdit.SelectAll;
    HEquationEdit.SetFocus;
    Exit;
  end;
  PoincareSectionCalculationSetupFrame1.StartPoincareBtnClick(Sender);
  i := ExistsAllVariables(HEquation);
  if i > 0 then
  begin
    {sMMMessageDlg(ErrMsgHeader + 'Missing variable in the equation : x' + IntToStr(i),mtError,[mbOK],0);
    Exit;}
    if sMMMessageDlg('The equation you have specified does not contain all the four ' +
        'variables (x1,x2,x3,x4).' + Chr(13) + 'Are you sure you want to start ' +
        'the calculation with this equation?',mtWarning,[mbYes,mbNo],0) = mrNo then
      Exit;
  end;
  if PoincareSectionCalculationSetupFrame1.ValidParameters and OnlyOneProgramInstance then
  begin
    PoincareSectionCalculationSetupFrame1.Hide;
    PoincareSectionCalculationFrame1.Show;
    PoincareSectionCalculationFrame1.OnResize(PoincareSectionCalculationFrame1);
    PointPanel.Show;
    PoincareSectionCalculationFrame1.Tag:=1;
    PoincareSectionCalculationSetupFrame1.Tag:=0;
//    sSkinProvider1.BorderIcons:=[biMinimize,biSystemMenu];
//    MainForm.BorderIcons:=[Forms.biMinimize,Forms.biSystemMenu];
    PoincareSectionCalculationSetupFrame1.StartPoincareBtn.Enabled:=False;
    MinimizeToTrayActive := PoincareSectionCalculationSetupFrame1.MinimizeToTtrayCheckBox.Checked;
    try
    with PoincareSectionCalculationSetupFrame1 do
    begin
      PoincareSectionCalculationFrame1.CalculatePoincarePoints(H,X2,X4,X2IniChangeValue,X4IniChangeValue,X2DefaultIni,X4DefaultIni,NumOfInitSteps,NumOfRK78Steps,not PoincareSectionCalculationSetupFrame1.ErrorMessagesCheck.Checked,SurfaceComboBox.ItemIndex+1,X2VarNo,UVarComboBox.ItemIndex+1,X4VarNo,YVarNo,HEquation,UVarFormula,UseUVarFormula,LogFileEdit.Text,LogFileCheckBox.Checked,OutputFileEdit.Text,SaveToDiskMinutesSpin.Value,SaveToDiskCheckBox.Checked,TurnOffCheckBox.Checked,BackgroundProcCheckBox.Checked);
    end;
    finally
      PoincareSectionCalculationSetupFrame1.StartPoincareBtn.Enabled:=True;
      PoincareSectionCalculationFrame1.RefreshMathImage;
//      sSkinProvider1.BorderIcons:=[biMaximize,biMinimize,biSystemMenu];
//      MainForm.BorderIcons:=[Forms.biMaximize,Forms.biMinimize,Forms.biSystemMenu];
    end;
  end;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  MsgStr: String;
begin
  CanClose:=True;
  if not CanExit then
  begin
    if PoincareSectionCalculationFrame1.CalculationMode then
    begin
      MsgStr := 'Calculation is in progress.' + Chr(13) + 'Are you sure you want to stop';
      if PoincareSectionCalculationSetupFrame1.SaveToDiskCheckBox.Checked then
        MsgStr := MsgStr + '?'
      else
        MsgStr := MsgStr + ' and exit without saving results?';
      if sMMMessageDlg(MsgStr,mtWarning,[mbYes,mbNo],0) = mrYes then
      begin
        PoincareSectionCalculationFrame1.PoincareStopCalcBtn.Click;
        Exit;
      end;  
      CanClose := False;
      Exit;
    end;
    if sMMMessageDlg('If you exit from the program, calculation results will be lost.'+Chr(13)
                   +'Are you sure you want to exit?',mtConfirmation,[mbYes,mbNo],0)=mrNo then
      CanClose:=False
    else
      PoincareSectionCalculationFrame1.PoincareStopCalcBtn.Click;
  end;
end;

procedure TMainForm.AboutSideBtnClick(Sender: TObject);
begin
  SelectSideBtn(AboutSideBtn);
  IntroductionFrame1.Hide;
  PoincareSectionCalculationSetupFrame1.Hide;
  PoincareSectionCalculationFrame1.Hide;
  AboutFrame1.Show;
  AboutFrame1.OnResize(AboutFrame1);
  AboutFrame1.AboutImage.Show;
  AboutFrame1.AboutImage.ShowHint := True;
end;

procedure TMainForm.SelectSideBtn(SideBtn: TsBitBtn);
begin
  IntroductionSideBtn.Down:=False;
  PoincareSideBtn.Down:=False;
  HelpSideBtn.Down := False;
  AboutSideBtn.Down:=False;
  SideBtn.Down:=True;
  PointPanel.Hide;
end;

procedure TMainForm.IntroductionSideBtnMouseEnter(Sender: TObject);
begin
  StatusBarPanel.Caption:='Clcik to see Introduction page';
end;

procedure TMainForm.IntroductionSideBtnMouseLeave(Sender: TObject);
begin
  StatusBarPanel.Caption:='';
end;

procedure TMainForm.PoincareSideBtnMouseEnter(Sender: TObject);
begin
  StatusBarPanel.Caption:='Click to see Poincare Section page';
end;

procedure TMainForm.PoincareSideBtnMouseLeave(Sender: TObject);
begin
  StatusBarPanel.Caption:='';
end;

procedure TMainForm.AboutSideBtnMouseEnter(Sender: TObject);
begin
  StatusBarPanel.Caption:='Click to see About page';
end;

procedure TMainForm.PoincareSectionCalculationSetupFrame1ViewPoincareBtnMouseEnter(
  Sender: TObject);
begin
  StatusBarPanel.Caption:='Click to see Poincare Section graph';
end;

procedure TMainForm.PoincareSectionCalculationSetupFrame1ViewPoincareBtnMouseLeave(
  Sender: TObject);
begin
  StatusBarPanel.Caption:='';
end;

procedure TMainForm.PoincareSectionCalculationSetupFrame1StartPoincareBtnMouseEnter(
  Sender: TObject);
begin
  if (Sender as TsBitBtn).Enabled=False then Exit;
  StatusBarPanel.Caption:='Click to start calculation based on the above settings';
end;

procedure TMainForm.PoincareSectionCalculationSetupFrame1StartPoincareBtnMouseLeave(
  Sender: TObject);
begin
  StatusBarPanel.Caption:='';
end;

procedure TMainForm.PoincareSectionCalculationSetupFrame1DefaultValuesBtn1MouseEnter(
  Sender: TObject);
begin
  StatusBarPanel.Caption:='Click to see a list of default initial conditions for x2, x4 and H';
end;

procedure TMainForm.PoincareSectionCalculationSetupFrame1DefaultValuesBtn1MouseLeave(
  Sender: TObject);
begin
  StatusBarPanel.Caption:='';
end;

procedure TMainForm.PoincareSectionCalculationSetupFrame1DefaultValuesBtn1MouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  StatusBarPanel.Caption:='';
end;

procedure TMainForm.PoincareSectionCalculationFrame1GraphOptionsBtnMouseEnter(
  Sender: TObject);
begin
  StatusBarPanel.Caption:='Click to see options for changing graph colors, graph title and axes bounds';
end;

procedure TMainForm.PoincareSectionCalculationFrame1GraphOptionsBtnMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  StatusBarPanel.Caption:='';
end;

procedure TMainForm.PoincareSectionCalculationFrame1ZoomBtnMouseEnter(
  Sender: TObject);
begin
  StatusBarPanel.Caption:='Zoom In Tool';
end;

procedure TMainForm.PoincareSectionCalculationFrame1ZoomBtnMouseLeave(
  Sender: TObject);
begin
  StatusBarPanel.Caption:='';
end;

procedure TMainForm.PoincareSectionCalculationFrame1FitBtnMouseEnter(
  Sender: TObject);
begin
  StatusBarPanel.Caption:='Click to automatically set the axes bounds to fit all points in the graph';  
end;

procedure TMainForm.PoincareSectionCalculationFrame1FitBtnMouseLeave(
  Sender: TObject);
begin
  StatusBarPanel.Caption:='';
end;

procedure TMainForm.PoincareSectionCalculationFrame1ZoomOutBtnMouseEnter(
  Sender: TObject);
begin
  StatusBarPanel.Caption:='Click to zoom out';
end;

procedure TMainForm.PoincareSectionCalculationFrame1ZoomOutBtnMouseLeave(
  Sender: TObject);
begin
  StatusBarPanel.Caption:='';
end;

procedure TMainForm.PoincareSectionCalculationFrame1PanBtnMouseLeave(
  Sender: TObject);
begin
  StatusBarPanel.Caption:='';
end;

procedure TMainForm.PoincareSectionCalculationFrame1PanBtnMouseEnter(
  Sender: TObject);
begin
  StatusBarPanel.Caption:='Pan Tool';
end;

procedure TMainForm.PoincareSectionCalculationFrame1SaveFileBtnMouseEnter(
  Sender: TObject);
begin
  StatusBarPanel.Caption:='Click to save a picture of graph';
end;

procedure TMainForm.PoincareSectionCalculationFrame1SaveFileBtnMouseLeave(
  Sender: TObject);
begin
  StatusBarPanel.Caption:='';
end;

procedure TMainForm.PoincareSectionCalculationFrame1CopyBtnMouseEnter(
  Sender: TObject);
begin
  StatusBarPanel.Caption:='Click to copy the graph to clipboard as a bitmap';
end;

procedure TMainForm.PoincareSectionCalculationFrame1CopyBtnMouseLeave(
  Sender: TObject);
begin
  StatusBarPanel.Caption:='';
end;

procedure TMainForm.PoincareSectionCalculationFrame1sBitBtn1MouseEnter(
  Sender: TObject);
begin
  StatusBarPanel.Caption:='Click to save the points to a text file';
end;

procedure TMainForm.PoincareSectionCalculationFrame1sBitBtn1MouseLeave(
  Sender: TObject);
begin
  StatusBarPanel.Caption:='';
end;

procedure TMainForm.PoincareSectionCalculationFrame1BackToSetupBtnMouseEnter(
  Sender: TObject);
begin
  StatusBarPanel.Caption:='Click to see calculation setup page';
end;

procedure TMainForm.PoincareSectionCalculationFrame1BackToSetupBtnMouseLeave(
  Sender: TObject);
begin
  StatusBarPanel.Caption:='';
end;

procedure TMainForm.PoincareGraphOptionsFrame1ApplyBtn2MouseEnter(
  Sender: TObject);
begin
  StatusBarPanel.Caption:='Click to apply these settings to graph';
end;

procedure TMainForm.PoincareGraphOptionsFrame1ApplyBtn2MouseLeave(
  Sender: TObject);
begin
  StatusBarPanel.Caption:='';
end;

procedure TMainForm.PoincareGraphOptionsFrame1BKColorSelectorMouseEnter(
  Sender: TObject);
begin
  StatusBarPanel.Caption:='Change graph background color';
end;

procedure TMainForm.PoincareGraphOptionsFrame1BKColorSelectorMouseLeave(
  Sender: TObject);
begin
  StatusBarPanel.Caption:='';
end;

procedure TMainForm.PoincareGraphOptionsFrame1PointsColorSelectorMouseEnter(
  Sender: TObject);
begin
  StatusBarPanel.Caption:='Change the color used to draw points on graph';
end;

procedure TMainForm.PoincareGraphOptionsFrame1PointsColorSelectorMouseLeave(
  Sender: TObject);
begin
  StatusBarPanel.Caption:='';
end;

procedure TMainForm.PoincareGraphOptionsFrame1FrameColorSelectorMouseEnter(
  Sender: TObject);
begin
  StatusBarPanel.Caption:='Change graph frame color';
end;

procedure TMainForm.PoincareGraphOptionsFrame1FrameColorSelectorMouseLeave(
  Sender: TObject);
begin
  StatusBarPanel.Caption:='';
end;

procedure TMainForm.PoincareGraphOptionsFrame1AxesColorSelectorMouseEnter(
  Sender: TObject);
begin
  StatusBarPanel.Caption:='Change the color of graph axes';
end;

procedure TMainForm.PoincareGraphOptionsFrame1AxesColorSelectorMouseLeave(
  Sender: TObject);
begin
  StatusBarPanel.Caption:='';
end;

procedure TMainForm.PoincareGraphOptionsFrame1LabelsColorSelectorMouseEnter(
  Sender: TObject);
begin
  StatusBarPanel.Caption:='Change the color of axes labels';
end;

procedure TMainForm.PoincareGraphOptionsFrame1LabelsColorSelectorMouseLeave(
  Sender: TObject);
begin
  StatusBarPanel.Caption:='';
end;

procedure TMainForm.PoincareGraphOptionsFrame1sBitBtn1MouseEnter(
  Sender: TObject);
begin
  StatusBarPanel.Caption:='Change font of the graph title';
end;

procedure TMainForm.ApplicationEvents1Activate(Sender: TObject);
var
  i:Integer;
begin
  {Repaint the panels in frames that need to be painted}
  for i:=1 to sPanels.Count do
    sPanels.Panels[i-1].Repaint;
end;

procedure TMainForm.PoincareSectionCalculationFrame1LoadPointsBtnMouseEnter(
  Sender: TObject);
begin
  StatusBarPanel.Caption:='Click to load points from a file';
end;

procedure TMainForm.PoincareSectionCalculationFrame1LoadPointsBtnMouseLeave(
  Sender: TObject);
begin
  StatusBarPanel.Caption:='';
end;

procedure TMainForm.FormDeactivate(Sender: TObject);
begin
  SideMenu.CloseMenu;
  SideMenu.Active:=False;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
//  Application.HintPause:=0;
  SideMenu.Active:=True;
  StatusBarPanel.Caption:='';
end;

function TMainForm.GetGraphPoint(Index: Integer):TExtendedPoint;
begin
  case PoincareSectionCalculationFrame1.HorizontalDataIndex of
    1: Result.X:=XXDotPoints[Index].T;
    2: Result.X:=XXDotPoints[Index].X;
    3: Result.X:=XXDotPoints[Index].XDot;
    4: Result.X:=PoincarePoints[Index].X;
    5: Result.X:=PoincarePoints[Index].Y;
  end;
  case PoincareSectionCalculationFrame1.VerticalDataIndex of
    1: Result.Y:=XXDotPoints[Index].T;
    2: Result.Y:=XXDotPoints[Index].X;
    3: Result.Y:=XXDotPoints[Index].XDot;
    4: Result.Y:=PoincarePoints[Index].X;
    5: Result.Y:=PoincarePoints[Index].Y;
  end;
end;

function TMainForm.GetPointsHighBound: Integer;
begin
  if High(PoincarePoints)<High(XXDotPoints) then
    Result:=High(PoincarePoints)
  else
    Result:=High(XXDotPoints);
end;

procedure TMainForm.LinearizationSideBtnClick(Sender: TObject);
begin
  PoincareSectionCalculationFrame1.Hide;
  PoincareSectionCalculationSetupFrame1.Hide;
  AboutFrame1.Hide;
  IntroductionFrame1.Hide;
end;

procedure TMainForm.GreenBtnClick(Sender: TObject);
begin
  if sSkinManager1.SkinName = 'TheFrog (internal)' then
    Exit;
  try
    Application.OnMinimize := nil;
    Application.Minimize;
    sSkinManager1.SkinName:='TheFrog (internal)';
    HEquationEdit.SkinData.SkinSection := 'PANEL';
  finally
    Sleep(200);
    Application.Restore;
    Application.OnMinimize := ApplicationEvents1Minimize;
  end;
end;

procedure TMainForm.GoldenBtnClick(Sender: TObject);
begin
  if sSkinManager1.SkinName = 'Golden (internal)' then
    Exit;
  try
    Application.OnMinimize := nil;
    Application.Minimize;
    sSkinManager1.SkinName:='Golden (internal)';
    HEquationEdit.SkinData.SkinSection := 'GROUPBOX';
  finally
    Sleep(200);
    Application.Restore;
    Application.OnMinimize := ApplicationEvents1Minimize;
  end;
end;

procedure TMainForm.LinearizationSideBtnMouseEnter(Sender: TObject);
begin
  StatusBarPanel.Caption:='This section is not completed. Right click to view incomplete page.'
end;

procedure TMainForm.LinearizationSideBtnMouseLeave(Sender: TObject);
begin
  StatusBarPanel.Caption:='';
end;

procedure TMainForm.ApplicationEvents1ShowHint(var HintStr: String;
  var CanShow: Boolean; var HintInfo: THintInfo);
begin
  if HintInfo.HintControl=GreenBtn then
  begin
    StatusBarPanel.Caption:=HintStr;
    Application.HintHidePause:=MainHHP;
    CanShow:=False;
  end
  else if HintInfo.HintControl=GoldenBtn then
  begin
    StatusBarPanel.Caption:=HintStr;
    Application.HintHidePause:=MainHHP;
    CanShow:=False;
  end
  else if HintInfo.HintControl=AboutFrame1.AboutImage then
  begin
    HintStr:=GetMainAboutString(12345,2659,38898);
    HintInfo.HintColor:=$00A3EBA0;
    HintInfo.HideTimeout:=2147483647;
    CanShow:=True;
  end
  else if HintInfo.HintControl = HEquationEdit then
  begin
    if Length(Trim(HEquationEdit.Text)) = 0 then
      HintStr := 'Insert equation here';
    HintInfo.HideTimeout := 2147483647;
  end
  else
  begin
    Application.HintHidePause:=MainHHP;
    HintInfo.HideTimeout:=MainHHP;
    CanShow:=True;
  end;
end;

procedure TMainForm.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
begin
  if E.Message<>'Thread Error: The parameter is incorrect (87)' then
    ShowMessage(E.Message);
end;

procedure TMainForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Ord(Key)=VK_F1) and (ssCtrl	in Shift) and (ssShift in Shift) and AboutSideBtn.Down then
    AboutFrame1.AboutImage.Visible:=not AboutFrame1.AboutImage.Visible;
end;

procedure TMainForm.AboutSideBtnMouseLeave(Sender: TObject);
begin
  StatusBarPanel.Caption:='';
end;

procedure TMainForm.HEquationEditChange(Sender: TObject);
var
  HEquation, S: String;
begin
  HEquationEdit.Hint := HEquationEdit.Text;
  HEquation := HEquationEdit.Text;
  if not CheckHEquationSyntax(HEquation,S) then
    //Indicate error; do nothing in this version
  else
    //Indicate error; do nothing in this version
end;

procedure TMainForm.InitializeParser(Parser: TParser);
  procedure _tanh(AnOp: POperation); far;
  begin
    AnOp^.Dest^:=Tanh(AnOp^.arg1^);
  end;
  procedure _asin(AnOp: POperation); far;
  begin
    AnOp^.Dest^:=ArcSin(AnOp^.arg1^);
  end;
  procedure _acos(AnOp: POperation); far;
  begin
    AnOp^.Dest^:=ArcCos(AnOp^.arg1^);
  end;
  procedure _atan(AnOp: POperation); far;
  begin
    AnOp^.Dest^:=ArcTan(AnOp^.arg1^);
  end;
begin
  //Initialize variables
  Parser.ClearVariables;
  Parser.SetVariable('x1',0);
  Parser.SetVariable('x2',0);
  Parser.SetVariable('x3',0);
  Parser.SetVariable('x4',0);

  //Initialize functions
  //Clear unwanted functions
  Parser.ClearFunction('ARCTAN');
  Parser.ClearFunction('ABS');
  Parser.ClearFunction('HEAV');
  Parser.ClearFunction('SIGN');
  Parser.ClearFunction('ZERO');
  Parser.ClearFunction('PH');
  Parser.ClearFunction('RND');
  Parser.ClearFunction('MAX');
  Parser.ClearFunction('MIN');
  //Add required functions
  Parser.AddFunctionOneParam('TANH', @_tanh);
  Parser.AddFunctionOneParam('ASIN', @_asin);
  Parser.AddFunctionOneParam('ACOS', @_acos);
  Parser.AddFunctionOneParam('ATAN', @_atan);
end;

procedure TMainForm.ParserErrorEvent(Sender: TObject; E: Exception);
begin
  ParserError:=True;
  ParserErrorMessage := E.Message;
end;

function TMainForm.CheckHEquationSyntax(var HEquation: String;
  var ErrorMsg: String): Boolean;
var
  Parser: Parser10.TParser;
  Diff: DiffExpress.TDiffExpress;
  i, j: Integer;
  S: String;
  MaxFormulaLength: Integer;
  StartPos: Integer;
  Token: String;
begin
  Result:=False;
  ErrorMsg:='';

  //Check syntax
  Parser:=Parser10.TParser.Create(nil);
  InitializeParser(Parser);
  Parser.OnParserError:=ParserErrorEvent;
  ParserError:=False;
  Parser.Expression:=HEquation;
  Parser.Free;
  if ParserError then
  begin
    if (ParserErrorMessage = 'Missing brackets in expression') or
       (ParserErrorMessage = 'Expression contains too many nestings') or
       (ParserErrorMessage = 'Expression is too complex') then
      ErrorMsg := ParserErrorMessage
    else if (ParserErrorMessage = 'TParser internal error') then
      ErrorMsg := '<Internal application error>'
    else
      ErrorMsg := 'Syntax error in the equation';
    Exit;
  end;

  //Normalize explicit numbers: .xx format to 0.xx format
  StartPos:=1;
  repeat
    GetNextToken(StartPos,HEquation,Token);
    if (Length(Token) > 0) and (Token[1] = '.') then
    begin
      Insert('0',HEquation,StartPos - Length(Token) - 1);
      Inc(StartPos);
    end;
  until StartPos > Length(HEquation);

  //Check the equation to be derivable
  MaxFormulaLength := Length(HEquation);
  Diff:=Diffexpress.TDiffExpress.Create(nil);
  try
    for i:=1 to 4 do
    begin
      Diff.Formula:=HEquation;
      Diff.Formula:=Diff.diff('x'+IntToStr(i));
      if Length(Diff.Formula) > MaxFormulaLength then
        MaxFormulaLength := Length(Diff.Formula);
      for j:=1 to 4 do
      begin
        S := Diff.diff('x'+IntToStr(j));
        if Length(S) > MaxFormulaLength then
          MaxFormulaLength := Length(S);
      end;
    end;
  except
    ErrorMsg:='Underivable equation';
    Diff.Free;
    Exit;
  end;
  Diff.Free;

  //Check maximum formula length
  if MaxFormulaLength > 399 then
  begin
    ErrorMsg := 'Derivative of the expression is too long';
    Exit;
  end;

  Result:=True;
end;

function TMainForm.ExistsAllVariables(const Expression: String): Integer;
var
  StartPos, i: Integer;
  XVars: array[1..4] of Boolean;
  Token: String;
begin
  StartPos:=1;
  repeat
    GetNextToken(StartPos,Expression,Token);
    for i:=1 to 4 do
      XVars[i]:=XVars[i] or (LowerCase(Token) = 'x' + IntToStr(i));
  until StartPos > Length(Expression);
  Result:=-1;
  for i:=1 to 4 do
    if not XVars[i] and (Result = -1) then
    begin
      Result:=i;
      Break;
    end;
end;

procedure TMainForm.GetNextToken(var StartPos: Integer;
  const Expression: String; var Token: String);
const
  Separators :set of Char = ['+' , '-' , '*' , '/' , '^' , '(' , ')'];
var
  i: Integer;
begin
  if StartPos > Length(Expression) then
  begin
    Token:='';
    Exit;
  end;
  for i:=StartPos to Length(Expression) do
    if (Expression[i] in Separators) then
      break;
  if (i-StartPos) > 0 then
    Token:=Copy(Expression,StartPos,i-StartPos)
  else
    Token := '';
  StartPos:=i + 1;
end;

procedure TMainForm.N1AdvancedDrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; State: TOwnerDrawState);
var
  S:String;
begin
  ACanvas.Pen.Color:=$00E1EAEB;
  ACanvas.Brush.Color:=$00E1EAEB;
  ACanvas.Rectangle(ARect.Left,ARect.Top,ARect.Right,ARect.Bottom);
  ACanvas.Brush.Style:=bsClear;
  ACanvas.Font.Color:=clBlue;
  ACanvas.Font.Style:=[fsBold];
  ACanvas.Font.Size:=8;
  S:='Sample Hamiltonian System Equations';
  ACanvas.TextOut(Trunc(ARect.Left+(ARect.Right-ARect.Left)/2-ACanvas.TextWidth(S)/2)
                  ,Trunc(ARect.Top+(ARect.Bottom-ARect.Top)/2-ACanvas.TextHeight(S)/2)
                  ,S);
  ACanvas.Pen.Color:=clRed;
  ACanvas.Rectangle(ARect.Left,ARect.Bottom-1,ARect.Right,ARect.Bottom);
end;

procedure TMainForm.SampleEquationsBtnClick(Sender: TObject);
var
  P:TPoint;
begin
  P:=SampleEquationsBtn.Parent.ClientToScreen(Point(SampleEquationsBtn.Left,SampleEquationsBtn.Top+SampleEquationsBtn.Height));
  SampleEquationsPopupMenu.Popup(P.X,P.Y);
end;

procedure TMainForm.HEquationEditMouseEnter(Sender: TObject);
begin
  StatusBarPanel.Caption := 'Edit hamiltonian system equation';
  HEquationEdit.SkinData.SkinSection := 'EDIT';
end;

procedure TMainForm.HEquationEditMouseLeave(Sender: TObject);
begin
  StatusBarPanel.Caption := '';
  if sSkinManager1.SkinName = 'Golden (internal)' then
    HEquationEdit.SkinData.SkinSection := 'GROUPBOX'
  else if sSkinManager1.SkinName = 'TheFrog (internal)' then
    HEquationEdit.SkinData.SkinSection := 'PANEL';
end;

procedure TMainForm.SampleEquationMenuItemClick(Sender: TObject);
  procedure SetParent(Control: TWinControl; ParentIndex: Integer);
  var
    C: TWinControl;
  begin
    C := Control.Parent;
    with PoincareSectionCalculationSetupFrame1 do
    begin
      Control.Parent := IniConditionPanels[ParentIndex];
      if X1Label.Parent = Control.Parent then
        X1Label.Parent := C
      else if X3Label.Parent = Control.Parent then
        X3Label.Parent := C;
    end;
  end;
begin
  with SampleEquations[(Sender as TComponent).Tag] do
  begin
    HEquationEdit.Text := HExpression;
    with PoincareSectionCalculationSetupFrame1 do
    begin
      UVarComboBox.ItemIndex := -1;  //Prevent similar variable selection
      SurfaceComboBox.ItemIndex := X1VarNo - 1;
      SurfaceComboBox.Repaint;
      SurfaceComboBox.OnChange(SurfaceComboBox);
      UVarComboBox.ItemIndex := X3VarNo - 1;
      UVarComboBox.Repaint;
      UVarComboBox.OnChange(UVarComboBox);
      UVarFormulaCheckBox.Checked := True;
      UVarFormulaEdit.Text := UVarExpression;
      YComboBox.ItemIndex := DefaultYVarNo - 1;
      YComboBox.Repaint;
      YComboBox.OnChange(YComboBox);
      x2IniEdit.Text := FloatToStr(IniValue1);
      x4IniEdit.Text := FloatToStr(IniValue2);
      HIniEdit.Text := FloatToStr(IniValueH);
      RK78Spin.Value := RK78Steps;
      StepsSpin.Value := MainSteps;
      x2IniChangeEdit.Text := FloatToStr(DefaultIniValue1);
      SetParent(x2IniEdit,x2IniEditPos);
      x4IniChangeEdit.Text := FloatToStr(DefaultIniValue2);
      SetParent(x4IniEdit,x4IniEditPos);
      x2IniDefaultCheck.Checked := UseDefaultIniValue1;
      x4IniDefaultCheck.Checked := UseDefaultIniValue2;
      Application.ProcessMessages;
    end;
  end;
end;

function TMainForm.CheckSampleEquation(const AHExpression,
  AUVarExpresion: String; AUseUVarExpression: Boolean; AX1VarNo, AX2VarNo, AX3VarNo,
  AX4VarNo: Integer): Integer;
var
  i: Integer;
begin
  Result := 0;  //Not found.
  for i:=1 to SAMPLE_EQUATIONS_COUNT do
    with SampleEquations[i] do
      if (LowerCase(AHExpression) = LowerCase(HExpression)) and
         ((not AUseUVarExpression) or (LowerCase(AUVarExpresion) = LowerCase(UVarExpression))) and
         (AX1VarNo = X1VarNo) and (AX2VarNo = X2VarNo) and
         (AX3VarNo = X3VarNo) and (AX4VarNo = X4VarNo) then
      begin
        if sMMMessageDlg('The equation you have defined is one of the internal predefined equations '+
                         'that can be calculated faster than normal equations.'+Chr(13)+'But you can '+
                         'choose to calculate it like a normal equation.'+Chr(13)+Chr(13)+'Do you '+
                         'want to use the internal predefined equation for high calculation speed?',
                         mtConfirmation,[mbYes,mbNo],0) = mrYes then
          Result := i;
        Exit;
      end;
end;

procedure TMainForm.HEquationEditKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = ' ') or (Ord(Key) = VK_RETURN) or
     (Ord(Key) = VK_ESCAPE) then
    Key := Chr(0);
end;

procedure TMainForm.SampleEquationsBtnMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  StatusBarPanel.Caption := '';
end;

procedure TMainForm.SampleEquationsBtnMouseEnter(Sender: TObject);
begin
  StatusBarPanel.Caption := 'Click to select a sample hamiltonian system equation';
end;

procedure TMainForm.SampleEquationsBtnMouseLeave(Sender: TObject);
begin
  StatusBarPanel.Caption := '';
end;

procedure TMainForm.EquationEditor1MouseEnter(Sender: TObject);
begin
  if EquationEditor1.Down then
    Exit;
  StatusBarPanel.Caption := 'Click to use the equation editor to edit the hamiltonian system equation';
end;

procedure TMainForm.EquationEditor1MouseLeave(Sender: TObject);
begin
  StatusBarPanel.Caption := '';
end;

procedure TMainForm.EquationEditor1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  StatusBarPanel.Caption := '';
end;

function TMainForm.TokenExits(StartPos: Integer; const Expression,
  Token: String): Boolean;
var
  StartPos2: Integer;
  Token2: String;
begin
  StartPos2 := StartPos;
  if StartPos2 <= 0 then
    StartPos2 := 1;
  repeat
    GetNextToken(StartPos2,Expression,Token2);
    if LowerCase(Token2) = LowerCase(Token) then
    begin
      Result := True;
      Exit;
    end;
  until StartPos2 > Length(Expression);
  Result := False;
end;

procedure TMainForm.DisableEditing;
begin
  SetEditMode(False);
end;

procedure TMainForm.EnableEditing;
begin
  SetEditMode(True);
end;

procedure TMainForm.SetEditMode(EditMode: Boolean);
begin
  HEquationEdit.ReadOnly := not EditMode;
  EquationEditor1.Enabled := EditMode;
  SampleEquationsBtn.Enabled := EditMode;
end;

function TMainForm.GetMainAboutString(Dummy1, Dummy2,
  Dummy3: Integer): String;
const
  AboutHintStr = 'Director: L. Kheibarshekan (M.Sc.)'#13'Programmer: M. Mehdipour - Mo.Mehdipour@gmail.com'#13'@Zanjan University';
var
  Dummy: Integer;
  S: String;
  C: Char;
begin
  Inc(MainAboutStringLocation);
  if Dummy1 = Dummy2 then
    Dummy := Dummy3;
  if MainAboutStringLocation > 1 then
  begin
    Dec(MainAboutStringLocation);
    Dec(MainAboutStringLocation);
  end;
  case MainAboutStringLocation of
    0: Result := AboutHintStr;
    1: begin
         S := MainAboutStr;
         for Dummy:=1 to Length(S) do
         begin
           C:=S[Dummy];
           asm
             XOR AX,AX
             MOV AL,C
             SUB AL,3
             MOV ECX,3
             ROL AL,CL
             NOT AL
             MOV ECX,5
             ROR AL,CL
             MOV C,AL
           end;
           S[Dummy] := C;
         end;
         Result := S;
       end;
  end;
end;

procedure TMainForm.ApplicationEvents1Minimize(Sender: TObject);
begin
  if MinimizeToTrayActive and PoincareSectionCalculationFrame1.CalculationMode then
  begin
    MinimizeToTray;
  end
  else
  begin
    PoincareSectionCalculationFrame1.ProgressCheck.Tag := Ord(PoincareSectionCalculationFrame1.ProgressCheck.Checked);
    PoincareSectionCalculationFrame1.ProgressCheck.Checked := False;
  end;
end;

procedure TMainForm.ShowTrayIcon;
var
  NotifyIconData: TNotifyIconData;
begin
  with NotifyIconData do
  begin
    cbSize := SizeOf(NotifyIconData);
    Wnd := MainForm.Handle;
    uID := 0;
    uFlags := NIF_MESSAGE or NIF_ICON or NIF_TIP;
    uCallbackMessage := WM_TRAYICON;
    hIcon := Application.Icon.Handle;
    szTip := '';
  end;
  Shell_NotifyIcon(NIM_ADD,@NotifyIconData);
  //Set icon hint text
  with PoincareSectionCalculationFrame1 do
    OnCalculationProgress(PoincareCalculationGauge.MinValue,PoincareCalculationGauge.MaxValue,PoincareCalculationGauge.Progress,Length(PoincarePoints));
end;

procedure TMainForm.HideTrayIcon;
var
  NotifyIconData: TNotifyIconData;
begin
  with NotifyIconData do
  begin
    cbSize := SizeOf(NotifyIconData);
    Wnd := MainForm.Handle;
    uID := 0;
    uFlags := NIF_MESSAGE or NIF_ICON;
    uCallbackMessage := WM_TRAYICON;
    hIcon := Application.Icon.Handle;
  end;
  Shell_NotifyIcon(NIM_DELETE,@NotifyIconData);
end;

procedure TMainForm.TrayIconEvent(var Msg: TMessage);
begin
  case Msg.LParam of
    WM_LBUTTONUP: begin
                    RestoreFromTray;
                  end;
    WM_RBUTTONUP: begin
                    //TrayPopupMenu.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
                    RestoreFromTray;
                  end;
  end;
end;

procedure TMainForm.Open1Click(Sender: TObject);
begin
  RestoreFromTray;
end;

procedure TMainForm.MinimizeTotray;
begin
  if not Application.MainForm.Visible then
    Exit;
  Application.OnMinimize := nil;
  Application.Minimize;
  Application.OnMinimize := ApplicationEvents1Minimize;
  Application.MainForm.Visible := False;
  //Save current state of ProgressCheck to restore at RestoreFromTray
  PoincareSectionCalculationFrame1.ProgressCheck.Tag := Ord(PoincareSectionCalculationFrame1.ProgressCheck.Checked);
  PoincareSectionCalculationFrame1.ProgressCheck.Checked := False;
  ShowTrayIcon;
end;

procedure TMainForm.RestoreFromTray;
begin
  if Application.MainForm.Visible then
    Exit;
  HideTrayIcon;
  PoincareSectionCalculationFrame1.ProgressCheck.Checked := PoincareSectionCalculationFrame1.ProgressCheck.Tag = 1;
  Application.MainForm.Visible := True;
  Application.Restore;
  Application.BringToFront;
  Application.ProcessMessages;
end;

procedure TMainForm.StopCalculation1Click(Sender: TObject);
begin
  RestoreFromTray;
  PoincareSectionCalculationFrame1.PoincareStopCalcBtn.Click;
end;

procedure TMainForm.OnCalculationFinished;
begin
  if not Application.MainForm.Visible then
    RestoreFromTray;
end;

procedure TMainForm.OnCalculationProgress(AMinValue, AMaxValue,
  AProgress, NumofPoints: Integer);
var
  NotifyIconData: TNotifyIconData;
  ToolTipText: String;
  i: Integer;
begin
  if MinimizeToTrayActive and
     PoincareSectionCalculationFrame1.CalculationMode and
     not Application.MainForm.Visible then
  begin
  with NotifyIconData do
  begin
    cbSize := SizeOf(NotifyIconData);
    Wnd := MainForm.Handle;
    uID := 0;
    uFlags := NIF_MESSAGE or NIF_ICON or NIF_TIP;
    uCallbackMessage := WM_TRAYICON;
    hIcon := Application.Icon.Handle;
    ToolTipText := 'Hamiltonian Systems - Calculating'+Chr(13)+
                   InttoStr(Trunc((100*(AProgress-AMinValue))/(AMaxValue - AMinValue)))+'%'+
                   '  ,  '+IntToStr(NumofPoints)+' points';
    for i:=1 to Length(ToolTipText) do
      szTip[i-1] := ToolTipText[i];
    szTip[Length(ToolTipText)] := Chr(0);
  end;
  Shell_NotifyIcon(NIM_MODIFY,@NotifyIconData);
  end;
end;

procedure TMainForm.HelpSideBtnMouseEnter(Sender: TObject);
begin
  StatusBarPanel.Caption := 'Click to see a short help about using this program';
end;

procedure TMainForm.HelpSideBtnMouseLeave(Sender: TObject);
begin
  StatusBarPanel.Caption := '';
end;

procedure TMainForm.HelpSideBtnClick(Sender: TObject);
begin
  SelectSideBtn(HelpSideBtn);
  IntroductionFrame1.Hide;
  PoincareSectionCalculationSetupFrame1.Hide;
  PoincareSectionCalculationFrame1.Hide;
  AboutFrame1.Hide;
  HelpFrame1.Show;
  if Assigned(HelpFrame1.OnResize) then
    HelpFrame1.OnResize(HelpFrame1);
end;

procedure TMainForm.SidePanelMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  Application.ProcessMessages;
end;

procedure TMainForm.SidePanelClick(Sender: TObject);
begin
  SideMenu.Active := True;
  SideMenu.OpenMenu;
end;

procedure TMainForm.ApplicationEvents1Restore(Sender: TObject);
begin
  PoincareSectionCalculationFrame1.ProgressCheck.Checked := PoincareSectionCalculationFrame1.ProgressCheck.Tag = 1;
end;

function TMainForm.OnlyOneProgramInstance: Boolean;
resourcestring
  OnlyOneInstanceMessage = 'Can not start the calculation because another calculation ' +
    'process is in progress. Stop it to start a new calculation.';
begin
  Result := not PoincareSectionCalculationFrame1.ProcessExists('calc4dh.exe');
  if not Result then
  begin
    sMMShowMessage(OnlyOneInstanceMessage);
  end;
end;

end.
