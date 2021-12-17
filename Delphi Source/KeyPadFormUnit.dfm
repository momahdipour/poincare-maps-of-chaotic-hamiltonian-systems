object KeyPadForm: TKeyPadForm
  Left = 140
  Top = 170
  BorderStyle = bsNone
  BorderWidth = 2
  Caption = 'KeyPadForm'
  ClientHeight = 174
  ClientWidth = 216
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object BackgroundPanel: TsPanel
    Left = 0
    Top = 0
    Width = 216
    Height = 174
    Align = alClient
    BorderStyle = bsSingle
    TabOrder = 6
    SkinData.SkinSection = 'PANEL'
  end
  object sPanel2: TsPanel
    Left = 3
    Top = 33
    Width = 90
    Height = 137
    TabOrder = 0
    SkinData.SkinSection = 'GROUPBOX'
    object Zero: TSpeedButton
      Tag = 1
      Left = 4
      Top = 82
      Width = 27
      Height = 26
      Caption = '0'
      Flat = True
    end
    object Point: TSpeedButton
      Tag = 1
      Left = 32
      Top = 82
      Width = 27
      Height = 26
      Caption = '.'
      Flat = True
    end
    object Seven: TSpeedButton
      Tag = 1
      Left = 4
      Top = 4
      Width = 27
      Height = 26
      Caption = '7'
      Flat = True
    end
    object Eight: TSpeedButton
      Tag = 1
      Left = 32
      Top = 4
      Width = 27
      Height = 26
      Caption = '8'
      Flat = True
    end
    object Nine: TSpeedButton
      Tag = 1
      Left = 59
      Top = 4
      Width = 27
      Height = 26
      Caption = '9'
      Flat = True
    end
    object Four: TSpeedButton
      Tag = 1
      Left = 4
      Top = 30
      Width = 27
      Height = 26
      Caption = '4'
      Flat = True
    end
    object Five: TSpeedButton
      Tag = 1
      Left = 32
      Top = 30
      Width = 27
      Height = 26
      Caption = '5'
      Flat = True
    end
    object Six: TSpeedButton
      Tag = 1
      Left = 59
      Top = 30
      Width = 27
      Height = 26
      Caption = '6'
      Flat = True
    end
    object One: TSpeedButton
      Tag = 1
      Left = 4
      Top = 56
      Width = 27
      Height = 26
      Caption = '1'
      Flat = True
    end
    object Two: TSpeedButton
      Tag = 1
      Left = 32
      Top = 56
      Width = 27
      Height = 26
      Caption = '2'
      Flat = True
    end
    object Three: TSpeedButton
      Tag = 1
      Left = 59
      Top = 56
      Width = 27
      Height = 26
      Caption = '3'
      Flat = True
    end
    object LeftParen: TSpeedButton
      Tag = 1
      Left = 4
      Top = 108
      Width = 41
      Height = 25
      Caption = '('
      Flat = True
    end
    object RightParen: TSpeedButton
      Tag = 1
      Left = 45
      Top = 108
      Width = 41
      Height = 25
      Caption = ')'
      Flat = True
    end
    object Power: TSpeedButton
      Tag = 1
      Left = 59
      Top = 82
      Width = 27
      Height = 26
      Caption = '^'
      Flat = True
    end
  end
  object sPanel1: TsPanel
    Left = 94
    Top = 33
    Width = 118
    Height = 28
    TabOrder = 1
    SkinData.SkinSection = 'GROUPBOX'
    object Minus: TSpeedButton
      Tag = 1
      Left = 4
      Top = 3
      Width = 28
      Height = 23
      Caption = '-'
      Flat = True
    end
    object Plus: TSpeedButton
      Tag = 1
      Left = 32
      Top = 3
      Width = 28
      Height = 23
      Caption = '+'
      Flat = True
    end
    object Multiply: TSpeedButton
      Tag = 1
      Left = 60
      Top = 3
      Width = 28
      Height = 23
      Caption = '*'
      Flat = True
    end
    object Divide: TSpeedButton
      Tag = 1
      Left = 88
      Top = 3
      Width = 28
      Height = 23
      Caption = '/'
      Flat = True
    end
  end
  object sPanel3: TsPanel
    Left = 94
    Top = 93
    Width = 118
    Height = 77
    TabOrder = 2
    SkinData.SkinSection = 'GROUPBOX'
    object sin: TSpeedButton
      Tag = 2
      Left = 4
      Top = 3
      Width = 37
      Height = 24
      Caption = 'sin'
      Flat = True
    end
    object cos: TSpeedButton
      Tag = 2
      Left = 41
      Top = 3
      Width = 37
      Height = 24
      Caption = 'cos'
      Flat = True
    end
    object tan: TSpeedButton
      Tag = 2
      Left = 78
      Top = 3
      Width = 37
      Height = 24
      Caption = 'tan'
      Flat = True
    end
    object sinh: TSpeedButton
      Tag = 2
      Left = 4
      Top = 27
      Width = 37
      Height = 24
      Caption = 'sinh'
      Flat = True
    end
    object cosh: TSpeedButton
      Tag = 2
      Left = 41
      Top = 27
      Width = 37
      Height = 24
      Caption = 'cosh'
      Flat = True
    end
    object tanh: TSpeedButton
      Tag = 2
      Left = 78
      Top = 27
      Width = 37
      Height = 24
      Caption = 'tanh'
      Flat = True
    end
    object asin: TSpeedButton
      Tag = 2
      Left = 4
      Top = 51
      Width = 37
      Height = 24
      Caption = 'asin'
      Flat = True
    end
    object acos: TSpeedButton
      Tag = 2
      Left = 41
      Top = 51
      Width = 37
      Height = 24
      Caption = 'acos'
      Flat = True
    end
    object atan: TSpeedButton
      Tag = 2
      Left = 78
      Top = 51
      Width = 37
      Height = 24
      Caption = 'atan'
      Flat = True
    end
  end
  object sPanel4: TsPanel
    Left = 94
    Top = 62
    Width = 118
    Height = 30
    TabOrder = 3
    SkinData.SkinSection = 'GROUPBOX'
    object ln: TSpeedButton
      Tag = 2
      Left = 78
      Top = 3
      Width = 37
      Height = 24
      Caption = 'ln'
      Flat = True
    end
    object exp: TSpeedButton
      Tag = 2
      Left = 41
      Top = 3
      Width = 37
      Height = 24
      Caption = 'exp'
      Flat = True
    end
    object sqrt: TSpeedButton
      Tag = 2
      Left = 4
      Top = 3
      Width = 37
      Height = 24
      Caption = 'sqrt'
      Flat = True
    end
  end
  object EditPanel: TsPanel
    Left = 142
    Top = 3
    Width = 70
    Height = 29
    TabOrder = 4
    SkinData.SkinSection = 'GROUPBOX'
    object Clear: TSpeedButton
      Tag = 3
      Left = 4
      Top = 3
      Width = 27
      Height = 24
      Caption = 'C'
      Flat = True
    end
    object BackSpace: TSpeedButton
      Tag = 4
      Left = 31
      Top = 3
      Width = 36
      Height = 24
      Caption = '<< BS'
      Flat = True
    end
  end
  object VarPanel: TsPanel
    Left = 3
    Top = 3
    Width = 138
    Height = 29
    TabOrder = 5
    SkinData.SkinSection = 'GROUPBOX'
    object SpeedButton1: TSpeedButton
      Tag = 1
      Left = 4
      Top = 3
      Width = 26
      Height = 24
      Caption = 'x1'
      Flat = True
    end
    object SpeedButton2: TSpeedButton
      Tag = 1
      Left = 30
      Top = 3
      Width = 26
      Height = 24
      Caption = 'x2'
      Flat = True
    end
    object SpeedButton3: TSpeedButton
      Tag = 1
      Left = 56
      Top = 3
      Width = 26
      Height = 24
      Caption = 'x3'
      Flat = True
    end
    object SpeedButton4: TSpeedButton
      Tag = 1
      Left = 82
      Top = 3
      Width = 26
      Height = 24
      Caption = 'x4'
      Flat = True
    end
    object Button1: TSpeedButton
      Tag = 1
      Left = 108
      Top = 3
      Width = 26
      Height = 24
      Caption = 'h'
      Flat = True
    end
  end
  object sSkinProvider1: TsSkinProvider
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 112
    Top = 24
  end
end
