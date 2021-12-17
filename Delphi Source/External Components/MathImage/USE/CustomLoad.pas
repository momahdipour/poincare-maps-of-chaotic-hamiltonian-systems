unit CustomLoad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Spin;

type
  TCustomLoadForm = class(TForm)
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    XColSpin: TSpinEdit;
    YColSpin: TSpinEdit;
    FNameLabel: TStaticText;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    OpenDialog1: TOpenDialog;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CustomLoadPointsFromFile(const fname: String); 
  end;

var
  CustomLoadForm: TCustomLoadForm;

implementation

uses
  Unit1;

{$R *.dfm}

procedure TCustomLoadForm.BitBtn3Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    FNameLabel.Caption:=OpenDialog1.FileName;
end;

procedure TCustomLoadForm.CustomLoadPointsFromFile(const fname: String);
var
  f:TextFile;
  XCol,YCol:Integer;
  xv,yv,Temp:Extended;
  i:Integer;
begin
  AssignFile(f,fname);
  reset(f);
  Unit1.Size:=0;
  XCol:=XColSpin.Value;
  YCol:=YColSpin.Value;
  while(not(eof(f))) do
  begin
    Inc(Unit1.Size);
    SetLength(Unit1.x,Unit1.Size);
    SetLength(Unit1.y,Unit1.Size);
    if XCol<=YCol then
    begin
      for i:=1 to (XCol-1) do
        Read(f,Temp);
      Read(f,xv);
      if XCol=YCol then
        yv:=xv
      else
      begin
        for i:=XCol to (YCol-2) do
          Read(f,Temp);
        Read(f,yv);
      end;
    end
    else
    begin
      for i:=1 to (YCol-1) do
        Read(f,Temp);
      Read(f,yv);
      for i:=YCol to (XCol-2) do
        Read(f,Temp);
      Read(f,xv);
    end;
    Unit1.x[Unit1.Size-1]:=xv;
    Unit1.y[Unit1.Size-1]:=yv;
    ReadLn(f);
  end;
  CloseFile(f);
  Form1.ResetBtn.Click;
end;

procedure TCustomLoadForm.BitBtn1Click(Sender: TObject);
begin
  CustomLoadPointsFromFile(FNameLabel.Caption);
end;

procedure TCustomLoadForm.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TCustomLoadForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key)=VK_ESCAPE then
    Close;
end;

end.
