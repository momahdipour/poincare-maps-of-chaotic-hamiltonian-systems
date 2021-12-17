unit CustomExportFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, sSkinProvider, StdCtrls, sLabel, Buttons, sBitBtn,
  sCheckBox;

type
  TCustomExportForm = class(TForm)
    sLabel1: TsLabel;
    sSkinProvider1: TsSkinProvider;
    StringGrid1: TStringGrid;
    ColCheck0: TsCheckBox;
    ColCheck1: TsCheckBox;
    ColCheck2: TsCheckBox;
    ColCheck3: TsCheckBox;
    ColCheck4: TsCheckBox;
    OKButton: TsBitBtn;
    CancelButton: TsBitBtn;
    AllColumnsCheck: TsCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1ColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure ColCheck0Click(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure AllColumnsCheckClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure SetOrder(const S:String;Order:Byte);    
  public
    { Public declarations }
    TOrder,XOrder,XDotOrder,YOrder,YDotOrder:Byte;
  end;

var
  CustomExportForm: TCustomExportForm;
  CheckArray:Array[0..4] of TsCheckBox;

implementation

{$R *.dfm}

procedure TCustomExportForm.FormCreate(Sender: TObject);
begin
  StringGrid1.Cells[0,0]:='t';
  StringGrid1.Cells[1,0]:='X';
  StringGrid1.Cells[2,0]:='XDOT';
  StringGrid1.Cells[3,0]:='Y';
  StringGrid1.Cells[4,0]:='YDOT';
  //--------------------------------------------------
  CheckArray[0]:=ColCheck0;
  CheckArray[1]:=ColCheck1;
  CheckArray[2]:=ColCheck2;
  CheckArray[3]:=ColCheck3;
  CheckArray[4]:=ColCheck4;
end;

procedure TCustomExportForm.StringGrid1ColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
var
  B:Boolean;
begin
  B:=CheckArray[FromIndex].Checked;
  CheckArray[FromIndex].Checked:=CheckArray[ToIndex].Checked;
  CheckArray[ToIndex].Checked:=B;
end;

procedure TCustomExportForm.ColCheck0Click(Sender: TObject);
var
  i,j:Byte;
begin
  j:=0;
  for i:=0 to 4 do
    if CheckArray[i].Checked then Inc(j);
  OKButton.Enabled:=(j>1);
  AllColumnsCheck.OnClick := nil;
  AllColumnsCheck.Checked := ColCheck0.Checked and
                             ColCheck1.Checked and
                             ColCheck2.Checked and
                             ColCheck3.Checked and
                             ColCheck4.Checked;
  AllColumnsCheck.OnClick := AllColumnsCheckClick;                              
end;

procedure TCustomExportForm.OKButtonClick(Sender: TObject);
var
  i,Order:Byte;
begin
  Order:=1;
  for i:=0 to 4 do
    if CheckArray[i].Checked then
    begin
      SetOrder(StringGrid1.Cells[i,0],Order);
      Inc(Order);
    end  
    else
      SetOrder(StringGrid1.Cells[i,0],0);
end;

procedure TCustomExportForm.SetOrder(const S: String; Order: Byte);
begin
  if S='t' then
    TOrder:=Order
  else if S='X' then
    XOrder:=Order
  else if S='XDOT' then
    XDotOrder:=Order
  else if S='Y' then
    YOrder:=Order
  else if S='YDOT' then
    YDotOrder:=Order;
end;

procedure TCustomExportForm.AllColumnsCheckClick(Sender: TObject);
var
  i: Integer;
  NewValue: Boolean;
begin
  NewValue := AllColumnsCheck.Checked;
  for i:= 0 to 4 do
    CheckArray[i].Checked := NewValue;
end;

procedure TCustomExportForm.FormShow(Sender: TObject);
begin
  if OKButton.Enabled then
    OKButton.SetFocus
  else
    CancelButton.SetFocus;
end;

end.
