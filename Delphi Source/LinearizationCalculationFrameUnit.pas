unit LinearizationCalculationFrameUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, sPanel, StdCtrls, sLabel, sEdit, Spin, sSkinProvider,
  sAlphaListBox, Buttons, sBitBtn, sGauge;

type
  TLinearizationCalculationFrame = class(TFrame)
    sPanel1: TsPanel;
    Label1: TLabel;
    sPanel2: TsPanel;
    nSpinEdit: TSpinEdit;
    sPanel3: TsPanel;
    sLabel5: TsLabel;
    sLabel6: TsLabel;
    sLabel7: TsLabel;
    sListBox1: TsListBox;
    Seperator2: TsPanel;
    sBitBtn1: TsBitBtn;
    sBitBtn2: TsBitBtn;
    sBitBtn3: TsBitBtn;
    sBitBtn4: TsBitBtn;
    sBitBtn5: TsBitBtn;
    sBitBtn6: TsBitBtn;
    InitialCountLabel: TsLabel;
    sLabel3: TsLabel;
    sLabel2: TsLabel;
    sLabel1: TsLabel;
    sBitBtn8: TsBitBtn;
    sBitBtn7: TsBitBtn;
    procedure nSpinEditChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TLinearizationCalculationFrame.nSpinEditChange(Sender: TObject);
begin
  InitialCountLabel.Caption:=IntToStr(4*nSpinEdit.Value+2);
end;

end.
