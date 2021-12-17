program Hamiltonian;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  Classes,
  ExtCtrls,
  Windows,
  Messages,
  SideMenu in 'Components\SideMenu\SideMenu.pas',
  SplashScreen in 'SplashScreen.pas' {SplashScreen},
  PoincareFrame in 'PoincareFrame.pas' {PoincareSectionCalculationSetupFrame: TFrame},
  PoincareCalculationFrame in 'PoincareCalculationFrame.pas' {PoincareSectionCalculationFrame: TFrame},
  PoincareGraphOptionsFrame in 'PoincareGraphOptionsFrame.pas' {PoincareGraphOptionsFrame: TFrame},
  FontDialogFrame in 'FontDialogFrame.pas' {FontDialogFrame: TFrame},
  FontDialog in 'FontDialog.pas' {FontDialogForm},
  IntroductionFrame in 'IntroductionFrame.pas' {IntroductionFrame: TFrame},
  AboutFrame in 'AboutFrame.pas' {AboutFrame: TFrame},
  ConfirmFormUnit in 'ConfirmFormUnit.pas' {ConfirmForm},
  sMMDialogs in 'sMMDialogs.pas' {MessageForm},
  CustomExportFormUnit in 'CustomExportFormUnit.pas' {CustomExportForm},
  PopupFormUnit in 'PopupFormUnit.pas' {PopupForm},
  sEquationEditor in 'Components\sEquationEditor\sEquationEditor.pas',
  Parser10 in 'External Components\Parser\Parser10.pas',
  P10Build in 'External Components\Parser\P10Build.pas',
  DiffExpress in 'External Components\DiffExpress\DiffExpress.pas',
  ScrollingSections in 'Components\ScrollingSections\ScrollingSections.pas',
  KeyPadFormUnit in 'KeyPadFormUnit.pas' {KeyPadForm},
  HelpFrame in 'HelpFrame.pas' {HelpFrame: TFrame},
  SysUtils;

type
  TCloseThread=class(TThread)
  private
  protected
    procedure Execute;override;
    procedure CloseIt;
  end;
  TTempClass=class(TComponent)
  private
  public
    procedure SplashOnTimer(Sender:TObject);
  end;

{$R *.res}
var
  CloseThread:TCloseThread;
  SplashScreen1:TSplashScreen;
  SplashTimer:TTimer;
  TempClass:TTempClass;

{ TCloseThread }

procedure TCloseThread.CloseIt;
begin
  if FindWindow('TsMessageForm','Warning')<>0 then
  begin
    SendMessage(FindWindow('TsMessageForm','Warning'),WM_CLOSE,0,0);
  end;
end;

procedure TCloseThread.Execute;
begin
  inherited;
  while not Terminated do
  begin
    Synchronize(CloseIt);
    Sleep(5);
  end;
end;

{ TempClas }

procedure TTempClass.SplashOnTimer(Sender: TObject);
begin
  SplashScreen1.Hide;
  SplashScreen1.Free;
  SplashTimer.Enabled:=False;
end;

begin
  SplashTimer:=TTimer.Create(nil);
  SplashTimer.Enabled:=False;
  SplashTimer.Interval:=1000;
  TempClass:=TTempClass.Create(nil);
  SplashTimer.OnTimer:=TempClass.SplashOnTimer;
  SplashScreen1:=TSplashScreen.Create(Application);
  SplashScreen1.Update;
  SplashScreen1.Show;
  Application.Initialize;
  Application.Title := 'Hamiltonian Systems';
  SplashScreen1.Update;
  if (Win32Platform = VER_PLATFORM_WIN32_WINDOWS) or
     (Win32Platform = VER_PLATFORM_WIN32s) then
  begin
//    sMMShowMessage('This program cannot be run under this operating system.');
//    Application.Terminate;
//    Exit;
  end;
  CloseThread:=TCloseThread.Create(False);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TConfirmForm, ConfirmForm);
  Application.CreateForm(TConfirmForm, ConfirmForm);
  Application.CreateForm(TConfirmForm, ConfirmForm);
  Application.CreateForm(TCustomExportForm, CustomExportForm);
  CloseThread.Terminate;
  CloseThread.Free;
  SplashTimer.Enabled:=True;
  MainForm.WindowState := wsMaximized;
  Application.Run;
  SplashTimer.Free;
  TempClass.Free;
end.
