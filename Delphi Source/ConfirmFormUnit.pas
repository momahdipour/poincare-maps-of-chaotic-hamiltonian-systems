unit ConfirmFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, sLabel, sSkinProvider, sCheckBox;

type
  TConfirmForm = class(TForm)
    MsgLabel: TsLabel;
    sBitBtn1: TsBitBtn;
    sBitBtn2: TsBitBtn;
    sSkinProvider1: TsSkinProvider;
    ShowAgainCheck: TsCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ConfirmForm: TConfirmForm;

implementation

{$R *.dfm}

end.
