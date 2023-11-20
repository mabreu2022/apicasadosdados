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
  IniFiles,
  Vcl.ExtCtrls,
  Vcl.WinXCtrls,
  Unit3,
  Generics.Collections;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    Memo1: TMemo;
    FDMemTable1: TFDMemTable;
    DataSource1: TDataSource;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
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
    TSSomenteMei: TToggleSwitch;
    TSExcluiMei: TToggleSwitch;
    TSComContatoTelefone: TToggleSwitch;
    TSSomenteFixo: TToggleSwitch;
    TSSomenteMatriz: TToggleSwitch;
    TSSomenteFilial: TToggleSwitch;
    TSSomenteCelular: TToggleSwitch;
    TSComEmail: TToggleSwitch;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    TSIncluirAtividadeSecundaria: TToggleSwitch;
    Label20: TLabel;
    EdtPagina: TEdit;
    Label8: TLabel;
    GroupBox2: TGroupBox;
    lblPagina: TLabel;
    GroupBox3: TGroupBox;
    lblStatusCode: TLabel;
    GroupBox4: TGroupBox;
    lblRegistros: TLabel;
    cbUF: TComboBox;
    cbMunicipios: TComboBox;
    GroupBox5: TGroupBox;
    lblNCaracteres: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cbUFChange(Sender: TObject);
  private
    { Private declarations }
    JSONObject, DataObject: TJSONObject;
    CNPJsArray: TJSONArray;
    Municipios: TObjectList<TMunicipio>;
    SuprimirPergunta: string;
    Mensagens: string;
    procedure CarregarJSONParaFDMemTable(const JSONString: string; MemTable: TFDMemTable);
    function FormatarJSON(const ADados: string): string;
    procedure CarregarMunicipiosDoJSON(const JSON: string);
    function RemoverAcentos(const ATexto: string): string;
    function MessageDlg(const Mensagem : String; aDlgType : TMsgDlgType; aBotao : TMsgDlgButtons) : Word;overload;
    function ChaveCnpjExiste(const jsonStr: string): Boolean;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation


{$R *.dfm}


procedure TForm1.Button1Click(Sender: TObject);
begin
   try

     TTHread.CreateAnonymousThread(procedure
     var
        LResponse: IResponse;
        LJson    : string;
        C        : integer;
        D        : Integer;
        LS_SomenteMei: string;
        LS_ExcluiMei: string;
        LS_ComContatoTelefone: string;
        LS_SomenteFixo: string;
        LS_SomenteMatriz: string;
        LS_SomenteFilial: string;
        LS_SomenteCelular: string;
        LS_ComEmail: string;
        LS_IncluirAtividadeSecundaria: string;
     begin

      D:= StrToInt(EdtPagina.Text);

      for C := 1 to D do
      begin
        //Limpa o memo do JSON a cada requisição enviada
        TThread.Synchronize(nil, procedure
        begin
          Memo1.Clear;
        end);

        //Ler os Switchs
         if TSSomenteMei.State = tssOff then
           LS_SomenteMei:='false'
         else
           LS_SomenteMei:= 'true';

         if TSExcluiMei.State = tssOff then
           LS_ExcluiMei:= 'false'
         else
           LS_ExcluiMei:= 'true';

         if TSComContatoTelefone.State = tssOff then
           LS_ComContatoTelefone:='false'
         else
           LS_ComContatoTelefone:='true';

         if TSSomenteFixo.State = tssOff then
           LS_SomenteFixo := 'false'
         else
           LS_SomenteFixo := 'true';

         if TSSomenteMatriz.State = tssOff then
           LS_SomenteMatriz := 'false'
         else
           LS_SomenteMatriz := 'true';

         if TSSomenteFilial.State = tssOff then
           LS_SomenteFilial := 'false'
         else
           LS_SomenteFilial := 'true';

         if TSSomenteCelular.State = tssOff then
           LS_SomenteCelular := 'false'
         else
           LS_SomenteCelular := 'true';

         if TSComEmail.State = tssOff then
           LS_ComEmail := 'false'
         else
           LS_ComEmail := 'true';

         if TSIncluirAtividadeSecundaria.State = tssOff then
           LS_IncluirAtividadeSecundaria := 'false'
         else
           LS_IncluirAtividadeSecundaria := 'true';
         //fim leitura dos Switchs

        //setar os parâmetros da pesquisa
        TMyConst.AtualizaTudo(cbUF.Items[cbUF.ItemIndex],                 //UF        1
                              cbMunicipios.Items[cbMunicipios.ItemIndex], //Municipio 2
                              EditBairro.Text,                            //Bairro    3
                              EditCEP.Text,                               //CEP        4
                              IntToStr(C),                                //Pagina      5
                              LS_SomenteMei,                              //Somente Mei  6
                              LS_ExcluiMei,                               //Exclui Mei    7
                              LS_ComContatoTelefone,                      //Com Contato Telefone 8
                              LS_SomenteFixo,                             //Somente Fixo         9
                              LS_SomenteMatriz,                           //Somente Matriz       10
                              LS_SomenteFilial,                           //Somente Filial       11
                              LS_SomenteCelular,                          //Somente Celular      12
                              LS_ComEmail,                                //Com E-mail           13
                              LS_IncluirAtividadeSecundaria);             //Incluir Atividade Secundária 14

        Ljson:= TMyConst.JSONENVIO;

        TThread.Synchronize(nil, procedure
        begin
         lblStatusCode.Caption := '0';
         lblNCaracteres.Caption:= '0';
        end);

          LResponse :=
             TRequest.New.BaseURL('https://api.casadosdados.com.br/v2/public/cnpj/search')
             .Accept('application/json')
             .AddBody(FormatarJSON(Ljson))
             .Post;


        //Mostra na tela o número da página
        TThread.Synchronize(nil, procedure
        begin
          lblPagina.Caption:= IntToStr(C);
        end);

        //if LResponse.StatusCode = 200 then
        if LResponse.ContentLength > 100 then
        begin
          //Mostra o Status Code na Tela.
          TThread.Synchronize(nil, procedure
          begin
            lblStatusCode.Font.Color:= ClGreen;
            lblStatusCode.Caption:= IntToStr(LResponse.StatusCode);
            lblNCaracteres.Caption:= IntToStr(LResponse.ContentLength);

            //Preenche o memo com o retorno da API
            memo1.Lines.Add(FormatarJSON(LResponse.Content));
            memo1.Perform(WM_VSCROLL,SB_THUMBPOSITION,0);
            CarregarJSONParaFDMemTable(Memo1.Text, FDMemTable1);
          end);

        end
        else
        //Se o status code for diferente de 200 OK sai do For
//        if LResponse.StatusCode <> 200 then
        begin
           //Mostra o Status Code na Tela.
          TThread.Synchronize(nil, procedure
          begin
            lblStatusCode.Font.Color:= ClRed;
            lblStatusCode.Caption:= IntToStr(LResponse.StatusCode);
            lblNCaracteres.Caption:= IntToStr(LResponse.ContentLength);
            ShowMessage('Não existem mais dados para essa pesquisa');

          end);
          exit;

        end;
      end;

    end).Start;
     Except  on E: Exception do
          begin
              ShowMessage('Erro : ' + E.Message);
          end;
     end;

end;

procedure TForm1.CarregarJSONParaFDMemTable(const JSONString: string;
  MemTable: TFDMemTable);
var

  CNPJObject: TJSONObject;
  AtivPrin : TJSONObject;
  I: Integer;
  Qry, QryVerificarCNPJ: TFDquery;
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
  MemTable.FieldDefs.Add('razao_social', ftString, 200);
  MemTable.FieldDefs.Add('nome_fantasia', ftString, 100);
  MemTable.FieldDefs.Add('data_abertura', ftString);
  MemTable.FieldDefs.Add('situacao_cadastral', ftString, 50);
  MemTable.FieldDefs.Add('logradouro', ftString, 100);
  MemTable.FieldDefs.Add('numero', ftString, 10);
  MemTable.FieldDefs.Add('bairro', ftString, 50);
  MemTable.FieldDefs.Add('municipio', ftString, 50);
  MemTable.FieldDefs.Add('uf', ftString, 2);
  MemTable.FieldDefs.Add('atividade_codigo', ftString, 10);
  MemTable.FieldDefs.Add('atividade_descricao', ftString, 200);
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


    if Assigned(CNPJsArray) and (CNPJsArray is TJSONArray) then
    begin
      for I := 0 to CNPJsArray.Size - 1 do
      begin
        //Zera os registros na Tela.
        lblRegistros.caption:='0';

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
    end;

  finally
    // Libera o objeto JSON
    JSONObject.Free;
  end;

  //Mostra a quantidade de registros da Pagina de dados na tela
  lblRegistros.caption:= IntToStr(MemTable.RecordCount);

  if Assigned(CNPJsArray) and (CNPJsArray is TJSONArray) then
  begin
    //Gravar no Banco de dados
    //ler config
    IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) +'\config.ini');

    try
      SuprimirPergunta := IniFile.ReadString('MySQLConfig', 'SuprimirPergunta', '');
      Mensagens        := IniFile.ReadString('MySQLConfig', 'Mensagens', '');
    finally
      IniFile.Free;
    end;

    if SuprimirPergunta='True' then
      RespostaUsuario := mrYes
    else
     RespostaUsuario := MessageDlg('Deseja gravar os dados?', mtConfirmation, mbYesNo);

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
        SuprimirPergunta := IniFile.ReadString('MySQLConfig', 'SuprimirPergunta', '');

      finally
        IniFile.Free;
      end;

      Connection.Connected := True;

      //Inicia a Transação com o banco
      try
        Connection.StartTransaction;

        MemTable.First;
        while not MemTable.Eof do
        begin
            Qry:= TFDQuery.Create(nil);
            Qry.Connection:= Connection;

            //testar se o cnpj já existe no banco para poder inserir ou não
            QryVerificarCNPJ:= TFDQuery.Create(nil);
            QryVerificarCNPJ.Connection:= Connection;
            try
              QryVerificarCNPJ.SQL.Clear;
              QryVerificarCNPJ.SQL.Add('SELECT CNPJ FROM CLIENTES');
              QryVerificarCNPJ.SQL.Add(' WHERE CNPJ=:PCNPJ');
              QryVerificarCNPJ.ParamByName('PCNPJ').DataType:= ftstring;
              QryVerificarCNPJ.ParamByName('PCNPJ').AsString:= MemTable.FieldByName('cnpj').AsString;
              QryVerificarCNPJ.Open;

              if QryVerificarCNPJ.RecordCount = 0 then
              begin
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
              end
              else
              begin
                if Mensagens ='True' then
                  ShowMessage('CNPJ Já cadastrado no banco de dados ' + MemTable.FieldByName('cnpj').AsString);

                MemTable.Next;
              end;
            finally
               QryVerificarCNPJ.Free;
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

procedure TForm1.CarregarMunicipiosDoJSON(const JSON: string);
var
  JSONArr: TJSONArray;
  JSONObj: TJSONObject;
  Municipio: TMunicipio;
begin
  JSONArr := TJSONObject.ParseJSONValue(JSON) as TJSONArray;

  if Assigned(JSONArr) then
  begin
    for var I := 0 to JSONArr.Count - 1 do
    begin
      JSONObj := JSONArr.Items[I] as TJSONObject;

      if Assigned(JSONObj) then
      begin
        Municipio := TMunicipio.Create;
        Municipio.id := JSONObj.GetValue('id').AsType<Integer>;
        // Remover acentos do nome do município
        Municipio.nome := RemoverAcentos(JSONObj.GetValue('nome').Value);

        // Preencher outras propriedades conforme necessário

        Municipios.Add(Municipio);
      end;
    end;
  end;
end;

procedure TForm1.cbUFChange(Sender: TObject);
var
  LResponse: IResponse;
  LJson    : string;
  LRetorno: string;
  UF: string;
  UFItem: string;
begin
  Municipios.Clear;
  cbMunicipios.Items.Clear;

  // fazer a requisição do IBGE e carregar no Combobox Municipios
  UF := cbUF.Items[cbUF.ItemIndex];

  TThread.CreateAnonymousThread(procedure
  begin
    LResponse :=
          TRequest.New.BaseURL('https://servicodados.ibge.gov.br/api/v1/localidades/estados/' + UF + '/municipios')
          .Accept('application/json')
          .Get;

    LRetorno:= LResponse.Content;

    // Processar o JSON e preencher a lista de municípios
    CarregarMunicipiosDoJSON(LRetorno);

    // Preencher o ComboBox com os nomes dos municípios
    for var Municipio in Municipios do
      cbMunicipios.Items.Add(Municipio.nome);
  end).Start;
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
  // Inicializar a lista de municípios
  Municipios := TObjectList<TMunicipio>.Create;
end;

function TForm1.MessageDlg(const Mensagem: String; aDlgType: TMsgDlgType;
  aBotao: TMsgDlgButtons): Word;
var
  Form : TForm;
begin
  Form:= CreateMessageDialog(Mensagem,aDlgType, aBotao);
  (Form.FindComponent('Yes') as TButton).Caption:= 'Sim';
  (Form.FindComponent('No') as TButton).Caption:= 'Não';
  Result:= Form.ShowModal;

end;

function TForm1.RemoverAcentos(const ATexto: string): string;
const
  AccentedChars: array[0..11] of string = ('á', 'é', 'í', 'ó', 'ú', 'à', 'è', 'ì', 'ò', 'ù', 'ã', 'õ');
  UnaccentedChars: array[0..11] of string = ('a', 'e', 'i', 'o', 'u', 'a', 'e', 'i', 'o', 'u', 'a', 'o');
var
  I: Integer;
begin
  Result := ATexto;
  for I := Low(AccentedChars) to High(AccentedChars) do
    Result := StringReplace(Result, AccentedChars[I], UnaccentedChars[I], [rfReplaceAll, rfIgnoreCase]);
end;

function TForm1.ChaveCnpjExiste(const jsonStr: string): Boolean;
var
  jsonObj, dataObj: TJSONObject;
  cnpjArray: TJSONArray;
begin
  // Carregar o JSON a partir da string
  jsonObj := TJSONObject.ParseJSONValue(jsonStr) as TJSONObject;

  try
    Result := False;

    if Assigned(jsonObj) then
    begin
      // Verificar se a chave 'data' existe
      if jsonObj.TryGetValue<TJSONObject>('data', dataObj) then
      begin
        // Verificar se a chave 'cnpj' existe dentro do objeto 'data'
        if dataObj.TryGetValue<TJSONArray>('cnpj', cnpjArray) then
        begin
          // Verificar se o array 'cnpj' não está vazio
          Result := Assigned(cnpjArray) and (cnpjArray.Count > 0);
        end;
      end;
    end;
  finally
    jsonObj.Free;
  end;

end;

end.
