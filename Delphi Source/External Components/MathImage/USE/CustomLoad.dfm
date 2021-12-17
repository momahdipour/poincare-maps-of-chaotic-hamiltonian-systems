object CustomLoadForm: TCustomLoadForm
  Left = 255
  Top = 224
  BorderStyle = bsToolWindow
  Caption = 'Custom Load'
  ClientHeight = 128
  ClientWidth = 631
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object StaticText1: TStaticText
    Left = 8
    Top = 8
    Width = 103
    Height = 17
    Caption = 'X values column no.:'
    TabOrder = 0
  end
  object StaticText2: TStaticText
    Left = 8
    Top = 40
    Width = 103
    Height = 17
    Caption = 'Y values column no.:'
    TabOrder = 1
  end
  object XColSpin: TSpinEdit
    Left = 120
    Top = 8
    Width = 81
    Height = 22
    MaxValue = 90000000
    MinValue = 1
    TabOrder = 2
    Value = 1
  end
  object YColSpin: TSpinEdit
    Left = 120
    Top = 32
    Width = 81
    Height = 22
    MaxValue = 90000000
    MinValue = 0
    TabOrder = 3
    Value = 2
  end
  object FNameLabel: TStaticText
    Left = 63
    Top = 61
    Width = 561
    Height = 21
    AutoSize = False
    Caption = 'yydot.dat'
    TabOrder = 4
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 96
    Width = 75
    Height = 25
    Caption = '&Load'
    Default = True
    TabOrder = 5
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 128
    Top = 96
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Close'
    TabOrder = 6
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 3
    Top = 58
    Width = 55
    Height = 25
    Caption = '&Filename:'
    TabOrder = 7
    OnClick = BitBtn3Click
  end
  object OpenDialog1: TOpenDialog
    Left = 336
    Top = 16
  end
end
