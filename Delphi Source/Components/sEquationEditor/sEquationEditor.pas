{
  TsEquationEditor Component
  Author: M. Mahdipour
  An equation editor using AlphaControls
}

unit sEquationEditor;

interface

uses
  SysUtils, Classes, Controls, StdCtrls, Buttons, sBitBtn,
  KeyPadFormUnit, Forms, Types, Windows;

const
  SEPARATOR_COUNT = 7;
  Separators:array[1..SEPARATOR_COUNT] of String = (
              '+' , '-' , '*' , '/' , '^' , '(' , ')'
              );
  FUNCTION_COUNT = 16;
  Functions:array[1..FUNCTION_COUNT] of String = (
              'sqrt(' , 'exp(' , 'ln(' ,
              'sin(' , 'sinh(' , 'asin(' ,
              'cos(' , 'cosh(' , 'acos(' ,
              'tan(' , 'tanh(' , 'atan(' ,
              'x1' , 'x2' , 'x3' , 'x4'
              );
type
  TsEquationEditor = class(TsBitBtn)
  private
    { Private declarations }
    FEquationEditBox:TEdit;
    FErrorLabel:TCustomLabel;
    EqKeyPadForm:TKeyPadForm;
    procedure MainButtonClick(Sender: TObject);
    procedure KeyPadButtonClick(Sender: TObject);
    procedure KeyPadFormDeactivate(Sender: TObject);
    procedure KeyPadFormKeyPress(Sender: TObject; var Key: Char);
    procedure PopupKeyPad;
    procedure HideKeyPad;
    procedure BackSpace;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
  published
    { Published declarations }
    property EquationEditBox:TEdit read FEquationEditBox write FEquationEditBox;
    property ErrorLabel:TCustomLabel read FErrorLabel write FErrorLabel;
    property KeyPad: TKeyPadForm read EqKeyPadForm;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('AlphaLite', [TsEquationEditor]);
end;

{ TsEquationEditor }

constructor TsEquationEditor.Create(AOwner:TComponent);
var
  i:Integer;
begin
  inherited;
  EqKeyPadForm:=TKeyPadForm.Create(nil);
  for i:=0 to EqKeyPadForm.ComponentCount - 1 do
    if EqKeyPadForm.Components[i].Tag > 0 then
      (EqKeyPadForm.Components[i] as TSpeedButton).OnClick := KeyPadButtonClick;
  EqKeyPadForm.OnDeactivate:=KeyPadFormDeactivate;
  EqKeyPadForm.OnKeyPress := KeyPadFormKeyPress;
  OnClick:=MainButtonClick;
end;

destructor TsEquationEditor.Destroy;
begin
  EqKeyPadForm.Free;
  inherited;
end;

procedure TsEquationEditor.MainButtonClick(Sender: TObject);
begin
  PopupKeyPad;
end;

procedure TsEquationEditor.KeyPadButtonClick(Sender: TObject);
var
  AppendStr:String;
begin
  if not Assigned(FEquationEditBox) then
    Exit;
  AppendStr:='';
  case (Sender as TSpeedButton).Tag of
    1: AppendStr:=(Sender as TSpeedButton).Caption;
    2: AppendStr:=(Sender as TSpeedButton).Caption+'(';
    3: EquationEditBox.Clear;
    4: BackSpace;
  end;
  if (EquationEditBox.MaxLength <> 0) and
     (Length(EquationEditBox.Text+AppendStr) > EquationEditBox.MaxLength) then
    AppendStr:='';
  EquationEditBox.Text:=EquationEditBox.Text + AppendStr;
  EqKeyPadForm.Repaint;
end;

procedure TsEquationEditor.PopupKeyPad;
var
  P:TPoint;
begin
  EqKeyPadForm.Hide;
  P:=Parent.ClientToScreen(Point(Left,top));
  if (P.X+EqKeyPadForm.Width) < Screen.Width then
    EqKeyPadForm.Left:=P.X
  else
    EqKeyPadForm.Left:=P.X-(EqKeyPadForm.Width-Width);
  if (P.Y+Height+EqKeyPadForm.Height) < Screen.Height then
    EqKeyPadForm.Top:=P.Y+Height
  else
    EqKeyPadForm.Top:=P.Y-EqKeyPadForm.Height;
  Down:=True;
  EqKeyPadForm.Show;
end;

procedure TsEquationEditor.BackSpace;
var
  S, FuncStr:String;
  SepPos, i, j:Integer;
begin
  S:=EquationEditBox.Text;
  if Length(S)=0 then
    Exit;
  SepPos:=0;
  for i:=Length(S)-1 downto 1 do
  begin
    for j:=1 to SEPARATOR_COUNT do
      if S[i]=Separators[j] then
      begin
        SepPos:=i;
        break;
      end;
    if SepPos <> 0 then
      break;
  end;
  if SepPos = 0 then
    FuncStr:=S
  else
    FuncStr:=Copy(S,SepPos+1,Length(S)-SepPos);
  for i:=1 to FUNCTION_COUNT do
    if LowerCase(FuncStr)=Functions[i] then
    begin
      S:=Copy(S,1,Length(S)-Length(Functions[i])+1);
      break;
    end;
  S:=Copy(S,1,Length(S)-1);
  EquationEditBox.Text:=S;
end;

procedure TsEquationEditor.KeyPadFormDeactivate(Sender: TObject);
begin
  HideKeyPad;
end;

procedure TsEquationEditor.KeyPadFormKeyPress(Sender: TObject;
  var Key: Char);
var
  i, FoundID:Integer;
begin
  if Ord(Key) = VK_ESCAPE then
    HideKeyPad
  else if Ord(Key) = VK_BACK then
    BackSpace
  else
  begin
    FoundID:=-1;
    for i:=0 to EqKeyPadForm.ComponentCount - 1 do
      if (EqKeyPadForm.Components[i].Tag = 1) or
         (EqKeyPadForm.Components[i].Tag = 2) then
        if UpCase((EqKeyPadForm.Components[i] as TSpeedButton).Caption[1]) = UpCase(Key) then
        begin
          if FoundID > 0 then
            Exit;
          FoundID:=i;
        end;
    if FoundID = -1 then
      Exit;
    KeyPadButtonClick(EqKeyPadForm.Components[FoundID]);
  end;
end;

procedure TsEquationEditor.HideKeyPad;
begin
  Down:=False;
  EqKeyPadForm.Hide;
end;

end.
