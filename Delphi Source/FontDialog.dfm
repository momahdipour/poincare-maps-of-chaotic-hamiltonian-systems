object FontDialogForm: TFontDialogForm
  Left = 221
  Top = 234
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Font'
  ClientHeight = 262
  ClientWidth = 410
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inline FontDialogFrame1: TFontDialogFrame
    Left = 0
    Top = 0
    Width = 410
    Height = 262
    TabOrder = 0
  end
  object sSkinProvider1: TsSkinProvider
    BorderIcons = [biSystemMenu]
    SkinData.SkinSection = 'FORM'
    MakeSkinMenu = False
    TitleButtons = <>
    Left = 376
    Top = 8
  end
end
