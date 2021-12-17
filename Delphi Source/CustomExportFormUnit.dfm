object CustomExportForm: TCustomExportForm
  Left = 207
  Top = 143
  BorderStyle = bsDialog
  Caption = 'Custom Export'
  ClientHeight = 102
  ClientWidth = 503
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sLabel1: TsLabel
    Left = 6
    Top = 8
    Width = 494
    Height = 13
    Caption = 
      'Customize the columns of the output file by moving and selecting' +
      '/deselecting columns:'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 32
    Width = 328
    Height = 28
    Color = clInactiveCaptionText
    Ctl3D = True
    FixedColor = 7977443
    FixedCols = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColMoving]
    ParentCtl3D = False
    ScrollBars = ssNone
    TabOrder = 0
    OnColumnMoved = StringGrid1ColumnMoved
    ColWidths = (
      64
      64
      64
      64
      64)
  end
  object ColCheck0: TsCheckBox
    Left = 50
    Top = 38
    Width = 19
    Height = 15
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 1
    OnClick = ColCheck0Click
    SkinData.SkinSection = 'PANEL'
    ImgChecked = 0
    ImgUnchecked = 0
    MultiLine = False
  end
  object ColCheck1: TsCheckBox
    Left = 115
    Top = 38
    Width = 19
    Height = 15
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 2
    OnClick = ColCheck0Click
    SkinData.SkinSection = 'PANEL'
    ImgChecked = 0
    ImgUnchecked = 0
    MultiLine = False
  end
  object ColCheck2: TsCheckBox
    Left = 180
    Top = 38
    Width = 19
    Height = 15
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 3
    OnClick = ColCheck0Click
    SkinData.SkinSection = 'PANEL'
    ImgChecked = 0
    ImgUnchecked = 0
    MultiLine = False
  end
  object ColCheck3: TsCheckBox
    Left = 244
    Top = 38
    Width = 19
    Height = 15
    Checked = True
    Ctl3D = True
    ParentCtl3D = False
    State = cbChecked
    TabOrder = 4
    OnClick = ColCheck0Click
    SkinData.SkinSection = 'PANEL'
    ImgChecked = 0
    ImgUnchecked = 0
    MultiLine = False
  end
  object ColCheck4: TsCheckBox
    Left = 309
    Top = 38
    Width = 19
    Height = 15
    Checked = True
    Ctl3D = True
    ParentCtl3D = False
    State = cbChecked
    TabOrder = 5
    OnClick = ColCheck0Click
    SkinData.SkinSection = 'PANEL'
    ImgChecked = 0
    ImgUnchecked = 0
    MultiLine = False
  end
  object OKButton: TsBitBtn
    Left = 8
    Top = 72
    Width = 81
    Height = 25
    TabOrder = 7
    OnClick = OKButtonClick
    Kind = bkOK
    SkinData.SkinSection = 'BUTTON'
    ShowFocus = False
  end
  object CancelButton: TsBitBtn
    Left = 112
    Top = 72
    Width = 75
    Height = 25
    TabOrder = 8
    Kind = bkCancel
    SkinData.SkinSection = 'BUTTON'
    ShowFocus = False
  end
  object AllColumnsCheck: TsCheckBox
    Left = 368
    Top = 38
    Width = 75
    Height = 17
    Caption = 'All columns'
    TabOrder = 6
    OnClick = AllColumnsCheckClick
    SkinData.SkinSection = 'CHECKBOX'
    ImgChecked = 0
    ImgUnchecked = 0
    MultiLine = False
  end
  object sSkinProvider1: TsSkinProvider
    SkinData.SkinSection = 'FORM'
    MakeSkinMenu = False
    TitleButtons = <>
    Left = 464
    Top = 40
  end
end
