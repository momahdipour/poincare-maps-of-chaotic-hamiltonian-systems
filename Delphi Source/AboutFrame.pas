unit AboutFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, sLabel, ExtCtrls;

type
  TAboutFrame = class(TFrame)
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    Image1: TImage;
    sLabel3: TsLabel;
    AboutImage: TImage;
    sLabel4: TsLabel;
    LineLabel: TsLabel;
    AttentionLabel1: TsLabel;
    AttentionLabel2: TsLabel;
    procedure FrameResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TAboutFrame.FrameResize(Sender: TObject);
begin
  AboutImage.Left:=Width-19;
  LineLabel.Top := Height - 74;
  AttentionLabel1.Top := Height - 60;
  AttentionLabel2.Top := Height - 44;
end;

end.
