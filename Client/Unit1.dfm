object Form1: TForm1
  Left = 192
  Top = 125
  Width = 841
  Height = 540
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 11
  object Button1: TButton
    Left = 112
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 568
    Top = 72
    Width = 185
    Height = 273
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object TCPC: TIdTCPClient
    MaxLineAction = maException
    ReadTimeout = 0
    Host = '127.0.0.1'
    Port = 3000
    Left = 112
    Top = 112
  end
end
