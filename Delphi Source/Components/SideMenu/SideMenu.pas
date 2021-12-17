unit SideMenu;
{
  TSideMenu Component
  Author: M. Mahdipour
  Creates a sidemenu using 3 threads.
}
interface

uses
  SysUtils, Classes, Controls, Types, Forms;

type
  TWidthCloseThread=class(TThread)
  private
  protected
    StopMenu:Boolean;
    Active:Boolean;
    AnimatedClose:Boolean;
    StartCloseProc,EndCloseProc:TNotifyEvent;
    OpenCloseDelay:Cardinal;
    Control:TControl;
    ClosedWidth:Integer;
    constructor Create;
    procedure CloseWidth;
    procedure Execute;override;
  end;
  TWidthOpenThread=class(TThread)
  private
  protected
    StopMenu:Boolean;
    Active:Boolean;
    AnimatedOpen:Boolean;
    StartOpenProc,EndOpenProc:TNotifyEvent;
    OpenCloseDelay:Cardinal;
    Control:TControl;
    OpenedWidth:Integer;
    constructor Create;
    procedure OpenWidth;
    procedure Execute;override;
  end;
  TSideMenuThread=class(TThread)
  private
  protected
    SideMenuOpen:Boolean;
    Control:TControl;
    CheckDelay:Cardinal;
    Pause:Boolean;
    procedure Execute;override;
  end;
  TSideMenu = class(TComponent)
  private
    { Private declarations }
    SideMenuThread:TSideMenuThread;
    FActive:Boolean;
    FAnimatedOpen,FAnimatedClose:Boolean;
    FSideControl:TControl;
    FOpeningTime,FClosingTime:Cardinal;
    FClosedWidth,FOpenedWidth:Integer;
    FMenuSensitivity:Integer;
    StartOpenProc,EndOpenProc,StartCloseProc,EndCloseProc:TNotifyEvent;
    procedure SetSideControl(ASideControl:TControl);
    procedure SetStartOpenProc(AStartOpenProc:TNotifyEvent);
    procedure SetEndOpenProc(AEndOpenProc:TNotifyEvent);
    procedure SetStartCloseProc(AStartCloseProc:TNotifyEvent);
    procedure SetEndCloseProc(AEndCloseProc:TNotifyEvent);
    procedure SetActive(AActive:Boolean);
    procedure SetMenuSensitivity(AMenuSensitivity:Integer);
    procedure SetClosedWidth(AClosedWidth:Integer);
    procedure SetOpenedWidth(AOpenedWidth:Integer);
    procedure SetOpeningTime(AOpeningTime:Cardinal);
    procedure SetClosingTime(AClosingTime:Cardinal);
    procedure SetAnimatedOpen(AAnimatedOpen:Boolean);
    procedure SetAnimatedClose(AAnimatedClose:Boolean);
    procedure PauseThreads;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
    procedure OpenMenu;
    procedure CloseMenu;
  published
    { Published declarations }
    property SideControl:TControl read FSideControl write SetSideControl;
    property OnStartOpen:TNotifyEvent read StartOpenProc write SetStartOpenProc;
    property OnEndOpen:TNotifyEvent read EndOpenProc write SetEndOpenProc;
    property OnStartClose:TNotifyEvent read StartCloseProc write SetStartCloseProc;
    property OnEndClose:TNotifyEvent read EndCloseProc write SetEndCloseProc;
    property OpeningTime:Cardinal read FOpeningTime write SetOpeningTime;
    property ClosingTime:Cardinal read FClosingTime write SetClosingTime;
    property ClosedWidth:Integer read FClosedWidth write SetClosedWidth;
    property OpenedWidth:Integer read FOpenedWidth write SetOpenedWidth;
    property Active:Boolean read FActive write SetActive;
    property MenuSensitivity:Integer read FMenuSensitivity write SetMenuSensitivity;
    property AnimatedOpen:Boolean read FAnimatedOpen write SetAnimatedOpen;
    property AnimatedClose:Boolean read FAnimatedClose write SetAnimatedClose;
  end;

procedure Register;

implementation
var
  WidthCloseThread:TWidthCloseThread;
  WidthOpenThread:TWidthOpenThread;

procedure Register;
begin
  RegisterComponents('Mohammad', [TSideMenu]);
end;

{ TWidthCloseThread }

procedure TWidthCloseThread.CloseWidth;
var
  Delay,i:Integer;
begin
  if not Control.Visible then Exit;
  if Control.Width>ClosedWidth then
  begin
    if not AnimatedClose then
      Control.Width:=ClosedWidth
    else if (OpenCloseDelay-1)>=(Control.Width-ClosedWidth) then
    begin
      Delay:=Trunc((OpenCloseDelay-1)/(Control.Width-ClosedWidth));
      for i:=Control.Width-1 downto ClosedWidth do
      begin
        Sleep(Delay);
        Control.Width:=i;
        Application.ProcessMessages;
        if StopMenu then
          break;
      end;
      if not StopMenu then Control.Width:=ClosedWidth;
    end
    else
    begin
      Delay:=Trunc((Control.Width-ClosedWidth)/(OpenCloseDelay-1));
      while Control.Width>ClosedWidth do
      begin
        Sleep(1);
        Control.Width:=Control.Width-Delay;
        Application.ProcessMessages;
        if StopMenu then
          break;
      end;
      if not StopMenu then Control.Width:=ClosedWidth;
    end;
  end;
end;

constructor TWidthCloseThread.Create;
begin
  inherited Create(True);
  Active:=False;
  StartCloseProc:=nil;
  EndCloseProc:=nil;
  OpenCloseDelay:=20;
  Control:=nil;
  ClosedWidth:=10;
  AnimatedClose:=True;
end;

procedure TWidthCloseThread.Execute;
begin
  inherited;
  while not Terminated do
  begin
    Active:=True;
    StopMenu:=False;
    if Assigned(StartCloseProc) then
      StartCloseProc(Control);
    Synchronize(CloseWidth);
    if Assigned(EndCloseProc) then
      EndCloseProc(Control);
    Active:=False;
    if not Suspended then Suspend;
  end;
end;

{ TWidthOpenThread }

constructor TWidthOpenThread.Create;
begin
  inherited Create(True);
  Active:=False;
  StartOpenProc:=nil;
  EndOpenProc:=nil;
  OpenCloseDelay:=20;
  Control:=nil;
  OpenedWidth:=100;
  AnimatedOpen:=True;
end;

procedure TWidthOpenThread.Execute;
begin
  inherited;
  while not Terminated do
  begin
    Active:=True;
    StopMenu:=False;
    if Assigned(StartOpenProc) then
      StartOpenProc(Control);
    Synchronize(OpenWidth);
    if Assigned(EndOpenProc) then
      EndOpenProc(Control);
    Active:=False;
    if not Suspended then Suspend;
  end;
end;

procedure TWidthOpenThread.OpenWidth;
var
  Delay,i:Integer;
begin
  if not Control.Visible then Exit;
  if Control.Width<OpenedWidth then
  begin
    if not AnimatedOpen then
      Control.Width:=OpenedWidth
    else if (OpenCloseDelay-1)>=(OpenedWidth-Control.Width) then
    begin
      Delay:=Trunc((OpenCloseDelay-1)/(OpenedWidth-Control.Width));
      for i:=Control.Width+1 to OpenedWidth do
      begin
        Sleep(Delay);
        Control.Width:=i;
        Application.ProcessMessages;
        if StopMenu then
          break;
      end;
      if not StopMenu then Control.Width:=OpenedWidth;
    end
    else
    begin
      Delay:=Trunc((OpenedWidth-Control.Width)/(OpenCloseDelay-1));
      while Control.Width<OpenedWidth do
      begin
        Sleep(1);
        Control.Width:=Control.Width+Delay;
        Application.ProcessMessages;
        if StopMenu then
          break;
      end;
      if not StopMenu then Control.Width:=OpenedWidth;
    end;
  end;
end;

{ TSideMenuThread }

procedure TSideMenuThread.Execute;
var
  P:TPoint;
begin
  inherited;
  while not Terminated do
  begin
    if Control.Visible then
    begin
//    try
    P:=Control.ScreenToClient(Mouse.CursorPos);
    if not(SideMenuOpen)
       and (P.X>=0) and (P.X<=Control.Width)
       and (P.Y>=0) and (P.Y<=Control.Height) then
    begin
      SideMenuOpen:=True;
      if not WidthOpenThread.Active then
      begin
        if WidthCloseThread.Active then WidthCloseThread.StopMenu:=True;
        if WidthOpenThread.Suspended then WidthOpenThread.Resume;
      end;
    end
    else if SideMenuOpen
         and ((P.X<0) or (P.X>Control.Width)
         or (P.Y<0) or (P.Y>Control.Height)) then
    begin
      SideMenuOpen:=False;
      if not WidthCloseThread.Active then
      begin
        if WidthOpenThread.Active then WidthOpenThread.StopMenu:=True;
        if WidthCloseThread.Suspended then WidthCloseThread.Resume;
      end;
    end;
    if Application.Terminated then
    begin
      WidthCloseThread.StopMenu:=True;
      WidthOpenThread.StopMenu:=True;
      if not Suspended then Suspend;
    end;  
    if Pause and not Suspended then
    begin
      Pause:=False;
      Suspend;
    end;
{    except
      on E:Exception do
        Application.MessageBox('Exception','Exception')}
    end;
    Sleep(CheckDelay);
  end;
end;

{ TSideMenu }

procedure TSideMenu.CloseMenu;
begin
  if Assigned(FSideControl) then
  begin
    WidthCloseThread.CloseWidth;
    SideMenuThread.SideMenuOpen:=False;
  end;  
end;

constructor TSideMenu.Create(AOwner: TComponent);
begin
  inherited;
  SideMenuThread:=TSideMenuThread.Create(True);
  SideMenuThread.FreeOnTerminate:=False;
  SideMenuThread.Pause:=False;
  WidthCloseThread:=TWidthCloseThread.Create;
  WidthCloseThread.FreeOnTerminate:=False;
  WidthOpenThread:=TWidthOpenThread.Create;
  WidthOpenThread.FreeOnTerminate:=False;
  FSideControl:=nil;
  FOpeningTime:=20;
  FClosingTime:=20;
  FClosedWidth:=10;
  FOpenedWidth:=100;
  StartOpenProc:=nil;
  EndOpenProc:=nil;
  StartCloseProc:=nil;
  EndCloseProc:=nil;
  FActive:=False;
  FMenuSensitivity:=80;
  SideMenuThread.CheckDelay:=5*(101-FMenuSensitivity);
  FAnimatedClose:=True;
  FAnimatedOpen:=True;
  WidthCloseThread.AnimatedClose:=FAnimatedClose;
  WidthOpenThread.AnimatedOpen:=FAnimatedOpen;
end;

destructor TSideMenu.Destroy;
begin
//  PauseThreads;
  SideMenuThread.FreeOnTerminate:=True;
  SideMenuThread.Terminate;
  try
    if not SideMenuThread.Suspended then SideMenuThread.WaitFor;
  //  SideMenuThread.Free;
    WidthCloseThread.FreeOnTerminate:=True;
    WidthOpenThread.Terminate;
    if not WidthOpenThread.Suspended then WidthOpenThread.WaitFor;
    WidthOpenThread.Free;
    WidthCloseThread.Terminate;
    if not WidthCloseThread.Suspended then WidthCloseThread.WaitFor;
  except
    on E:Exception do;
  end;    
//  WidthCloseThread.Free;
  inherited;
end;

procedure TSideMenu.OpenMenu;
begin
  if Assigned(FSideControl) then
  begin
    WidthOpenThread.OpenWidth;
    SideMenuThread.SideMenuOpen:=True;
  end;
end;

procedure TSideMenu.PauseThreads;
begin
  SideMenuThread.Pause:=True;
  WidthCloseThread.StopMenu:=True;
  WidthOpenThread.StopMenu:=True;
  while not SideMenuThread.Suspended do
    Sleep(5);
  SideMenuThread.Pause:=False;
  while not WidthCloseThread.Suspended do
    Sleep(5);
  while not WidthOpenThread.Suspended do
    Sleep(5);
end;

procedure TSideMenu.SetActive(AActive: Boolean);
begin
  if FActive=AActive then Exit;
  FActive:=AActive;
  if Assigned(SideControl) then
    if FActive then
    begin
      SideMenuThread.SideMenuOpen:=FSideControl.Width>FClosedWidth;
      SideMenuThread.Resume;
    end
    else
      SideMenuThread.Suspend;
end;

procedure TSideMenu.SetAnimatedClose(AAnimatedClose: Boolean);
begin
  FAnimatedClose:=AAnimatedClose;
  WidthCloseThread.AnimatedClose:=FAnimatedClose;
end;

procedure TSideMenu.SetAnimatedOpen(AAnimatedOpen: Boolean);
begin
  FAnimatedOpen:=AAnimatedOpen;
  WidthOpenThread.AnimatedOpen:=FAnimatedOpen;
end;

procedure TSideMenu.SetClosedWidth(AClosedWidth: Integer);
begin
  FClosedWidth:=AClosedWidth;
  WidthCloseThread.ClosedWidth:=FClosedWidth;
end;

procedure TSideMenu.SetClosingTime(AClosingTime: Cardinal);
begin
  FClosingTime:=AClosingTime;
  WidthCloseThread.OpenCloseDelay:=FClosingTime;
end;

procedure TSideMenu.SetEndCloseProc(AEndCloseProc: TNotifyEvent);
begin
  if Assigned(EndCloseProc) then
    PauseThreads;
  EndCloseProc:=AEndCloseProc;
  if Assigned(EndCloseProc) then
  begin
    WidthCloseThread.EndCloseProc:=EndCloseProc;
    SideMenuThread.Resume;
  end;
end;

procedure TSideMenu.SetEndOpenProc(AEndOpenProc: TNotifyEvent);
begin
  if Assigned(EndOpenProc) then
    PauseThreads;
  EndOpenProc:=AEndOpenProc;
  if Assigned(EndOpenProc) then
  begin
    WidthOpenThread.EndOpenProc:=EndOpenProc;
    SideMenuThread.Resume;
  end;
end;

procedure TSideMenu.SetMenuSensitivity(AMenuSensitivity: Integer);
begin
  FMenuSensitivity:=AMenuSensitivity;
  if FMenuSensitivity>100 then
    FMenuSensitivity:=100;
  if FMenuSensitivity<1 then
    FMenuSensitivity:=1;
  SideMenuThread.CheckDelay:=5*(101-FMenuSensitivity);
end;

procedure TSideMenu.SetOpenedWidth(AOpenedWidth: Integer);
begin
  FOpenedWidth:=AOpenedWidth;
  WidthOpenThread.OpenedWidth:=FOpenedWidth;
end;

procedure TSideMenu.SetOpeningTime(AOpeningTime: Cardinal);
begin
  FOpeningTime:=AOpeningTime;
  WidthOpenThread.OpenCloseDelay:=FOpeningTime;
end;

procedure TSideMenu.SetSideControl(ASideControl: TControl);
begin
  if Assigned(FSideControl) then
    PauseThreads;
  FSideControl:=ASideControl;
  SideMenuThread.Control:=FSideControl;
  WidthCloseThread.Control:=FSideControl;
  WidthOpenThread.Control:=FSideControl;
  if Assigned(FSideControl) and FActive then
  begin
    SideMenuThread.SideMenuOpen:=FSideControl.Width>FClosedWidth;
    if FSideControl.Width>FOpenedWidth then
      FSideControl.Width:=FOpenedWidth
    else if FSideControl.Width<FClosedWidth then
      FSideControl.Width:=FClosedWidth;  
    SideMenuThread.Resume;
  end;
end;

procedure TSideMenu.SetStartCloseProc(AStartCloseProc: TNotifyEvent);
begin
  if Assigned(StartCloseProc) then
    PauseThreads;
  StartCloseProc:=AStartCloseProc;
  if Assigned(StartCloseProc) then
  begin
    WidthCloseThread.StartCloseProc:=StartCloseProc;
    SideMenuThread.Resume;
  end;
end;

procedure TSideMenu.SetStartOpenProc(AStartOpenProc: TNotifyEvent);
begin
  if Assigned(StartOpenProc) then
    PauseThreads;
  StartOpenProc:=AStartOpenProc;
  if Assigned(StartOpenProc) then
  begin
    WidthOpenThread.StartOpenProc:=StartOpenProc;
    SideMenuThread.Resume;
  end;
end;

end.
