object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 623
  ClientWidth = 899
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
    Width = 899
    Height = 134
    Align = alClient
    Caption = 'Par'#226'metros'
    TabOrder = 2
    ExplicitLeft = 8
    ExplicitTop = 247
    ExplicitWidth = 416
    ExplicitHeight = 130
    object Lbl_Estado: TLabel
      Left = 24
      Top = 16
      Width = 17
      Height = 15
      Caption = ' UF'
    end
    object Label2: TLabel
      Left = 200
      Top = 16
      Width = 54
      Height = 15
      Caption = 'Municipio'
    end
    object Label3: TLabel
      Left = 24
      Top = 64
      Width = 31
      Height = 15
      Caption = 'Bairro'
    end
    object Label4: TLabel
      Left = 200
      Top = 64
      Width = 21
      Height = 15
      Caption = 'CEP'
    end
    object Edt_CEP: TEdit
      Left = 200
      Top = 80
      Width = 121
      Height = 23
      TabOrder = 3
      TextHint = 'CEP'
    end
    object Edt_Bairro: TEdit
      Left = 24
      Top = 80
      Width = 121
      Height = 23
      TabOrder = 2
      TextHint = 'Bairro'
    end
    object Edt_Municipio: TEdit
      Left = 200
      Top = 35
      Width = 121
      Height = 23
      TabOrder = 1
      TextHint = 'Munic'#237'pio'
    end
    object Edt_Estado: TEdit
      Left = 24
      Top = 35
      Width = 121
      Height = 23
      TabOrder = 0
      TextHint = 'Estado UF'
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 416
    Width = 899
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
    Width = 899
    Height = 241
    Align = alTop
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 375
    Width = 899
    Height = 41
    Align = alBottom
    TabOrder = 3
    ExplicitTop = 383
    object Button1: TButton
      AlignWithMargins = True
      Left = 813
      Top = 4
      Width = 75
      Height = 33
      Margins.Right = 10
      Align = alRight
      Caption = 'Enviar'
      TabOrder = 0
      OnClick = Button1Click
      ExplicitLeft = 816
      ExplicitTop = 10
      ExplicitHeight = 25
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
