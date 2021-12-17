unit PoincareCalculationFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, sPanel, StdCtrls, sGauge, ToolWin,
  ComCtrls, Buttons, sBitBtn, sLabel, Menus, MathImge,
  PoincareGraphOptionsFrame, Clipbrd, Tlhelp32, ImgList,
  sCheckBox, ConfirmFormUnit, sMMDialogs, CustomExportFormUnit, DiffExpress,
  CommDlg;

const
  MAX_BUFF_LEN = 2048;
  MINIMUM_HORIZ_ZOOM_LENGTH = 5;  //Define minimum horizontal zoom box length in points
  MINIMUM_VERT_ZOOM_LENGTH = 5;  //Define minimum vertical zoom box length in points

  CALC4DH_FILE_IDENTIFIER = 12345;
  WRONG_FILE_VERSION_MESSAGE = ' WRONG_FILE_VERSION';

type
  TBuffer=array[1..MAX_BUFF_LEN] of Char;
  TExtendedPoint=record
      X,Y:Extended;
  end;
  TXXDotPoint=record
      T,X,XDot:Extended;
  end;
  TPoincarePointsArray=array of TExtendedPoint;
  TXXDotPoints=array of TXXDotPoint;
  TDrawPointsProc=procedure(AMathImage:TMathImage) of object;
  TPoincareSectionCalculationFrame = class(TFrame)
    Label1: TLabel;
    TitlePanel: TsPanel;
    PoincareCalculationPanel: TsPanel;
    PoincareCalculationGauge: TsGauge;
    sLabel1: TsLabel;
    PoincareLabel1: TsLabel;
    PoincareNumOfPointsLabel: TsLabel;
    PoincareStopCalcBtn: TsBitBtn;
    PoincareGraphPanel: TsPanel;
    SaveGraphPopupMenu: TPopupMenu;
    SaveGraphAsBitmap1: TMenuItem;
    SaveGraphAsMetafile1: TMenuItem;
    MathImage1: TMathImage;
    sBitBtn1: TsBitBtn;
    SaveDialog1: TSaveDialog;
    BackToSetupBtn: TsBitBtn;
    MathImagePopupMenu: TPopupMenu;
    ZoomInMenuItem: TMenuItem;
    PanMenuItem: TMenuItem;
    N1: TMenuItem;
    ZoomOutMenuItem: TMenuItem;
    N2: TMenuItem;
    SaveGraph1: TMenuItem;
    CopyToClipboardAsBitmap1: TMenuItem;
    SaveGraphAsBitmap2: TMenuItem;
    SaveGraphAsMetafile2: TMenuItem;
    ImageList1: TImageList;
    ProgressCheck: TsCheckBox;
    FitMenuItem: TMenuItem;
    PoincareLabel2: TsLabel;
    PoincareNumOfPointsLabel2: TsLabel;
    GraphOptionsBtn: TsBitBtn;
    ZoomBtn: TsBitBtn;
    FitBtn: TsBitBtn;
    ZoomOutBtn: TsBitBtn;
    PanBtn: TsBitBtn;
    SaveFileBtn: TsBitBtn;
    CopyBtn: TsBitBtn;
    sPanel1: TsPanel;
    Seperator2: TsPanel;
    Separator2: TsPanel;
    Separator1: TsPanel;
    LoadPointsBtn: TsBitBtn;
    OpenDialog1: TOpenDialog;
    ExportPopup: TPopupMenu;
    ExportYYDOT1: TMenuItem;
    ExportXXDOT1: TMenuItem;
    N3: TMenuItem;
    CustomExport1: TMenuItem;
    PoincareGraphOptionsFrame1: TPoincareGraphOptionsFrame;
    ImportPopup: TPopupMenu;
    ImportYYDOT1: TMenuItem;
    ImportYYDOT2: TMenuItem;
    ImportYYDOT3: TMenuItem;
    ImportYYDOT4: TMenuItem;
    ImportYYDOT5: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    PreviousViewPopupMenuItem: TMenuItem;
    TimeLabelSeparator: TsPanel;
    TimeLabel: TsLabel;
    TimeTimer: TTimer;
    procedure FrameResize(Sender: TObject);
    procedure SaveFileBtnClick(Sender: TObject);
    procedure ZoomBtnClick(Sender: TObject);
    procedure MathImage1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MathImage1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MathImage1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PanBtnClick(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
    procedure CopyBtnClick(Sender: TObject);
    procedure SaveGraphAsBitmap1Click(Sender: TObject);
    procedure SaveGraphAsMetafile1Click(Sender: TObject);
    procedure TitlePanelCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure PoincareStopCalcBtnClick(Sender: TObject);
    procedure ZoomInMenuItemClick(Sender: TObject);
    procedure MathImagePopupMenuPopup(Sender: TObject);
    procedure ZoomOutMenuItemClick(Sender: TObject);
    procedure PanMenuItemClick(Sender: TObject);
    procedure SaveGraphAsBitmap2Click(Sender: TObject);
    procedure SaveGraphAsMetafile2Click(Sender: TObject);
    procedure CopyToClipboardAsBitmap1Click(Sender: TObject);
    procedure FitBtnClick(Sender: TObject);
    procedure ZoomOutBtnClick(Sender: TObject);
    procedure FitMenuItemClick(Sender: TObject);
    procedure LoadPointsBtnClick(Sender: TObject);
    procedure CustomExport1Click(Sender: TObject);
    procedure ImportYYDOT5Click(Sender: TObject);
    procedure TitlePanelResize(Sender: TObject);
    procedure PreviousViewPopupMenuItemClick(Sender: TObject);
    procedure TimeTimerTimer(Sender: TObject);
    procedure OpenDialog1Show(Sender: TObject);
  private
    { Private declarations }
    FDrawPointsProc:TDrawPointsProc;
    PanningMode,ZoomingMode:Boolean;
    AllowPanning:Boolean;
    ZoomBox:Boolean;
    P1,P2:TPoint;
    KillProcess, UserAborted: Boolean;
    StartTime: TDateTime;
    OpenDialog1OpenBtnCaption: String;
    procedure UpdateGraphCursor;
    procedure NormalizePoints(var P1, P2: TPoint);
    procedure ConvertPointToValues(P: TPoint;var vx,vy: Extended);
    procedure ZoomIn(P1, P2: TPoint);
    procedure ResetView;
  public
    { Public declarations }
//    PoincarePoints:TPoincarePointsArray;
    SetWorld:Boolean;
    HorizontalDataIndex,VerticalDataIndex:Byte;
    VariableReplacementMode: Byte;
    CalculationMode: Boolean;
    constructor Create(AOwner:TComponent);override;
    procedure RefreshMathImage(FullRefresh:Boolean=True);
    procedure CalculatePoincarePoints(H,x2Ini,x4Ini,
      x2IniChange,x4IniChange:Extended;x2DefaultIni,
      x4DefaultIni:Boolean;
      NumOfSteps,NumOfRK78Steps:Integer;ShowErrorMessages:Boolean;
      x1VarNo, x2VarNo, x3VarNo, x4VarNo, YVarNo: Integer;
      const HEquation, UVarFormula: String; UseUVarFormula: Boolean;
      const ErrorLogFileName: String; LogErrorMessages: Boolean;
      const OutputFileName: String; OutputTime: Integer; OutputToDisk: Boolean;
      AShutDownAfterComplete: Boolean;
      BackgroundProcessing: Boolean);
    function ParseLine(var OldS: TBuffer; var OldN: Integer;
      var NewS: TBuffer; var NewN: Integer; var ALine: String): Boolean;
    function ParseString(const S:String;n:Integer):String;
    function ReadFileLine(Handle:Windows.THandle;var NewLine:String):Boolean;
    function ProcessExists(const ExeName:String):Boolean;
    function ContinueCalculation(const ErrMsg:String;var ShowAgain:Boolean):Boolean;
    procedure ExportPoincarePointsToFile(const FName:String;
            TOrder,XOrder,XDotOrder,YOrder,YDotOrder:Byte);
    procedure ImportPointsFromFile(const FName:String;
            LayoutIndex:Byte{1=(Y,YDOT),2=(T,Y,YDOT),
                             3=(X,XDOT),4=(T,X,XDOT),
                             5=(T,X,XDOT,Y,YDOT)});
    procedure ReplaceVariables(var HFormula, x3Formula: String;
      x1VarNo, x2VarNo, x3VarNo, x4VarNo: Integer;
      var YVarNo: Integer);
    procedure GenerateFormulas(HFormula: String; Formulas: TStringList);
    procedure NormalizeFormulas(Formulas: TStringList);
    procedure BackgroundProcess(EnableBackgroundProcessing: Boolean);
    function WindowsExit(ExitFlags: LongWord): Boolean;
    procedure UpdatePointsFromFiles;
  public
    property OnDrawPoints:TDrawPointsProc read FDrawPointsProc write FDrawPointsProc;
  end;

implementation
uses
  MainUnit, DateUtils, Math;

{$R *.dfm}

procedure TPoincareSectionCalculationFrame.FrameResize(Sender: TObject);
begin
  {Calculation Panel}
  PoincareCalculationPanel.Width:=Width-13;
  PoincareStopCalcBtn.Left:=PoincareCalculationPanel.Width-109;
  Separator1.Left:=PoincareCalculationPanel.Width-116;
  PoincareNumOfPointsLabel.Left:=PoincareCalculationPanel.Width-170;
  PoincareLabel1.Left:=PoincareCalculationPanel.Width-313;
  Separator2.Left:=PoincareCalculationPanel.Width-321;
  ProgressCheck.Left:=PoincareCalculationPanel.Width-467;
  PoincareCalculationGauge.Width:=PoincareCalculationPanel.Width-573;
  {Graph Panel}
  PoincareGraphPanel.Width:=Width-13;
  TimeLabel.Left := Width - 70;
  TimeLabelSeparator.Left := TimeLabel.Left - 3;
  {MathImage1}
  MathImage1.Width:=Width-13;
  if PoincareGraphPanel.Top=24 then
    MathImage1.Height:=Height-58
  else
    MathImage1.Height:=Height-89;
  TitlePanel.Align := alTop;
end;

procedure TPoincareSectionCalculationFrame.RefreshMathImage(FullRefresh:Boolean);
const
  DataSourceLabels:array[1..5] of String=('T','X','XDOT','Y','YDOT');
begin
  with PoincareGraphOptionsFrame1.GraphInformation do
    if Assigned(FDrawPointsProc) then
    begin
      MathImage1.Canvas.Pen.Color:=PointsColor;
      if FullRefresh then
      begin
        MathImage1.Canvas.Brush.Color:=BackgroundColor;
//        MathImage1.Hide;
        MathImage1.Clear;
        MathImage1.D2Axes:=True;
        if SetWorld then
          MathImage1.SetWorld(YAxisMin,YDotAxisMin,YAxisMax,YDotAxisMax);
        MainForm.LastPoint:=0;
      end;
      FDrawPointsProc(MathImage1);
      if FullRefresh then
      begin
        MathImage1.Canvas.Font.Assign(TitleFont);
        MathImage1.Canvas.Font.Color:=LabelsColor;
        MathImage1.DrawAxes(DataSourceLabels[HorizontalDataIndex],DataSourceLabels[VerticalDataIndex],DrawZerolines,
                         AxesColor,ZerolinesColor);
        MathImage1.Canvas.Font.Color:=TitleFont.Color;
        MathImage1.Show;
        MathImage1.Canvas.Pen.Color:=FrameColor;
        with MathImage1 do
        begin
          Canvas.MoveTo(WindowX(D2WorldX1),WindowY(D2WorldY2));
          Canvas.LineTo(WindowX(D2WorldX2),WindowY(D2Worldy2));
          Canvas.LineTo(WindowX(D2Worldx2),WindowY(D2Worldy1));
        end;
        Application.ProcessMessages;
        if MathImage1.Canvas.TextWidth(TitleText)<MathImage1.Width then
          MathImage1.Canvas.TextOut(Trunc(MathImage1.Width/2-MathImage1.Canvas.TextWidth(TitleText)/2),0,TitleText);
        Application.ProcessMessages;
      end;
    end;
end;

procedure TPoincareSectionCalculationFrame.SaveFileBtnClick(
  Sender: TObject);
var
  P:TPoint;
begin
  P:=SaveFileBtn.Parent.ClientToScreen(Point(SaveFileBtn.Left,SaveFileBtn.Top+SaveFileBtn.Height));
  SaveGraphPopupMenu.Popup(P.X,P.Y);
end;

procedure TPoincareSectionCalculationFrame.ZoomBtnClick(Sender: TObject);
begin
  ZoomBtn.Down:=not ZoomBtn.Down;
  PanBtn.Down:=False;
  ZoomingMode:=ZoomBtn.Down;
  PanningMode:=PanBtn.Down;
  UpdateGraphCursor;
end;

constructor TPoincareSectionCalculationFrame.Create(AOwner: TComponent);
begin
  inherited;
  PanningMode:=False;
  ZoomingMode:=False;
  AllowPanning:=False;
  ZoomBox:=False;
  SetWorld:=True;
  PoincareGraphOptionsFrame1.RefreshProc:=RefreshMathImage;
  PoincareGraphOptionsFrame1.RelatedMathImage:=MathImage1;
  HorizontalDataIndex:=4;
  VerticalDataIndex:=5;
  CalculationMode := False;
  OpenDialog1OpenBtnCaption := 'Open';
//  ResetView;
  SetWorld:=False;
  MathImage1.SetWorld(-0.5,-0.6,1,0.6);
  RefreshMathImage;
  SetWorld:=True;
end;

procedure TPoincareSectionCalculationFrame.MathImage1MouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  if Button<>mbLeft then Exit;
  if PanningMode then
  begin
   Screen.Cursor := crPanDownCursor;
    AllowPanning:=True;
    P1:=Point(X,Y);
  end
  else if ZoomingMode then
  begin
    ZoomBox:=True;
    P1:=Point(X,Y);
    P2:=P1;
    MathImage1.Canvas.DrawFocusRect(Rect(P1,P1));
  end;  
end;

procedure TPoincareSectionCalculationFrame.UpdateGraphCursor;
begin
  if ZoomingMode then
    MathImage1.Cursor:=crZoomInCursor
  else if PanningMode then
    MathImage1.Cursor:=crPanUpCursor
  else
    MathImage1.Cursor:=crDefault;
end;

procedure TPoincareSectionCalculationFrame.MathImage1MouseUp(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
var
  P1temp,P2Temp:TPoint;
begin
  if Button<>mbLeft then Exit;
  if PanningMode then
  begin
    AllowPanning:=False;
    Screen.Cursor := crDefault;
  end
  else if ZoomingMode then
  begin
    ZoomBox:=False;
    P1temp:=P1;
    P2temp:=P2;
    NormalizePoints(P1temp,P2temp);
    MathImage1.Canvas.DrawFocusRect(Rect(P1temp,P2temp));
    Application.ProcessMessages;
    P2.X:=X;
    P2.Y:=Y;
    NormalizePoints(P1,P2);
    ZoomIn(P1,P2);
  end;
end;

procedure TPoincareSectionCalculationFrame.NormalizePoints(var P1,
  P2: TPoint);
var
  Temp:Integer;
begin
  if P1.X>P2.X then
  begin
    Temp:=P1.X;
    P1.X:=P2.X;
    P2.X:=temp;
  end;
  if P1.Y>P2.Y then
  begin
    Temp:=P1.Y;
    P1.Y:=p2.Y;
    P2.Y:=temp;
  end;
end;

procedure TPoincareSectionCalculationFrame.ZoomIn(P1, P2: TPoint);
var
  x1,y1,x2,y2:Extended;
begin
  if (P1.X<P2.X) and (P1.Y<P2.Y) and
     (((P2.X-P1.X)>MINIMUM_HORIZ_ZOOM_LENGTH) or ((P2.Y-P1.Y)>MINIMUM_VERT_ZOOM_LENGTH)) then
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
    SetWorld:=False;
    RefreshMathImage;
    SetWorld:=True;
    PoincareGraphOptionsFrame1.UpdateFields;
  end;
end;

procedure TPoincareSectionCalculationFrame.ConvertPointToValues(P: TPoint;
  var vx, vy: Extended);
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

procedure TPoincareSectionCalculationFrame.MathImage1MouseMove(
  Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  P1temp,P2temp:TPoint;
  Pandx,Pandy:Extended;
begin
  if MathImage1.Canvas.Pixels[X,Y]=PoincareGraphOptionsFrame1.PointsColorSelector.ColorValue then
    MainForm.PointPanel.Caption:=' ('+FloatToStrF(MathImage1.WorldX(X),ffExponent,10,3)+','+FloatToStrF(MathImage1.WorldY(Y),ffExponent,10,3)+')'
  else
    MainForm.PointPanel.Caption:=' (N/A,N/A)';

  if AllowPanning and PanningMode then
  begin
    if (abs(P1.X-x)<5) and (abs(P1.Y-y)<5) then Exit;
    with MathImage1 do
    begin
      Pandx:=WorldX(P1.X)-WorldX(X);
      Pandy:=WorldY(P1.Y)-WorldY(Y);
      P1:=Point(X,Y);
      SetWorld(D2WorldX1+Pandx,D2WorldY1+Pandy,D2Worldx2+Pandx,D2Worldy2+Pandy);
    end;
    SetWorld:=False;
    RefreshMathImage;
    SetWorld:=True;
    PoincareGraphOptionsFrame1.UpdateFields;
  end
  else if ZoomBox and ZoomingMode then
  begin
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
end;

procedure TPoincareSectionCalculationFrame.PanBtnClick(Sender: TObject);
begin
  PanBtn.Down:=not PanBtn.Down;
  ZoomBtn.Down:=False;
  ZoomingMode:=ZoomBtn.Down;
  PanningMode:=PanBtn.Down;
  UpdateGraphCursor;
end;

procedure TPoincareSectionCalculationFrame.sBitBtn1Click(Sender: TObject);
var
  P:TPoint;
begin
  P:=(Sender as TsBitBtn).Parent.ClientToScreen(Point((Sender as TsBitBtn).Left,(Sender as TsBitBtn).Top+(Sender as TsBitBtn).Height));
  ExportPopup.Popup(P.X,P.Y);
end;

procedure TPoincareSectionCalculationFrame.ExportPoincarePointsToFile(const FName:String;
            TOrder,XOrder,XDotOrder,YOrder,YDotOrder:Byte);
var
  OrderArray:array[1..5] of Byte;

function GetPointValue(ValueIndex:Integer;Order:Byte):String;
var
  i,OrderIndex:Byte;
  TempValue:Extended;
begin
  Result:='';
  OrderIndex:=0;
  for i:=1 to 5 do
    if OrderArray[i]=Order then
      OrderIndex:=i;
  if OrderIndex=0 then Exit;
  case OrderIndex of
    1,2,3: begin
             case OrderIndex of
               1: TempValue:=XXDotPoints[ValueIndex].T;
               2: TempValue:=XXDotPoints[ValueIndex].X;
               3: TempValue:=XXDotPoints[ValueIndex].XDot;
             end;
           end;
    4,5:   begin
             if OrderIndex=4 then TempValue:=PoincarePoints[ValueIndex].X
             else if OrderIndex=5 then TempValue:=PoincarePoints[ValueIndex].Y;
           end;
  end;
  if TempValue>=0 then
    Result:=' '+FloatToStrF(TempValue,ffExponent,19,4)
  else
    Result:=FloatToStrF(TempValue,ffExponent,19,4);
end;

var
  i:Integer;
  j:Byte;
  S1,S2:String;
  F:TextFile;
  MaxBound: Integer;
begin
  OrderArray[1]:=TOrder;
  OrderArray[2]:=XOrder;
  OrderArray[3]:=XDotOrder;
  OrderArray[4]:=YOrder;
  OrderArray[5]:=YDotOrder;
  AssignFile(F,fname);
  {$I-}
  Rewrite(F);
  {$I+}
  if IOResult<>0 then
  begin
    sMMMessageDlg('Unable to create output file:'+Chr(13)+fname+'.',mtError,[mbOK],0);
    Exit;
  end;
  {$I-}
  if CalculationMode then
    MaxBound := Min(Length(PoincarePoints),Length(XXDotPoints)) - 1
  else
    MaxBound := StrToInt(PoincareNumOfPointsLabel2.Caption) - 1;
  for i:=0 to MaxBound do
  begin
    S1:='';
    for j:=1 to 5 do
    begin
      S2:=GetPointValue(i,j);
      if Length(S2)>0 then
        S1:=S1+' '+S2;
    end;
    WriteLn(F,S1);
    if IOResult<>0 then
    begin
      sMMMessageDlg('Occured an error while writing to the output file.',mtError,[mbOK],0);
      Break;
    end;
  end;
  CloseFile(F);
  {$I+}
  IOResult;
end;

procedure TPoincareSectionCalculationFrame.CopyBtnClick(Sender: TObject);
begin
  Clipboard.Assign(MathImage1.Bitmap);
end;

procedure TPoincareSectionCalculationFrame.SaveGraphAsBitmap1Click(
  Sender: TObject);
var
  fname:String;
begin
  SaveDialog1.Filter:='Bitmap Files(*.bmp,*.dib)|*.bmp;*.dib';
  SaveDialog1.FilterIndex:=1;
  SaveDialog1.Title:='Save Graph As Bitmap';
  if SaveDialog1.Execute then
  begin
    fname:=SaveDialog1.FileName;
    if (LowerCase(ExtractFileExt(fname))<>'.bmp') and
       (LowerCase(ExtractFileExt(fname))<>'.dib') then
      fname:=fname+'.bmp';
    MathImage1.Bitmap.SaveToFile(fname);
  end;
end;

procedure TPoincareSectionCalculationFrame.SaveGraphAsMetafile1Click(
  Sender: TObject);
var
  fname:String;
begin
  SaveDialog1.Filter:='Windows Metafiles(*.wmf)|*.wmf';
  SaveDialog1.FilterIndex:=1;
  SaveDialog1.Title:='Save Graph As Metafile';
  if SaveDialog1.Execute then
  begin
    fname:=SaveDialog1.FileName;
    if LowerCase(ExtractFileExt(fname))<>'.wmf' then
      fname:=fname+'.wmf';
    MathImage1.RecordMetafile:=True;
    SetWorld:=False;
    RefreshMathImage;
    SetWorld:=True;
    MathImage1.SaveAsMetafile(fname);
    MathImage1.RecordMetafile:=False;
  end;
end;

procedure TPoincareSectionCalculationFrame.TitlePanelCanResize(
  Sender: TObject; var NewWidth, NewHeight: Integer; var Resize: Boolean);
begin
end;

//****************************** KILLTASK ******************************
function KillTask(ExeFileName:String):Integer;
const
  PROCESS_TERMINATE=$0001;
var
  ContinueLoop:BOOL;
  FSnapshotHandle:THandle;
  FProcessEntry32:TProcessEntry32;
begin
  Result:=0;
  FSnapshotHandle:=CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS,0);
  FProcessEntry32.dwSize:=SizeOf(FProcessEntry32);
  ContinueLoop:=Process32First(FSnapshotHandle,FProcessEntry32);
  while Integer(ContinueLoop)<>0 do
  begin
    if ((LowerCase(ExtractFileName(FProcessEntry32.szExeFile))=LowerCase(ExeFileName)) or
       (LowerCase(FProcessEntry32.szExeFile)=LowerCase(ExeFileName))) then
      Result:=Integer(TerminateProcess(OpenProcess(PROCESS_TERMINATE,BOOL(0),FProcessEntry32.th32ProcessID),0));
    ContinueLoop:=Process32Next(FSnapshotHandle,FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;
//**********************************************************************

procedure TPoincareSectionCalculationFrame.CalculatePoincarePoints(H,
  x2Ini, x4Ini, x2IniChange, x4IniChange: Extended; x2DefaultIni,
  x4DefaultIni: Boolean; NumOfSteps, NumOfRK78Steps: Integer;ShowErrorMessages:Boolean;
  x1VarNo, x2VarNo, x3VarNo, x4VarNo, YVarNo: Integer;
  const HEquation, UVarFormula: String; UseUVarFormula: Boolean;
  const ErrorLogFileName: String; LogErrorMessages: Boolean;
  const OutputFileName: String; OutputTime: Integer; OutputToDisk: Boolean;
  AShutDownAfterComplete: Boolean;
  BackgroundProcessing: Boolean);
const
  MAX_NUM_OF_STATUS_OUTPUT=110000;
  MIN_PROGRESS_DIFF=10;
var
  f:TextFile;
  MainStepFactor,RK78StepFactor:Integer;
  S,S2:String;
  yydotHandle,xxdotHandle,StatusHandle,tmpHandle:Windows.THandle;
  tempSec:TSecurityAttributes;
  ProcInfo:TProcessInformation;
  SInfo:TStartupInfo;
  OldS1,NewS1,OldS2,NewS2,OldS3,NewS3:TBuffer;
  OldN1,NewN1,OldN2,NewN2,OldN3,NewN3:Integer;
  NewLine:String;
  ReadNum1,ReadNum2,ReadNum3:Cardinal;
  NewPoint:TExtendedPoint;
  Progress:Integer;
  ShowError,RefreshGraph:Boolean;
  Counter:Integer;
  Formulas: TStringList;
  HFormula, x3Formula: String;
  NewYVarNo: Integer;
  InternalEquationIndex: Integer;
  ErrorLogFile: TextFile;
  NoCalculationError: Boolean;
  OldDateTime, TimeTemp: TDateTime;
  OutputToDiskEnabled: Boolean;
  OutputToDiskDelayTime: Integer;
  ShutDownAfterComplete: Boolean;
  ShutDownResult: LongBool;
  InternalAppError: Boolean;
  MainStepCount: Integer;
begin
  LoadPointsBtn.Enabled:=False;
  PoincareStopCalcBtn.Enabled := True;
  PoincareCalculationPanel.Show;
  PoincareGraphPanel.Top:=56;
  MathImage1.Height:=MathImage1.Height-33;
  MathImage1.Top:=89;
  RefreshMathImage;
  PoincareNumOfPointsLabel.Caption:='0';
  PoincareCalculationGauge.Progress:=0;
//  ProgressCheck.Checked:=True;
  PoincareLabel2.Visible:=False;
  PoincareNumOfPointsLabel2.Visible:=False;
  MainForm.StatusBarPanel.Caption:='';
  {Initializing}
  ShutDownAfterComplete := AShutDownAfterComplete;
  OutputToDiskEnabled := OutputToDisk;
  if OutputTime <= 0 then
    OutputToDiskDelayTime := 5
  else
    OutputToDiskDelayTime := OutputTime;
  if NumOfSteps<MAX_NUM_OF_STATUS_OUTPUT then
  begin
    MainStepFactor:=1;
    RK78StepFactor:=Trunc(NumOfRK78Steps/((MAX_NUM_OF_STATUS_OUTPUT-
      NumOfSteps)/NumOfSteps));
    if RK78StepFactor=0 then RK78StepFactor:=1;
  end
  else
  begin
    MainStepFactor:=Trunc(NumOfSteps/MAX_NUM_OF_STATUS_OUTPUT);
    RK78StepFactor:=NumOfRK78Steps+1;
  end;
  MainStepFactor := 1;
  PoincareCalculationGauge.MaxValue:=Trunc(NumOfSteps/MainStepFactor*(NumOfRK78Steps/RK78StepFactor));
  {Check for calc4dh.exe to exist}
  IOResult;
  Windows.GetLastError;
  if not FileExists(MainForm.ExePath + 'calc4dh.exe') then
  begin
    sMMShowMessage('Error: Can not find the file ''calc4dh.exe''.');
    ResetView;
    Exit;
  end;
  {Check to be able to create the output file}
  if OutputToDiskEnabled then
  begin
    //Use ErrorLogFile variable to create the output file for the first time
    AssignFile(ErrorLogFile,OutputFileName);
    {$I-}
    Rewrite(ErrorLogFile);
    if IOResult <> 0 then
    begin
      CloseFile(ErrorLogFile);
      IOResult;
      {$I+}
      if sMMMessageDlg('Unable to create the output file.'+Chr(13)+'Do you want to disable output to disk while calculating?',mtWarning,[mbYes,mbNo],0) = mrYes then
        OutputToDiskEnabled := False
      else
      begin
        ResetView;
        Exit;
      end;
    end
    else
      CloseFile(ErrorLogFile);
    {$I+}
  end;
  {Create input.tmp}
  {
   1st Line: H,X2 Initial Condition,X4 Initial Condition
   2nd Line: Number Of Steps,Number Of RK78 Steps
   3rd Line: X2 initial condition changing flag(0=Don't use,1=Use),X2 initial condition changing value
   4th Line: X4 initial condition changing flag(0=Don't use,1=Use),X4 initial condition changing value
   5th Line: xxdot file (xout.tmp) creation flag(0=Don't create,1=Create)
   6th Line: Calculation progress factors for main steps and RK78 steps
  }
  {Generate formulas first}
  HFormula := LowerCase(HEquation);
  if UseUVarFormula then
    x3Formula := LowerCase(UVarFormula)
  else
    x3Formula := '0.';
  //Check to see if this equation is a predefined internal equation
  InternalEquationIndex := MainForm.CheckSampleEquation(HFormula,x3Formula,UseUVarFormula,x1VarNo,x2VarNo,x3VarNo,x4VarNo);
  NewYVarNo := YVarNo;
  Formulas := TStringList.Create;
  if InternalEquationIndex = 0 then
  begin
    //No an internal equation
    ReplaceVariables(HFormula,x3Formula,x1VarNo,x2VarNo,x3VarNo,x4VarNo,NewYVarNo);
    Formulas.Append(HFormula);
    GenerateFormulas(HFormula,Formulas);
    Formulas.Append(x3Formula);
    NormalizeFormulas(Formulas);
  end
  else
  begin
    //This equation is an internal equation
    //Fill the formulas with dummy strings
    for Counter:=1 to 22 do
      Formulas.Append('?');
  end;
  AssignFile(f,MainForm.ExePath + 'input.tmp');
  {$I-}
  Rewrite(f);
  {$I+}
  if IOResult<>0 then
  begin
    sMMShowMessage('Error: Could not access to the file ''input.tmp''.');
    ResetView;
    Exit;
  end;
  S:=FloatToStrF(H,ffExponent,19,4)+' '+FloatToStrF(x2Ini,ffExponent,19,4)+
     ' '+FloatToStrF(x4Ini,ffExponent,19,4) + ' ' + IntToStr(CALC4DH_FILE_IDENTIFIER);
  WriteLn(f,S);
  WriteLn(f,NumOfSteps,' ',NumOfRK78Steps);
  if x2DefaultIni then S:='0' else S:='1';
  S:=S+' '+FloatToStrF(x2IniChange,ffExponent,19,4);
  WriteLn(f,S);
  if x4DefaultIni then S:='0' else S:='1';
  S:=S+' '+FloatToStrF(x4IniChange,ffExponent,19,4);
  WriteLn(f,S);
  WriteLn(f,'1'); //Create xxdot.dat file (xout.tmp).
  S:=IntToStr(MainStepFactor)+' '+IntToStr(RK78StepFactor)+' ';
  {x3FormulaFlag}
  if UseUVarFormula then
    S:=S+'1'
  else
    S:=S+'0';
  S:=S + ' ' + IntToStr(InternalEquationIndex) {InternalFormulaIndex} + ' ' +
    '1' {XVarNo - not used in this version} + ' ' + IntToStr(NewYVarNo) {'2'} {YVarNo};
  WriteLn(f,S);
  //Write 22 formulas
  for Counter:=0 to 21 do
    WriteLn(f,Formulas.Strings[Counter]);
  Formulas.Free;
{
  WriteLn(f,'(x3^2.0d0+x4^2.0d0+x1^2.0d0+x2^2.0d0)/2.0d0+x1^2.0d0*x2-x2^3.0d0/3.0d0');
  WriteLn(f,'x1+2.0d0*x1*x2');
  WriteLn(f,'x2+x1^2.0d0-x2^2.0d0');
  WriteLn(f,'x3');
  WriteLn(f,'x4');
  WriteLn(f,'1.0d0+2.0d0*x2');
  WriteLn(f,'2.0d0*x1');
  WriteLn(f,'0.0d0');
  WriteLn(f,'0.0d0');
  WriteLn(f,'2.0d0*x1');
  WriteLn(f,'1.0d0-2.0d0*x2');
  WriteLn(f,'0.0d0');
  WriteLn(f,'0.0d0');
  WriteLn(f,'0.0d0');
  WriteLn(f,'0.0d0');
  WriteLn(f,'1.0d0');
  WriteLn(f,'0.0d0');
  WriteLn(f,'0.0d0');
  WriteLn(f,'0.0d0');
  WriteLn(f,'0.0d0');
  WriteLn(f,'1.0d0');
  WriteLn(f,'sqrt(2.0d0*hh-x4^2.0d0-x2^2.0d0+(2.0d0*x2^3.0d0)/3.0d0)');
  }
  CloseFile(f);
  {input.tmp -> OK}
  {Delete err.msg if exists}
  if FileExists(MainForm.ExePath + 'err.msg') then
    if not DeleteFile(MainForm.ExePath + 'err.msg') then
    begin
      sMMShowMessage('Error: Can not delete the file ''err.msg''.');
      ResetView;
      Exit;
    end;
  {Delete end.tmp if exists}
  if FileExists(MainForm.ExePath + 'end.tmp') then
    if not DeleteFile(MainForm.ExePath + 'end.tmp') then
    begin
      DeleteFile(MainForm.ExePath + 'input.tmp');
      sMMShowMessage('IO Error: Can not delete the file ''end.tmp''.');
      ResetView;
      Exit;
    end;
  {Create yydot.dat file}
  if FileExists(MainForm.ExePath + 'yout.tmp') then
    if not DeleteFile(MainForm.ExePath + 'yout.tmp') then
  begin
    DeleteFile(MainForm.ExePath + 'input.tmp');
    sMMShowMessage('Error: Could not access to the file ''yout.tmp''.');
    ResetView;
    Exit;
  end;
  FillChar(tempSec,SizeOf(tempSec),#0);
  tempSec.nLength:=SizeOf(tempSec);
  tempSec.bInheritHandle:=True;
  yydotHandle:=CreateFile(PChar(MainForm.ExePath + 'yout.tmp'),
    GENERIC_READ or GENERIC_WRITE,FILE_SHARE_WRITE or FILE_SHARE_READ,
    @tempSec,CREATE_ALWAYS,FILE_ATTRIBUTE_HIDDEN,0);
  if GetLastError<>0 then
  begin
    DeleteFile(MainForm.ExePath + 'input.tmp');
    sMMShowMessage('Error: Could not access to the file ''yout.tmp''.');
    ResetView;
    Exit;
  end;
  {Create xxdot.dat file}
  if FileExists(MainForm.ExePath + 'xout.tmp') then
    if not DeleteFile(MainForm.ExePath + 'xout.tmp') then
  begin
    DeleteFile(MainForm.ExePath + 'input.tmp');
    sMMShowMessage('Error: Could not access to the file ''xout.tmp''.');
    ResetView;
    Exit;
  end;
  FillChar(tempSec,SizeOf(tempSec),#0);
  tempSec.nLength:=SizeOf(tempSec);
  tempSec.bInheritHandle:=True;
  xxdotHandle:=CreateFile(PChar(MainForm.ExePath + 'xout.tmp'),
    GENERIC_READ or GENERIC_WRITE,FILE_SHARE_WRITE or FILE_SHARE_READ,
    @tempSec,CREATE_ALWAYS,FILE_ATTRIBUTE_HIDDEN,0);
  if GetLastError<>0 then
  begin
    DeleteFile(MainForm.ExePath + 'input.tmp');
    sMMShowMessage('Error: Could not access to the file ''xout.tmp''.');
    Windows.CloseHandle(yydotHandle);
    ResetView;
    Exit;
  end;
  {Create status.tmp}
  if FileExists(MainForm.ExePath + 'status.tmp') then
    if not DeleteFile(MainForm.ExePath + 'status.tmp') then
  begin
    DeleteFile(MainForm.ExePath + 'input.tmp');
    sMMShowMessage('Error: Could not access to the file ''status.tmp''.');
    Windows.CloseHandle(yydotHandle);
    Windows.CloseHandle(xxdotHandle);
    ResetView;
    Exit;
  end;
  FillChar(tempSec,SizeOf(tempSec),#0);
  tempSec.nLength:=SizeOf(tempSec);
  tempSec.bInheritHandle:=True;
  StatusHandle:=CreateFile(PChar(MainForm.ExePath + 'status.tmp'),
    GENERIC_READ or GENERIC_WRITE,FILE_SHARE_WRITE or FILE_SHARE_READ,
    @tempSec,CREATE_ALWAYS,FILE_ATTRIBUTE_HIDDEN,0);
  if GetLastError<>0 then
  begin
    DeleteFile(MainForm.ExePath + 'input.tmp');
    sMMShowMessage('Error: Could not access to the file ''status.tmp''.');
    ResetView;
    Exit;
  end;
  {Execute calc4dh.exe}
  TitlePanel.Caption:='Poincare Section {Calculating...}';
  FillChar(SInfo,SizeOf(SInfo),#0);
  SInfo.cb:=SizeOf(SInfo);
  SInfo.dwFlags:=STARTF_USESHOWWINDOW;
  SInfo.wShowWindow:=SW_HIDE;
  if CreateProcess(PChar(MainForm.ExePath + 'calc4dh.exe'),nil,nil,nil,True,0,nil,PChar(MainForm.ExePath),SInfo,ProcInfo)=False then
  begin
    DeleteFile(MainForm.ExePath + 'input.tmp');
    sMMShowMessage('Error in executing ''calc4dh.exe''.');
    Windows.CloseHandle(yydotHandle);
    Windows.CloseHandle(xxdotHandle);
    Windows.CloseHandle(StatusHandle);
    ResetView;
    Exit;
  end;
  SetPriorityClass(ProcInfo.hProcess,IDLE_PRIORITY_CLASS);
  BackgroundProcess(BackgroundProcessing);
  {Get output}
  TimeLabel.Caption := '00:00:00';
  StartTime := EncodeTime(0,0,0,0);
  TimeLabel.Hint := 'Elapsed Time';
  TimeTimer.Enabled := True;
  NoCalculationError := True;
  if LogErrorMessages then
  begin
    AssignFile(ErrorLogFile,ErrorLogFileName);
    {$I-}
    Rewrite(ErrorLogFile);
    TimeTemp := Time;
    WriteLn(ErrorLogFile,'Calculation started at ' + DateToStr(Date)+ ' ' + TimeToStr(TimeTemp));
    {$I+}
  end;
  OldDateTime := Time;
  KillProcess:=False;
  UserAborted := False;
  OldN1:=0;
  OldN2:=0;
  SetLength(PoincarePoints,0);
  SetLength(XXDotPoints,0);
  SetWorld := False;
  RefreshMathImage;
  SetWorld := True;
  ShowError:=ShowErrorMessages;
  MainForm.DisableEditing;
  MainForm.PoincareSectionCalculationSetupFrame1.DisableEditing;
  CalculationMode := True;
  InternalAppError := False;
  MainStepCount := -1;  //No problem because the first character is a '*' in the status.tmp. 

  TRY

  while not KillProcess do
  begin
    Application.ProcessMessages;
    {Read yydot.dat}
    if ReadFile(yydotHandle,NewS1,MAX_BUFF_LEN,ReadNum1,nil)=False then
    begin
      sMMShowMessage('I/O Error:'+Chr(13)+'Error in reading from the file ''yout.tmp''.');
      KillProcess:=True;
      break;
    end;
    if ReadNum1>0 then
    begin
      NewN1:=ReadNum1;
      while ParseLine(OldS1,OldN1,NewS1,NewN1,NewLine) do
      begin
        S:=ParseString(NewLine,1);
        NewPoint.X:=StrToFloat(S);
        S:=ParseString(NewLine,2);
        NewPoint.Y:=StrToFloat(S);
        SetLength(PoincarePoints,Length(PoincarePoints)+1);
        PoincarePoints[High(PoincarePoints)]:=NewPoint;
      end;
      RefreshGraph:=True;
    end;
    {Read xxdot.dat}
    if ReadFile(xxdotHandle,NewS3,MAX_BUFF_LEN,ReadNum3,nil)=False then
    begin
      sMMShowMessage('I/O Error:'+Chr(13)+'Error in reading from the file ''xout.tmp''.');
      KillProcess:=True;
      break;
    end;
    if ReadNum3>0 then
    begin
      NewN3:=ReadNum3;
      while ParseLine(OldS3,OldN3,NewS3,NewN3,NewLine) do
      begin
        SetLength(XXDotPoints,Length(XXDotPoints)+1);
        XXDotPoints[High(XXDotPoints)].T:=StrToFloat(ParseString(NewLine,1));
        XXDotPoints[High(XXDotPoints)].X:=StrToFloat(ParseString(NewLine,2));
        XXDotPoints[High(XXDotPoints)].XDot:=StrToFloat(ParseString(NewLine,3));
      end;
      RefreshGraph:=True;
    end;
    if ProgressCheck.Checked and RefreshGraph and not (ZoomBox and ZoomingMode) then
    begin
      SetWorld := False;
      RefreshMathImage(False);
      SetWorld := True;
    end;
    PoincareNumOfPointsLabel.Caption:=IntToStr(Length(PoincarePoints));
    PoincareNumOfPointsLabel2.Caption := PoincareNumOfPointsLabel.Caption;
    MainForm.OnCalculationProgress(PoincareCalculationGauge.MinValue,PoincareCalculationGauge.MaxValue,PoincareCalculationGauge.Progress,Length(PoincarePoints));
    {Read status.tmp}
    if ReadFile(StatusHandle,NewS2,MAX_BUFF_LEN,ReadNum2,nil)=False then
    begin
      sMMShowMessage('I/O Error:'+Chr(13)+'Error in reading from the file status.tmp.');
      KillProcess:=True;
      break;
    end;
    if ReadNum2>0 then
    begin
      NewN2:=ReadNum2;
      Progress:=0;
      while ParseLine(OldS2,OldN2,NewS2,NewN2,NewLine) do
        if Trim(NewLine) = '*' then
        begin
          Inc(MainStepCount);
          Progress := 0;
        end
        else
          Progress:=Progress+1;
      PoincareCalculationGauge.Progress:=Trunc(MainStepCount*(NumOfRK78Steps/RK78StepFactor)+Progress);
      if PoincareCalculationGauge.Progress>PoincareCalculationGauge.MaxValue then
        PoincareCalculationGauge.Progress:=PoincareCalculationGauge.MaxValue;
    end;
    if not ProcessExists('calc4dh.exe') and (ReadNum1=0) then
    begin
      KillProcess:=False;
      break;
    end;
    if FileExists(MainForm.ExePath + 'cpause.tmp') and FileExists(MainForm.ExePath + 'err.msg') then
    begin
      NoCalculationError := False;
      if ShowError or LogErrorMessages then
      begin
        AssignFile(f,MainForm.ExePath + 'err.msg');
        {$I-}
        Reset(f);
        S:='';
        ReadLn(f,S);
        while not eof(f) do
        begin
          ReadLn(f,S2);
          S:=S+Chr(13)+S2;
        end;
        CloseFile(f);
        {$I+}
      end
      else
        Sleep(400);
      DeleteFile(MainForm.ExePath + 'err.msg');
      if LogErrorMessages then
      begin
        {$I-}
        WriteLn(ErrorLogFile,' ');
        WriteLn(ErrorLogFile,'-----------------------------------------------');
        TimeTemp := Time;
        WriteLn(ErrorLogFile,'Calculation error at ' + DateToStr(Date)+ ' ' + TimeToStr(TimeTemp) +':');
        WriteLn(ErrorLogFile,S);
        {$I+}
      end;
      if S = WRONG_FILE_VERSION_MESSAGE then
      begin
        sMMMessageDlg('Incorrect ''calc4dh.exe'' file version. Calculation stopped.',mtError,[mbOK],0);
        ShutDownAfterComplete := False;
        KillProcess := True;
      end
      else if Pos('An invalid floating point operation occurred.',S) > 0 then
      begin
        sMMMessageDlg(S,mtError,[mbOK],0);
        ShutDownAfterComplete := False;
        KillProcess := True;
      end
      else if ShowError then
        KillProcess:=not ContinueCalculation(S,ShowError);
      DeleteFile(MainForm.ExePath + 'cpause.tmp');
      if not KillProcess then
      begin
        FillChar(tempSec,SizeOf(tempSec),#0);
        tempSec.nLength:=SizeOf(tempSec);
        tempSec.bInheritHandle:=True;
        tmpHandle:=CreateFile(PChar(MainForm.ExePath + 'resume.tmp'),
          GENERIC_READ or GENERIC_WRITE,FILE_SHARE_WRITE or FILE_SHARE_READ,
          @tempSec,CREATE_ALWAYS,FILE_ATTRIBUTE_HIDDEN,0);
        CloseHandle(tmpHandle);
      end;
    end;
    if MainForm.CanExit and (High(PoincarePoints)>=0) then
      MainForm.CanExit:=False;
    if OutputToDiskEnabled and (MinutesBetween(OldDateTime,Time) >= OutputToDiskDelayTime) then
    begin
      ExportPoincarePointsToFile(OutputFileName,1,2,3,4,5);
      OldDateTime := Time;
    end;  
    Sleep(50);
  end;

  EXCEPT

    KillProcess := True;
    InternalAppError := True;
    NoCalculationError := False;
    if LogErrorMessages then
    begin
      {$I-}
      WriteLn(ErrorLogFile,' ');
      WriteLn(ErrorLogFile,'-----------------------------------------------');
      TimeTemp := Time;
      WriteLn(ErrorLogFile,'Internal application error at ' + DateToStr(Date)+ ' ' + TimeToStr(TimeTemp));
      {$I+}
    end;

  END;

  if KillProcess then
  begin
    TitlePanel.Caption:='Poincare Section {Stopping...}';
    Application.ProcessMessages;
    FillChar(tempSec,SizeOf(tempSec),#0);
    tempSec.nLength:=SizeOf(tempSec);
    tempSec.bInheritHandle:=True;
    tmpHandle:=CreateFile(PChar(MainForm.ExePath + 'end.tmp'),
    GENERIC_READ or GENERIC_WRITE,FILE_SHARE_WRITE or FILE_SHARE_READ,
    @tempSec,CREATE_ALWAYS,FILE_ATTRIBUTE_HIDDEN,0);
    CloseHandle(tmpHandle);
    Sleep(800);
    KillTask('calc4dh.exe');
    DeleteFile(MainForm.ExePath + 'end.tmp');
  end
  else
  begin
    if (PoincareCalculationGauge.MaxValue-PoincareCalculationGauge.Progress)>MIN_PROGRESS_DIFF then
    begin
      Progress:=Trunc((PoincareCalculationGauge.MaxValue-PoincareCalculationGauge.Progress)/10);
      for Counter:=1 to 10 do
      begin
        PoincareCalculationGauge.Progress:=PoincareCalculationGauge.Progress+Progress;
        Application.ProcessMessages;
        Sleep(10);
      end;
    end;
    PoincareCalculationGauge.Progress:=PoincareCalculationGauge.MaxValue;
    Application.ProcessMessages;
    Sleep(100);
  end;
  CalculationMode := False;
  if Length(PoincarePoints) > Length(XXDotPoints) then
    SetLength(XXDotPoints,Length(PoincarePoints));
  CloseHandle(yydotHandle);
  CloseHandle(xxdotHandle);
  CloseHandle(StatusHandle);
  CloseHandle(ProcInfo.hThread);
  CloseHandle(ProcInfo.hProcess);
  if FileExists(MainForm.ExePath + 'input.tmp') then DeleteFile(MainForm.ExePath + 'input.tmp');
  if FileExists(MainForm.ExePath + 'resume.tmp') then DeleteFile(MainForm.ExePath + 'resume.tmp');
  Sleep(400);
  UpdatePointsFromFiles;
  if OutputToDiskEnabled then
    ExportPoincarePointsToFile(OutputFileName,1,2,3,4,5);
  DeleteFile(MainForm.ExePath + 'status.tmp');
  DeleteFile(MainForm.ExePath + 'yout.tmp');
  DeleteFile(MainForm.ExePath + 'xout.tmp');
{  if FileExists(MainForm.ExePath + 'err.msg') then
  begin
    AssignFile(f,MainForm.ExePath + 'err.msg');
    {$I-}
{    Reset(f);
    S:='';
    ReadLn(f,S);
    while not eof(f) do
    begin
      ReadLn(f,S2);
      S:=S+Chr(13)+S2;
    end;
    CloseFile(f);
    {$I+}
{    DeleteFile(MainForm.ExePath + 'err.msg');
    sMMShowMessage('Calculation Error:'+Chr(13)+S);
  end;}
  if LogErrorMessages then
  begin
    {$I-}
    WriteLn(ErrorLogFile);
    if NoCalculationError then
    begin
      WriteLn(ErrorLogFile,'  No errors occurred during calculation.');
      WriteLn(ErrorLogFile);
    end;
    WriteLn(ErrorLogFile,'-----------------------------------------------');
    TimeTemp := Time;
    WriteLn(ErrorLogFile,'Calculation finished at ' + DateToStr(Date)+ ' ' + TimeToStr(TimeTemp));
    CloseFile(ErrorLogFile);
    {$I+}
  end;
  TimeTimer.Enabled := False;
  TimeLabel.Hint := 'Elapsed Time';
  MainForm.RestoreFromTray;
  ResetView;
  TitlePanel.Caption:='Poincare Section Calculation Results';
  MainForm.EnableEditing;
  MainForm.PoincareSectionCalculationSetupFrame1.EnableEditing;
  MainForm.CanExit := (High(PoincarePoints)<0) or OutputToDiskEnabled;
  MainForm.OnCalculationFinished;
  if InternalAppError then
    sMMMessageDlg('Internal application error. Calculation stopped.',mtError,[mbOK],0);
  if ShutDownAfterComplete and not UserAborted then
  begin
    Counter := 1;
    repeat
      ShutDownResult := WindowsExit(EWX_POWEROFF or EWX_FORCE);
      Inc(Counter);
    until (Counter = 5) or ShutDownResult;
  end;
  BackgroundProcess(False);
end;

procedure TPoincareSectionCalculationFrame.ResetView;
begin
  LoadPointsBtn.Enabled:=True;
  PoincareCalculationPanel.Hide;
  PoincareGraphPanel.Top:=24;
  MathImage1.Top:=56;
  MathImage1.Height:=MathImage1.Height+33;
  PoincareLabel2.Visible:=True;
  PoincareNumOfPointsLabel2.Visible:=True;
  RefreshMathImage;
end;

function TPoincareSectionCalculationFrame.ParseLine(var OldS: TBuffer;
  var OldN: Integer; var NewS: TBuffer; var NewN: Integer;
  var ALine: String): Boolean;
var
  i,j,N:Integer;
  L:Integer;
begin
  L:=Length(OldS);
  if (OldN<L) and (NewN>0) then
  begin
    N:=0;
    for i:=OldN+1 to L do
    begin
      Inc(N);
      OldS[i]:=NewS[N];
      if N=NewN then break;
    end;
    OldN:=OldN+N;
    for i:=N+1 to NewN do
      NewS[i-N]:=NewS[i];
    NewN:=NewN-N;
  end;
  Result:=False;
  ALine:='';
  for i:=1 to OldN do
  begin
    if (OldS[i]=Chr(13)) and (i<OldN) then
      if OldS[i+1]=Chr(10) then
      begin
        Result:=True;
        break;
      end;
    ALine:=ALine+Copy(OldS,i,1);
  end;
  if Result then
  begin
    for j:=i+2 to OldN do
      OldS[j-i-1]:=OldS[j];
    OldN:=OldN-i-1;
  end;
end;

function TPoincareSectionCalculationFrame.ReadFileLine(Handle:Windows.THandle;
            var NewLine:String):Boolean;
Type
  TSmallBuffer=array[1..1] of Char;
var
  NumRead:Cardinal;
  ReadBuffer:TSmallBuffer;
begin
  Result:=False;
  NewLine:='';
  repeat
    if ReadFile(Handle,ReadBuffer,1,NumRead,nil)=False then
      Exit;
    NewLine:=NewLine+Copy(ReadBuffer,1,NumRead);
    if (NumRead>0) and (ReadBuffer[1]=Chr(13)) then
    begin
      if ReadFile(Handle,ReadBuffer,1,NumRead,nil)=False then
        Exit;
      NewLine:=NewLine+Copy(ReadBuffer,1,NumRead);
      if (NumRead>0) and (ReadBuffer[1]=Chr(10)) then
      begin
        Delete(NewLine,Length(NewLine)-1,2);
        Break;
      end;
    end;
  until NumRead=0;
  Result:=True;
end;

function TPoincareSectionCalculationFrame.ParseString(const S: String;
  n: Integer): String;
var
  StPos,Order:Integer;
  L:Integer;
begin
  L:=Length(S);
  for StPos:=1 to L do
    if S[StPos]<>' ' then break;
  Result:='';
  if StPos>L then Exit;
  Order:=1;
  while StPos<=L do
  begin
    if Order=n then break;
    while (StPos<L) and (S[StPos]<>' ') do
      Inc(StPos);
    if StPos=L then Exit;
    while (StPos<=L) and (S[StPos]=' ') do
      Inc(StPos);
    if S[StPos]=' ' then Exit;
    Inc(Order);
  end;
  while (StPos<=L) and (S[StPos]<>' ') do
  begin
    Result:=Result+Copy(S,StPos,1);
    Inc(StPos);
  end;
end;

procedure TPoincareSectionCalculationFrame.PoincareStopCalcBtnClick(
  Sender: TObject);
begin
  KillProcess:=True;
  UserAborted := True;
  PoincareStopCalcBtn.Enabled:=False;
end;

function TPoincareSectionCalculationFrame.ProcessExists(const ExeName:String):Boolean;
var
  ContinueLoop:BOOL;
  FSnapshotHandle:THandle;
  FProcessEntry32:TProcessEntry32;
begin
  FSnapshotHandle:=CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS,0);
  FProcessEntry32.dwSize:=SizeOf(FProcessEntry32);
  ContinueLoop:=Process32First(FSnapshotHandle,FProcessEntry32);
  Result:=False;
  while Integer(ContinueLoop)<>0 do
  begin
    if (LowerCase(ExtractFileName(FProcessEntry32.szExeFile))=LowerCase(ExeName))
       or (LowerCase(FProcessEntry32.szExeFile)=LowerCase(ExeName)) then
    begin
      Result:=True;
      CloseHandle(FSnapshotHandle);
      Exit;
    end;
    ContinueLoop:=Process32Next(FSnapshotHandle,FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

procedure TPoincareSectionCalculationFrame.BackgroundProcess(EnableBackgroundProcessing: Boolean);
begin
  if EnableBackgroundProcessing then
    SetPriorityClass(GetCurrentProcess,IDLE_PRIORITY_CLASS)
  else
    SetPriorityClass(GetCurrentProcess,NORMAL_PRIORITY_CLASS);
end;

procedure TPoincareSectionCalculationFrame.ZoomInMenuItemClick(Sender: TObject);
begin
  ZoomBtn.Click;
end;

procedure TPoincareSectionCalculationFrame.MathImagePopupMenuPopup(
  Sender: TObject);
begin
  PreviousViewPopupMenuItem.Enabled := PoincareGraphOptionsFrame1.PreviousViewAvailable;
  ZoomInMenuItem.Checked:=ZoomBtn.Down;
  PanMenuItem.Checked:=PanBtn.Down;
end;

procedure TPoincareSectionCalculationFrame.ZoomOutMenuItemClick(
  Sender: TObject);
begin
  ZoomOutBtn.Click;
end;

procedure TPoincareSectionCalculationFrame.PanMenuItemClick(
  Sender: TObject);
begin
  PanBtn.Click;  
end;

procedure TPoincareSectionCalculationFrame.SaveGraphAsBitmap2Click(
  Sender: TObject);
begin
  SaveGraphAsBitmap1.Click;
end;

procedure TPoincareSectionCalculationFrame.SaveGraphAsMetafile2Click(
  Sender: TObject);
begin
  SaveGraphAsMetafile1.Click;
end;

procedure TPoincareSectionCalculationFrame.CopyToClipboardAsBitmap1Click(
  Sender: TObject);
begin
  CopyBtn.Click;
end;

function TPoincareSectionCalculationFrame.ContinueCalculation(
  const ErrMsg: String;var ShowAgain:Boolean): Boolean;
begin
  MainForm.RestoreFromTray;
  ConfirmForm.MsgLabel.Caption:='Calculation Error:'+Chr(13)+ErrMsg;
  ConfirmForm.ShowAgainCheck.Checked:=False;
  Application.Restore;
  Application.BringToFront;
  Application.ProcessMessages;
  if ConfirmForm.ShowModal=mrYes then
    Result:=True
  else
    Result:=False;
  ShowAgain:=not ConfirmForm.ShowAgainCheck.Checked;
end;

procedure TPoincareSectionCalculationFrame.FitBtnClick(Sender: TObject);
var
  i:Integer;
  MinX,MinY,MaxX,MaxY:Extended;
  P:TExtendedPoint;
begin
  if MainForm.GetPointsHighBound>=1 then
  begin
    P:=MainForm.GetGraphPoint(0);
    MinX:=P.X;
    MaxX:=MinX;
    MinY:=P.Y;
    MaxY:=MinY;
    for i:=1 to MainForm.GetPointsHighBound do
    begin
      P:=MainForm.GetGraphPoint(i);
      with P do
      begin
        if X<MinX then MinX:=X else if X>MaxX then MaxX:=X;
        if Y<MinY then MinY:=Y else if Y>MaxY then MaxY:=Y;
      end;
    end;
    if (MinX=MaxX) then
    begin
      MinX:=MinX-0.1;
      MaxX:=MaxX+0.1;
    end;
    if (MinY=MaxY) then
    begin
      MinY:=MinY-0.1;
      MaxY:=MaxY+0.1;
    end;
    MathImage1.SetWorld(MinX,MinY,MaxX,MaxY);
    SetWorld:=False;
    RefreshMathImage;
    SetWorld:=True;
    PoincareGraphOptionsFrame1.UpdateFields;
  end;
end;

procedure TPoincareSectionCalculationFrame.ZoomOutBtnClick(
  Sender: TObject);
const
  ZoomFactor=(1/10);
var
  RangeX,RangeY:Extended;
  X1,X2,Y1,Y2:Extended;
begin
  with MathImage1 do
  begin
    RangeX:=D2Worldx2-D2WorldX1;
    RangeY:=D2Worldy2-D2WorldY1;
    X1:=D2WorldX1-RangeX*ZoomFactor;
    X2:=D2Worldx2+RangeX*ZoomFactor;
    Y1:=D2WorldY1-RangeY*ZoomFactor;
    Y2:=D2WorldY2+RangeY*ZoomFactor;
    SetWorld(X1,Y1,X2,Y2);
    Self.SetWorld:=False;
    RefreshMathImage;
    Self.SetWorld:=True;
    PoincareGraphOptionsFrame1.UpdateFields;
  end;
end;

procedure TPoincareSectionCalculationFrame.FitMenuItemClick(
  Sender: TObject);
begin
  FitBtn.Click;
end;

procedure TPoincareSectionCalculationFrame.LoadPointsBtnClick(
  Sender: TObject);
var
  P:TPoint;
begin
  P:=(Sender as TsBitBtn).Parent.ClientToScreen(Point((Sender as TsBitBtn).Left,(Sender as TsBitBtn).Top+(Sender as TsBitBtn).Height));
  ImportPopup.Popup(P.X,P.Y);
end;

procedure TPoincareSectionCalculationFrame.CustomExport1Click(
  Sender: TObject);
var
  TOrder,XOrder,XDotOrder,YOrder,YDotOrder:Byte;
  FName,Ext:String;
begin
  TOrder:=0;  XOrder:=0;  XDotOrder:=0;
  YOrder:=1;  YDotOrder:=2;
  case (Sender as TMenuItem).Tag Of
    10:  begin
           TOrder:=0;  XOrder:=0;  XDotOrder:=0;
           YOrder:=1;  YDotOrder:=2;
         end;
    20:  begin
           TOrder:=0;  XOrder:=1;  XDotOrder:=2;
           YOrder:=0;  YDotOrder:=0;
         end;
    100: begin
           if CustomExportForm.ShowModal=mrOK then
           begin
             TOrder:=CustomExportForm.TOrder;
             XOrder:=CustomExportForm.XOrder;
             XDotOrder:=CustomExportForm.XDotOrder;
             YOrder:=CustomExportForm.YOrder;
             YDotOrder:=CustomExportForm.YDotOrder;
           end
           else
             Exit;
         end;
  end;
  SaveDialog1.Filter:='*.dat|*.dat|*.txt|*.txt|All Files(*.*)|*.*';
  SaveDialog1.FilterIndex:=1;
  SaveDialog1.Title:='Export Points To File';
  if SaveDialog1.Execute then
  begin
    FName:=SaveDialog1.FileName;
    case SaveDialog1.FilterIndex of
      1: Ext:='.dat';
      2: Ext:='.txt';
      3: Ext:='';
    end;
    if LowerCase(ExtractFileExt(FName))<>LowerCase(Ext) then
      FName:=FName+Ext;
    ExportPoincarePointsToFile(FName,TOrder,XOrder,XDotOrder,YOrder,YDotOrder);
    MainForm.CanExit:=True;
  end;
end;

procedure TPoincareSectionCalculationFrame.ImportPointsFromFile(
  const FName: String; LayoutIndex: Byte);
var
  F:TextFile;
  I:Integer;
  T,X,XDot,Y,YDot:Extended;
begin
  if (LayoutIndex=0) or (LayoutIndex>5) then
  begin
    sMMShowMessage('Internal error.');
    Exit;
  end;
  AssignFile(F,FName);
  {$I-}
  Reset(F);
  {$I+}
  if IOResult<>0 then
  begin
    sMMShowMessage('Error: Cannot access to the input file.');
    Exit;
  end;
  SetLength(PoincarePoints,0);
  SetLength(XXDotPoints,0);
  T:=0;  X:=0;  XDot:=0;  Y:=0;  YDot:=0;
  I:=0;
  while not(eof(F)) do
  begin
    Inc(I);
    SetLength(PoincarePoints,I);
    SetLength(XXDotPoints,I);
    {$I-}
    case LayoutIndex of
      1: begin
           ReadLn(F,Y,YDot);
         end;
      2: begin
           ReadLn(F,T,Y,YDot);
         end;
      3: ReadLn(F,X,XDot);
      4: ReadLn(F,T,X,XDot);
      5: ReadLn(F,T,X,XDot,Y,YDot);
    end;
    {$I+}
    IOResult;
    PoincarePoints[I-1].X:=Y;
    PoincarePoints[I-1].Y:=YDot;
    XXDotPoints[I-1].T:=T;
    XXDotPoints[I-1].X:=X;
    XXDotPoints[I-1].XDot:=XDot;
  end;
  {$I-}
  CloseFile(F);
  {$I+}
  IOResult;
  if LayoutIndex<>5 then
    sMMShowMessage('All other fields have been filled with zero(0).');
  MainForm.CanExit := True;  
end;

procedure TPoincareSectionCalculationFrame.ImportYYDOT5Click(
  Sender: TObject);
var
  S:String;
begin
  if MainForm.GetPointsHighBound>0 then
    if sMMMessageDlg('If you load points from a file the current points will be lost.'+Chr(13)+'Do you want to continue?',mtConfirmation,[mbYes,mbNo],0)=mrNo then
      Exit;
  OpenDialog1.Filter:='*.dat|*.dat|*.txt|*.txt|All Files(*.*)|*.*';
  OpenDialog1.FilterIndex:=1;
  case (Sender as TMenuItem).Tag of
    1: S:='(Y,YDOT)';
    2: S:='(T,Y,YDOT)';
    3: S:='(X,XDOT)';
    4: S:='(T,X,XDOT)';
    5: S:='(T,X,XDOT,Y,YDOT)';
  end;
  OpenDialog1.Title:='Load '+S+' From a File';
  OpenDialog1OpenBtnCaption := 'Load Points';
  if OpenDialog1.Execute then
  begin
    ImportPointsFromFile(OpenDialog1.FileName,(Sender as TMenuItem).Tag);
    PoincareNumOfPointsLabel2.Caption:=IntToStr(MainForm.GetPointsHighBound+1);
    TimeLabel.Caption := '00:00:00';
    SetWorld:=False;
    RefreshMathImage;
    SetWorld:=True;
    FitBtn.Click;
  end;
  OpenDialog1OpenBtnCaption := 'Open';
end;

procedure TPoincareSectionCalculationFrame.ReplaceVariables(var HFormula,
  x3Formula: String; x1VarNo, x2VarNo, x3VarNo, x4VarNo: Integer;
  var YVarNo: Integer);

  procedure DoReplacement(var Formula: String; const FromVar, ToVar: String);
  var
    StartPos: Integer;
    Token: String;
  begin
    StartPos := 1;
    repeat
      MainForm.GetNextToken(StartPos,Formula,Token);
      Token := LowerCase(Token);
      if Token = LowerCase(FromVar) then
      begin
        Delete(Formula,StartPos-1-Length(FromVar),Length(FromVar));
        Insert(ToVar,Formula,StartPos-1-Length(FromVar));
      end else if Token = LowerCase(ToVar) then
      begin
        Delete(Formula,StartPos-1-Length(ToVar),Length(ToVar));
        Insert(FromVar,Formula,StartPos-1-Length(ToVar));
      end;
    until StartPos > Length(Formula);
  end;

var
  OldYVarPos: Integer;
begin
  OldYVarPos := Pos('x'+IntToStr(YVarNo),HFormula);
  DoReplacement(HFormula,'x'+IntToStr(x1VarNo),'x1');
  DoReplacement(x3Formula,'x'+IntToStr(x1VarNo),'x1');
  if (x1VarNo <> 3) or (x3VarNo <> 1) then
  begin
    VariableReplacementMode := 1;
    DoReplacement(HFormula,'x'+IntToStr(x3VarNo),'x3');
    DoReplacement(x3Formula,'x'+IntToStr(x3VarNo),'x3');
  end
  else
    VariableReplacementMode := 2;
  if OldYVarPos > 0 then
    YVarNo := StrToInt(Copy(HFormula,OldYVarPos+1,1));
end;

procedure TPoincareSectionCalculationFrame.GenerateFormulas(
  HFormula: String; Formulas: TStringList);
var
  Diff: DiffExpress.TDiffExpress;
  i, j: Integer;
begin
  Diff:=Diffexpress.TDiffExpress.Create(nil);
  Formulas.Sorted := False;
  for i:=1 to 4 do
  begin
    Diff.Formula:=HFormula;
    Diff.Formula:=Diff.diff('x'+IntToStr(i));
    Formulas.Insert(i,Diff.Formula);
    for j:=1 to 4 do
      Formulas.Append(Diff.diff('x'+IntToStr(j)));
  end;
  Diff.Free;
end;

procedure TPoincareSectionCalculationFrame.NormalizeFormulas(
  Formulas: TStringList);
var
  StartPos, ErrCode, i: Integer;
  Token, Formula: String;
  exTemp: Extended;
begin
  for i:=0 to Formulas.Count - 1 do
  begin
    Formula := Formulas.Strings[i];
    StartPos := 1;
    Token := '';
    repeat
      MainForm.GetNextToken(StartPos,Formula,Token);
      val(Token,exTemp,ErrCode);
      if (ErrCode = 0) and (Pos('.',Token) < 1) then
      begin
        Insert('.',Formula,StartPos-1);
        Inc(StartPos);
      end;
      if LowerCase(Token) = 'h' then
      begin
        Insert('h',Formula,StartPos-1);
        Inc(StartPos);
      end;
    until StartPos > Length(Formula);
    Formulas.Strings[i] := Formula;
  end;
end;

procedure TPoincareSectionCalculationFrame.TitlePanelResize(
  Sender: TObject);
begin
  BackToSetupBtn.Left:=TitlePanel.Width - 167;
end;

procedure TPoincareSectionCalculationFrame.PreviousViewPopupMenuItemClick(
  Sender: TObject);
begin
  PoincareGraphOptionsFrame1.PreviousView;
  SetWorld := True;
  RefreshMathImage;
end;

procedure TPoincareSectionCalculationFrame.TimeTimerTimer(Sender: TObject);
var
  S: String;
begin
  StartTime := IncSecond(StartTime);
  S := LongTimeFormat;
  LongTimeFormat := 'hh:mm:ss';
  TimeLabel.Caption := TimeToStr(StartTime);
  LongTimeFormat := S;
end;

function TPoincareSectionCalculationFrame.WindowsExit(
  ExitFlags: LongWord): Boolean;
var
   TokenHandle: THandle;
   NewTokenPrivileges: TTokenPrivileges;
   RequiredStructureSize: Cardinal;
const
   SE_SHUTDOWN_PRIVILEGE_NAME = 'SeShutdownPrivilege';
begin
  if Win32Platform = VER_PLATFORM_WIN32_NT then
    if OpenProcessToken(GetCurrentProcess(),TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY,TokenHandle) then
      if LookupPrivilegeValue(nil,SE_SHUTDOWN_PRIVILEGE_NAME,NewTokenPrivileges.Privileges[0].Luid) then
      begin
        NewTokenPrivileges.PrivilegeCount := 1;
        NewTokenPrivileges.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
        RequiredStructureSize := 0;
        Windows.AdjustTokenPrivileges(TokenHandle,False,NewTokenPrivileges,0,nil,RequiredStructureSize)
      end;
  Result := ExitWindowsEx(ExitFlags, 0);
end;

procedure TPoincareSectionCalculationFrame.OpenDialog1Show(
  Sender: TObject);
begin
  SendMessage(GetParent(OpenDialog1.Handle), CDM_SETCONTROLTEXT, IDOK,
    LongInt(Pchar(OpenDialog1OpenBtnCaption)));
end;

procedure TPoincareSectionCalculationFrame.UpdatePointsFromFiles;
var
  F: TextFile;
  I: Integer;
  NumOfLines: Integer;
begin
  //Read 'yout.tmp'
  AssignFile(F,MainForm.ExePath + 'yout.tmp');
  {$I-}
  Reset(F);
  {$I+}
  if IOResult <> 0 then
  begin
    sMMShowMessage('I/O error.');
    Exit;
  end;
  if not UserAborted then
  begin
    SetLength(PoincarePoints,0);
    SetLength(XXDotPoints,0);
    while not eof(F) do
    begin
      SetLength(PoincarePoints,Length(PoincarePoints)+1);
      {$I-}
      ReadLn(F,PoincarePoints[Length(PoincarePoints)-1].X,PoincarePoints[Length(PoincarePoints)-1].Y);
      {$I+}
      if IOResult <> 0 then
      begin
        sMMShowMessage('I/O error.');
        Break;
      end;
    end;
    NumOfLines := Length(PoincarePoints);
    SetLength(XXDotPoints,NumOfLines);
  end
  else
  begin
    NumOfLines := Length(PoincarePoints);
    SetLength(XXDotPoints,NumOfLines);
    for i:= 1 to NumOfLines do
    begin
      {$I-}
      ReadLn(F,PoincarePoints[i-1].X,PoincarePoints[i-1].Y);
      {$I+}
      if IOResult <> 0 then
      begin
        sMMShowMessage('I/O error.');
        Break;
      end;
    end;
  end;
  {$I-}
  CloseFile(F);
  {$I+}
  IOResult;
  //Read 'xout.tmp'
  AssignFile(F,MainForm.ExePath + 'xout.tmp');
  {$I-}
  Reset(F);
  {$I+}
  if IOResult <> 0 then
  begin
    sMMShowMessage('I/O error.');
    Exit;
  end;
  for i:= 1 to NumOfLines do
  begin
    {$I-}
    ReadLn(F,XXDotPoints[i-1].T,XXDotPoints[i-1].X,XXDotPoints[i-1].XDot);
    {$I+}
    if IOResult <> 0 then
    begin
      sMMShowMessage('I/O error.');
      Break;
    end;
  end;
  {$I-}
  CloseFile(F);
  {$I+}
  PoincareNumOfPointsLabel2.Caption := IntToStr(Length(PoincarePoints));
end;

end.
