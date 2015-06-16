object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FoxViewer'
  ClientHeight = 540
  ClientWidth = 775
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Segoe UI Light'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 25
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 563
    Height = 34
    Caption = ' '
    TabOrder = 0
    object Button1: TButton
      Left = 16
      Top = 0
      Width = 75
      Height = 25
      Caption = 'Load'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 104
      Top = 0
      Width = 75
      Height = 25
      Caption = 'Parse'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 208
      Top = 0
      Width = 75
      Height = 25
      Caption = 'Save'
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 312
      Top = 0
      Width = 75
      Height = 25
      Caption = 'Clear'
      TabOrder = 3
      OnClick = Button4Click
    end
    object CheckBox1: TCheckBox
      Left = 416
      Top = 4
      Width = 129
      Height = 17
      Caption = 'Show data'
      TabOrder = 4
    end
  end
  object Memo1: TMemo
    Left = 14
    Top = 48
    Width = 258
    Height = 89
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -19
    Font.Name = 'Segoe UI Light'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 646
    Top = -1
    Width = 121
    Height = 41
    TabOrder = 2
    object Button5: TButton
      Left = 6
      Top = 8
      Width = 43
      Height = 25
      Caption = '__'
      TabOrder = 0
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 65
      Top = 8
      Width = 48
      Height = 25
      Caption = 'X'
      TabOrder = 1
      OnClick = Button6Click
    end
  end
end
