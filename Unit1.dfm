object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Pesquisa Casa dos Dados'
  ClientHeight = 678
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
    Height = 189
    Align = alClient
    Caption = 'Par'#226'metros'
    TabOrder = 2
    object Lbl_Estado: TLabel
      Left = 448
      Top = 16
      Width = 17
      Height = 15
      Caption = ' UF'
    end
    object Label2: TLabel
      Left = 578
      Top = 16
      Width = 54
      Height = 15
      Caption = 'Municipio'
    end
    object Label3: TLabel
      Left = 707
      Top = 19
      Width = 31
      Height = 15
      Caption = 'Bairro'
    end
    object Label4: TLabel
      Left = 835
      Top = 19
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
      Top = 19
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
      TabOrder = 3
      TextHint = 'CEP'
    end
    object EditBairro: TEdit
      Left = 707
      Top = 35
      Width = 121
      Height = 23
      TabOrder = 2
      TextHint = 'Bairro'
    end
    object EditMunicipio: TEdit
      Left = 578
      Top = 35
      Width = 121
      Height = 23
      TabOrder = 1
      TextHint = 'Munic'#237'pio'
    end
    object EditUF: TEdit
      Left = 448
      Top = 35
      Width = 121
      Height = 23
      TabOrder = 0
      TextHint = 'Estado UF'
    end
    object EdtRazaoSocial: TEdit
      Left = 16
      Top = 35
      Width = 121
      Height = 23
      TabOrder = 4
      Text = 'EdtRazaoSocial'
    end
    object EdtKnae: TEdit
      Left = 152
      Top = 35
      Width = 154
      Height = 23
      TabOrder = 5
      Text = 'EdtKnae'
    end
    object EdtNaturezaJuridica: TEdit
      Left = 319
      Top = 35
      Width = 121
      Height = 23
      TabOrder = 6
      Text = 'EdtNaturezaJuridica'
    end
    object EdtDDD: TEdit
      Left = 16
      Top = 80
      Width = 121
      Height = 23
      TabOrder = 7
      Text = 'EdtDDD'
      TextHint = '2 Digitos'
    end
    object EdtDataAberturaAPartirDe: TEdit
      Left = 152
      Top = 80
      Width = 121
      Height = 23
      TabOrder = 8
      Text = 'EdtDataAberturaAPartirDe'
    end
    object EdtDataAberturaAte: TEdit
      Left = 319
      Top = 80
      Width = 121
      Height = 23
      TabOrder = 9
      Text = 'EdtDataAberturaAte'
    end
    object CBAtivaInativa: TComboBox
      Left = 448
      Top = 80
      Width = 97
      Height = 23
      ItemIndex = 0
      TabOrder = 10
      Text = 'ATIVA'
      Items.Strings = (
        'ATIVA'
        'INATIVA')
    end
    object ToggleSwitch1: TToggleSwitch
      Left = 16
      Top = 134
      Width = 73
      Height = 20
      TabOrder = 11
    end
    object ToggleSwitch2: TToggleSwitch
      Left = 110
      Top = 134
      Width = 73
      Height = 20
      TabOrder = 12
    end
    object ToggleSwitch3: TToggleSwitch
      Left = 216
      Top = 134
      Width = 73
      Height = 20
      TabOrder = 13
    end
    object ToggleSwitch4: TToggleSwitch
      Left = 354
      Top = 134
      Width = 73
      Height = 20
      TabOrder = 14
    end
    object ToggleSwitch5: TToggleSwitch
      Left = 442
      Top = 134
      Width = 73
      Height = 20
      TabOrder = 15
    end
    object ToggleSwitch6: TToggleSwitch
      Left = 530
      Top = 134
      Width = 73
      Height = 20
      TabOrder = 16
    end
    object ToggleSwitch7: TToggleSwitch
      Left = 618
      Top = 134
      Width = 73
      Height = 20
      TabOrder = 17
    end
    object ToggleSwitch8: TToggleSwitch
      Left = 710
      Top = 134
      Width = 73
      Height = 20
      TabOrder = 18
    end
    object ToggleSwitch9: TToggleSwitch
      Left = 976
      Top = 37
      Width = 73
      Height = 20
      TabOrder = 19
    end
    object EdtPagina: TEdit
      Left = 570
      Top = 80
      Width = 121
      Height = 23
      TabOrder = 20
      Text = '1'
      TextHint = 'Numero da P'#225'gina'
    end
    object GroupBox2: TGroupBox
      Left = 1012
      Top = 88
      Width = 111
      Height = 65
      Caption = 'Pagina Corrente'
      TabOrder = 21
      object lblPagina: TLabel
        Left = 2
        Top = 17
        Width = 107
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
        ExplicitLeft = 50
        ExplicitTop = 40
        ExplicitWidth = 87
        ExplicitHeight = 37
      end
    end
    object GroupBox3: TGroupBox
      Left = 904
      Top = 88
      Width = 89
      Height = 65
      Caption = 'Status Code'
      TabOrder = 22
      object lblStatusCode: TLabel
        Left = 2
        Top = 17
        Width = 85
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
      Left = 800
      Top = 88
      Width = 100
      Height = 65
      Caption = 'Registros'
      TabOrder = 23
      object lblRegistros: TLabel
        Left = 2
        Top = 17
        Width = 96
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
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 471
    Width = 1134
    Height = 207
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
  end
  object Panel1: TPanel
    Left = 0
    Top = 430
    Width = 1134
    Height = 41
    Align = alBottom
    TabOrder = 3
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
end
