object PoincareSectionCalculationSetupFrame: TPoincareSectionCalculationSetupFrame
  Left = 0
  Top = 0
  Width = 443
  Height = 270
  Align = alClient
  TabOrder = 0
  OnResize = FrameResize
  object Label1: TLabel
    Left = 0
    Top = 24
    Width = 13
    Height = 203
    Align = alLeft
    AutoSize = False
    Color = clBtnShadow
    ParentColor = False
  end
  object MainPanel: TsPanel
    Left = 13
    Top = 24
    Width = 413
    Height = 203
    Align = alClient
    BevelWidth = 2
    TabOrder = 0
    OnResize = MainPanelResize
    SkinData.SkinSection = 'FORM'
    object InitialConditionsHeader: TJLAqua
      Left = 24
      Top = 173
      Width = 441
      Height = 25
      CaptionMouseOver = False
      ButtonActive = False
      BackgroundError = clBtnFace
      ButtonColor = 16251287
      ButtonShape = bsButton
      Caption = 
        'Initial Conditions For Hamiltonian System                       ' +
        '          '
      Enabled = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      FontColor = clBlack
      CustomColor = ccNone
      SmallCorners = True
      OnClick = InitialConditionsHeaderClick
    end
    object CalculationOptionsHeader: TJLAqua
      Left = 24
      Top = 334
      Width = 441
      Height = 25
      CaptionMouseOver = False
      ButtonActive = True
      BackgroundError = clBtnFace
      ButtonColor = 16251287
      ButtonShape = bsButton
      Caption = 
        'Calculation Options                                             ' +
        '                          '
      Enabled = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      FontColor = clBlack
      CustomColor = ccNone
      SmallCorners = True
      OnClick = CalculationOptionsHeaderClick
    end
    object EquationSettingsHeader: TJLAqua
      Left = 24
      Top = 5
      Width = 441
      Height = 25
      CaptionMouseOver = False
      ButtonActive = True
      BackgroundError = clBtnFace
      ButtonColor = 16251287
      ButtonShape = bsButton
      Caption = 
        'Hamiltonian Equation Settings                                   ' +
        '                   '
      Enabled = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      FontColor = clBlack
      CustomColor = ccNone
      SmallCorners = True
      OnClick = EquationSettingsHeaderClick
    end
    object OtherOptionsHeader: TJLAqua
      Left = 24
      Top = 489
      Width = 441
      Height = 25
      CaptionMouseOver = False
      ButtonActive = True
      BackgroundError = clBtnFace
      ButtonColor = 16251287
      ButtonShape = bsButton
      Caption = 
        'Other Options                                                   ' +
        '                              '
      Enabled = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      FontColor = clBlack
      CustomColor = ccNone
      SmallCorners = True
      OnClick = OtherOptionsHeaderClick
    end
    object OtherOptionsBody: TsPanel
      Left = 36
      Top = 513
      Width = 616
      Height = 148
      BevelOuter = bvSpace
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 4
      SkinData.SkinSection = 'GROUPBOX'
      object sPanel14: TsPanel
        Left = 1
        Top = 108
        Width = 614
        Height = 39
        Alignment = taLeftJustify
        TabOrder = 2
        SkinData.SkinSection = 'TABLEFT'
        object BackgroundProcCheckBox: TsCheckBox
          Left = 8
          Top = 3
          Width = 136
          Height = 13
          Caption = 'Background processing'
          TabOrder = 0
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
          MultiLine = False
        end
        object MinimizeToTtrayCheckBox: TsCheckBox
          Left = 8
          Top = 22
          Width = 177
          Height = 13
          Caption = 'Minimize to tray while calculating'
          TabOrder = 1
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
          MultiLine = False
        end
      end
      object sPanel15: TsPanel
        Left = 1
        Top = 41
        Width = 614
        Height = 67
        Align = alTop
        Alignment = taLeftJustify
        TabOrder = 1
        SkinData.SkinSection = 'TABLEFT'
        object OutputFileLabel: TsLabel
          Left = 35
          Top = 29
          Width = 51
          Height = 13
          Caption = 'Output file:'
          Enabled = False
        end
        object SaveToDiskCheckBox: TsCheckBox
          Left = 8
          Top = 3
          Width = 305
          Height = 14
          AutoSize = False
          Caption = 
            'Save points to disk automatically every                     minu' +
            'tes'
          TabOrder = 0
          OnClick = SaveToDiskCheckBoxClick
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
          MultiLine = False
        end
        object SaveToDiskMinutesSpin: TSpinEdit
          Left = 212
          Top = 1
          Width = 56
          Height = 22
          Enabled = False
          MaxValue = 99999
          MinValue = 1
          TabOrder = 1
          Value = 5
        end
        object OutputFileEdit: TsEdit
          Left = 88
          Top = 26
          Width = 489
          Height = 21
          Enabled = False
          ReadOnly = True
          TabOrder = 2
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
        object OutputFileOpenBtn: TsBitBtn
          Left = 579
          Top = 25
          Width = 33
          Height = 21
          Hint = 'Select output file'
          Caption = '...'
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = OutputFileOpenBtnClick
          SkinData.SkinSection = 'BUTTON'
          ShowFocus = False
        end
        object TurnOffCheckBox: TsCheckBox
          Left = 35
          Top = 49
          Width = 228
          Height = 14
          Caption = 'Turn off computer when calculation is done'
          Enabled = False
          TabOrder = 4
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
          MultiLine = False
        end
      end
      object sPanel16: TsPanel
        Left = 1
        Top = 1
        Width = 614
        Height = 40
        Align = alTop
        Alignment = taLeftJustify
        TabOrder = 0
        SkinData.SkinSection = 'TABLEFT'
        object LogFileLabel: TsLabel
          Left = 35
          Top = 20
          Width = 37
          Height = 13
          Caption = 'Log file:'
          Enabled = False
        end
        object LogFileCheckBox: TsCheckBox
          Left = 8
          Top = 3
          Width = 144
          Height = 13
          AutoSize = False
          Caption = 'Log error messages to file'
          TabOrder = 0
          OnClick = LogFileCheckBoxClick
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
          MultiLine = False
        end
        object LogFileEdit: TsEdit
          Left = 72
          Top = 18
          Width = 506
          Height = 21
          Enabled = False
          ReadOnly = True
          TabOrder = 1
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
        object LogFileOpenBtn: TsBitBtn
          Left = 579
          Top = 17
          Width = 33
          Height = 21
          Hint = 'Select error log file'
          Caption = '...'
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = LogFileOpenBtnClick
          SkinData.SkinSection = 'BUTTON'
          ShowFocus = False
        end
      end
    end
    object DefaultValuesBtn1: TsBitBtn
      Left = 424
      Top = 19
      Width = 28
      Height = 23
      Hint = 'Default initial conditions'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TabStop = False
      Visible = False
      OnClick = DefaultValuesBtn1Click
      Glyph.Data = {
        86050000424D8605000000000000360000002800000016000000140000000100
        1800000000005005000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA37875A37875A37875A37875A37875A3
        7875A37875A37875A37875A37875A37875A37875A378758A5B5AFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA57B77A37875A37875A37875
        A37875A37875A37875A37875A37875A37875A37875A37875A378758C5C5CFFFF
        FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA97E78A37875F6EF
        E7F6EFE7F6EFE7F6EFE7F6EFE7F6EFE7F6EFE7F6EFE7F6EFE7F6EFE7A378758E
        5E5DFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAE817AA3
        7875F6EFE7808080808080808080808080808080808080808080808080F6EFE7
        A3787591615EFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        B2857CA37875F6EFE78080808080808080808080808080808080808080808080
        80F6EFE7A37875946460FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFA97E78A37875934932974B32934932D8E9ECD8E9ECD8E9ECD8E9ECD8
        E9ECF6EFE7F6EFE7A37875976762FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFA97E78A378759B5036BC6836A75836964C36808080808080
        808080808080808080F6EFE7A378759A6A65FFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFA97E78A3787593482FB5612FBE692FA1522F8F46
        2F808080808080808080808080F6EFE7A378759E6D67FFFFFFFFFFFF0000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA97E78A37875934932974B32BF6A32C2
        6C329D5032934932D8E9ECFFFFFFF6EFE7F6EFE7A37875A17169FFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA97E78A37875FFFFFF934932
        9D5032C26C32BC6732974C32808080808080808080F6EFE7A37875A5746CFFFF
        FFFFFFFF0000A55532B56332B56332B56332B56332B56332B56332B36032974C
        32808080934932A65732C26C32AA5A32934932808080808080F6EFE7A37875A8
        776DFFFFFFFFFFFF0000B36236CE7736C77036C57036C57036C57036C57036C3
        6D369E5236E8F9FCE8F9FC964C36C06B36C36D369B5036FFFFFFFFEDDCFFDDD1
        A37875AB7A70FFFFFFFFFFFF0000B2602FD1782FCB732FBD682F92472F8F462F
        8F462F8F462F8F462FD8E9EC8080808F462FA3542FBE692FA1522F8080808080
        80F3BBB1A37875AE7D71FFFFFFFFFFFF0000BB6732E18532C26C32D17932C26C
        32984D32A97E78E0D0C5D8E9ECD8E9EC808080808080A25432C26C32AA5A3280
        8080808080B28074A37875B28074FFFFFFFFFFFF0000C16B32EC8F32A95932AD
        5C32D77E32C56E32984D32934932D8E9ECD8E9ECD8E9ECD8E9ECA25432C26C32
        AA5A32934932B28074FCC47BA37875A37875FFFFFFFFFFFF0000C26F35F59935
        B26032934932AD5C32DB8132C87232A05232934932D8E9ECD8E9EC934932AA5A
        32C26C32A55532A37875A37875A37875A37875A37875FFFFFFFFFFFF0000C579
        44F9AA4EB56538FFFFFF964C36B56336E28836DC8336B56336A15436964C36A6
        5736C36D36C36D369B5036A37875A37875A37875A37875A37875FFFFFFFFFFFF
        0000BE784CF2B065A75B35FFFFFFFFFFFF8F462FA0512FD57B2FD97F2FD2782F
        CB732FC46D2FBC662F984C2F8F462FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF00009D5438AA613F934932FFFFFFFFFFFFFFFFFF934932934932B360
        32C56E32C77032B462329B4F32934932FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000}
      SkinData.SkinSection = 'BUTTON'
      ShowFocus = False
    end
    object InitialConditionsBody: TsPanel
      Left = 36
      Top = 197
      Width = 616
      Height = 137
      BevelOuter = bvSpace
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 2
      SkinData.SkinSection = 'GROUPBOX'
      object IniPanel1: TsPanel
        Left = 1
        Top = 1
        Width = 614
        Height = 27
        Alignment = taLeftJustify
        TabOrder = 0
        SkinData.SkinSection = 'TABLEFT'
        object Image1: TImage
          Left = 31
          Top = 4
          Width = 28
          Height = 21
          Picture.Data = {
            07544269746D617042010000424D420100000000000076000000280000001800
            0000110000000100040000000000CC0000000000000000000000100000000000
            0000000000000000800000800000008080008000000080008000808000008080
            8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00FFFFFFFFFFFFFFFFFFCFFFFFFFFFFFFFFFFFFFFFFFFCFFFFFFFFFFFFFFFF
            FFFFFFFFCFFFFFFFFFFFFFFFFFFFFFFFCFFFFCCCFFFCCCCFFFFFFFFFFCFFCCCF
            CFCCFFFCCFFFFFFFCFCFFFCFFCCCFFFFFCFFFFFFFCCFFFFFFFCCFFFFFFFFFFFF
            FFCCFFFFFFCCCFFFFFFFFFFFFFFFFFFFFFFCCFFFFFFFFFFFFFFFFFFFFFFFCCFF
            FFFFFFFFFFFFFFFFCCFFCCFFFFFFFFFFFFFFFFFFCCCFFCCFFFFFFFFFFFFFFFFF
            CFFFFCCCFFFFFFFFFFFFFFFFFCFFFFCCCCFFFFFFFFFFFFFFFFCCFFCCFFCCCFFF
            FFFFFFFFFFFFCCCCFFFCCFFFFFFF}
          Transparent = True
        end
        object sLabel1: TsLabel
          Left = 81
          Top = 0
          Width = 21
          Height = 23
          AutoSize = False
          Caption = '='
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
        end
        object X1Label: TsLabel
          Left = 219
          Top = 6
          Width = 9
          Height = 16
          Caption = '0'
          ParentFont = False
          Layout = tlCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
        end
      end
      object IniPanel2: TsPanel
        Left = 1
        Top = 28
        Width = 614
        Height = 27
        Alignment = taLeftJustify
        TabOrder = 1
        SkinData.SkinSection = 'TABLEFT'
        object Image2: TImage
          Left = 31
          Top = 4
          Width = 28
          Height = 21
          Picture.Data = {
            07544269746D617086010000424D860100000000000076000000280000001A00
            0000110000000100040000000000100100000000000000000000100000000000
            0000000000000000800000800000008080008000000080008000808000008080
            8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00FFFFFFFFFFFFFFFFFFCCCCCFFF000000FFFFFFFFFFFFFFFFFFFCCFCCFF00
            0000FFFFFFFFFFFFFFFFFFFFFCFFFF000000FFFFFFFFFFFFFFFFFFFFFFCCFF00
            0000FCCCFFFCCCCFFFFFFFFFFFFFCF000000CCCFCFCCFFFCCFFFFFFFFCCFFC00
            0000FFCFFCCCFFFFFCFFFFFFFCCFFC000000FFFFFFCCFFFFFFFFFFFFFFFCCC00
            0000FFFFFFCCCFFFFFFFFFFFFFFFFF000000FFFFFFFCCFFFFFFFFFFFFFFFFF00
            0000FFFFFFFFCCFFFFFFFFFFFFFFFF000000FFFFCCFFCCFFFFFFFFFFFFFFFF00
            0000FFFFCCCFFCCFFFFFFFFFFFFFFF000000FFFFCFFFFCCCFFFFFFFFFFFFFF00
            0000FFFFFCFFFFCCCCFFFFFFFFFFFF000000FFFFFFCCFFCCFFCCCFFFFFFFFF00
            0000FFFFFFFFCCCCFFFCCFFFFFFFFF000000}
          Transparent = True
        end
        object sLabel2: TsLabel
          Left = 81
          Top = 0
          Width = 21
          Height = 23
          AutoSize = False
          Caption = '='
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
        end
        object x2IniEdit: TsEdit
          Left = 126
          Top = 1
          Width = 207
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          Text = '-0.3'
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
      object IniPanel3: TsPanel
        Left = 1
        Top = 55
        Width = 614
        Height = 27
        Alignment = taLeftJustify
        TabOrder = 2
        SkinData.SkinSection = 'TABLEFT'
        object Image3: TImage
          Left = 31
          Top = 4
          Width = 28
          Height = 21
          Picture.Data = {
            07544269746D617086010000424D860100000000000076000000280000001900
            0000110000000100040000000000100100000000000000000000100000000000
            0000000000000000800000800000008080008000000080008000808000008080
            8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00FFFFFFFFFFFFFFFFFFCCCCFFF0000000FFFFFFFFFFFFFFFFFFFCCFCFF000
            0000FFFFFFFFFFFFFFFFFFFFFFFCF0000000FFFFFFFFFFFFFFFFFFFFFCCFF000
            0000FFCCCFFFCCCCFFFFFFFFFFFCF0000000FCCCFCFCCFFFCCFFFFFFFFFFC000
            0000FFFCFFCCCFFFFFCFFFFFFCFFC0000000FFFFFFFCCFFFFFFFFFFFFFCCC000
            0000FFFFFFFCCCFFFFFFFFFFFFFFF0000000FFFFFFFFCCFFFFFFFFFFFFFFF000
            0000FFFFFFFFFCCFFFFFFFFFFFFFF0000000FFFFFCCFFCCFFFFFFFFFFFFFF000
            0000FFFFFCCCFFCCFFFFFFFFFFFFF0000000FFFFFCFFFFCCCFFFFFFFFFFFF000
            0000FFFFFFCFFFFCCCCFFFFFFFFFF0000000FFFFFFFCCFFCCFFCCCFFFFFFF000
            0000FFFFFFFFFCCCCFFFCCFFFFFFF0000000}
          Transparent = True
        end
        object sLabel3: TsLabel
          Left = 81
          Top = 0
          Width = 21
          Height = 23
          AutoSize = False
          Caption = '='
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
        end
        object X3Label: TsLabel
          Left = 185
          Top = 7
          Width = 78
          Height = 16
          Caption = '{Calculate}'
          ParentFont = False
          Layout = tlCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
        end
      end
      object IniPanel4: TsPanel
        Left = 1
        Top = 82
        Width = 614
        Height = 27
        Alignment = taLeftJustify
        TabOrder = 3
        SkinData.SkinSection = 'TABLEFT'
        object Image4: TImage
          Left = 31
          Top = 4
          Width = 28
          Height = 21
          Picture.Data = {
            07544269746D617086010000424D860100000000000076000000280000001900
            0000110000000100040000000000100100000000000000000000100000000000
            0000000000000000800000800000008080008000000080008000808000008080
            8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00FFFFFFFFFFFFFFFFFFFCFFFFF0000000FFFFFFFFFFFFFFFFFFFFCFFFF000
            0000FFFFFFFFFFFFFFFFFFCCCCCCF0000000FFFFFFFFFFFFFFFFFFCFFCFFF000
            0000FCCCFFFCCCCFFFFFFFFCCFCFF0000000CCCFCFCCFFFCCFFFFFFFFCCCF000
            0000FFCFFCCCFFFFFCFFFFFFFFCCF0000000FFFFFFCCFFFFFFFFFFFFFFFCC000
            0000FFFFFFCCCFFFFFFFFFFFFFFFF0000000FFFFFFFCCFFFFFFFFFFFFFFFF000
            0000FFFFFFFFCCFFFFFFFFFFFFFFF0000000FFFFCCFFCCFFFFFFFFFFFFFFF000
            0000FFFFCCCFFCCFFFFFFFFFFFFFF0000000FFFFCFFFFCCCFFFFFFFFFFFFF000
            0000FFFFFCFFFFCCCCFFFFFFFFFFF0000000FFFFFFCCFFCCFFCCCFFFFFFFF000
            0000FFFFFFFFCCCCFFFCCFFFFFFFF0000000}
          Transparent = True
        end
        object sLabel4: TsLabel
          Left = 81
          Top = 0
          Width = 21
          Height = 23
          AutoSize = False
          Caption = '='
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
        end
        object x4IniEdit: TsEdit
          Left = 126
          Top = 1
          Width = 207
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          Text = '-0.2'
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
      object sPanel6: TsPanel
        Left = 1
        Top = 109
        Width = 614
        Height = 27
        Alignment = taLeftJustify
        TabOrder = 4
        SkinData.SkinSection = 'TABLEFT'
        object Image5: TImage
          Left = 31
          Top = 4
          Width = 28
          Height = 21
          Picture.Data = {
            07544269746D617012010000424D120100000000000076000000280000001300
            00000D00000001000400000000009C0000000000000000000000100000000000
            0000000000000000800000800000008080008000000080008000808000008080
            8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00FCCCCFFFFFCCCFFFFFF00000FCCFFCCFFFCCCCCFFFF00000FFCFFFCFFFCC
            FFFCFFF00000FFFFFFCCFFCCFFFFFFF00000FFFFCFFCCFFCCFFFFFF00000FFFF
            FCCCCFFCCFFFFFF00000FFFFFFFFCCCCCCCFFFF00000FFFFFFFFCCFFCCFCCFF0
            0000FFFFFFCCFCCFFCCFFFF00000FFFFFFCCFFCFFFCCFFF00000FFFFFFFCFFFC
            FFFCCFF00000FFFFFFFFCFFFCFFFCCF00000FFFFFFFFFCCCCCFFFCC00000}
          Transparent = True
        end
        object sLabel5: TsLabel
          Left = 81
          Top = 0
          Width = 21
          Height = 23
          AutoSize = False
          Caption = '='
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
        end
        object HIniEdit: TsEdit
          Left = 126
          Top = 1
          Width = 207
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          Text = '0.1'
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
    object CalculationOptionsBody: TsPanel
      Left = 36
      Top = 358
      Width = 616
      Height = 132
      BevelOuter = bvSpace
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 3
      SkinData.SkinSection = 'GROUPBOX'
      object sPanel7: TsPanel
        Left = 1
        Top = 25
        Width = 614
        Height = 83
        Alignment = taLeftJustify
        TabOrder = 1
        SkinData.SkinSection = 'TABLEFT'
        object sLabel8: TsLabel
          Left = 8
          Top = 1
          Width = 267
          Height = 20
          Caption = 'Number of used initial conditions:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
        end
        object sLabel9: TsLabel
          Left = 30
          Top = 25
          Width = 264
          Height = 16
          Caption = 'Initial condition changing value for     ='
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
        end
        object sLabel10: TsLabel
          Left = 30
          Top = 62
          Width = 264
          Height = 16
          Caption = 'Initial condition changing value for     ='
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
        end
        object x2IniImage: TImage
          Left = 268
          Top = 29
          Width = 16
          Height = 12
          AutoSize = True
          Picture.Data = {
            07544269746D6170D6000000424DD60000000000000076000000280000001000
            00000C0000000100040000000000600000000000000000000000100000000000
            0000000000000000800000800000008080008000000080008000808000008080
            8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00FFFFFFFFFFF0000FFFFFFFFFFFFF0FF0FFFFFFFFFFFFF0FFFFFFFFFFFFFF
            FF0F00FFF000FFFFFFF00000000F0FFFFFF0FFFF000FFFFF0FF0FFFF00FFFFFF
            F00FFFFF00FFFFFFFFFFFFF0000FFFFFFFFFFF0000F000FFFFFFFFFF0FFF00FF
            FFFF}
          Transparent = True
        end
        object x4IniImage: TImage
          Left = 268
          Top = 67
          Width = 17
          Height = 12
          AutoSize = True
          Picture.Data = {
            07544269746D617006010000424D060100000000000076000000280000001100
            00000C0000000100040000000000900000000000000000000000100000000000
            0000000000000000800000800000008080008000000080008000808000008080
            8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00FFFFFFFFFFFFFF0FF0000000FFFFFFFFFFFFFF0FF0000000FFFFFFFFFFFF
            000000000000FFFFFFFFFFFF0FF0F000000000FFF000FFFFF0F0F00000000000
            000F0FFFFF00F0000000FFFF000FFFFFFFF000000000FFFF00FFFFFFFFFF0000
            0000FFFF00FFFFFFFFFFF0000000FFF0000FFFFFFFFFF0000000FF0000F000FF
            FFFFF0000000FFFF0FFF00FFFFFFF0000000}
          Transparent = True
        end
        object Image8: TImage
          Left = 24
          Top = 16
          Width = 4
          Height = 68
          AutoSize = True
          Picture.Data = {
            07544269746D617086010000424D860100000000000076000000280000000400
            0000440000000100040000000000100100000000000000000000100000000000
            0000000000000000800000800000008080008000000080008000808000008080
            8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00FF000000F0FF0000F0FF0000F0FF0000F0FF0000F0FF0000F0FF0000F0FF
            0000F0FF0000F0FF0000F0FF0000F0FF0000F0FF0000F0FF0000F0FF0000F0FF
            0000F0FF0000F0FF0000F0FF0000F0FF0000F0FF0000F0FF0000F0FF0000F0FF
            0000F0FF0000F0FF0000F0FF0000F0FF0000F0FF0000F0FF0000F0FF0000F0FF
            0000F0FF00000FFF00000FFF0000F0FF0000F0FF0000F0FF0000F0FF0000F0FF
            0000F0FF0000F0FF0000F0FF0000F0FF0000F0FF0000F0FF0000F0FF0000F0FF
            0000F0FF0000F0FF0000F0FF0000F0FF0000F0FF0000F0FF0000F0FF0000F0FF
            0000F0FF0000F0FF0000F0FF0000F0FF0000F0FF0000F0FF0000F0FF0000F0FF
            0000F0FF0000F0FF0000F0FF0000FF000000}
          Transparent = True
        end
        object x3IniImage: TImage
          Left = 204
          Top = 45
          Width = 16
          Height = 12
          AutoSize = True
          Picture.Data = {
            07544269746D6170D6000000424DD60000000000000076000000280000001000
            00000C0000000100040000000000600000000000000000000000100000000000
            0000000000000000800000800000008080008000000080008000808000008080
            8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFF0FF00FFFFFFFFFFFFF
            F00F00FFF000FFFFF00F0000000F0FFF00FFFFFF000FFFFFF00FFFFF00FFFF0F
            F00FFFFF00FFFFF000FFFFF0000FFFFFFFFFFF0000F000FFFFFFFFFF0FFF00FF
            FFFF}
          Transparent = True
          Visible = False
        end
        object x1IniImage: TImage
          Left = 228
          Top = 45
          Width = 16
          Height = 12
          AutoSize = True
          Picture.Data = {
            07544269746D6170D6000000424DD60000000000000076000000280000001000
            00000C0000000100040000000000600000000000000000000000100000000000
            0000000000000000800000800000008080008000000080008000808000008080
            8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00FFFFFFFFFFF000FFFFFFFFFFFFFF0FFFFFFFFFFFFFFF0FFFFFFFFFFFFFFF
            0FFF00FFF000FFFF0FFF0000000F0FFF0FFFFFFF000FFFFF0FFFFFFF00FFFFF0
            0FFFFFFF00FFFFFFFFFFFFF0000FFFFFFFFFFF0000F000FFFFFFFFFF0FFF00FF
            FFFF}
          Transparent = True
          Visible = False
        end
        object StepsSpin: TSpinEdit
          Left = 288
          Top = 1
          Width = 83
          Height = 22
          Increment = 5
          MaxValue = 2147483646
          MinValue = 1
          TabOrder = 0
          Value = 80
        end
        object x2IniChangeEdit: TsEdit
          Left = 303
          Top = 24
          Width = 134
          Height = 21
          Enabled = False
          TabOrder = 1
          Text = '0.003'
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
        object x4IniChangeEdit: TsEdit
          Left = 303
          Top = 60
          Width = 134
          Height = 21
          Enabled = False
          TabOrder = 3
          Text = '0.003'
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
        object x2IniDefaultCheck: TsCheckBox
          Left = 447
          Top = 26
          Width = 107
          Height = 19
          Caption = 'Use default value'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 2
          OnClick = x2IniDefaultCheckClick
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
          MultiLine = False
        end
        object x4IniDefaultCheck: TsCheckBox
          Left = 447
          Top = 62
          Width = 107
          Height = 19
          Caption = 'Use default value'
          Checked = True
          State = cbChecked
          TabOrder = 4
          OnClick = x4IniDefaultCheckClick
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
          MultiLine = False
        end
      end
      object sPanel8: TsPanel
        Left = 1
        Top = 1
        Width = 614
        Height = 24
        Alignment = taLeftJustify
        TabOrder = 0
        SkinData.SkinSection = 'TABLEFT'
        object sLabel11: TsLabel
          Left = 8
          Top = 1
          Width = 419
          Height = 20
          Caption = 'Number of Runge-Kutta(7-8) integrals for each step:'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
        end
        object RK78Spin: TSpinEdit
          Left = 434
          Top = 1
          Width = 83
          Height = 22
          Increment = 50000
          MaxValue = 2147483646
          MinValue = 1
          TabOrder = 0
          Value = 900000
        end
      end
      object sPanel10: TsPanel
        Left = 1
        Top = 108
        Width = 614
        Height = 23
        TabOrder = 2
        SkinData.SkinSection = 'TABLEFT'
        object ErrorMessagesCheck: TsCheckBox
          Left = 8
          Top = 2
          Width = 363
          Height = 19
          Caption = 
            'Don'#39't display error messages during calculation and continue cal' +
            'culation'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
          MultiLine = False
        end
      end
    end
    object EquationSettingsBody: TsPanel
      Left = 36
      Top = 29
      Width = 617
      Height = 144
      BevelOuter = bvSpace
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 1
      SkinData.SkinSection = 'GROUPBOX'
      object SurfaceComboPanel: TsPanel
        Left = 1
        Top = 1
        Width = 615
        Height = 30
        Alignment = taLeftJustify
        TabOrder = 0
        SkinData.SkinSection = 'TABLEFT'
        object sLabel12: TsLabel
          Left = 7
          Top = 6
          Width = 187
          Height = 16
          Caption = 'Desired Poincare Surface :'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
        end
        object SurfaceComboBox: TsMMComboBoxEx
          Left = 194
          Top = 2
          Width = 145
          Height = 25
          Alignment = taLeftJustify
          BoundLabel.Active = False
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'MS Sans Serif'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          SkinData.SkinSection = 'COMBOBOX'
          Style = csOwnerDrawFixed
          ItemHeight = 19
          ItemIndex = 0
          TabOrder = 0
          Text = ' '
          OnChange = SurfaceComboBoxChange
          Items.Strings = (
            ' '
            ' '
            ' '
            ' ')
          Images = VariableImages2
          HighlightColor = clHighlight
          HighlightTextColor = clHighlightText
          NormalColor = clWhite
          NormalTextColor = clBlack
        end
      end
      object UVarPanel: TsPanel
        Left = 1
        Top = 31
        Width = 615
        Height = 82
        Alignment = taLeftJustify
        TabOrder = 1
        SkinData.SkinSection = 'TABLEFT'
        object sLabel13: TsLabel
          Left = 7
          Top = 4
          Width = 134
          Height = 16
          Caption = 'Unknown Variable :'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
        end
        object UVarx3Image: TImage
          Left = 209
          Top = 63
          Width = 22
          Height = 15
          AutoSize = True
          Picture.Data = {
            07544269746D61702A010000424D2A0100000000000076000000280000001600
            00000F0000000100040000000000B40000000000000000000000100000000000
            0000000000000000800000800000008080008000000080008000808000008080
            8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00FFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFCCCFFFFFFFF00FFFFFFFFFFCF
            FCCFFFFFFF00FFFFFFFFFFFFFCCFFFFFFF00CCFFFCCCFFFFFCCFFFFFFF00CCCC
            CCCFCFFFCCFFFFFFFF00FFFFCCCFFFFFFCCFFCCCCC00FFFFCCFFFFCFFCCFFFFF
            FF00FFFFCCFFFFFCCCFFFCCCCC00FFFCCCCFFFFFFFFFFFFFFF00FFCCCCFCCCFF
            FFFFFFFFFF00FFFFCFFFCCFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFF00}
          Transparent = True
        end
        object UVarx1Image: TImage
          Left = 45
          Top = 60
          Width = 21
          Height = 15
          AutoSize = True
          Picture.Data = {
            07544269746D61702A010000424D2A0100000000000076000000280000001500
            00000F0000000100040000000000B40000000000000000000000100000000000
            0000000000000000800000800000008080008000000080008000808000008080
            8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00FFFFFFFFFFFCCCFFFFFFF000FFFFFFFFFFFFCFFFFFFFF000FFFFFFFFFFFF
            CFFFFFFFF000FFFFFFFFFFFFCFFFFFFFF000CCFFFCCCFFFFCFFFFFFFF000CCCC
            CCCFCFFFCFFFFFFFF000FFFFCCCFFFFFCFFFCCCCC000FFFFCCFFFFFCCFFFFFFF
            F000FFFFCCFFFFFFFFFFCCCCC000FFFCCCCFFFFFFFFFFFFFF000FFCCCCFCCCFF
            FFFFFFFFF000FFFFCFFFCCFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFF000FFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFF000}
          Transparent = True
        end
        object UVarx2Image: TImage
          Left = 183
          Top = 63
          Width = 23
          Height = 15
          AutoSize = True
          Picture.Data = {
            07544269746D61702A010000424D2A0100000000000076000000280000001700
            00000F0000000100040000000000B40000000000000000000000100000000000
            0000000000000000800000800000008080008000000080008000808000008080
            8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00FFFFFFFFFFFCCCCFFFFFFFF0FFFFFFFFFFFFCFFCFFFFFFF0FFFFFFFFFFFF
            FCFFFFFFFFF0FFFFFFFFFFFFFFCFFFFFFFF0CCFFFCCCFFFFFFFCFFFFFFF0CCCC
            CCCFCFFFFFFCFFFFFFF0FFFFCCCFFFFFCFFCFFCCCCC0FFFFCCFFFFFFFCCFFFFF
            FFF0FFFFCCFFFFFFFFFFFFCCCCC0FFFCCCCFFFFFFFFFFFFFFFF0FFCCCCFCCCFF
            FFFFFFFFFFF0FFFFCFFFCCFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFF0FFFF
            FFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFF0}
          Transparent = True
        end
        object UVarx4Image: TImage
          Left = 233
          Top = 63
          Width = 22
          Height = 15
          AutoSize = True
          Picture.Data = {
            07544269746D61702A010000424D2A0100000000000076000000280000001600
            00000F0000000100040000000000B40000000000000000000000100000000000
            0000000000000000800000800000008080008000000080008000808000008080
            8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00FFFFFFFFFFFFFCFFFFFFFF00FFFFFFFFFFFFFCFFFFFFFF00FFFFFFFFFFFC
            CCCCFFFFFF00FFFFFFFFFFFCFFCFFFFFFF00CCFFFCCCFFFFCFCFFFFFFF00CCCC
            CCCFCFFFFCCFFFFFFF00FFFFCCCFFFFFFFCCFCCCCC00FFFFCCFFFFFFFFFCFFFF
            FF00FFFFCCFFFFFFFFFFFCCCCC00FFFCCCCFFFFFFFFFFFFFFF00FFCCCCFCCCFF
            FFFFFFFFFF00FFFFCFFFCCFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFF00}
          Transparent = True
        end
        object UVarComboBox: TsMMComboBoxEx
          Tag = 2
          Left = 194
          Top = 2
          Width = 145
          Height = 25
          Alignment = taLeftJustify
          BoundLabel.Active = False
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'MS Sans Serif'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          SkinData.SkinSection = 'COMBOBOX'
          Style = csOwnerDrawFixed
          ItemHeight = 19
          ItemIndex = 2
          TabOrder = 0
          Text = ' '
          OnChange = UVarComboBoxChange
          Items.Strings = (
            ' '
            ' '
            ' '
            ' ')
          Images = VariableImages1
          HighlightColor = clHighlight
          HighlightTextColor = clHighlightText
          NormalColor = clWhite
          NormalTextColor = clBlack
        end
        object UVarFormulaCheckBox: TsCheckBox
          Left = 19
          Top = 38
          Width = 111
          Height = 19
          Caption = 'Specify formula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = UVarFormulaCheckBoxClick
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
          MultiLine = False
        end
        object UVarNumericalCheckBox: TsCheckBox
          Left = 19
          Top = 22
          Width = 146
          Height = 19
          Caption = 'Numerical calculation'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          State = cbChecked
          TabOrder = 3
          OnClick = UVarFormulaCheckBoxClick
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
          MultiLine = False
        end
        object UVarFormulaEdit: TsEdit
          Left = 68
          Top = 58
          Width = 502
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 200
          ParentFont = False
          TabOrder = 2
          Text = 'sqrt(2*h-x4^2-x2^2+(2*x2^3)/3)'
          OnChange = UVarFormulaEditChange
          OnKeyPress = UVarFormulaEditKeyPress
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
      object YComboPanel: TsPanel
        Left = 1
        Top = 113
        Width = 615
        Height = 30
        Alignment = taLeftJustify
        TabOrder = 2
        SkinData.SkinSection = 'TABLEFT'
        object YDotx1Image: TImage
          Left = 163
          Top = 5
          Width = 24
          Height = 18
          Picture.Data = {
            07544269746D6170EE000000424DEE0000000000000076000000280000001000
            00000F0000000100040000000000780000000000000000000000100000000000
            0000000000000000800000800000008080008000000080008000808000008080
            8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00FFFFFFFFFFFCCCFFFFFFFFFFFFFFCFFFFFFFFFFFFFFFCFFFCCFFFCCCFFFF
            CFFFCCCCCCCFCFFFCFFFFFFFCCCFFFFFCFFFFFFFCCFFFFFFCFFFFFFFCCFFFFFC
            CFFFFFFCCCCFFFFFFFFFFFCCCCFCCCFFFFFFFFFFCFFFCCFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFCCCFFFFFFFFFFFFFCCCFFFFFFFFFFFFFCCCFFFF}
          Proportional = True
          Stretch = True
          Transparent = True
          Visible = False
        end
        object YDotx2Image: TImage
          Left = 187
          Top = 5
          Width = 24
          Height = 18
          Picture.Data = {
            07544269746D6170EE000000424DEE0000000000000076000000280000001000
            00000F0000000100040000000000780000000000000000000000100000000000
            0000000000000000800000800000008080008000000080008000808000008080
            8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00FFFFFFFFFFFCCCCFFFFFFFFFFFFFCFFCFFFFFFFFFFFFFCFFCCFFFCCCFFFF
            FFCFCCCCCCCFCFFFFFFCFFFFCCCFFFFFFFFCFFFFCCFFFFFFCFFCFFFFCCFFFFFF
            FCCFFFFCCCCFFFFFFFFFFFCCCCFCCCFFFFFFFFFFCFFFCCFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFCCCFFFFFFFFFFFFFCCCFFFFFFFFFFFFFCCCFFFF}
          Proportional = True
          Stretch = True
          Transparent = True
          Visible = False
        end
        object Image9: TImage
          Left = 7
          Top = 4
          Width = 18
          Height = 20
          Picture.Data = {
            07544269746D617006010000424D060100000000000076000000280000000E00
            0000120000000100040000000000900000000000000000000000100000000000
            0000000000000000800000800000008080008000000080008000808000008080
            8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00FFF00000FFFF
            FF00FFF00FF00FFFFF00FFFFFFFF00FFFF00FFFFF00000FFFF00FFFFF000000F
            FF00FFFFF00F000FFF00FFFFF00FF00FFF00FFFF000FF000FF00FFFF000FF000
            FF00FFFF000FFF00FF00FFFF000FFF00FF00FF0000FFFF000F00FFF000FFFF00
            0F00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00}
          Stretch = True
          Transparent = True
        end
        object sLabel15: TsLabel
          Left = 28
          Top = 1
          Width = 21
          Height = 23
          AutoSize = False
          Caption = '='
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
        end
        object Image10: TImage
          Left = 120
          Top = 4
          Width = 16
          Height = 18
          AutoSize = True
          Picture.Data = {
            07544269746D617006010000424D060100000000000076000000280000001000
            0000120000000100040000000000900000000000000000000000100000000000
            0000000000000000800000800000008080008000000080008000808000008080
            8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00FFFFFFFFFFFFFFFFFFF00000FFFFFFFFFFF00FF00FFFFFFFFFFFFFFF00FF
            FFFFFFFFF00000FFFFFFFFFFF000000FFFFFFFFFF00F000FFFFFFFFFF00FF00F
            FFFFFFFF000FF000FFFFFFFF000FF000FFFFFFFF000FFF00FFFFFFFF000FFF00
            FFFFFF0000FFFF000FFFFFF000FFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            000FFFFFFFFFFFFF000FFFFFFFFFFFFF000F}
          Stretch = True
          Transparent = True
        end
        object sLabel14: TsLabel
          Left = 143
          Top = 1
          Width = 21
          Height = 23
          AutoSize = False
          Caption = '='
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
        end
        object sLabel16: TsLabel
          Left = 110
          Top = 3
          Width = 6
          Height = 26
          Caption = ','
          ParentFont = False
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
        end
        object YDotx3Image: TImage
          Left = 212
          Top = 5
          Width = 24
          Height = 18
          Picture.Data = {
            07544269746D6170EE000000424DEE0000000000000076000000280000001000
            00000F0000000100040000000000780000000000000000000000100000000000
            0000000000000000800000800000008080008000000080008000808000008080
            8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00FFFFFFFFFFFCCCFFFFFFFFFFFFCFFCCFFFFFFFFFFFFFFCCFCCFFFCCCFFFF
            FCCFCCCCCCCFCFFFCCFFFFFFCCCFFFFFFCCFFFFFCCFFFFCFFCCFFFFFCCFFFFFC
            CCFFFFFCCCCFFFFFFFFFFFCCCCFCCCFFFFFFFFFFCFFFCCFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFCCCFFFFFFFFFFFFFCCCFFFFFFFFFFFFFCCCFFFF}
          Proportional = True
          Stretch = True
          Transparent = True
          Visible = False
        end
        object YDotx4Image: TImage
          Left = 236
          Top = 5
          Width = 24
          Height = 18
          Picture.Data = {
            07544269746D6170EE000000424DEE0000000000000076000000280000001000
            00000F0000000100040000000000780000000000000000000000100000000000
            0000000000000000800000800000008080008000000080008000808000008080
            8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00FFFFFFFFFFFFFCFFFFFFFFFFFFFFFCFFFFFFFFFFFFFCCCCCCCFFFCCCFFFC
            FFCFCCCCCCCFCFFFCFCFFFFFCCCFFFFFFCCFFFFFCCFFFFFFFFCCFFFFCCFFFFFF
            FFFCFFFCCCCFFFFFFFFFFFCCCCFCCCFFFFFFFFFFCFFFCCFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFCCCFFFFFFFFFFFFFCCCFFFFFFFFFFFFFCCCFFFF}
          Proportional = True
          Stretch = True
          Transparent = True
          Visible = False
        end
        object YComboBox: TsMMComboBoxEx
          Left = 46
          Top = 2
          Width = 59
          Height = 25
          Alignment = taLeftJustify
          BoundLabel.Active = False
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'MS Sans Serif'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          SkinData.SkinSection = 'COMBOBOX'
          Style = csOwnerDrawFixed
          ItemHeight = 19
          ItemIndex = 1
          TabOrder = 0
          Text = ' '
          OnChange = YComboBoxChange
          Items.Strings = (
            ' '
            ' '
            ' '
            ' ')
          Images = VariableImages1
          HighlightColor = clHighlight
          HighlightTextColor = clHighlightText
          NormalColor = clWhite
          NormalTextColor = clBlack
        end
      end
    end
  end
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 443
    Height = 24
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Poincare Section Calculation Setup'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4079166
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    SkinData.SkinSection = 'MAINMENU'
  end
  object BottomPanel: TsPanel
    Left = 0
    Top = 227
    Width = 443
    Height = 43
    Align = alBottom
    TabOrder = 1
    SkinData.SkinSection = 'STATUSBAR'
    object ViewPoincareBtn: TsBitBtn
      Left = 432
      Top = 5
      Width = 169
      Height = 33
      Caption = 'View Poincare Section'
      Enabled = False
      TabOrder = 0
      SkinData.SkinSection = 'BUTTON'
      ShowFocus = False
    end
    object StartPoincareBtn: TsBitBtn
      Left = 608
      Top = 5
      Width = 145
      Height = 33
      Caption = 'Start Calculation'
      TabOrder = 1
      OnClick = StartPoincareBtnClick
      Glyph.Data = {
        0E060000424D0E06000000000000360000002800000016000000160000000100
        180000000000D805000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00CADFE2E6F0F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
        FEFDFCFEFDFCFEFAFCFCFDFCFDFCFFFFFEFFFFFFFDFEFEE8F1F2CADFE2000000
        0000000000ECF3F5D0E1D0297B290E670E126C12136C13156C15136B16166F15
        1972181B741B157916147A140F7611097309057103016B02207420CFDFCFEBF3
        F50000000000000000FEFEFE298829147F141C821C2287222688262789272589
        25248B24248B24238B221893191592140F950F0B950A059205038B02017B0120
        7320FFFFFF0000000000000000FFFFFF0F840F1D8C1D29922930963034983435
        9935329932329A313298322A9A2A229D221B9F1A14A1140EA60E09A408039D03
        018901016801FFFFFF0000000000000000FFFFFF158A152693263298323A9D3A
        3E9F3E3EA03E3CA03C3AA13AA4D4A4FFFFFF29A32821A52019A91912AA120CAB
        0C06A506039203026C02FFFFFF0000000000000000FFFFFF198C192F972F3B9D
        3B43A14347A34746A44644A44440A542FFFFFFFFFFFFFFFFFF25AB251DAD1D16
        B0160FAF0F0BA90A069506036F03FFFFFF0000000000000000FFFFFF1F8F1F37
        9B3743A0434AA44A4DA64D4BA64B48A64945A74641A843FFFFFFFFFFFFFFFFFF
        1FB12019B21913B0130EA90E0C960C077107FFFFFF0000000000000000FFFFFF
        2693263E9E3E49A3494FA64F51A8514FA84F4CA74C48A84847A8483EAA40FFFF
        FFFFFFFFFFFFFF1BB01B17AF1714A7141197110B720BFFFFFF00000000000000
        00FFFFFF2C952C45A1454FA74F53A85354A95452A9524EA84E49A74947A84741
        AA3E34AC34FFFFFFFFFFFFFFFFFF19AC1918A619179715107610FFFFFF000000
        0000000000FFFFFF2C952C45A1454FA74FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF19A619179816107512FFFF
        FF0000000000000000FFFFFF2C952C45A1454FA74FFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF19A51917981710
        7412FFFFFF0000000000000000FFFFFF3398334CA54C55A95557AA5756AA5653
        A8534FA74E4AA64A46A64640A74038A738FFFFFFFFFFFFFFFFFF1EA51D1DA11D
        1C961D167413FFFFFF0000000000000000FFFFFF389B3852A85258AB585AAB5A
        58AA5854A85350A7514DA64D49A64943A643FFFFFFFFFFFFFFFFFF29A12725A0
        25239F23229422187217FFFFFF0000000000000000FFFFFF4EA64E6FB76F71B9
        716BB56B63AF635CAB5B55A85651A7514DA74DFFFFFFFFFFFFFFFFFF36A1352F
        9E2E2D9B2C2E972D2D8E2D1E721EFFFFFF0000000000000000FFFFFF53A8537A
        BD7A7DBE7D72B97268B36861AE615DAB5C58A858FFFFFFFFFFFFFFFFFF44A444
        3EA13E389E38339A333197312D8D2D1E721EFFFFFF0000000000000000FFFFFF
        59AC5989C4898DC68D80BF8072B8726BB46B65B1655FAE5FB5DAB5FFFFFF51A9
        524BA64C46A34641A0413B9D3B3599352B8C2B196F19FFFFFF00000000000000
        00FFFFFF66B26697CB979ACD9A89C4897BBD7B73B9736EB66E69B36966B2675E
        AF6057AB5850A8524DA74E4BA44B44A144389A38298B29166C16FFFFFF000000
        0000000000FFFFFF77BB7790C89094CA9485C28576BB766FB76F69B46967B267
        67B16765B26556AC5953A95550A64F4AA54A40A040339833248924317F31FDFE
        FE0000000000000000EEF5F7DCEDDC74B97461B06156AA564EA64E49A34943A0
        4345A14545A24546A1463D9D3C359A35349A3431983229942A208D20358F35D2
        E3D2EEF5F70000000000000000DBEBEEEEF5F7FDFEFEFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFEFF6F7DBEBEE0000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000}
      Layout = blGlyphRight
      SkinData.SkinSection = 'BUTTON'
      ShowFocus = False
    end
  end
  object sScrollBar1: TsScrollBar
    Tag = 1
    Left = 426
    Top = 24
    Width = 17
    Height = 203
    Align = alRight
    TabOrder = 2
    OnChange = sScrollBar1Change
    Kind = sbVertical
    Min = 1
    PageSize = 0
    Position = 1
  end
  object DefaultValuesPopup1: TPopupMenu
    AutoHotkeys = maManual
    MenuAnimation = [maTopToBottom]
    OwnerDraw = True
    Left = 464
    Top = 120
    object N1: TMenuItem
      Caption = '???????????????'
      Enabled = False
      OnAdvancedDrawItem = N1AdvancedDrawItem
    end
    object DefaultValues1: TMenuItem
      Caption = 'X2 = -0.3 , X4 = -0.2 , H = 0.1'
      OnClick = X203X402H171Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object X203X402H161: TMenuItem
      Tag = 1
      Caption = 'X2 = -0.3 , X4 = -0.2 , H = 1/12'
      OnClick = X203X402H171Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object X203X402H171: TMenuItem
      Tag = 2
      Caption = 'X2 = -0.3 , X4 = -0.2 , H = 1/8'
      OnClick = X203X402H171Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object X203X402H162: TMenuItem
      Tag = 3
      Caption = 'X2 = -0.3 , X4 = -0.2 , H = 1/7'
      OnClick = X203X402H171Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object X203X402H163: TMenuItem
      Tag = 4
      Caption = 'X2 = -0.3 , X4 = -0.2 , H = 1/6'
      OnClick = X203X402H171Click
    end
  end
  object VariableImages1: TImageList
    Height = 12
    Left = 672
    Top = 56
    Bitmap = {
      494C010104000900040010000C00FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002400000001002000000000000024
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D280390000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF0000000000000000000000FF0000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF0000000000
      000000000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF0000000000000000000000FF000000FF000000FF000000000000000000
      000000000000FF000000FF000000FF0000000000000000000000000000000000
      0000FF000000000000000000000000000000FF000000FF000000000000000000
      000000000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000000000000000
      000000000000FF000000FF000000FF0000000000000000000000000000000000
      000000000000FF000000FF00000000000000FF000000FF000000000000000000
      000000000000FF000000FF000000FF0000000000000000000000000000000000
      000000000000FF00000000000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF00000000000000FF00000000000000000000000000
      0000FF000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF00000000000000FF00000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF00000000000000FF00000000000000000000000000
      0000FF000000FF0000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF00000000000000FF00000000000000000000000000
      00000000000000000000FF000000FF0000000000000000000000000000000000
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000FF0000000000000000000000FF0000000000000000000000000000000000
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      000000000000FF000000FF000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000C88C580000000000000000000000
      0000FF000000FF0000000000000000000000000000000000000000000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000FF000000FF00000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000000000000000000000000000000000000000
      0000FF000000FF00000000000000000000000000000000000000FF0000000000
      000000000000FF000000FF000000000000000000000000000000000000000000
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF0000000000000000000000000000000000000000000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000FF000000FF00000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF00000000000000FF000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF00000000000000FF000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF00000000000000FF000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF00000000000000FF000000FF000000FF000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000FF000000000000000000000000000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000000000000000000000000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000000000000000000000000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000000000000000000000000000FF000000FF000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000240000000100010000000000200100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFE3FFE1FFFFFFFDFFF7FFF6FFE3FFFD
      FFF7FFFBFFD9FFF0FFF7FFFDFFF9FFF638F738FE38F938FA0177017E0173017C
      F1F7F1F6F1F9F1FEF3E7F3F9F3D9F3FFF3FFF3FFF3E3F3FFE1FFE1FFE1FFE1FF
      C23FC23FC23FC23FF73FF73FF73FF73F00000000000000000000000000000000
      000000000000}
  end
  object VariableImages2: TImageList
    Height = 15
    Width = 69
    Left = 584
    Top = 64
    Bitmap = {
      494C010104000900040045000F00FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000140100002D000000010020000000000010C2
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000080F050F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000080F050F00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000080F050F00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005B9EB5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF0000000000000000000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF0000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF0000000000000000000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF00000000000000000000000000
      0000000000000000000000000000FF000000000000000000000000000000FF00
      0000FF000000000000000000000000000000FF000000FF000000FF0000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000FF000000000000000000000000000000FF000000FF000000000000000000
      000000000000FF000000FF000000FF0000000000000000000000000000000000
      00000000000000000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF0000000000
      00000000000000000000000000000000000000000000FF000000000000000000
      000000000000FF000000FF000000000000000000000000000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF0000000000000000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF0000000000000000000000000000000000
      00000000000000000000FF000000000000000000000000000000FF000000FF00
      0000000000000000000000000000FF000000FF000000FF000000000000000000
      000000000000FF0000000000000000000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF00000000000000FF000000FF000000000000000000
      000000000000FF000000FF000000FF0000000000000000000000000000000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF0000000000
      0000FF000000FF00000000000000000000000000000000000000FF000000FF00
      0000000000000000000000000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000000000000FF000000000000000000000000000000FF00
      00000000000000000000000000000000000000000000FF000000000000000000
      000000000000000000000000000000000000FF000000FF00000000000000FF00
      0000FF000000FF000000FF000000000000000000000000000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF00000000000000FF000000FF0000000000
      0000000000000000000000000000FF000000FF00000000000000000000000000
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      0000FF000000000000000000000000000000000000000000000000000000FF00
      00000000000000000000FF000000000000000000000000000000000000000000
      000000000000FF000000FF00000000000000FF000000FF000000FF000000FF00
      0000000000000000000000000000FF000000FF000000FF000000000000000000
      0000000000000000000000000000FF000000FF00000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF00000000000000FF000000FF0000000000000000000000000000000000
      0000FF000000FF000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF00000000000000FF000000000000000000
      000000000000FF000000FF00000000000000000000000000000000000000FF00
      0000000000000000000000000000000000000000000000000000FF000000FF00
      000000000000FF000000FF000000FF000000FF00000000000000000000000000
      0000FF000000FF000000FF00000000000000000000000000000000000000FF00
      000000000000FF00000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF00000000000000FF00
      0000FF00000000000000000000000000000000000000FF000000FF0000000000
      00000000000000000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF00000000000000FF000000000000000000000000000000FF0000000000
      0000FF000000000000000000000000000000FF00000000000000000000000000
      0000000000000000000000000000FF000000FF00000000000000FF000000FF00
      0000080F050FFF000000FF000000FF000000FF000000FF000000FF0000000000
      0000FF000000000000000000000000000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF00000000000000FF000000FF000000000000000000
      00000000000000000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF00000000000000000000000000
      0000FF000000FF00000000000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF00000000000000FF000000000000000000
      000000000000000000000000000000000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      000000000000FF000000FF00000000000000000000000000000000000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000000000000000000000000000FF00
      0000FF000000FF000000000000000000000000000000FF000000FF0000000000
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF00000000000000FF000000000000000000000000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF00000000000000FF000000FF00
      000000000000000000000000000000000000FF000000FF000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000FF000000FF00
      000000000000000000000000000000000000FF000000FF000000FF0000000000
      00000000000000000000FF000000FF00000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF00000000000000FF00
      000000000000000000000000000000000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF00000000000000FF000000FF00000000000000000000000000
      000000000000FF000000FF000000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF00000000000000000000000000
      0000000000000000000000000000FF000000FF00000000000000000000000000
      000000000000FF000000FF000000FF000000000000000000000000000000FF00
      0000FF00000000000000FF000000FF0000000000000000000000000000000000
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000FF00000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000000000000000000000000000FF000000FF0000000000
      0000FF000000FF00000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000000000000000000000000000000000000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF0000000000000000000000FF000000FF00000000000000FF00
      0000FF00000000000000000000000000000000000000FF000000FF000000FF00
      00000000000000000000000000000000000000000000FF000000000000000000
      0000FF00000000000000FF000000FF000000FF000000FF000000FF0000000000
      00000000000000000000FF000000FF00000000000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000000000000000
      000000000000000000000000000000000000FF0000000000000000000000FF00
      0000000000000000000000000000000000000000000000000000FF0000000000
      000000000000FF000000FF00000000000000FF000000FF000000000000000000
      00000000000000000000FF000000FF000000FF00000000000000000000000000
      0000000000000000000000000000FF000000FF0000000000000000000000FF00
      0000FF000000FF000000FF000000FF000000000000000000000000000000FF00
      0000FF00000000000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF00000000000000000000000000000000000000FF00
      00000000000000000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000FF000000FF00
      000000000000FF000000FF00000000000000000000000000000000000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      000000000000FF000000FF00000000000000FF000000FF000000FF000000FF00
      0000FF000000000000000000000000000000FF000000FF00000000000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000FF0000000000000000000000FF000000FF00000000000000FF000000FF00
      000000000000000000000000000000000000FF000000FF000000000000000000
      0000000000000000000000000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF00000000000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF00000000000000000000000000
      00000000000000000000FF000000FF0000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF00000000000000000000000000
      0000FF000000FF00000000000000FF000000FF00000000000000000000000000
      000000000000FF000000FF000000000000000000000000000000000000000000
      00000000000000000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      000000000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF00000000000000000000000000000000000000000000000000
      000000000000FF000000FF00000000000000000000000000000000000000FF00
      0000FF000000FF000000000000000000000000000000FF000000FF0000000000
      0000FF000000FF00000000000000000000000000000000000000FF000000FF00
      000000000000000000000000000000000000FF0000000000000000000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF00000000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF0000000000
      000000000000000000000000000000000000FF000000FF000000FF0000000000
      000000000000000000000000000000000000FF000000FF000000FF0000000000
      00000000000000000000FF000000FF00000000000000FF000000FF0000000000
      0000000000000000000000000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF00000000000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF0000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000000000000000
      000000000000FF000000FF000000FF000000000000000000000000000000FF00
      0000FF00000000000000FF000000FF000000C88C580000000000000000000000
      0000FF000000FF00000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000000000000000000000000000FF000000FF0000000000
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000000000000000
      000000000000000000000000000000000000FF000000FF00000000000000FF00
      0000FF00000000000000000000000000000000000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF000000FF000000FF0000000000
      00000000000000000000FF000000FF00000000000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000000000000000000000000000000000000000
      000000000000FF000000FF00000000000000FF000000FF000000000000000000
      00000000000000000000FF000000FF0000000000000000000000000000000000
      000000000000FF000000FF000000FF000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF000000000000000000000000000000FF00
      0000FF00000000000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000FF0000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000000000000000000000000000000000000000000000000000FF000000FF00
      000000000000FF000000FF00000000000000000000000000000000000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000000000000000000000000000FF000000FF00000000000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00000000000000000000000000
      0000000000000000000000000000FF000000FF00000000000000FF000000FF00
      0000000000000000000000000000FF000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF00000000000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF000000FF00000000000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF00000000000000FF000000FF00000000000000000000000000
      0000FF000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      000000000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF00000000000000FF000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF0000000000
      0000FF000000FF000000000000000000000000000000FF000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF00000000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000FF0000000000
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF00000000000000FF000000FF0000000000
      00000000000000000000FF000000FF000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF00000000000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000FF00000000000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF00000000000000FF000000FF0000000000000000000000FF000000FF00
      0000FF000000FF00000000000000FF000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000000000000000000000000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000000000000000000000000000FF000000FF000000FF000000FF0000000000
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00000000000000000000000000
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF00000000000000000000000000
      0000FF000000FF000000FF000000FF00000000000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000000000000000000000000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000000000000000000000000000FF000000FF000000FF00
      0000FF00000000000000FF000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF0000000000
      00000000000000000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF0000000000
      0000F2E8E00F000000000000000000000000FF00000000000000000000000000
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000000000000000000000000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF0000000000
      00000000000000000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000000000000000000000000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000424D3E000000000000003E00000028000000140100002D00000001000100
      00000000540600000000000000000000000000000000000000000000FFFFFF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FFE3FFFFFFFFC7FF
      FFFF0FFFFFFFFE1FFFFFFFFFFFFFFFF1FFFFFFF7FFFFFFFFEFFFF000FFF7FFFF
      FFFFEFFFFFFFB7FFFFFFFF6FFFFFF8FFFFFFFFECFFFFFFF7FFFFFFFFEFFFF000
      FFF7FFFFDFFFEFFFFFFFDFFFFEFFFFBFFFFFF67FFFF7FFFCFFFFFFC1FFFFBFFF
      83FFF000FFF7FFC7EE71EFFF8FFFEFFE3F738FDFFC7FFE7FF1FB9C7CFFE3FFDB
      FF8FDCE3B7FF100038F7FF93CE02EFBF21C7F7FC9E7017EDF90E3E7FE4F380B9
      EFC871EBFF279C05D77E40000177FF93CFE3EFC7200BF7FC9E7F1FEE39005CFF
      E4F3F8FCF1C802F3FF279FC7E78E4000F1F78393FFE7EFFB278FB41C9FFF3F6F
      D93C7E60E4FFF9ECFEC9E3F90727FFCFF3F64000F3E7FF93FFE7CFC7279FCFFC
      9FFF3F9E393CF67FE4FFF9F1F1C9E7FDFF27FFCFFB8E4000F3FF8393FFC3FFBF
      279FFC1C9FFE1FFDF93CF8E0E4FFF0FFEFC9E7FF0727FF87FF7E4000E1FFFF93
      FF847FFF270FFFFC9FFC23FFF9387FFFE4FFE11FFFC9C3FFFF27FF08FFFE4000
      C23FFFC7FFEE7FFF8E11FFFE3FFF73FFFC708FFFF1FFFB9FFFE3847FFF8FFFDC
      FFFF1000F73FFFFFFFFFFFFFFFB9FFFFFFFFFFFFFFFDCFFFFFFFFFFFFFFFEE7F
      FFFFFFFFFFFFF000FFFFFFFFFFFF1FFFFFFFFFFFFFFFF8FFFFFFFFFFFFFFFFC7
      FFFFFFFFFFFFFFFE3FFFF000FFFFFFFFFFFF1FFFFFFFFFFFFFFFF8FFFFFFFFFF
      FFFFFFC7FFFFFFFFFFFFFFFE3FFFF000FFFFFFFFFFFF1FFFFFFFFFFFFFFFF8FF
      FFFFFFFFFFFFFFC7FFFFFFFFFFFFFFFE3FFFF000000000000000000000000000
      00000000000000000000}
  end
  object SaveDialog1: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofNoReadOnlyReturn, ofEnableSizing]
    OptionsEx = [ofExNoPlacesBar]
    Left = 512
    Top = 512
  end
end
