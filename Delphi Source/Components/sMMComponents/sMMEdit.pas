unit sMMEdit;

interface

uses
  SysUtils, Classes, Controls, StdCtrls, sEdit, Messages;

type
  TsMMEdit = class(TsEdit)
  private
    { Private declarations }
    FOnMouseEnterEvent, FOnMouseLeaveEvent: TNotifyEvent;
    procedure MouseEnter(var Msg: TMessage); message CM_mouseEnter;
    procedure MouseLeave(var Msg: TMessage); message CM_mouseLeave;
  protected
    { Protected declarations }
  public
    { Public declarations }
  published
    { Published declarations }
    property OnMouseEnter: TNotifyEvent read FOnMouseEnterEvent write FOnMouseEnterEvent;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeaveEvent write FOnMouseLeaveEvent;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('AlphaLite', [TsMMEdit]);
end;

{ TsMMEdit }

procedure TsMMEdit.MouseEnter(var Msg: TMessage);
begin
  if Assigned(FOnMouseEnterEvent) then
    FOnMouseEnterEvent(Self);
end;

procedure TsMMEdit.MouseLeave(var Msg: TMessage);
begin
  if Assigned(FOnMouseLeaveEvent) then
    FOnMouseLeaveEvent(Self);
end;

end.
