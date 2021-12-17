unit PoincareGraphOptionsFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sCheckBox,
  ExtCtrls, sPanel, sLabel, sEdit, Buttons,
  sBitBtn, MathImge, FontDialog, sMMColorSelector,
  sMMDialogs, JLAqua;

type
  TGraphInformationRec = record
    BackgroundColor, PointsColor, FrameColor, AxesColor, LabelsColor: TColor;
    DrawZerolines: Boolean;
    ZerolinesColor: TColor;
    TitleFont: TFont;
    TitleText: String;
    YAxisMin, YAxisMax, YDotAxisMin, YDotAxisMax: Extended;
  end;
  TRefreshProc=procedure(FullRefresh:Boolean=True) of object;
  TPoincareGraphOptionsFrame = class(TFrame)
    AppearancePanel: TsPanel;
    sPanel5: TsPanel;
    sLabel12: TsLabel;
    sLabel13: TsLabel;
    sLabel14: TsLabel;
    sLabel15: TsLabel;
    sLabel16: TsLabel;
    BKColorSelector: TsMMColorSelector;
    PointsColorSelector: TsMMColorSelector;
    FrameColorSelector: TsMMColorSelector;
    AxesColorSelector: TsMMColorSelector;
    LabelsColorSelector: TsMMColorSelector;
    sPanel4: TsPanel;
    ZerolinesColorSelector: TsMMColorSelector;
    DrawZerolinesCheck: TsCheckBox;
    sLabel1: TsLabel;
    sPanel6: TsPanel;
    sLabel2: TsLabel;
    TitleEdit: TsEdit;
    sBitBtn1: TsBitBtn;
    BoundsPanel: TsPanel;
    sPanel2: TsPanel;
    sLabel3: TsLabel;
    sLabel4: TsLabel;
    YAxisMinEdit: TsEdit;
    YAxisMaxEdit: TsEdit;
    sPanel3: TsPanel;
    sLabel5: TsLabel;
    sLabel6: TsLabel;
    YDOTAxisMinEdit: TsEdit;
    YDOTAxisMaxEdit: TsEdit;
    sLabel11: TsLabel;
    sLabel17: TsLabel;
    ApplyBtn2: TsBitBtn;
    sPanel1: TsPanel;
    AppearanceBtn: TsBitBtn;
    BoundsBtn: TsBitBtn;
    DataBtn: TsBitBtn;
    DataPanel: TsPanel;
    sPanel7: TsPanel;
    HTCheck: TsCheckBox;
    HXCheck: TsCheckBox;
    HXDotCheck: TsCheckBox;
    HYCheck: TsCheckBox;
    HYDotCheck: TsCheckBox;
    sLabel7: TsLabel;
    JLAqua2: TJLAqua;
    sPanel8: TsPanel;
    VTCheck: TsCheckBox;
    VXCheck: TsCheckBox;
    VXDotCheck: TsCheckBox;
    VYCheck: TsCheckBox;
    VYDotCheck: TsCheckBox;
    JLAqua3: TJLAqua;
    procedure ApplyBtn2Click(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
    procedure AppearanceBtnClick(Sender: TObject);
    procedure BoundsBtnClick(Sender: TObject);
    procedure DataBtnClick(Sender: TObject);
    procedure HTCheckClick(Sender: TObject);
    procedure VTCheckClick(Sender: TObject);
    procedure DataBtnEnter(Sender: TObject);
    procedure BoundsBtnEnter(Sender: TObject);
    procedure AppearanceBtnEnter(Sender: TObject);
    procedure YAxisMinEditKeyPress(Sender: TObject; var Key: Char);
    procedure TitleEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    HChecking,VChecking:Boolean;
    HorizontalIndex,VerticalIndex:Byte;
    OldHorizontalIndex,OldVerticalIndex:Byte;
    HorizontalChecks,VerticalChecks:array[1..5] of TsCheckBox;
    PreviousAxisBounds: array[1..4] of Extended;
    procedure RefreshGraphInformationRec;
  public
    { Public declarations }
    RefreshProc:TRefreshProc;
    RelatedMathImage:TMathImage;
    GraphInformation: TGraphInformationRec;
    constructor Create(AOwner:TComponent);override;
    destructor Destroy; override;
    procedure UpdateFields;
    function StrToFloatNumber(const Str: String; var Number: Extended): Boolean;
    procedure PreviousView;
    function PreviousViewAvailable: Boolean;
  end;

implementation
uses
  PoincareCalculationFrame, MainUnit, Math;

{$R *.dfm}

procedure TPoincareGraphOptionsFrame.ApplyBtn2Click(Sender: TObject);
const
  S1:String='Please enter a valid value for ';
  MinS:String='minimum ';
  MaxS:String='maximum ';
  S2:String='value of the ';
  S3:String=' axis.';
var
  v:Extended;
  ErrCode:Integer;
begin
  YAxisMinEdit.Text := Trim(YAxisMinEdit.Text);
  YAxisMaxEdit.Text := Trim(YAxisMaxEdit.Text);
  YDOTAxisMinEdit.Text := Trim(YDOTAxisMinEdit.Text);
  YDOTAxisMaxEdit.Text := Trim(YDOTAxisMaxEdit.Text);
  val(YAxisMinEdit.Text,v,ErrCode);
  if ErrCode<>0 then
    sMMMessageDlg(S1+MinS+S2+'Y'+S3,mtError,[mbOK],0);
  if ErrCode=0 then
  begin
    val(YAxisMaxEdit.Text,v,ErrCode);
    if ErrCode<>0 then
      sMMMessageDlg(S1+MaxS+S2+'Y'+S3,mtError,[mbOK],0);
  end;
  if ErrCode=0 then
  begin
    val(YDOTAxisMinEdit.Text,v,ErrCode);
    if ErrCode<>0 then
      sMMMessageDlg(S1+MinS+S2+'YDOT'+S3,mtError,[mbOK],0);
  end;
  if ErrCode=0 then
  begin
    val(YDOTAxisMaxEdit.Text,v,ErrCode);
    if ErrCode<>0 then
      sMMMessageDlg(S1+MaxS+S2+'YDOT'+S3,mtError,[mbOK],0);
  end;
  MainForm.PoincareSectionCalculationFrame1.HorizontalDataIndex:=HorizontalIndex;
  MainForm.PoincareSectionCalculationFrame1.VerticalDataIndex:=VerticalIndex;
  if (ErrCode=0) and Assigned(RefreshProc) then
  begin
    RefreshGraphInformationRec;
    RefreshProc;
    if (VerticalIndex<>OldVerticalIndex) or (HorizontalIndex<>OldHorizontalIndex) then
      MainForm.PoincareSectionCalculationFrame1.FitBtn.Click;
  end;
end;

procedure TPoincareGraphOptionsFrame.UpdateFields;
var
  YMin, YMax, YDotMin, YDotMax: Extended;
begin
  if Assigned(RelatedMathImage) then
    with RelatedMathImage do
    begin
      if StrToFloatNumber(YAxisMinEdit.Text,YMin) and
         StrToFloatNumber(YAxisMaxEdit.Text,YMax) and
         StrToFloatNumber(YDOTAxisMinEdit.Text,YDotMin) and
         StrToFloatNumber(YDOTAxisMaxEdit.Text,YDotMax) and
         (YAxisMinEdit.Text<>FloatToStrF(D2WorldX1,ffGeneral,20,20)) and
         (YAxisMaxEdit.Text<>FloatToStrF(D2WorldX2,ffGeneral,20,20)) and
         (YDOTAxisMinEdit.Text<>FloatToStrF(D2WorldY1,ffGeneral,20,20)) and
         (YDOTAxisMaxEdit.Text<>FloatToStrF(D2WorldY2,ffGeneral,20,20)) then
       begin
         PreviousAxisBounds[1] := YMin;
         PreviousAxisBounds[2] := YMax;
         PreviousAxisBounds[3] := YDotMin;
         PreviousAxisBounds[4] := YDotMax;
       end;
      YAxisMinEdit.Text:=FloatToStrF(D2WorldX1,ffGeneral,20,20);
      YAxisMaxEdit.Text:=FloatToStrF(D2WorldX2,ffGeneral,20,20);
      YDOTAxisMinEdit.Text:=FloatToStrF(D2WorldY1,ffGeneral,20,20);
      YDOTAxisMaxEdit.Text:=FloatToStrF(D2WorldY2,ffGeneral,20,20);
    end;
  HorizontalIndex:=MainForm.PoincareSectionCalculationFrame1.HorizontalDataIndex;
  OldHorizontalIndex:=HorizontalIndex;
  HorizontalChecks[HorizontalIndex].Checked:=True;
  VerticalIndex:=MainForm.PoincareSectionCalculationFrame1.VerticalDataIndex;
  OldVerticalIndex:=VerticalIndex;
  VerticalChecks[VerticalIndex].Checked:=True;
end;

procedure TPoincareGraphOptionsFrame.sBitBtn1Click(Sender: TObject);
var
  FD:FontDialog.TFontDialog;
begin
  FD:=FontDialog.TFontDialog.Create(nil);
  FD.Font.Assign(TitleEdit.Font);
  if FD.Execute then
    TitleEdit.Font.Assign(FD.Font);
  FD.Free;  
end;

procedure TPoincareGraphOptionsFrame.AppearanceBtnClick(Sender: TObject);
begin
  AppearancePanel.BringToFront;
  BoundsBtn.Down:=False;
  AppearanceBtn.Down:=True;
  DataBtn.Down:=False;
end;

procedure TPoincareGraphOptionsFrame.BoundsBtnClick(Sender: TObject);
begin
  BoundsPanel.BringToFront;
  BoundsBtn.Down:=True;
  AppearanceBtn.Down:=False;
  DataBtn.Down:=False;
end;

procedure TPoincareGraphOptionsFrame.DataBtnClick(Sender: TObject);
begin
  DataPanel.BringToFront;
  BoundsBtn.Down:=False;
  AppearanceBtn.Down:=False;
  DataBtn.Down:=True;
end;

procedure TPoincareGraphOptionsFrame.HTCheckClick(Sender: TObject);
var
  i:Integer;
begin
  if HChecking then Exit;
  HChecking:=True;
  for i:=1 to 5 do
    HorizontalChecks[i].Checked:=False;
  (Sender as TsCheckBox).Checked:=True;
  HorizontalIndex:=(Sender as TsCheckBox).Tag;
  HChecking:=False;
end;

procedure TPoincareGraphOptionsFrame.VTCheckClick(Sender: TObject);
var
  i:Integer;
begin
  if VChecking then Exit;
  VChecking:=True;
  for i:=1 to 5 do
    VerticalChecks[i].Checked:=False;
  (Sender as TsCheckBox).Checked:=True;
  VerticalIndex:=(Sender as TsCheckBox).Tag;
  VChecking:=False;
end;

constructor TPoincareGraphOptionsFrame.Create(AOwner: TComponent);
var
  i: Integer;
begin
  inherited;
  HorizontalChecks[1]:=HTCheck;
  HorizontalChecks[2]:=HXCheck;
  HorizontalChecks[3]:=HXDotCheck;
  HorizontalChecks[4]:=HYCheck;
  HorizontalChecks[5]:=HYDotCheck;
  //----------------------------------------------
  VerticalChecks[1]:=VTCheck;
  VerticalChecks[2]:=VXCheck;
  VerticalChecks[3]:=VXDotCheck;
  VerticalChecks[4]:=VYCheck;
  VerticalChecks[5]:=VYDotCheck;
  //----------------------------------------------
  for i:=1 to 4 do
     PreviousAxisBounds[i] := 0;
  //----------------------------------------------
  GraphInformation.TitleFont := TFont.Create;
  RefreshGraphInformationRec;
end;

procedure TPoincareGraphOptionsFrame.DataBtnEnter(Sender: TObject);
begin
   DataBtn.Click;
end;

procedure TPoincareGraphOptionsFrame.BoundsBtnEnter(Sender: TObject);
begin
  BoundsBtn.Click;
end;

procedure TPoincareGraphOptionsFrame.AppearanceBtnEnter(Sender: TObject);
begin
  AppearanceBtn.Click;
end;

procedure TPoincareGraphOptionsFrame.PreviousView;
var
  YMin, YMax, YDotMin, YDotMax: Extended;
  StoreBounds: Boolean;
begin
  if PreviousViewAvailable then
  begin
    StoreBounds := StrToFloatNumber(YAxisMinEdit.Text,YMin) and
                   StrToFloatNumber(YAxisMaxEdit.Text,YMax) and
                   StrToFloatNumber(YDOTAxisMinEdit.Text,YDotMin) and
                   StrToFloatNumber(YDOTAxisMaxEdit.Text,YDotMax);
    YAxisMinEdit.Text:=FloatToStrF(PreviousAxisBounds[1],ffGeneral,20,20);
    YAxisMaxEdit.Text:=FloatToStrF(PreviousAxisBounds[2],ffGeneral,20,20);
    YDOTAxisMinEdit.Text:=FloatToStrF(PreviousAxisBounds[3],ffGeneral,20,20);
    YDOTAxisMaxEdit.Text:=FloatToStrF(PreviousAxisBounds[4],ffGeneral,20,20);
    RefreshGraphInformationRec;
    if StoreBounds then
    begin
      PreviousAxisBounds[1] := YMin;
      PreviousAxisBounds[2] := YMax;
      PreviousAxisBounds[3] := YDotMin;
      PreviousAxisBounds[4] := YDotMax;
    end;
  end;
end;

function TPoincareGraphOptionsFrame.StrToFloatNumber(const Str: String;
  var Number: Extended): Boolean;
var
  ErrCode: Integer;
  exTemp: Extended;
begin
  val(Str,exTemp,ErrCode);
  if ErrCode = 0 then
  begin
    Number := exTemp;
    Result := True;
  end
  else
    Result := False;
end;

function TPoincareGraphOptionsFrame.PreviousViewAvailable: Boolean;
begin
  Result := (PreviousAxisBounds[1] = 0) and
            (PreviousAxisBounds[2] = 0) and
            (PreviousAxisBounds[3] = 0) and
            (PreviousAxisBounds[4] = 0);
  Result := not Result;
end;

procedure TPoincareGraphOptionsFrame.YAxisMinEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = ' ') or (Ord(Key) = VK_ESCAPE) then
    Key := Chr(0)
  else if Ord(Key) = VK_RETURN then
  begin
    Key := Chr(0);
    ApplyBtn2.Click;
  end;  
end;

procedure TPoincareGraphOptionsFrame.TitleEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Ord(Key) = VK_RETURN then
  begin
    Key := Chr(0);
    ApplyBtn2.Click;
  end
  else if Ord(Key) = VK_ESCAPE then
    Key := Chr(0); 
end;

destructor TPoincareGraphOptionsFrame.Destroy;
begin
  GraphInformation.TitleFont.Free;
  inherited;
end;

procedure TPoincareGraphOptionsFrame.RefreshGraphInformationRec;
begin
  with GraphInformation do
  begin
    BackgroundColor := BKColorSelector.ColorValue;
    PointsColor := PointsColorSelector.ColorValue;
    FrameColor := FrameColorSelector.ColorValue;
    AxesColor := AxesColorSelector.ColorValue;
    LabelsColor := LabelsColorSelector.ColorValue;
    DrawZerolines := DrawZerolinesCheck.Checked;
    ZerolinesColor := ZerolinesColorSelector.ColorValue;
    TitleText := TitleEdit.Text;
    TitleFont.Assign(TitleEdit.Font);
    //////////////////////////////////////////////
    YAxisMin := StrToFloat(YAxisMinEdit.Text);
    YAxisMax := StrToFloat(YAxisMaxEdit.Text);
    YDotAxisMin := StrToFloat(YDOTAxisMinEdit.Text);
    YDotAxisMax := StrToFloat(YDOTAxisMaxEdit.Text);
  end;
end;

end.
