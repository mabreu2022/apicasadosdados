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
  OnCreate = FormCreate
  TextHeight = 15
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
    Height = 329
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 893
  end
  object Button1: TButton
    Left = 288
    Top = 336
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 512
    Top = 344
    Width = 75
    Height = 25
    Caption = 'Importar'
    TabOrder = 3
    OnClick = Button2Click
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
    Left = 56
    Top = 352
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 160
    Top = 360
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=fred'
      'User_Name=root'
      'Password=19741974'
      'DriverID=MySQL')
    Left = 168
    Top = 128
  end
end
