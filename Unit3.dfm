object Form3: TForm3
  Left = 0
  Top = 0
  Caption = #1050#1053#1048#1043#1040' v2'
  ClientHeight = 482
  ClientWidth = 979
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel4: TPanel
    Left = 377
    Top = 0
    Width = 602
    Height = 482
    Align = alClient
    TabOrder = 0
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 49
      Height = 456
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'Panel1'
      Color = clSilver
      ParentBackground = False
      ShowCaption = False
      TabOrder = 0
      object Back: TButton
        Left = 8
        Top = 372
        Width = 35
        Height = 35
        Caption = '<--'
        TabOrder = 0
        OnClick = BackClick
      end
      object Home: TButton
        Left = 8
        Top = 148
        Width = 35
        Height = 35
        Caption = '^'
        TabOrder = 1
        OnClick = HomeClick
      end
    end
    object Panel2: TPanel
      Left = 552
      Top = 1
      Width = 49
      Height = 456
      Align = alRight
      BevelOuter = bvNone
      Caption = 'Panel1'
      Color = clSilver
      ParentBackground = False
      ShowCaption = False
      TabOrder = 1
      object Next: TButton
        Left = 6
        Top = 372
        Width = 35
        Height = 35
        Caption = '-->'
        TabOrder = 0
        OnClick = NextClick
      end
      object Button1: TButton
        Left = 6
        Top = 8
        Width = 41
        Height = 25
        Caption = #1042#1080#1076#1077#1086'1'
        TabOrder = 1
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 6
        Top = 32
        Width = 41
        Height = 25
        Caption = #1042#1080#1076#1077#1086'2'
        TabOrder = 2
        Visible = False
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 6
        Top = 56
        Width = 41
        Height = 25
        Caption = #1042#1080#1076#1077#1086'3'
        TabOrder = 3
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 6
        Top = 80
        Width = 41
        Height = 25
        Caption = #1042#1080#1076#1077#1086'4'
        TabOrder = 4
        Visible = False
        OnClick = Button4Click
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 457
      Width = 600
      Height = 24
      Align = alBottom
      BevelOuter = bvNone
      Caption = '1/10'
      Color = clSilver
      ParentBackground = False
      TabOrder = 2
    end
    object ScrollBox1: TScrollBox
      Left = 50
      Top = 1
      Width = 502
      Height = 456
      Align = alClient
      BevelOuter = bvNone
      BorderStyle = bsNone
      TabOrder = 3
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 502
        Height = 321
        Align = alTop
        BevelInner = bvNone
        BorderStyle = bsNone
        Ctl3D = True
        Lines.Strings = (
          
            'Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo' +
            '1M'
          
            'emo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1' +
            'Me'
          
            'mo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1M' +
            'em'
          
            'o1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Me' +
            'mo'
          
            '1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Mem' +
            'o1'
          
            'Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo' +
            '1M'
          
            'emo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1' +
            'Me'
          
            'mo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1M' +
            'em'
          
            'o1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Me' +
            'mo'
          
            '1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Mem' +
            'o1'
          
            'Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo' +
            '1M'
          
            'emo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1' +
            'Me'
          
            'mo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1M' +
            'em'
          
            'o1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Me' +
            'mo'
          
            '1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Mem' +
            'o1'
          
            'Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo' +
            '1M'
          
            'emo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1' +
            'Me'
          
            'mo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1M' +
            'em'
          
            'o1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Me' +
            'mo'
          
            '1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Mem' +
            'o1'
          
            'Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo' +
            '1M'
          
            'emo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1' +
            'Me'
          
            'mo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1M' +
            'em'
          
            'o1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Me' +
            'mo'
          
            '1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Mem' +
            'o1'
          
            'Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo' +
            '1M'
          
            'emo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1' +
            'Me'
          
            'mo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1M' +
            'em'
          
            'o1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Me' +
            'mo'
          
            '1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Mem' +
            'o1'
          
            'Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo' +
            '1M'
          
            'emo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1' +
            'Me'
          
            'mo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1M' +
            'em'
          
            'o1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Me' +
            'mo'
          
            '1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Mem' +
            'o1'
          
            'Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo' +
            '1M'
          
            'emo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1' +
            'Me'
          
            'mo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1M' +
            'em'
          
            'o1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Me' +
            'mo'
          
            '1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Mem' +
            'o1'
          
            'Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo' +
            '1M'
          
            'emo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1' +
            'Me'
          
            'mo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1M' +
            'em'
          
            'o1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Me' +
            'mo'
          
            '1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Mem' +
            'o1'
          
            'Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo' +
            '1M'
          
            'emo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1' +
            'Me'
          
            'mo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1M' +
            'em'
          
            'o1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Me' +
            'mo'
          
            '1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Mem' +
            'o1'
          
            'Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo' +
            '1M'
          
            'emo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1' +
            'Me'
          
            'mo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1M' +
            'em'
          
            'o1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Me' +
            'mo'
          '1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Mem'
          
            'o1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Me' +
            'mo'
          
            '1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Mem' +
            'o1'
          
            'Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo1Memo' +
            '1M'
          'emo1Memo1Memo1Memo1Memo1')
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
      end
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 377
    Height = 482
    Align = alLeft
    TabOrder = 1
    object ScrollBox2: TScrollBox
      Left = 1
      Top = 1
      Width = 375
      Height = 480
      VertScrollBar.Position = 38
      Align = alClient
      TabOrder = 0
      object Label1: TLabel
        Left = 19
        Top = -12
        Width = 333
        Height = 13
        Caption = 
          #1055#1056#1045#1044#1048#1057#1051#1054#1042#1048#1045'.....................................................' +
          '..........2'
        OnClick = Label1Click
      end
      object Label2: TLabel
        Left = 19
        Top = 7
        Width = 331
        Height = 13
        Caption = 
          #1063#1040#1057#1058#1068' I. DELPHI XE..............................................' +
          '...........2'
        OnClick = Label1Click
      end
      object Label3: TLabel
        Left = 19
        Top = 26
        Width = 331
        Height = 13
        Caption = 
          #1043#1051#1040#1042#1040' 1. '#1057#1056#1045#1044#1040' '#1056#1040#1047#1056#1040#1041#1054#1058#1050#1048' DELPHI XE.............................' +
          '.2'
        OnClick = Label1Click
      end
      object Label4: TLabel
        Left = 19
        Top = 197
        Width = 327
        Height = 13
        Caption = 
          #1056#1077#1076#1072#1082#1090#1086#1088' '#1082#1086#1076#1072'...................................................' +
          '..........6'
        OnClick = Label4Click
      end
      object Label5: TLabel
        Left = 19
        Top = 45
        Width = 328
        Height = 13
        Caption = 
          #1059#1089#1090#1072#1085#1086#1074#1082#1072'.......................................................' +
          '............2'
        OnClick = Label1Click
      end
      object Label6: TLabel
        Left = 19
        Top = 178
        Width = 329
        Height = 13
        Caption = 
          #1055#1088#1086#1094#1077#1076#1091#1088#1072' '#1086#1073#1088#1072#1073#1086#1090#1082#1080' '#1089#1086#1073#1099#1090#1080#1103'.....................................' +
          '....5'
        OnClick = Label7Click
      end
      object Label7: TLabel
        Left = 19
        Top = 159
        Width = 331
        Height = 13
        Caption = 
          #1057#1086#1073#1099#1090#1080#1077'.........................................................' +
          '.............5'
        OnClick = Label7Click
      end
      object Label8: TLabel
        Left = 19
        Top = 64
        Width = 328
        Height = 13
        Caption = 
          #1055#1077#1088#1074#1086#1077' '#1079#1085#1072#1082#1086#1084#1089#1090#1074#1086'...............................................' +
          '.........2'
        OnClick = Label1Click
      end
      object Label9: TLabel
        Left = 19
        Top = 83
        Width = 330
        Height = 13
        Caption = 
          #1055#1077#1088#1074#1086#1077' '#1043#1051#1040#1042#1040' 2. '#1055#1045#1056#1042#1067#1049' '#1055#1056#1054#1045#1050#1058'...................................' +
          '...3'
        OnClick = Label9Click
      end
      object Label10: TLabel
        Left = 19
        Top = 102
        Width = 328
        Height = 13
        Caption = 
          #1053#1072#1095#1072#1083#1086' '#1088#1072#1073#1086#1090#1099'...................................................' +
          '..........3'
        OnClick = Label9Click
      end
      object Label11: TLabel
        Left = 19
        Top = 121
        Width = 330
        Height = 13
        Caption = 
          #1060#1086#1088#1084#1072'...........................................................' +
          '..............3'
        OnClick = Label9Click
      end
      object Label12: TLabel
        Left = 19
        Top = 140
        Width = 329
        Height = 13
        Caption = 
          #1050#1086#1084#1087#1086#1085#1077#1085#1090#1099'......................................................' +
          '...........4'
        OnClick = Label12Click
      end
      object Label13: TLabel
        Left = 19
        Top = 216
        Width = 328
        Height = 13
        Caption = 
          #1057#1080#1089#1090#1077#1084#1072' '#1087#1086#1076#1089#1082#1072#1079#1086#1082'...............................................' +
          '.........6'
        OnClick = Label4Click
      end
      object Label14: TLabel
        Left = 19
        Top = 235
        Width = 326
        Height = 13
        Caption = 
          #1064#1072#1073#1083#1086#1085#1099' '#1082#1086#1076#1072'....................................................' +
          '.........6'
        OnClick = Label4Click
      end
      object Label15: TLabel
        Left = 19
        Top = 254
        Width = 324
        Height = 13
        Caption = 
          #1057#1087#1088#1072#1074#1086#1095#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103'...........................................' +
          '.....7'
        OnClick = Label15Click
      end
      object Label16: TLabel
        Left = 19
        Top = 273
        Width = 323
        Height = 13
        Caption = 
          #1057#1086#1093#1088#1072#1085#1077#1085#1080#1077' '#1087#1088#1086#1077#1082#1090#1072' .............................................' +
          '.......7'
        OnClick = Label15Click
      end
      object Label17: TLabel
        Left = 19
        Top = 292
        Width = 326
        Height = 13
        Caption = 
          #1057#1090#1088#1091#1082#1090#1091#1088#1072' '#1087#1088#1086#1077#1082#1090#1072'...............................................' +
          '........7'
        OnClick = Label15Click
      end
      object Label18: TLabel
        Left = 19
        Top = 311
        Width = 327
        Height = 13
        Caption = 
          #1050#1086#1084#1087#1080#1083#1103#1094#1080#1103'......................................................' +
          '...........8'
        OnClick = Label18Click
      end
      object Label19: TLabel
        Left = 19
        Top = 330
        Width = 326
        Height = 13
        Caption = 
          #1054#1096#1080#1073#1082#1080'..........................................................' +
          '............8'
        OnClick = Label18Click
      end
      object Label20: TLabel
        Left = 19
        Top = 349
        Width = 329
        Height = 13
        Caption = 
          #1088#1077#1076#1091#1087#1088#1077#1078#1076#1077#1085#1080#1103' '#1080' '#1087#1086#1076#1089#1082#1072#1079#1082#1080'.......................................' +
          '.....8'
        OnClick = Label18Click
      end
      object Label21: TLabel
        Left = 19
        Top = 368
        Width = 327
        Height = 13
        Caption = 
          #1047#1072#1087#1091#1089#1082' '#1087#1088#1086#1075#1088#1072#1084#1084#1099'................................................' +
          '.........8'
        OnClick = Label18Click
      end
      object Label22: TLabel
        Left = 19
        Top = 387
        Width = 325
        Height = 13
        Caption = 
          #1048#1089#1082#1083#1102#1095#1077#1085#1080#1103'......................................................' +
          '..........9'
        OnClick = Label22Click
      end
      object Label23: TLabel
        Left = 19
        Top = 406
        Width = 327
        Height = 13
        Caption = 
          #1054#1073#1088#1072#1073#1086#1090#1082#1072' '#1080#1089#1082#1083#1102#1095#1077#1085#1080#1103'............................................' +
          '......9'
        OnClick = Label22Click
      end
      object Label24: TLabel
        Left = 19
        Top = 444
        Width = 331
        Height = 13
        Caption = 
          #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1103'............................................' +
          '......10'
        OnClick = Label24Click
      end
      object Label25: TLabel
        Left = 19
        Top = 425
        Width = 329
        Height = 13
        Caption = 
          #1042#1085#1077#1089#1077#1085#1080#1077' '#1080#1079#1084#1077#1085#1077#1085#1080#1081'..............................................' +
          '.........9'
        OnClick = Label22Click
      end
      object Label27: TLabel
        Left = 19
        Top = 463
        Width = 333
        Height = 13
        Caption = #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1103' '#1085#1072' '#1076#1088#1091#1075#1086#1081' '#1082#1086#1084#1087#1100#1102#1090#1077#1088'......................10'
        OnClick = Label24Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 576
    Top = 8
  end
end
