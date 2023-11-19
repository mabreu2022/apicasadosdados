unit Unit2;


interface

uses
  System.SysUtils;

type
TMyConst = class
  private
    class var FJSON: string;
    class var FJSONENVIO: string;
  public
   class constructor Create;
   class property JSON: string read FJSON write FJSON;
   class property JSONENVIO: string read FJSONENVIO write FJSONENVIO;
   class procedure AtualizarUF(const novaUF: string);
   class procedure AtualizarMunicipio(const novoMunicipio: string);
   class procedure AtualizarBairro(const novoBairro: string);
   class procedure AtualizarCEP(const novoCEP: string);
   class procedure AtualizarPagina(const novaPagina: string);

end;

implementation

uses Unit1;

{ TMyConst }

class constructor TMyConst.Create;
begin
  FJSON :=  '{'+
  '"query": {'+
  '"termo": [],'+
  '"atividade_principal": [],'+
  '"natureza_juridica": [],'+
  '"uf": ['+
  '"SP"'+
  '],'+
  '"municipio": ['+
  '"SAO JOSE DOS CAMPOS"'+
  '],'+
  '"bairro": ['+
  '"Jardim Aquarius"'+
  '],'+
  '"situacao_cadastral": "ATIVA",'+
  '"cep": [],'+
  '"ddd": []'+
  '},'+
  '"range_query": {'+
  '"data_abertura": {'+
  '"lte": null,'+
  '"gte": null'+
  '},'+
  '"capital_social": {'+
  '"lte": null,'+
  '"gte": null'+
  '}'+
  '},'+
  '"extras": {'+
  '"somente_mei": false,'+
  '"excluir_mei": false,'+
  '"com_email": false,'+
  '"incluir_atividade_secundaria": false,'+
  '"com_contato_telefonico": false,'+
  '"somente_fixo": false,'+
  '"somente_celular": false,'+
  '"somente_matriz": false,'+
  '"somente_filial": false'+
  '},'+
  '"page": %PAGINA% '+
  '}';

   FJSONENVIO := FJSON;

  inherited;
end;

class procedure TMyConst.AtualizarBairro(const novoBairro: string);
begin
  // Substituir os valores no JSON
  FJSON := StringReplace(FJSON, '"bairro": ["Jardim Aquarius"]', '"bairro": ["' + novoBairro + '"]', []);
end;

class procedure TMyConst.AtualizarCEP(const novoCEP: string);
begin
  // Substituir os valores no JSON para o CEP
  FJSON := StringReplace(FJSON, '"cep": []', '"cep": ["' + novoCEP + '"]', []);
end;

class procedure TMyConst.AtualizarMunicipio(const novoMunicipio: string);
begin
  // Substituir os valores no JSON
  FJSON := StringReplace(FJSON, '"municipio": ["SAO JOSE DOS CAMPOS"]', '"municipio": ["' + novoMunicipio + '"]', []);
end;

class procedure TMyConst.AtualizarPagina(const novaPagina: string);
begin
  // Substituir os valores no JSON para a Page

  JSONENVIO := StringReplace(FJSON, '%PAGINA%', novaPagina, [rfReplaceAll]);
end;

class procedure TMyConst.AtualizarUF(const novaUF: string);
begin
  // Substituir os valores no JSON
  FJSON := StringReplace(FJSON, '"uf": ["SP"]', '"uf": ["' + novaUF + '"]', []);
end;

end.
