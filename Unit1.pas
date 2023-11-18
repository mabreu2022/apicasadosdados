unit Unit1;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  DataSet.Serialize,
  Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Vcl.StdCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  RESTRequest4D,
  System.JSON,
  FireDac.Stan.Def,
  FireDAC.UI.Intf,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef,
  FireDAC.VCLUI.Wait,
  FireDAC.DApt,
  Unit2,
  IniFiles, Vcl.ExtCtrls, Vcl.WinXCtrls;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    Memo1: TMemo;
    FDMemTable1: TFDMemTable;
    DataSource1: TDataSource;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    EditUF: TEdit;
    EditMunicipio: TEdit;
    EditBairro: TEdit;
    EditCEP: TEdit;
    Lbl_Estado: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    EdtRazaoSocial: TEdit;
    EdtKnae: TEdit;
    EdtNaturezaJuridica: TEdit;
    EdtDDD: TEdit;
    EdtDataAberturaAPartirDe: TEdit;
    EdtDataAberturaAte: TEdit;
    CBAtivaInativa: TComboBox;
    Label1: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    ToggleSwitch1: TToggleSwitch;
    ToggleSwitch2: TToggleSwitch;
    ToggleSwitch3: TToggleSwitch;
    ToggleSwitch4: TToggleSwitch;
    ToggleSwitch5: TToggleSwitch;
    ToggleSwitch6: TToggleSwitch;
    ToggleSwitch7: TToggleSwitch;
    ToggleSwitch8: TToggleSwitch;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    ToggleSwitch9: TToggleSwitch;
    Label20: TLabel;
    EdtPagina: TEdit;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    JSONObject, DataObject: TJSONObject;
    CNPJsArray: TJSONArray;
    procedure CarregarJSONParaFDMemTable(const JSONString: string; MemTable: TFDMemTable);
    function FormatarJSON(const ADados: string): string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation


{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  LResponse: IResponse;
  LJson    : string;
  C        : integer;
  D        : Integer;
begin

   //Só Envia os parâmetros caso sejam modificados.
   if Trim(EditUF.Text)<>'' then
     TMyConst.AtualizarUF(EditUF.Text);
   if Trim(EditMunicipio.Text)<>'' then
     TMyConst.AtualizarMunicipio(EditMunicipio.Text);
   if Trim(EditBairro.Text)<>'' then
     TMyConst.AtualizarBairro(EditBairro.Text);
   if Trim(EditCEP.Text)<>'' then
     TMyConst.AtualizarCEP(EditCEP.Text);


    Ljson:= TMyConst.JSON;

    D:= StrToInt(EdtPagina.Text);

    for C := 1 to D do
    begin
      //Limpa o memo do JSON a cada requisição enviada
      Memo1.Clear;

      TMyConst.AtualizarPagina(IntToStr(C));
      LResponse :=
         TRequest.New.BaseURL('https://api.casadosdados.com.br/v2/public/cnpj/search')
         .Accept('application/json')
         .AddBody(Ljson)
         //.AddBody(FormatarJSON(Ljson))
         .Post;

      //Preenche o memo com o retorno da API
      memo1.Lines.Add(FormatarJSON(LResponse.Content));
      memo1.Perform(WM_VSCROLL,SB_THUMBPOSITION,0);

      CarregarJSONParaFDMemTable(Memo1.Text, FDMemTable1);


      //Se o status code for diferente de 200 OK sai do For
      if LResponse.StatusCode <> 200 then
      begin
        ShowMessage('Não existem mais dados para essa pesquisa');
        exit;
      end;
    end;

    //Libera da memoria
    JSONObject.Free;
    DataObject.Free;
    CNPJsArray.Free;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  FDMemTable1.LoadFromJSON(Memo1.Text);
end;

procedure TForm1.CarregarJSONParaFDMemTable(const JSONString: string;
  MemTable: TFDMemTable);
var

  CNPJObject: TJSONObject;
  AtivPrin : TJSONObject;
  I: Integer;
  Qry: TFDquery;
  Connection: TFDConnection;
  IniFile: TIniFile;
  RespostaUsuario: Integer;
begin
  // Limpa os dados existentes na FDMemTable
  MemTable.Close;
  MemTable.FieldDefs.Clear;


  // Adiciona os campos à FDMemTable
  MemTable.FieldDefs.Add('cnpj', ftString, 14);
  MemTable.FieldDefs.Add('cnpj_raiz', ftString, 8);
  MemTable.FieldDefs.Add('filial_numero', ftInteger);
  MemTable.FieldDefs.Add('razao_social', ftString, 100);
  MemTable.FieldDefs.Add('nome_fantasia', ftString, 100);
  MemTable.FieldDefs.Add('data_abertura', ftString);
  MemTable.FieldDefs.Add('situacao_cadastral', ftString, 50);
  MemTable.FieldDefs.Add('logradouro', ftString, 100);
  MemTable.FieldDefs.Add('numero', ftString, 10);
  MemTable.FieldDefs.Add('bairro', ftString, 50);
  MemTable.FieldDefs.Add('municipio', ftString, 50);
  MemTable.FieldDefs.Add('uf', ftString, 2);
  MemTable.FieldDefs.Add('atividade_codigo', ftString, 10);
  MemTable.FieldDefs.Add('atividade_descricao', ftString, 100);
  MemTable.FieldDefs.Add('cnpj_mei', ftBoolean);
  MemTable.FieldDefs.Add('versao', ftString, 10);

  // Cria os campos na FDMemTable
  MemTable.CreateDataSet;

  // Converte a string JSON para um objeto JSON
  JSONObject:=  TJSONObject.Create(nil);
  JSONObject := TJSONObject.ParseJSONValue(JSONString) as TJSONObject;
  try
    // Obtém o objeto 'data' do JSON
    DataObject:= TJSONObject.Create(nil);
    DataObject := JSONObject.GetValue('data') as TJSONObject;

    // Obtém o array 'cnpj' do objeto 'data'
    CNPJsArray:= TJSONArray.Create(nil);
    CNPJsArray := DataObject.GetValue('cnpj') as TJSONArray;

    // Itera sobre os objetos CNPJ no array
    for I := 0 to CNPJsArray.Size - 1 do
    begin
      // Obtém o objeto CNPJ
      CNPJObject:= TJSONObject.Create(nil);
      CNPJObject := CNPJsArray.Items[I] as TJSONObject;

      // Adiciona os campos na FDMemTable e preenche os valores
      MemTable.Append;
      MemTable.FieldByName('cnpj').AsString               := CNPJObject.GetValue('cnpj').Value;
      MemTable.FieldByName('cnpj_raiz').AsString          := CNPJObject.GetValue('cnpj_raiz').Value;
      MemTable.FieldByName('filial_numero').AsInteger     := CNPJObject.GetValue<integer>('filial_numero');
      MemTable.FieldByName('razao_social').AsString       := CNPJObject.GetValue('razao_social').Value;
      MemTable.FieldByName('nome_fantasia').AsString      := CNPJObject.GetValue('nome_fantasia').Value;
      MemTable.FieldByName('data_abertura').AsString      := CNPJObject.GetValue('data_abertura').Value;
      MemTable.FieldByName('situacao_cadastral').AsString := CNPJObject.GetValue('situacao_cadastral').Value;
      MemTable.FieldByName('logradouro').AsString         := CNPJObject.GetValue('logradouro').Value;
      MemTable.FieldByName('numero').AsString             := CNPJObject.GetValue('numero').Value;
      MemTable.FieldByName('bairro').AsString             := CNPJObject.GetValue('bairro').Value;
      MemTable.FieldByName('municipio').AsString          := CNPJObject.GetValue('municipio').Value;
      MemTable.FieldByName('uf').AsString                 := CNPJObject.GetValue('uf').Value;

      AtivPrin:=  CNPJObject.GetValue<TJSONObject>('atividade_principal',nil);
      MemTable.FieldByName('atividade_codigo').AsString   := AtivPrin.GetValue('codigo').Value;
      MemTable.FieldByName('atividade_descricao').AsString:= AtivPrin.GetValue('descricao').Value;

      MemTable.FieldByName('cnpj_mei').AsBoolean          := CNPJObject.GetValue<boolean>('cnpj_mei');
      MemTable.FieldByName('versao').AsString             := CNPJObject.GetValue('versao').Value;

      // Posta os dados na FDMemTable
      MemTable.Post;

    end;
  finally
    // Libera o objeto JSON
    //JSONObject.Free;
    //DataObject.Free;
    //CNPJsArray.Free;

    //Gravar no Banco de dados
    RespostaUsuario := MessageDlg('Deseja gravar os dados?', mtConfirmation, mbYesNo, 0);
    // Verificar a resposta do usuário
    if RespostaUsuario = mrYes then
    begin
      Connection := TFDConnection.Create(nil);

      //Ideal Ler de um arquivo Ini para não ficar enjessado
      Connection.DriverName := 'MySQL'; // Driver do FireDAC para MySQL
      IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) +'\config.ini');
      try
        Connection.Params.Values['Server']    := IniFile.ReadString('MySQLConfig', 'Server', '');
        Connection.Params.Values['User_Name'] := IniFile.ReadString('MySQLConfig', 'User_Name', '');
        Connection.Params.Values['Password']  := IniFile.ReadString('MySQLConfig', 'Password', '');
        Connection.Params.Values['Database']  := IniFile.ReadString('MySQLConfig', 'Database', '');
        Connection.Params.Values['Port']      := IniFile.ReadString('MySQLConfig', 'Port', '');
      finally
        IniFile.Free;
      end;

      Connection.Connected := True;

      //Showmessage(IntToStr(MemTable.RecordCount));

      //Inicia a Transação com o banco
      try
        Connection.StartTransaction;

        MemTable.First;
        while not MemTable.Eof do
        begin
            Qry:= TFDQuery.Create(nil);
            Qry.Connection:= Connection;
            try
              Qry.SQL.Clear;
              Qry.SQL.Add('INSERT INTO clientes (' +
                          'cnpj, cnpj_raiz, filial_numero, razao_social, nome_fantasia, ' +
                          'data_abertura, situacao_cadastral, logradouro, numero, bairro, ' +
                          'municipio, uf, codigo, descricao, cnpj_mei, versao) ' +
                          'VALUES (:cnpj, :cnpj_raiz, :filial_numero, :razao_social, :nome_fantasia, ' +
                          ':data_abertura, :situacao_cadastral, :logradouro, :numero, :bairro, ' +
                          ':municipio, :uf, :codigo, :descricao, :cnpj_mei, :versao)');

              Qry.ParamByName('cnpj').AsString                := MemTable.FieldByName('cnpj').AsString;
              Qry.ParamByName('cnpj_raiz').AsString           := MemTable.FieldByName('cnpj_raiz').AsString;
              Qry.ParamByName('filial_numero').AsInteger      := MemTable.FieldByName('filial_numero').AsInteger;
              Qry.ParamByName('razao_social').AsString        := MemTable.FieldByName('razao_social').AsString;
              Qry.ParamByName('nome_fantasia').AsString       := MemTable.FieldByName('nome_fantasia').AsString;
              Qry.ParamByName('data_abertura').AsString       := MemTable.FieldByName('data_abertura').AsString;
              Qry.ParamByName('situacao_cadastral').AsString  := MemTable.FieldByName('situacao_cadastral').AsString;
              Qry.ParamByName('logradouro').AsString          := MemTable.FieldByName('logradouro').AsString;
              Qry.ParamByName('numero').AsString              := MemTable.FieldByName('numero').AsString;
              Qry.ParamByName('bairro').AsString              := MemTable.FieldByName('bairro').AsString;
              Qry.ParamByName('municipio').AsString           := MemTable.FieldByName('municipio').AsString;
              Qry.ParamByName('uf').AsString                  := MemTable.FieldByName('uf').AsString;
              Qry.ParamByName('codigo').AsString              := MemTable.FieldByName('atividade_codigo').AsString;
              Qry.ParamByName('descricao').AsString           := MemTable.FieldByName('atividade_descricao').AsString;
              Qry.ParamByName('cnpj_mei').AsBoolean           := MemTable.FieldByName('cnpj_mei').AsBoolean;
              Qry.ParamByName('versao').AsString              := MemTable.FieldByName('versao').AsString;

              Qry.ExecSQL;
              MemTable.Next;
            finally
              Qry.Free;
              Connection.Commit;
              Connection.Connected := False;
            end;

        end;
      Except  on E: Exception do
        begin
           Connection.Rollback;
           ShowMessage('Erro durante a transação: ' + E.Message);
        end;
      end;

    end
    else
    begin
      ShowMessage('Dados não gravados.');
    end;
  end;
end;

function TForm1.FormatarJSON(const ADados: string): string;
var
  LV: System.JSON.TJSONValue;
begin
  if ADados.Trim.IsEmpty then
    Exit;
  LV := System.JSON.TJSONObject.ParseJSONValue(ADados);
  if not Assigned(LV) then
    Exit(ADados);
  try
    Result := LV.Format();
  finally
    LV.Free;
  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  //FDMemTable1.Open;
end;

end.
