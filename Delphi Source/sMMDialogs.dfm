object MessageForm: TMessageForm
  Left = 92
  Top = 144
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'MessageForm'
  ClientHeight = 114
  ClientWidth = 268
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object MessageLabel: TsLabel
    Left = 8
    Top = 8
    Width = 69
    Height = 13
    Caption = 'MessageLabel'
    WordWrap = True
  end
  object sBitBtn1: TsBitBtn
    Left = 55
    Top = 80
    Width = 70
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 6
    TabOrder = 0
    Visible = False
    NumGlyphs = 2
    SkinData.SkinSection = 'BUTTON'
    ShowFocus = False
  end
  object sBitBtn2: TsBitBtn
    Left = 150
    Top = 80
    Width = 70
    Height = 25
    Caption = 'sBitBtn2'
    ModalResult = 7
    TabOrder = 1
    Visible = False
    SkinData.SkinSection = 'BUTTON'
    ShowFocus = False
  end
  object sSkinProvider1: TsSkinProvider
    BorderIcons = [biSystemMenu]
    SkinData.SkinSection = 'FORM'
    MakeSkinMenu = False
    TitleButtons = <>
    Left = 200
    Top = 36
  end
end
