object HelpFrame: THelpFrame
  Left = 0
  Top = 0
  Width = 804
  Height = 500
  TabOrder = 0
  object sLabel1: TsLabel
    Left = 16
    Top = 16
    Width = 64
    Height = 36
    Caption = 'Help'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -32
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic, fsUnderline]
  end
  object sLabel5: TsLabel
    Left = 56
    Top = 80
    Width = 609
    Height = 41
    AutoSize = False
    Caption = 
      'To start, first you should define a hamiltonian system equation ' +
      'in the equation box. You can use the equation editor to edit the' +
      ' equation or type the equation directly into the equation box. A' +
      'lso you can select one of the sample equations by clicking the s' +
      'ample equation button next to the equation editor button.'
    WordWrap = True
  end
  object sLabel6: TsLabel
    Left = 56
    Top = 126
    Width = 609
    Height = 41
    AutoSize = False
    Caption = 
      'In the '#39'Poincare Section Calculation Setup'#39' page select your des' +
      'ired calculation options such as the desired poincare surface, i' +
      'nitial conditions for calculation and much more. Note that inval' +
      'id inputs for the equation settings will result in math errors d' +
      'uring calculation.'
    WordWrap = True
  end
  object sLabel7: TsLabel
    Left = 56
    Top = 172
    Width = 609
    Height = 41
    AutoSize = False
    Caption = 
      'The '#39'Start Calculation'#39' button at the bottom of the calculation ' +
      'setup page, starts the calculation process based on the settings' +
      ' you have defined. The main calculation process is done by the '#39 +
      'calc4dh.exe'#39' program, which is written in fortran. This allows t' +
      'o reach high precision calculation results. '
    WordWrap = True
  end
  object sLabel8: TsLabel
    Left = 56
    Top = 220
    Width = 609
    Height = 33
    AutoSize = False
    Caption = 
      'After the calculation is started, you can not change the calcula' +
      'tion settings. To change them, stop the calculation, select your' +
      ' calculation options and start the calculation process again.'
    WordWrap = True
  end
  object sLabel9: TsLabel
    Left = 56
    Top = 255
    Width = 609
    Height = 41
    AutoSize = False
    Caption = 
      'The '#39'View Poincare Section'#39' button shows the '#39'Poincare Section C' +
      'alculation Results'#39' page. This page displays the last calculatio' +
      'n results in a graph. Also you can use this page to load previou' +
      'sly saved calculation results into the graph. This page provides' +
      ' some other options to work with data and control the graph view' +
      '.'
    WordWrap = True
  end
end
