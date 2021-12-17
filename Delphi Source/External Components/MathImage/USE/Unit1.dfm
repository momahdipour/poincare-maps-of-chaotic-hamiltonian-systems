object Form1: TForm1
  Left = 275
  Top = 129
  Width = 783
  Height = 540
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object MathImage1: TMathImage
    Left = 0
    Top = 58
    Width = 775
    Height = 448
    Cursor = crHandPoint
    Align = alClient
    PopUpMenu = PopupMenu1
    Version = '5.0 August 99 '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Pen.Width = 5
    RecordMetafile = False
    D3Xscale = 1.000000000000000000
    D3Yscale = 1.000000000000000000
    D3Zscale = 1.000000000000000000
    D3ViewDist = 6.400000000000000000
    D3ViewAngle = 6.000000000000000000
    D3AspectRatio = True
    OnMouseDown = MathImage1MouseDown
    OnMouseMove = MathImage1MouseMove
    OnMouseUp = MathImage1MouseUp
    OnResize = MathImage1Resize
    D2WorldX1 = -1.000000000000000000
    D2WorldXW = 2.000000000000000000
    D2WorldY1 = -1.000000000000000000
    D2WorldYW = 2.000000000000000000
    D3WorldX1 = -1.000000000000000000
    D3WorldY1 = -1.000000000000000000
    D3WorldZ1 = -1.000000000000000000
    D3WorldXW = 2.000000000000000000
    D3WorldYW = 2.000000000000000000
    D3WorldZW = 2.000000000000000000
    D3Zrotation = 45.000000000000000000
    D3Yrotation = 45.000000000000000000
  end
  object ControlBar1: TControlBar
    Left = 0
    Top = 0
    Width = 775
    Height = 58
    Align = alTop
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 253
      Top = 28
      Width = 46
      Height = 22
      AllowAllUp = True
      GroupIndex = 1
      Caption = 'Pan'
      OnClick = SpeedButton1Click
    end
    object BitBtn1: TBitBtn
      Left = 11
      Top = 2
      Width = 75
      Height = 22
      Caption = 'Load...'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 221
      Top = 2
      Width = 75
      Height = 22
      Caption = 'Zoom In'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object ResetBtn: TButton
      Left = 133
      Top = 2
      Width = 75
      Height = 22
      Caption = 'Reset View'
      TabOrder = 2
      OnClick = ResetBtnClick
    end
    object Button2: TButton
      Left = 406
      Top = 2
      Width = 75
      Height = 22
      Caption = 'Back Color'
      TabOrder = 3
      OnClick = Button2Click
    end
    object BitBtn3: TBitBtn
      Left = 494
      Top = 2
      Width = 75
      Height = 22
      Caption = 'Points Color'
      TabOrder = 4
      OnClick = BitBtn3Click
    end
    object BitBtn4: TBitBtn
      Left = 582
      Top = 2
      Width = 99
      Height = 22
      Caption = 'Save As Bitmap...'
      TabOrder = 5
      OnClick = BitBtn4Click
    end
    object BitBtn5: TBitBtn
      Left = 486
      Top = 28
      Width = 99
      Height = 22
      Caption = 'Save As Metafile...'
      TabOrder = 6
      OnClick = BitBtn5Click
    end
    object BitBtn6: TBitBtn
      Left = 598
      Top = 28
      Width = 171
      Height = 22
      Caption = 'Copy To Clipboard As Bitmap'
      TabOrder = 7
      OnClick = BitBtn6Click
    end
    object BitBtn7: TBitBtn
      Left = 694
      Top = 2
      Width = 75
      Height = 22
      Caption = 'Print'
      TabOrder = 8
      OnClick = BitBtn7Click
    end
    object ZeroLinesCheck: TCheckBox
      Left = 143
      Top = 28
      Width = 97
      Height = 22
      Caption = 'Show zero lines'
      TabOrder = 9
      OnClick = ZeroLinesCheckClick
    end
    object BitBtn9: TBitBtn
      Left = 11
      Top = 28
      Width = 75
      Height = 22
      Caption = 'Custom Load'
      TabOrder = 10
      OnClick = BitBtn9Click
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 168
    Top = 232
    object ZommIn1: TMenuItem
      Caption = 'Zomm In'
      OnClick = ZommIn1Click
    end
  end
  object ColorDialog1: TColorDialog
    Left = 736
    Top = 56
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 264
    Top = 184
  end
  object SaveDialog1: TSaveDialog
    Left = 168
    Top = 168
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 432
    Top = 192
  end
  object OpenDialog1: TOpenDialog
    Left = 88
    Top = 216
  end
end
