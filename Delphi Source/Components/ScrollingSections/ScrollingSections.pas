{
  TScrollingSections Component
  Author: M. Mahdipour
  Manages multisection pages by scrolling
}

unit ScrollingSections;

interface

uses
  SysUtils, Classes, Controls, Forms;

type
  TScrollSection = record
    HeaderControl: TControl;
    BodyControl: TControl;
    Open: Boolean;
    Level: Integer;
    OpenHeight: Integer;
  end;
  TScrollingSections = class(TComponent)
  private
    { Private declarations }
    FSections: array of TScrollSection;
    FSectionCount: Integer;
    FScrollSpeed: Integer;
    FAnimatedScrolling: Boolean;
    FAllowMultipleSections: Boolean;
    Scrolling: Boolean;
    NewSectionRequest: Integer;
    procedure ArrangeSections;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AddSection(HeaderControl,SectionsBody: TControl; OpenHeight, Level: Integer);
    procedure PopupSection(SectionNo: Integer);
  published
    { Published declarations }
    property ScrollSpeed: Integer read FScrollSpeed write FScrollSpeed;
    property AnimatedScrolling: Boolean read FAnimatedScrolling write FAnimatedScrolling;
    property SectionCount: Integer read FSectionCount;
    property AllowMultipleSections: Boolean read FAllowMultipleSections write FAllowMultipleSections;
  end;

procedure Register;

implementation

uses Math;

procedure Register;
begin
  RegisterComponents('Samples', [TScrollingSections]);
end;

{ TScrollingSections }

procedure TScrollingSections.AddSection(HeaderControl,
     SectionsBody: TControl; OpenHeight, Level: Integer);
var
  i, j, MinIndex: Integer;
  SSTemp: TScrollSection;
begin
  for i:=0 to FSectionCount - 1 do
    if FSections[i].Level = Level then
      raise Exception.Create('Duplicated level numbers in TScrollingSectiond.');
  if Scrolling then Exit;
  Scrolling := True;
  SetLength(FSections,Length(FSections)+1);
  j:=Length(FSections)-1;
  FSections[j].HeaderControl:=HeaderControl;
  FSections[j].BodyControl:=SectionsBody;
  FSections[j].Level:=Level;
  FSections[j].OpenHeight:=OpenHeight;
  FSections[j].Open:=False;
  Inc(FSectionCount);
  for i:=0 to FSectionCount - 1 do
  begin
    MinIndex := i;
    for j:=i + 1 to FSectionCount - 1 do
      if FSections[j].Level < FSections[MinIndex].Level then
        MinIndex := j;
    if MinIndex <> i then
    begin
      SSTemp := FSections[i];
      FSections[i] := FSections[MinIndex];
      FSections[MinIndex] := SSTemp;
    end;
  end;
  Scrolling := False;
end;

procedure TScrollingSections.ArrangeSections;
var
  i, CorrectTop: Integer;
begin
  CorrectTop := FSections[0].HeaderControl.Top;
  FSections[0].BodyControl.Top := CorrectTop + FSections[0].HeaderControl.Height;
  for i:=1 to FSectionCount - 1 do
  begin
    CorrectTop := CorrectTop + FSections[i-1].HeaderControl.Height;
    if FSections[i-1].Open then
      CorrectTop := CorrectTop + FSections[i-1].BodyControl.Height + 1;
    FSections[i].HeaderControl.Top := CorrectTop;
    FSections[i].BodyControl.Top := CorrectTop + FSections[i].HeaderControl.Height;
  end;
end;

constructor TScrollingSections.Create(AOwner: TComponent);
begin
  inherited;
  SetLength(FSections,0);
  FSectionCount:=0;
  FScrollSpeed := 3;
  Scrolling := False;
  FAnimatedScrolling := True;
end;

destructor TScrollingSections.Destroy;
begin
  SetLength(FSections,0);
  inherited;
end;

procedure TScrollingSections.PopupSection(SectionNo: Integer);
var
  i, j, DesiredSection: Integer;
begin
  NewSectionRequest := SectionNo;
  if not FAllowMultipleSections and FSections[SectionNo-1].Open then
    Exit;
  if Scrolling then
    Exit;
  Scrolling := True;
  DesiredSection := SectionNo;
  ////////////////////////////////////////////////////////////
  if FAllowMultipleSections then
  begin
    repeat
      NewSectionRequest := 0;
      FSections[DesiredSection-1].BodyControl.Top := FSections[DesiredSection-1].HeaderControl.Top +
              FSections[DesiredSection-1].HeaderControl.Height;
      if not FSections[DesiredSection-1].Open then
        FSections[DesiredSection-1].BodyControl.Height := 1;
      for i:=0 to FSectionCount - 1 do
        if not FSections[i].Open then
          FSections[i].BodyControl.Height := 0;  //Hide
      if FAnimatedScrolling then
      begin
        //Control is visible
        Application.ProcessMessages;
        for i:=1 to Trunc(FSections[DesiredSection-1].OpenHeight/FScrollSpeed) do
        begin
          for j:=FSectionCount downto DesiredSection + 1 do
          begin
            if FSections[DesiredSection-1].Open then
              FSections[j-1].HeaderControl.Top := FSections[j-1].HeaderControl.Top - FScrollSpeed
            else
              FSections[j-1].HeaderControl.Top := FSections[j-1].HeaderControl.Top + FScrollSpeed + 1;
            if FSections[j-1].Open then
            begin
              if FSections[DesiredSection-1].Open then
                FSections[j-1].BodyControl.Top := FSections[j-1].BodyControl.Top - FScrollSpeed
              else
                FSections[j-1].BodyControl.Top := FSections[j-1].BodyControl.Top + FScrollSpeed + 1;
            end;
          end;
          if FSections[DesiredSection-1].Open then
            FSections[DesiredSection-1].BodyControl.Height := FSections[DesiredSection-1].BodyControl.Height - FScrollSpeed
          else
            FSections[DesiredSection-1].BodyControl.Height := FSections[DesiredSection-1].BodyControl.Height + FScrollSpeed + 1;
          Application.ProcessMessages;
          if NewSectionRequest > 0 then
            Break;
        end;
      end;
      if FSections[DesiredSection-1].Open then
        FSections[DesiredSection-1].BodyControl.Height := 0  //Hide
      else
      begin
        FSections[DesiredSection-1].BodyControl.Height := FSections[DesiredSection-1].OpenHeight;
        //Control is visible
        Application.ProcessMessages;
      end;
      FSections[DesiredSection-1].Open := FSections[DesiredSection-1].BodyControl.Height > 1;
      ArrangeSections;
      DesiredSection := NewSectionRequest;
    until NewSectionRequest = 0;
    Scrolling := False;
    Exit;
  end;
  ////////////////////////////////////////////////////////////
  repeat
    NewSectionRequest := 0;
    for i:=0 to FSectionCount - 1 do
    begin
      FSections[i].BodyControl.Height := 0;  //Hide
      FSections[i].Open := False;
    end;
    Application.ProcessMessages;
    ArrangeSections;
    //Open desired section
    Fsections[DesiredSection-1].BodyControl.Height := 1;
    if FAnimatedScrolling then
    begin
      //Control is visible
      Application.ProcessMessages;
      for i:=1 to Trunc(Fsections[DesiredSection-1].OpenHeight/FScrollSpeed) do
      begin
        for j:=FSectionCount downto DesiredSection + 1 do
          Fsections[j-1].HeaderControl.Top := FSections[j-1].HeaderControl.Top + FScrollSpeed + 1;
        Fsections[DesiredSection-1].BodyControl.Height := Fsections[DesiredSection-1].BodyControl.Height + FScrollSpeed;
        Application.ProcessMessages;
        if NewSectionRequest > 0 then
          Break;
      end;
    end;
    Fsections[DesiredSection-1].BodyControl.Height := Fsections[DesiredSection-1].OpenHeight;
    //Control is visible
    for i:=0 to FSectionCount - 1 do
      FSections[i].Open := i = DesiredSection - 1;
    ArrangeSections;
    Application.ProcessMessages;
    DesiredSection := NewSectionRequest;
  until NewSectionRequest = 0;
  Scrolling := False;
end;

end.
