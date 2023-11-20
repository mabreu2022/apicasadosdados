object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Pesquisa Casa dos Dados - 2023'
  ClientHeight = 724
  ClientWidth = 1134
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object GroupBox1: TGroupBox
    Left = 0
    Top = 241
    Width = 1134
    Height = 226
    Align = alClient
    Caption = 'Par'#226'metros'
    TabOrder = 2
    ExplicitWidth = 1130
    ExplicitHeight = 214
    object Lbl_Estado: TLabel
      Left = 448
      Top = 17
      Width = 17
      Height = 15
      Caption = ' UF'
    end
    object Label2: TLabel
      Left = 551
      Top = 17
      Width = 54
      Height = 15
      Caption = 'Municipio'
    end
    object Label3: TLabel
      Left = 707
      Top = 17
      Width = 31
      Height = 15
      Caption = 'Bairro'
    end
    object Label4: TLabel
      Left = 837
      Top = 17
      Width = 21
      Height = 15
      Caption = 'CEP'
    end
    object Label1: TLabel
      Left = 152
      Top = 64
      Width = 155
      Height = 15
      Caption = 'Data de Abertura - A partir de'
    end
    object Label5: TLabel
      Left = 319
      Top = 64
      Width = 118
      Height = 15
      Caption = 'Data de Abertura - At'#233
    end
    object Label7: TLabel
      Left = 448
      Top = 64
      Width = 97
      Height = 15
      Caption = 'Situa'#231#227'o Cadastral'
    end
    object Label6: TLabel
      Left = 19
      Top = 17
      Width = 119
      Height = 15
      Caption = 'Raz'#227'o Social / Fantasia'
    end
    object Label9: TLabel
      Left = 152
      Top = 17
      Width = 141
      Height = 15
      Caption = 'Atividade Principal (CNAE)'
    end
    object Label10: TLabel
      Left = 319
      Top = 17
      Width = 90
      Height = 15
      Caption = 'Natureza Jur'#237'dica'
    end
    object Label11: TLabel
      Left = 16
      Top = 64
      Width = 24
      Height = 15
      Caption = 'DDD'
    end
    object Label12: TLabel
      Left = 16
      Top = 113
      Width = 70
      Height = 15
      Caption = 'Somente MEI'
    end
    object Label13: TLabel
      Left = 109
      Top = 113
      Width = 54
      Height = 15
      Caption = 'Exlcui MEI'
    end
    object Label14: TLabel
      Left = 208
      Top = 113
      Width = 132
      Height = 15
      Caption = 'Com contato de telefone'
    end
    object Label15: TLabel
      Left = 354
      Top = 113
      Width = 70
      Height = 15
      Caption = 'Somente fixo'
    end
    object Label16: TLabel
      Left = 442
      Top = 113
      Width = 83
      Height = 15
      Caption = 'Somente matriz'
    end
    object Label17: TLabel
      Left = 530
      Top = 113
      Width = 71
      Height = 15
      Caption = 'somente filial'
    end
    object Label18: TLabel
      Left = 618
      Top = 113
      Width = 85
      Height = 15
      Caption = 'Somente celular'
    end
    object Label19: TLabel
      Left = 714
      Top = 113
      Width = 63
      Height = 15
      Caption = 'Com e-mail'
    end
    object Label20: TLabel
      Left = 976
      Top = 17
      Width = 147
      Height = 15
      Caption = 'Incluir Atividade Secund'#225'ria'
    end
    object Label8: TLabel
      Left = 570
      Top = 64
      Width = 36
      Height = 15
      Caption = 'P'#225'gina'
    end
    object EditCEP: TEdit
      Left = 835
      Top = 35
      Width = 121
      Height = 23
      TabOrder = 1
      TextHint = 'CEP'
    end
    object EditBairro: TEdit
      Left = 707
      Top = 35
      Width = 121
      Height = 23
      TabOrder = 0
      TextHint = 'Bairro'
    end
    object EdtRazaoSocial: TEdit
      Left = 16
      Top = 35
      Width = 121
      Height = 23
      TabOrder = 2
      Text = 'EdtRazaoSocial'
    end
    object EdtKnae: TEdit
      Left = 152
      Top = 35
      Width = 154
      Height = 23
      TabOrder = 3
      Text = 'EdtKnae'
    end
    object EdtNaturezaJuridica: TEdit
      Left = 319
      Top = 35
      Width = 121
      Height = 23
      TabOrder = 4
      Text = 'EdtNaturezaJuridica'
    end
    object EdtDDD: TEdit
      Left = 16
      Top = 80
      Width = 121
      Height = 23
      TabOrder = 5
      Text = 'EdtDDD'
      TextHint = '2 Digitos'
    end
    object EdtDataAberturaAPartirDe: TEdit
      Left = 152
      Top = 80
      Width = 121
      Height = 23
      TabOrder = 6
      Text = 'EdtDataAberturaAPartirDe'
    end
    object EdtDataAberturaAte: TEdit
      Left = 319
      Top = 80
      Width = 121
      Height = 23
      TabOrder = 7
      Text = 'EdtDataAberturaAte'
    end
    object CBAtivaInativa: TComboBox
      Left = 448
      Top = 80
      Width = 97
      Height = 23
      ItemIndex = 0
      TabOrder = 8
      Text = 'ATIVA'
      Items.Strings = (
        'ATIVA'
        'INATIVA')
    end
    object TSSomenteMei: TToggleSwitch
      Left = 16
      Top = 134
      Width = 73
      Height = 20
      TabOrder = 9
    end
    object TSExcluiMei: TToggleSwitch
      Left = 110
      Top = 134
      Width = 73
      Height = 20
      TabOrder = 10
    end
    object TSComContatoTelefone: TToggleSwitch
      Left = 216
      Top = 134
      Width = 73
      Height = 20
      TabOrder = 11
    end
    object TSSomenteFixo: TToggleSwitch
      Left = 354
      Top = 134
      Width = 73
      Height = 20
      TabOrder = 12
    end
    object TSSomenteMatriz: TToggleSwitch
      Left = 442
      Top = 134
      Width = 73
      Height = 20
      TabOrder = 13
    end
    object TSSomenteFilial: TToggleSwitch
      Left = 530
      Top = 134
      Width = 73
      Height = 20
      TabOrder = 14
    end
    object TSSomenteCelular: TToggleSwitch
      Left = 618
      Top = 134
      Width = 73
      Height = 20
      TabOrder = 15
    end
    object TSComEmail: TToggleSwitch
      Left = 710
      Top = 134
      Width = 73
      Height = 20
      TabOrder = 16
    end
    object TSIncluirAtividadeSecundaria: TToggleSwitch
      Left = 976
      Top = 37
      Width = 73
      Height = 20
      TabOrder = 17
    end
    object EdtPagina: TEdit
      Left = 570
      Top = 80
      Width = 121
      Height = 23
      TabOrder = 18
      Text = '1'
      TextHint = 'Numero da P'#225'gina'
    end
    object GroupBox2: TGroupBox
      Left = 1022
      Top = 96
      Width = 109
      Height = 65
      Caption = 'Pagina Corrente'
      TabOrder = 19
      object lblPagina: TLabel
        Left = 2
        Top = 17
        Width = 105
        Height = 46
        Align = alClient
        Alignment = taCenter
        Caption = 'Pagina'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 87
        ExplicitHeight = 37
      end
    end
    object GroupBox3: TGroupBox
      Left = 862
      Top = 96
      Width = 74
      Height = 65
      Caption = 'Status Code'
      TabOrder = 20
      object lblStatusCode: TLabel
        Left = 2
        Top = 17
        Width = 70
        Height = 46
        Align = alClient
        Alignment = taCenter
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -27
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 16
        ExplicitHeight = 37
      end
    end
    object GroupBox4: TGroupBox
      Left = 789
      Top = 96
      Width = 69
      Height = 65
      Caption = 'Registros'
      TabOrder = 21
      object lblRegistros: TLabel
        Left = 2
        Top = 17
        Width = 65
        Height = 46
        Align = alClient
        Alignment = taCenter
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 16
        ExplicitHeight = 37
      end
    end
    object cbUF: TComboBox
      Left = 443
      Top = 35
      Width = 99
      Height = 23
      TabOrder = 22
      OnChange = cbUFChange
      Items.Strings = (
        'AC'
        'AL'
        'AP'
        'AM'
        'BA'
        'CE'
        'DF'
        'ES'
        'GO'
        'MA'
        'MT'
        'MS'
        'MG'
        'PA'
        'PB'
        'PR'
        'PE'
        'PI'
        'RJ'
        'RN'
        'RS'
        'RO'
        'RR'
        'SC'
        'SP'
        'SE'
        'TO')
    end
    object cbMunicipios: TComboBox
      Left = 551
      Top = 35
      Width = 150
      Height = 23
      TabOrder = 23
    end
    object GroupBox5: TGroupBox
      Left = 940
      Top = 96
      Width = 81
      Height = 63
      Caption = 'N.Caracteres'
      TabOrder = 24
      object lblNCaracteres: TLabel
        Left = 2
        Top = 17
        Width = 77
        Height = 44
        Align = alClient
        Alignment = taCenter
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 16
        ExplicitHeight = 37
      end
    end
    object GroupBox6: TGroupBox
      Left = 789
      Top = 161
      Width = 147
      Height = 58
      Caption = 'Tempo Decorrido'
      TabOrder = 25
      object lblTempo: TLabel
        Left = 2
        Top = 17
        Width = 143
        Height = 39
        Align = alClient
        Alignment = taCenter
        Caption = '00:00:00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 110
        ExplicitHeight = 37
      end
    end
    object GroupBox7: TGroupBox
      Left = 940
      Top = 163
      Width = 191
      Height = 54
      Caption = 'N'#176' Registros Tabela Clientes'
      TabOrder = 26
      object lblNTabClientes: TLabel
        Left = 2
        Top = 17
        Width = 187
        Height = 35
        Align = alClient
        Alignment = taCenter
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 16
        ExplicitHeight = 37
      end
    end
<<<<<<< HEAD
    object GroupBox8: TGroupBox
      Left = 16
      Top = 157
      Width = 121
      Height = 63
      Caption = 'Duplicidade CNPJ'
      TabOrder = 27
    end
=======
>>>>>>> a1497b4087e82b51d3c80a8a11068047f25eda30
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 508
    Width = 1134
    Height = 216
    Align = alBottom
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 1134
    Height = 241
    Align = alTop
    ScrollBars = ssBoth
    TabOrder = 1
    ExplicitWidth = 1130
  end
  object Panel1: TPanel
    Left = 0
    Top = 467
    Width = 1134
    Height = 41
    Align = alBottom
    TabOrder = 3
    ExplicitTop = 455
    ExplicitWidth = 1130
    object Button1: TButton
      AlignWithMargins = True
      Left = 1048
      Top = 4
      Width = 75
      Height = 33
      Margins.Right = 10
      Align = alRight
      Caption = 'Enviar'
      TabOrder = 0
      OnClick = Button1Click
      ExplicitLeft = 1044
    end
  end
  object FDMemTable1: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 592
    Top = 472
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 720
    Top = 480
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 304
    Top = 496
  end
end
