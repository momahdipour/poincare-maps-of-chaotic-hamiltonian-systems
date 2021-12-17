unit sMMDialogs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sSkinProvider, StdCtrls, Buttons, sBitBtn, sLabel;

procedure sMMShowMessage(const Msg:String);
function sMMMessageDlg(const Msg:String;DlgType:TMsgDlgType;Buttons:TMsgDlgButtons;HelpCtx:Integer):TModalResult;

type
  TMessageForm = class(TForm)
    sSkinProvider1: TsSkinProvider;
    MessageLabel: TsLabel;
    sBitBtn1: TsBitBtn;
    sBitBtn2: TsBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

uses
  MainUnit;

{$R *.dfm}

procedure sMMShowMessage(const Msg:String);
var
  MsgForm: TMessageForm;
begin
  MsgForm:=TMessageForm.Create(nil);
  with MsgForm do
  begin
    MessageLabel.Width:=297;
    MessageLabel.Height:=13;
    MessageLabel.AutoSize:=True;
    MessageLabel.Caption:=Msg;
    MessageLabel.AutoSize:=False;
    if MessageLabel.Width>297 then
      MessageLabel.Width:=297;
    if MessageLabel.Height>57 then
      MessageLabel.Height:=57;
    Height:=MessageLabel.Height+sBitBtn1.Height+66;
    Width:=MessageLabel.Width+24;
    if Width<179 then Width:=179;
    sBitBtn1.Top:=MessageLabel.Height+23;
    sBitBtn1.Left:=Trunc(Width/2-sBitBtn1.Width/2);
    sBitBtn1.Show;
    Caption:=Application.Title;
    if MainForm <> nil then
      MainForm.RestoreFromTray;
    ShowModal;
  end;
  MsgForm.Free;
end;

function sMMMessageDlg(const Msg:String;DlgType:TMsgDlgType;Buttons:TMsgDlgButtons;HelpCtx:Integer):TModalResult;
const
  Max_LW=900;
  MAX_LH=100;
  MIN_FW=276;
var
  MsgForm:TMessageForm;
begin
  MsgForm:=TMessageForm.Create(nil);
  with MsgForm do
  begin
    MessageLabel.Width:=Max_LW;
    MessageLabel.Height:=MAX_LH;
    MessageLabel.AutoSize:=True;
    MessageLabel.Caption:=Msg;
    MessageLabel.AutoSize:=False;
    if MessageLabel.Width>Max_LW then
      MessageLabel.Width:=Max_LW;
    if MessageLabel.Height>MAX_LH then
      MessageLabel.Height:=MAX_LH;
    Height:=MessageLabel.Height+sBitBtn1.Height+66;
    Width:=MessageLabel.Width+24;
    if Width<MIN_FW then Width:=MIN_FW;
    sBitBtn1.Caption:='&Yes';
    sBitBtn2.Caption:='&No';
    sBitBtn1.Top:=MessageLabel.Height+23;
    if (mbYes in Buttons) and (mbNo in Buttons) then
    begin
      sBitBtn1.Left:=Trunc(Width/2-166/2);
      sBitBtn2.Left:=sBitBtn1.Left+95;
      sBitBtn2.Top:=sBitBtn1.Top;
      sBitBtn1.Caption:='&Yes';
      sBitBtn2.Caption:='&No';
      sBitBtn2.Show
    end
    else if mbOK in Buttons then
    begin
      sBitBtn1.Left:=Trunc(Width/2-sBitBtn1.Width/2);
      sBitBtn1.Caption:='&OK'
    end;
    sBitBtn1.Show;
    case DlgType of
      mtInformation:  Caption:='Information';
      mtConfirmation: Caption:='Confirm';
      mtError:        Caption:='Error';
      mtWarning:      Caption:='Warning';
    end;
    MainForm.RestoreFromTray;
    Result:=ShowModal;
  end;
  MsgForm.Free;
end;

end.
