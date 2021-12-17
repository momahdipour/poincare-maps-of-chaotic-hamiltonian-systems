unit KeyPadFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sSkinProvider, ExtCtrls, sPanel, Buttons;

type
  TKeyPadForm = class(TForm)
    sSkinProvider1: TsSkinProvider;
    sPanel2: TsPanel;
    Zero: TSpeedButton;
    Point: TSpeedButton;
    Seven: TSpeedButton;
    Eight: TSpeedButton;
    Nine: TSpeedButton;
    Four: TSpeedButton;
    Five: TSpeedButton;
    Six: TSpeedButton;
    One: TSpeedButton;
    Two: TSpeedButton;
    Three: TSpeedButton;
    sPanel1: TsPanel;
    Minus: TSpeedButton;
    Plus: TSpeedButton;
    Multiply: TSpeedButton;
    Divide: TSpeedButton;
    LeftParen: TSpeedButton;
    RightParen: TSpeedButton;
    Power: TSpeedButton;
    sPanel3: TsPanel;
    sin: TSpeedButton;
    cos: TSpeedButton;
    tan: TSpeedButton;
    sinh: TSpeedButton;
    cosh: TSpeedButton;
    tanh: TSpeedButton;
    asin: TSpeedButton;
    acos: TSpeedButton;
    atan: TSpeedButton;
    sPanel4: TsPanel;
    ln: TSpeedButton;
    exp: TSpeedButton;
    sqrt: TSpeedButton;
    EditPanel: TsPanel;
    Clear: TSpeedButton;
    BackSpace: TSpeedButton;
    VarPanel: TsPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Button1: TSpeedButton;
    BackgroundPanel: TsPanel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FhButton: Boolean;
    procedure SethButton(AhButton: Boolean);
  public
    { Public declarations }
    property hButton: Boolean read FhButton write SethButton;
  end;

implementation

{$R *.dfm}

{ TKeyPadForm }

procedure TKeyPadForm.SethButton(AhButton: Boolean);
begin
  FhButton := AhButton;
  Button1.Visible := FhButton;
  if FhButton then
  begin
    BackSpace.Width := 36;
    EditPanel.Left := 142;
    EditPanel.Width := 70;
    VarPanel.Width := 138;
  end
  else
  begin
    BackSpace.Width := 63;
    EditPanel.Width := 97;
    EditPanel.Left := 115;
    EditPanel.Width := 97;
    VarPanel.Width := 111;
  end;
end;

procedure TKeyPadForm.FormCreate(Sender: TObject);
begin
  SethButton(False);
end;

end.
