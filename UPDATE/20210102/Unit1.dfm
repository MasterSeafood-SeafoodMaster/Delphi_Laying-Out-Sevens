object Form1: TForm1
  Left = 283
  Top = 171
  Width = 1048
  Height = 540
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 11
  object Card1: TCard
    Left = 56
    Top = 392
    Width = 71
    Height = 96
    Value = 1
    Suit = Hearts
    ShowDeck = False
    DeckType = Standard1
  end
  object Label1: TLabel
    Left = 56
    Top = 312
    Width = 76
    Height = 20
    Caption = 'Your IP:'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = '@FZShuTi'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 144
    Top = 312
    Width = 64
    Height = 20
    Caption = 'Offline'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = '@FZShuTi'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Card2: TCard
    Left = 128
    Top = 392
    Width = 71
    Height = 96
    Value = 1
    Suit = Hearts
    ShowDeck = False
    DeckType = Standard1
  end
  object Card3: TCard
    Left = 200
    Top = 392
    Width = 71
    Height = 96
    Value = 1
    Suit = Hearts
    ShowDeck = False
    DeckType = Standard1
  end
  object Card4: TCard
    Left = 272
    Top = 392
    Width = 71
    Height = 96
    Value = 1
    Suit = Hearts
    ShowDeck = False
    DeckType = Standard1
  end
  object Card5: TCard
    Left = 344
    Top = 392
    Width = 71
    Height = 96
    Value = 1
    Suit = Hearts
    ShowDeck = False
    DeckType = Standard1
  end
  object Card6: TCard
    Left = 416
    Top = 392
    Width = 71
    Height = 96
    Value = 1
    Suit = Hearts
    ShowDeck = False
    DeckType = Standard1
  end
  object Card7: TCard
    Left = 488
    Top = 392
    Width = 71
    Height = 96
    Value = 1
    Suit = Hearts
    ShowDeck = False
    DeckType = Standard1
  end
  object Card8: TCard
    Left = 560
    Top = 392
    Width = 71
    Height = 96
    Value = 1
    Suit = Hearts
    ShowDeck = False
    DeckType = Standard1
  end
  object Card9: TCard
    Left = 632
    Top = 392
    Width = 71
    Height = 96
    Value = 1
    Suit = Hearts
    ShowDeck = False
    DeckType = Standard1
  end
  object Card10: TCard
    Left = 704
    Top = 392
    Width = 71
    Height = 96
    Value = 1
    Suit = Hearts
    ShowDeck = False
    DeckType = Standard1
  end
  object Card11: TCard
    Left = 776
    Top = 392
    Width = 71
    Height = 96
    Value = 1
    Suit = Hearts
    ShowDeck = False
    DeckType = Standard1
  end
  object Card12: TCard
    Left = 848
    Top = 392
    Width = 71
    Height = 96
    Value = 1
    Suit = Hearts
    ShowDeck = False
    DeckType = Standard1
  end
  object Card13: TCard
    Left = 920
    Top = 392
    Width = 71
    Height = 96
    Value = 1
    Suit = Hearts
    ShowDeck = False
    DeckType = Standard1
  end
  object Label3: TLabel
    Left = 144
    Top = 288
    Width = 64
    Height = 20
    Caption = 'Offline'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = '@FZShuTi'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 464
    Top = 16
    Width = 52
    Height = 20
    Caption = 'Label'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = '@FZShuTi'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 80
    Top = 344
    Width = 113
    Height = 41
    Caption = 'Connect!'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = '@FZShuTi'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 432
    Top = 336
    Width = 113
    Height = 41
    Caption = 'GO!'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = '@FZShuTi'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object UDPC: TIdUDPClient
    Active = True
    Host = '127.0.0.1'
    Port = 5000
    Left = 24
    Top = 16
  end
end
