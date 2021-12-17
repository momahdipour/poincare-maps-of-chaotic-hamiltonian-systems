program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  CustomLoad in 'CustomLoad.pas' {CustomLoadForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TCustomLoadForm, CustomLoadForm);
  Application.Run;
end.
