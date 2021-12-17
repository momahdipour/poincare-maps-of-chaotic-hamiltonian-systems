object PoincareGraphOptionsFrame: TPoincareGraphOptionsFrame
  Left = 0
  Top = 0
  Width = 323
  Height = 231
  TabOrder = 0
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 323
    Height = 231
    Align = alClient
    TabOrder = 4
    SkinData.SkinSection = 'FORM'
    object AppearanceBtn: TsBitBtn
      Left = 156
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Appearance'
      TabOrder = 2
      OnClick = AppearanceBtnClick
      OnEnter = AppearanceBtnEnter
      SkinData.SkinSection = 'BUTTON'
      ShowFocus = False
    end
    object BoundsBtn: TsBitBtn
      Left = 80
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Axes Bounds'
      TabOrder = 1
      OnClick = BoundsBtnClick
      OnEnter = BoundsBtnEnter
      SkinData.SkinSection = 'BUTTON'
      ShowFocus = False
    end
    object DataBtn: TsBitBtn
      Left = 4
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Graph Data'
      TabOrder = 0
      OnClick = DataBtnClick
      OnEnter = DataBtnEnter
      SkinData.SkinSection = 'BUTTON'
      Down = True
      ShowFocus = False
    end
  end
  object ApplyBtn2: TsBitBtn
    Left = 234
    Top = 202
    Width = 89
    Height = 24
    Caption = 'Apply'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = ApplyBtn2Click
    SkinData.SkinSection = 'BUTTON'
    ShowFocus = False
  end
  object AppearancePanel: TsPanel
    Left = 3
    Top = 28
    Width = 319
    Height = 173
    TabOrder = 2
    SkinData.SkinSection = 'PAGECONTROL'
    object sPanel5: TsPanel
      Left = 5
      Top = 5
      Width = 308
      Height = 73
      TabOrder = 0
      SkinData.SkinSection = 'GROUPBOX'
      object sLabel12: TsLabel
        Left = 7
        Top = 6
        Width = 88
        Height = 13
        Caption = 'Background Color:'
      end
      object sLabel13: TsLabel
        Left = 7
        Top = 28
        Width = 59
        Height = 13
        Caption = 'Points Color:'
      end
      object sLabel14: TsLabel
        Left = 7
        Top = 50
        Width = 59
        Height = 13
        Caption = 'Frame Color:'
      end
      object sLabel15: TsLabel
        Left = 155
        Top = 6
        Width = 50
        Height = 13
        Caption = 'Axes Color'
      end
      object sLabel16: TsLabel
        Left = 155
        Top = 28
        Width = 87
        Height = 13
        Caption = 'Axes Labels Color:'
      end
      object BKColorSelector: TsMMColorSelector
        Left = 114
        Top = 4
        Width = 35
        Height = 21
        TabOrder = 0
        Glyph.Data = {
          06030000424D060300000000000036000000280000000F0000000F0000000100
          180000000000D002000000000000000000000000000000000000000000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000}
        SkinData.SkinSection = 'BUTTON'
        ShowFocus = False
        ColorValue = clWhite
      end
      object PointsColorSelector: TsMMColorSelector
        Left = 114
        Top = 26
        Width = 35
        Height = 21
        TabOrder = 1
        Glyph.Data = {
          06030000424D060300000000000036000000280000000F0000000F0000000100
          180000000000D002000000000000000000000000000000000000FF0001FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFF000000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FFFFFF000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFF000000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FFFFFF000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFF000000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FFFFFF000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFF000000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FFFFFF000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFF000000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FFFFFF000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFF000000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FFFFFF000000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FFFFFF000000FF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FFFFFF000000}
        SkinData.SkinSection = 'BUTTON'
        ShowFocus = False
        ColorValue = clBlue
      end
      object FrameColorSelector: TsMMColorSelector
        Left = 114
        Top = 47
        Width = 35
        Height = 21
        TabOrder = 2
        Glyph.Data = {
          06030000424D060300000000000036000000280000000F0000000F0000000100
          180000000000D002000000000000000000000000000000000000000100FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFF0000000000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FFFFFFFF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFF0000000000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FFFFFFFF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFF0000000000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FFFFFFFF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFF0000000000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FFFFFFFF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFF0000000000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FFFFFFFF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFF0000000000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FFFFFFFF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFF0000000000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FFFFFFFF000000}
        SkinData.SkinSection = 'BUTTON'
        ShowFocus = False
        ColorValue = clRed
      end
      object AxesColorSelector: TsMMColorSelector
        Left = 266
        Top = 4
        Width = 35
        Height = 21
        TabOrder = 3
        Glyph.Data = {
          06030000424D060300000000000036000000280000000F0000000F0000000100
          180000000000D002000000000000000000000000000000000000000100FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFF0000000000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FFFFFFFF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFF0000000000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FFFFFFFF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFF0000000000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FFFFFFFF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFF0000000000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FFFFFFFF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFF0000000000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FFFFFFFF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFF0000000000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FFFFFFFF0000000000FF0000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000FF0000FF0000FF0000FFFFFFFF0000000000FF0000FF
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
          FF0000FFFFFFFF000000}
        SkinData.SkinSection = 'BUTTON'
        ShowFocus = False
        ColorValue = clRed
      end
      object LabelsColorSelector: TsMMColorSelector
        Left = 266
        Top = 26
        Width = 35
        Height = 21
        TabOrder = 4
        Glyph.Data = {
          06030000424D060300000000000036000000280000000F0000000F0000000100
          180000000000D002000000000000000000000000000000000000008001FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF00000000800000800000800000800000800000800000800000
          8000008000008000008000008000008000008000FFFFFF000000008000008000
          0080000080000080000080000080000080000080000080000080000080000080
          00008000FFFFFF00000000800000800000800000800000800000800000800000
          8000008000008000008000008000008000008000FFFFFF000000008000008000
          0080000080000080000080000080000080000080000080000080000080000080
          00008000FFFFFF00000000800000800000800000800000800000800000800000
          8000008000008000008000008000008000008000FFFFFF000000008000008000
          0080000080000080000080000080000080000080000080000080000080000080
          00008000FFFFFF00000000800000800000800000800000800000800000800000
          8000008000008000008000008000008000008000FFFFFF000000008000008000
          0080000080000080000080000080000080000080000080000080000080000080
          00008000FFFFFF00000000800000800000800000800000800000800000800000
          8000008000008000008000008000008000008000FFFFFF000000008000008000
          0080000080000080000080000080000080000080000080000080000080000080
          00008000FFFFFF00000000800000800000800000800000800000800000800000
          8000008000008000008000008000008000008000FFFFFF000000008000008000
          0080000080000080000080000080000080000080000080000080000080000080
          00008000FFFFFF00000000800000800000800000800000800000800000800000
          8000008000008000008000008000008000008000FFFFFF000000008000008000
          0080000080000080000080000080000080000080000080000080000080000080
          00008000FFFFFF000000}
        SkinData.SkinSection = 'BUTTON'
        ShowFocus = False
        ColorValue = clGreen
      end
    end
    object sPanel4: TsPanel
      Left = 5
      Top = 79
      Width = 308
      Height = 57
      TabOrder = 1
      SkinData.SkinSection = 'GROUPBOX'
      object sLabel1: TsLabel
        Left = 26
        Top = 23
        Width = 75
        Height = 13
        Caption = 'Zero lines color:'
      end
      object ZerolinesColorSelector: TsMMColorSelector
        Left = 136
        Top = 19
        Width = 35
        Height = 21
        TabOrder = 1
        Glyph.Data = {
          06030000424D060300000000000036000000280000000F0000000F0000000100
          180000000000D002000000000000000000000000000000000000000001FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF00000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000FFFFFF000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000FFFFFF00000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000FFFFFF000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000FFFFFF00000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000FFFFFF000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000FFFFFF00000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000FFFFFF000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000FFFFFF00000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000FFFFFF000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000FFFFFF00000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000FFFFFF000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000FFFFFF00000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000FFFFFF000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000FFFFFF000000}
        SkinData.SkinSection = 'BUTTON'
        ShowFocus = False
      end
      object DrawZerolinesCheck: TsCheckBox
        Left = 7
        Top = 3
        Width = 126
        Height = 19
        Caption = 'Draw graph zero lines'
        TabOrder = 0
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
        MultiLine = False
      end
    end
    object sPanel6: TsPanel
      Left = 5
      Top = 137
      Width = 308
      Height = 30
      TabOrder = 2
      SkinData.SkinSection = 'GROUPBOX'
      object sLabel2: TsLabel
        Left = 3
        Top = 7
        Width = 55
        Height = 13
        Caption = 'Graph Title:'
      end
      object TitleEdit: TsEdit
        Left = 60
        Top = 2
        Width = 220
        Height = 24
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = 'Poincare Section'
        OnKeyPress = TitleEditKeyPress
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Active = False
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
      end
      object sBitBtn1: TsBitBtn
        Left = 283
        Top = 3
        Width = 23
        Height = 24
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = sBitBtn1Click
        Glyph.Data = {
          A6020000424DA6020000000000003600000028000000100000000D0000000100
          1800000000007002000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF5D5D5D292929292929434343626262FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1F1F
          1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF242424242424FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF24242424
          2424FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF1F1F1F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6262623E3E3E0A0A0A0A
          0A0A3E3E3E484848626262FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF1F1F1F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E3E3E24
          2424FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFC6C6C6434343434343484848626262FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF}
        SkinData.SkinSection = 'BUTTON'
        ShowFocus = False
      end
    end
  end
  object BoundsPanel: TsPanel
    Left = 3
    Top = 28
    Width = 320
    Height = 173
    TabOrder = 1
    SkinData.SkinSection = 'PAGECONTROL'
    object sPanel2: TsPanel
      Left = 5
      Top = 5
      Width = 309
      Height = 75
      TabOrder = 0
      SkinData.SkinSection = 'GROUPBOX'
      object sLabel3: TsLabel
        Left = 9
        Top = 24
        Width = 124
        Height = 13
        Caption = 'Minimum value of the axis:'
      end
      object sLabel4: TsLabel
        Left = 9
        Top = 47
        Width = 127
        Height = 13
        Caption = 'Maximum value of the axis:'
      end
      object sLabel11: TsLabel
        Left = 8
        Top = 3
        Width = 111
        Height = 13
        Caption = 'Horizontal Axis Bounds:'
      end
      object YAxisMinEdit: TsEdit
        Left = 142
        Top = 21
        Width = 163
        Height = 21
        TabOrder = 0
        Text = '-0.5'
        OnKeyPress = YAxisMinEditKeyPress
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Active = False
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
      end
      object YAxisMaxEdit: TsEdit
        Left = 142
        Top = 46
        Width = 163
        Height = 21
        TabOrder = 1
        Text = '1.0'
        OnKeyPress = YAxisMinEditKeyPress
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Active = False
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
      end
    end
    object sPanel3: TsPanel
      Left = 5
      Top = 83
      Width = 309
      Height = 76
      TabOrder = 1
      SkinData.SkinSection = 'GROUPBOX'
      object sLabel5: TsLabel
        Left = 9
        Top = 24
        Width = 124
        Height = 13
        Caption = 'Minimum value of the axis:'
      end
      object sLabel6: TsLabel
        Left = 9
        Top = 47
        Width = 127
        Height = 13
        Caption = 'Maximum value of the axis:'
      end
      object sLabel17: TsLabel
        Left = 8
        Top = 3
        Width = 99
        Height = 13
        Caption = 'Vertical Axis Bounds:'
      end
      object YDOTAxisMinEdit: TsEdit
        Left = 142
        Top = 21
        Width = 163
        Height = 21
        TabOrder = 0
        Text = '-0.6'
        OnKeyPress = YAxisMinEditKeyPress
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Active = False
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
      end
      object YDOTAxisMaxEdit: TsEdit
        Left = 142
        Top = 46
        Width = 163
        Height = 21
        TabOrder = 1
        Text = '0.6'
        OnKeyPress = YAxisMinEditKeyPress
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Active = False
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
      end
    end
  end
  object DataPanel: TsPanel
    Left = 3
    Top = 28
    Width = 320
    Height = 173
    TabOrder = 0
    SkinData.SkinSection = 'PAGECONTROL'
    object JLAqua2: TJLAqua
      Left = 177
      Top = 25
      Width = 132
      Height = 26
      CaptionMouseOver = False
      ButtonActive = False
      BackgroundError = 13232365
      ButtonColor = 9223372
      ButtonShape = bsButton
      Caption = 'Horizontal Axis'
      Enabled = True
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      FontColor = clBlack
      CustomColor = ccNone
      SmallCorners = True
    end
    object sLabel7: TsLabel
      Left = 8
      Top = 8
      Width = 238
      Height = 13
      Caption = 'Select data source for vertical and horizontal axes:'
    end
    object JLAqua3: TJLAqua
      Left = 9
      Top = 25
      Width = 132
      Height = 26
      CaptionMouseOver = False
      ButtonActive = False
      BackgroundError = 13232365
      ButtonColor = 9223372
      ButtonShape = bsButton
      Caption = 'Vertical Axis'
      Enabled = True
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      FontColor = clBlack
      CustomColor = ccNone
      SmallCorners = True
    end
    object sPanel8: TsPanel
      Left = 10
      Top = 52
      Width = 130
      Height = 118
      TabOrder = 0
      SkinData.SkinSection = 'GROUPBOX'
      object VTCheck: TsCheckBox
        Tag = 1
        Left = 9
        Top = 3
        Width = 31
        Height = 19
        Caption = 'T'
        TabOrder = 0
        OnClick = VTCheckClick
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
        MultiLine = False
      end
      object VXCheck: TsCheckBox
        Tag = 2
        Left = 9
        Top = 25
        Width = 31
        Height = 19
        Caption = 'X'
        TabOrder = 1
        OnClick = VTCheckClick
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
        MultiLine = False
      end
      object VXDotCheck: TsCheckBox
        Tag = 3
        Left = 9
        Top = 47
        Width = 54
        Height = 19
        Caption = 'XDOT'
        TabOrder = 2
        OnClick = VTCheckClick
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
        MultiLine = False
      end
      object VYCheck: TsCheckBox
        Tag = 4
        Left = 9
        Top = 70
        Width = 31
        Height = 19
        Caption = 'Y'
        TabOrder = 3
        OnClick = VTCheckClick
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
        MultiLine = False
      end
      object VYDotCheck: TsCheckBox
        Tag = 5
        Left = 9
        Top = 94
        Width = 54
        Height = 19
        Caption = 'YDOT'
        Checked = True
        State = cbChecked
        TabOrder = 4
        OnClick = VTCheckClick
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
        MultiLine = False
      end
    end
    object sPanel7: TsPanel
      Left = 178
      Top = 52
      Width = 130
      Height = 118
      TabOrder = 1
      SkinData.SkinSection = 'GROUPBOX'
      object HTCheck: TsCheckBox
        Tag = 1
        Left = 9
        Top = 3
        Width = 31
        Height = 19
        Caption = 'T'
        TabOrder = 0
        OnClick = HTCheckClick
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
        MultiLine = False
      end
      object HXCheck: TsCheckBox
        Tag = 2
        Left = 9
        Top = 25
        Width = 31
        Height = 19
        Caption = 'X'
        TabOrder = 1
        OnClick = HTCheckClick
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
        MultiLine = False
      end
      object HXDotCheck: TsCheckBox
        Tag = 3
        Left = 9
        Top = 47
        Width = 54
        Height = 19
        Caption = 'XDOT'
        TabOrder = 2
        OnClick = HTCheckClick
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
        MultiLine = False
      end
      object HYCheck: TsCheckBox
        Tag = 4
        Left = 9
        Top = 70
        Width = 31
        Height = 19
        Caption = 'Y'
        Checked = True
        State = cbChecked
        TabOrder = 3
        OnClick = HTCheckClick
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
        MultiLine = False
      end
      object HYDotCheck: TsCheckBox
        Tag = 5
        Left = 9
        Top = 94
        Width = 54
        Height = 19
        Caption = 'YDOT'
        TabOrder = 4
        OnClick = HTCheckClick
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
        MultiLine = False
      end
    end
  end
end
