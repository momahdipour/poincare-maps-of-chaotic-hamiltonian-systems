unit IntroductionFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, sLabel, ExtCtrls, sPanel, jpeg, Buttons, sBitBtn;

type
  TIntroductionFrame = class(TFrame)
    sPanel1: TsPanel;
    sLabel1: TsLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    NextBtn: TsBitBtn;
    PrevBtn: TsBitBtn;
    procedure NextBtnClick(Sender: TObject);
    procedure PrevBtnClick(Sender: TObject);
    procedure FrameResize(Sender: TObject);
  private
    { Private declarations }
    Images:array[1..10] of TImage;
    ActiveImage:Integer;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);override;
  end;

implementation

{$R *.dfm}

{ TIntroductionFrame }

constructor TIntroductionFrame.Create(AOwner: TComponent);
var
  i:Integer;
begin
  inherited;
  Images[1]:=Image1;
  Images[2]:=Image2;
  Images[3]:=Image3;
  Images[4]:=Image4;
  Images[5]:=Image5;
  Images[6]:=Image6;
  Images[7]:=Image7;
  Images[8]:=Image8;
  Images[9]:=Image9;
  Images[10]:=Image10;
  ActiveImage:=1;
  for i:=1 to 10 do
  begin
    Images[i].Visible:=False;
    Images[i].Top:=52;
  end;
  Images[ActiveImage].Visible:=True;
end;

procedure TIntroductionFrame.NextBtnClick(Sender: TObject);
var
  i:Integer;
begin
  Inc(ActiveImage);
  for i:=1 to 10 do
    Images[i].Visible:=False;
  Images[ActiveImage].Visible:=True;
  NextBtn.Enabled:=ActiveImage<10;
  PrevBtn.Enabled:=True;
end;

procedure TIntroductionFrame.PrevBtnClick(Sender: TObject);
var
  i:Integer;
begin
  Dec(ActiveImage);
  for i:=1 to 10 do
    Images[i].Visible:=False;
  Images[ActiveImage].Visible:=True;
  NextBtn.Enabled:=True;
  PrevBtn.Enabled:=ActiveImage>1;
end;

procedure TIntroductionFrame.FrameResize(Sender: TObject);
const
  MIN_H=600;
var
  i:Integer;
  L:Integer;
begin
  L:=Trunc(Width/2-Images[1].Width/2)+5;
  for i:=1 to 10 do
  begin
    Images[i].Left:=L;
    Images[i].AutoSize:=Height>=MIN_H;
    Images[i].Stretch:=Height<MIN_H;
    if Height<MIN_H then
      Images[i].Height:=Height-100;
  end;
  PrevBtn.Left:=L+123;
  NextBtn.Left:=L+438;
  PrevBtn.Top:=Images[1].Top+Images[1].Height+5;
  NextBtn.Top:=PrevBtn.Top;
end;

end.
