object FontDialogFrame: TFontDialogFrame
  Left = 0
  Top = 0
  Width = 410
  Height = 262
  TabOrder = 0
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 410
    Height = 262
    Align = alClient
    TabOrder = 0
    SkinData.SkinSection = 'FORM'
    object sPanel3: TsPanel
      Left = 7
      Top = 151
      Width = 153
      Height = 103
      TabOrder = 7
      SkinData.SkinSection = 'GROUPBOX'
      object sLabel2: TsLabel
        Left = 6
        Top = 2
        Width = 36
        Height = 13
        Caption = 'Effects:'
      end
      object StrikeCheck: TsCheckBox
        Left = 8
        Top = 16
        Width = 66
        Height = 19
        Caption = 'Strikeout'
        TabOrder = 0
        OnClick = StrikeCheckClick
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
        MultiLine = False
      end
      object UnderLineCheck: TsCheckBox
        Left = 8
        Top = 40
        Width = 69
        Height = 19
        Caption = 'Underline'
        TabOrder = 1
        OnClick = UnderLineCheckClick
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
        MultiLine = False
      end
      object ColorCombo: TsMMColorBox
        Left = 8
        Top = 74
        Width = 135
        Height = 19
        Alignment = taLeftJustify
        BoundLabel.Active = True
        BoundLabel.Caption = '&Color:'
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclTopLeft
        BoundLabel.MaxWidth = 0
        SkinData.SkinSection = 'COMBOBOX'
        Style = csOwnerDrawFixed
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 2
        Text = 'clBlack'
        OnChange = ColorComboChange
        Items.Strings = (
          'clBlack'
          'clMaroon'
          'clGreen'
          'clOlive'
          'clNavy'
          'clPurple'
          'clTeal'
          'clGray'
          'clSilver'
          'clRed'
          'clLime'
          'clYellow'
          'clBlue'
          'clFuchsia'
          'clAqua'
          'clWhite'
          'clWhite')
        HTMLcolor = '#000000'
        Selected = clBlack
      end
    end
    object sPanel2: TsPanel
      Left = 167
      Top = 151
      Width = 158
      Height = 103
      TabOrder = 8
      SkinData.SkinSection = 'GROUPBOX'
      object sLabel1: TsLabel
        Left = 6
        Top = 2
        Width = 38
        Height = 13
        Caption = 'Sample:'
      end
      object SamplePanel: TsPanel
        Left = 13
        Top = 20
        Width = 130
        Height = 73
        BorderStyle = bsSingle
        Caption = 'AaBbYyZz'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        SkinData.SkinSection = 'SPLITTER'
      end
    end
    object NameList: TsListBox
      Left = 6
      Top = 17
      Width = 153
      Height = 129
      BoundLabel.Active = True
      BoundLabel.Caption = 'Font:'
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclTopLeft
      BoundLabel.MaxWidth = 0
      SkinData.SkinSection = 'EDIT'
      ItemHeight = 16
      Sorted = True
      TabOrder = 0
      OnClick = NameListClick
    end
    object StyleEdit: TsEdit
      Left = 166
      Top = 16
      Width = 105
      Height = 21
      TabOrder = 1
      OnChange = StyleEditChange
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Active = True
      BoundLabel.Caption = 'Font Style:'
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclTopLeft
      BoundLabel.MaxWidth = 0
    end
    object StyleList: TsListBox
      Left = 166
      Top = 40
      Width = 106
      Height = 106
      BoundLabel.Active = False
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclTopLeft
      BoundLabel.MaxWidth = 0
      SkinData.SkinSection = 'EDIT'
      ItemHeight = 16
      Items.Strings = (
        'Regular'
        'Italic'
        'Bold'
        'Bold Italic')
      TabOrder = 2
      OnClick = StyleListClick
    end
    object SizeEdit: TsEdit
      Left = 275
      Top = 16
      Width = 49
      Height = 21
      TabOrder = 3
      OnChange = SizeEditChange
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Active = True
      BoundLabel.Caption = 'Size:'
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclTopLeft
      BoundLabel.MaxWidth = 0
    end
    object SizeList: TsListBox
      Left = 276
      Top = 40
      Width = 49
      Height = 106
      BoundLabel.Active = False
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      SkinData.SkinSection = 'EDIT'
      ItemHeight = 16
      Items.Strings = (
        '8'
        '10'
        '12'
        '14'
        '16'
        '18'
        '20'
        '24'
        '28'
        '36'
        '46'
        '76')
      TabOrder = 4
      OnClick = SizeListClick
    end
    object OKBtn: TsBitBtn
      Left = 330
      Top = 16
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 5
      SkinData.SkinSection = 'BUTTON'
      ShowFocus = False
    end
    object CancelBtn: TsBitBtn
      Left = 330
      Top = 48
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 6
      SkinData.SkinSection = 'BUTTON'
      ShowFocus = False
    end
  end
end
