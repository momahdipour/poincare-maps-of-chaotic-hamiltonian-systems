unit PopupFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PoincareGraphOptionsFrame, sSkinProvider;

type
  TPopupForm = class(TForm)
    sSkinProvider1: TsSkinProvider;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PopupForm: TPopupForm;

implementation

{$R *.dfm}

end.
