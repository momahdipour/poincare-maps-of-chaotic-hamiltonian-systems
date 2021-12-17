object LinearizationCalculationFrame: TLinearizationCalculationFrame
  Left = 0
  Top = 0
  Width = 763
  Height = 495
  TabOrder = 0
  object Label1: TLabel
    Left = 0
    Top = 24
    Width = 13
    Height = 471
    Align = alLeft
    AutoSize = False
    Color = clBtnShadow
    ParentColor = False
  end
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 763
    Height = 24
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Initial Conditions'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4079166
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    SkinData.SkinSection = 'MAINMENU'
  end
  object sPanel2: TsPanel
    Left = 13
    Top = 24
    Width = 750
    Height = 471
    Align = alClient
    TabOrder = 1
    SkinData.SkinSection = 'FORM'
    object InitialCountLabel: TsLabel
      Left = 197
      Top = 101
      Width = 65
      Height = 17
      AutoSize = False
      Caption = '14'
    end
    object sLabel3: TsLabel
      Left = 24
      Top = 100
      Width = 170
      Height = 13
      Caption = 'Number of required initial conditions:'
    end
    object sLabel2: TsLabel
      Left = 24
      Top = 80
      Width = 128
      Height = 13
      Caption = 'Value of n for fourier series:'
    end
    object sLabel1: TsLabel
      Left = 6
      Top = 32
      Width = 746
      Height = 37
      AutoSize = False
      Caption = 
        'For Linearization about a fix point, this program uses fourier s' +
        'eries. Define the number of variables ((n+1)*2) and select (n+1)' +
        '*2 initial conditions from the graph:'
      ParentFont = False
      WordWrap = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object nSpinEdit: TSpinEdit
      Left = 156
      Top = 76
      Width = 47
      Height = 22
      MaxValue = 50000
      MinValue = 1
      TabOrder = 0
      Value = 3
      OnChange = nSpinEditChange
    end
    object sPanel3: TsPanel
      Left = 23
      Top = 128
      Width = 726
      Height = 305
      TabOrder = 1
      SkinData.SkinSection = 'GROUPBOX'
      object sLabel5: TsLabel
        Left = 16
        Top = 3
        Width = 79
        Height = 13
        Caption = 'Initial Conditions:'
      end
      object sLabel6: TsLabel
        Left = 24
        Top = 240
        Width = 96
        Height = 13
        Caption = 'Total points defined:'
      end
      object sLabel7: TsLabel
        Left = 128
        Top = 240
        Width = 73
        Height = 17
        AutoSize = False
        Caption = '0'
      end
      object sListBox1: TsListBox
        Left = 16
        Top = 16
        Width = 561
        Height = 209
        AutoComplete = False
        BoundLabel.Active = False
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        Columns = 2
        SkinData.SkinSection = 'EDIT'
        ItemHeight = 16
        TabOrder = 0
      end
      object Seperator2: TsPanel
        Left = 587
        Top = 17
        Width = 2
        Height = 211
        TabOrder = 1
        SkinData.SkinSection = 'SPEEDBUTTON'
      end
      object sBitBtn1: TsBitBtn
        Left = 600
        Top = 24
        Width = 113
        Height = 33
        Caption = 'New Random Point'
        TabOrder = 2
        SkinData.SkinSection = 'BUTTON'
        ShowFocus = False
      end
      object sBitBtn2: TsBitBtn
        Left = 600
        Top = 64
        Width = 113
        Height = 33
        Caption = 'New Point'
        TabOrder = 3
        SkinData.SkinSection = 'BUTTON'
        ShowFocus = False
      end
      object sBitBtn3: TsBitBtn
        Left = 600
        Top = 104
        Width = 113
        Height = 33
        Caption = 'Remove'
        TabOrder = 4
        SkinData.SkinSection = 'BUTTON'
        ShowFocus = False
      end
      object sBitBtn4: TsBitBtn
        Left = 600
        Top = 144
        Width = 113
        Height = 41
        Caption = 'Change'
        TabOrder = 5
        SkinData.SkinSection = 'BUTTON'
        ShowFocus = False
      end
      object sBitBtn5: TsBitBtn
        Left = 16
        Top = 272
        Width = 137
        Height = 25
        Caption = 'Autoselect Random Points'
        TabOrder = 6
        SkinData.SkinSection = 'BUTTON'
        ShowFocus = False
      end
      object sBitBtn6: TsBitBtn
        Left = 160
        Top = 272
        Width = 137
        Height = 25
        Caption = 'Select Points Manually'
        TabOrder = 7
        SkinData.SkinSection = 'BUTTON'
        ShowFocus = False
      end
    end
    object sBitBtn8: TsBitBtn
      Left = 608
      Top = 444
      Width = 113
      Height = 25
      Caption = 'Calculate'
      TabOrder = 2
      SkinData.SkinSection = 'BUTTON'
      ShowFocus = False
    end
    object sBitBtn7: TsBitBtn
      Left = 472
      Top = 444
      Width = 113
      Height = 25
      Caption = 'View Last Results'
      TabOrder = 3
      SkinData.SkinSection = 'BUTTON'
      ShowFocus = False
    end
  end
end
