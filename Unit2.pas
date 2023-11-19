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
   class procedure AtualizaTudo(const novaUF: string;
                                      const novoMunicipio : string;
                                      const novoBairro: string;
                                      const novoCEP: string;
                                      const novaPagina: string;
                                      const somenteMei: string;
                                      const excluirMei: string;
                                      const comcontatotelefone: string;
                                      const somentefixo: string;
                                      const somentematriz:string;
                                      const somentefilial:string;
                                      const somentecelular:string;
                                      const comemail: string;
                                      const incluiratividadesecundaria:string);
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
  '"%UF%"'+
  '],'+
  '"municipio": ['+
  '"%MUNICIPIO%"'+
  '],'+
  '"bairro": ['+
  '"%BAIRRO%"'+
  '],'+
  '"situacao_cadastral": "ATIVA",'+
  '"cep": ["%CEP%"],'+
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
  '"somente_mei": %SOMENTEMEI%,'+
  '"excluir_mei": %EXCLUIRMEI%,'+
  '"com_email": %COMEMAIL%,'+
  '"incluir_atividade_secundaria": %INCLUIRATIVIDADESECUNDARIA%,'+
  '"com_contato_telefonico": %COMCONTATOTELEFONE%,'+
  '"somente_fixo": %SOMENTEFIXO%,'+
  '"somente_celular": %SOMENTECELULAR%,'+
  '"somente_matriz": %SOMENTEMATRIZ%,'+
  '"somente_filial": %SOMENTEFILIAL%'+
  '},'+
  '"page": %PAGINA% '+
  '}';

   FJSONENVIO := FJSON;

  inherited;
end;

class procedure TMyConst.AtualizarBairro(const novoBairro: string);
begin
  // Substituir os valores no JSON
 // FJSON := StringReplace(FJSON, '"bairro": ["Jardim Aquarius"]', '"bairro": ["' + novoBairro + '"]', []);
  JSONENVIO := StringReplace(FJSON, '%BAIRRO%', novoBairro, [rfReplaceAll]);
end;

class procedure TMyConst.AtualizarCEP(const novoCEP: string);
begin
  // Substituir os valores no JSON para o CEP
  JSONENVIO := StringReplace(FJSON, '%CEP%', novoCEP, [rfReplaceAll]);
end;

class procedure TMyConst.AtualizarMunicipio(const novoMunicipio: string);
begin
  // Substituir os valores no JSON
  JSONENVIO := StringReplace(FJSON, '%MUNICIPIO%', novoMunicipio, [rfReplaceAll]);
end;

class procedure TMyConst.AtualizarPagina(const novaPagina: string);
begin
  // Substituir os valores no JSON para a Page
  JSONENVIO := StringReplace(FJSON, '%PAGINA%', novaPagina, [rfReplaceAll]);
end;

class procedure TMyConst.AtualizarUF(const novaUF: string);
begin
  // Substituir os valores no JSON
  JSONENVIO := StringReplace(FJSON, '%UF%', novaUF, [rfReplaceAll]);
end;

class procedure TMyConst.AtualizaTudo(const novaUF: string;
                                      const novoMunicipio : string;
                                      const novoBairro: string;
                                      const novoCEP: string;
                                      const novaPagina: string;
                                      const somenteMei: string;
                                      const excluirMei: string;
                                      const comcontatotelefone: string;
                                      const somentefixo: string;
                                      const somentematriz:string;
                                      const somentefilial:string;
                                      const somentecelular:string;
                                      const comemail: string;
                                      const incluiratividadesecundaria:string);
var
  texto: string;
begin
  texto := FJSON;
  texto := StringReplace(texto, '%BAIRRO%', novoBairro, [rfReplaceAll]);  //campo obrigatório
  texto := StringReplace(texto, '%UF%', novaUF, [rfReplaceAll]);         //campo obrigatório
  texto := StringReplace(texto, '%MUNICIPIO%', novoMunicipio, [rfReplaceAll]); //campo obrigatório
  texto := StringReplace(texto, '%CEP%', novoCEP, [rfReplaceAll]);
  texto := StringReplace(texto, '%PAGINA%', novaPagina, [rfReplaceAll]);
  texto  := StringReplace(texto, '%SOMENTEMEI%', somenteMei, [rfReplaceAll]);
  texto  := StringReplace(texto, '%EXCLUIRMEI%', excluirMei, [rfReplaceAll]);
  texto  := StringReplace(texto, '%COMCONTATOTELEFONE%', comcontatotelefone, [rfReplaceAll]);
  texto := StringReplace(texto, '%SOMENTEFIXO%', somentefixo, [rfReplaceAll]); //campo obrigatório
  texto := StringReplace(texto, '%SOMENTEMATRIZ%', somentematriz, [rfReplaceAll]);
  texto := StringReplace(texto, '%SOMENTEFILIAL%', somentefilial, [rfReplaceAll]);
  texto  := StringReplace(texto, '%SOMENTECELULAR%', somentecelular, [rfReplaceAll]);
  texto  := StringReplace(texto, '%COMEMAIL%', comemail, [rfReplaceAll]);
  texto  := StringReplace(texto, '%INCLUIRATIVIDADESECUNDARIA%', incluiratividadesecundaria, [rfReplaceAll]);

  JSONENVIO := texto;
end;

end.
