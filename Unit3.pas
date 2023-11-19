unit Unit3;

interface

type
  TMunicipio = class
    private
    FMesoRegiaoId: Integer;
      FUFNome: string;
      FUFRegiaoNome: string;
      FRegiaoImediataId: Integer;
      FRegiaoIntermediariaId: Integer;
      FMicroRegiaoNome: string;
      FMesoRegiaoNome: string;
      FId: Integer;
      FRegiaoImediataNome: string;
      FRegiaoIntermediariaNome: string;
      FMicrRegiaoId: Integer;
      FUFId: Integer;
      FUFRegiaoId: Integer;
      FNome: string;
      FUFSigla: string;
      procedure SetId(const Value: Integer);
      procedure SetMesoRegiaoId(const Value: Integer);
      procedure SetMesoRegiaoNome(const Value: string);
      procedure SetMicroRegiaoNome(const Value: string);
      procedure SetMicrRegiaoId(const Value: Integer);
      procedure SetNome(const Value: string);
      procedure SetRegiaoImediataId(const Value: Integer);
      procedure SetRegiaoImediataNome(const Value: string);
      procedure SetRegiaoIntermediariaId(const Value: Integer);
      procedure SetRegiaoIntermediariaNome(const Value: string);
      procedure SetUFId(const Value: Integer);
      procedure SetUFNome(const Value: string);
      procedure SetUFRegiaoId(const Value: Integer);
      procedure SetUFRegiaoNome(const Value: string);
      procedure SetUFSigla(const Value: string);
    public
      property Id: integer read FId write SetId;
      property Nome: string read FNome write SetNome;
      property MicrRegiaoId: Integer read FMicrRegiaoId write SetMicrRegiaoId;
      property MicroRegiaoNome: string read FMicroRegiaoNome write SetMicroRegiaoNome;
      property MesoRegiaoId: Integer read FMesoRegiaoId write SetMesoRegiaoId;
      property MesoRegiaoNome: string read FMesoRegiaoNome write SetMesoRegiaoNome;
      property UFId: Integer read FUFId write SetUFId;
      property UFNome: string read FUFNome write SetUFNome;
      property UFSigla: string read FUFSigla write SetUFSigla;
      property UFRegiaoId: Integer read FUFRegiaoId write SetUFRegiaoId;
      property UFRegiaoNome: string read FUFRegiaoNome write SetUFRegiaoNome;
      property RegiaoImediataId: Integer read FRegiaoImediataId write SetRegiaoImediataId;
      property RegiaoImediataNome: string read FRegiaoImediataNome write SetRegiaoImediataNome;
      property RegiaoIntermediariaId: Integer read FRegiaoIntermediariaId write SetRegiaoIntermediariaId;
      property RegiaoIntermediariaNome: string read FRegiaoIntermediariaNome write SetRegiaoIntermediariaNome;
  end;

implementation

{ TMunicipio }

procedure TMunicipio.SetId(const Value: integer);
begin
  FId := Value;
end;

procedure TMunicipio.SetMesoRegiaoId(const Value: Integer);
begin
  FMesoRegiaoId := Value;
end;

procedure TMunicipio.SetMesoRegiaoNome(const Value: string);
begin
  FMesoRegiaoNome := Value;
end;

procedure TMunicipio.SetMicroRegiaoNome(const Value: string);
begin
  FMicroRegiaoNome := Value;
end;

procedure TMunicipio.SetMicrRegiaoId(const Value: Integer);
begin
  FMicrRegiaoId := Value;
end;

procedure TMunicipio.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TMunicipio.SetRegiaoImediataId(const Value: Integer);
begin
  FRegiaoImediataId := Value;
end;

procedure TMunicipio.SetRegiaoImediataNome(const Value: string);
begin
  FRegiaoImediataNome := Value;
end;

procedure TMunicipio.SetRegiaoIntermediariaId(const Value: Integer);
begin
  FRegiaoIntermediariaId := Value;
end;

procedure TMunicipio.SetRegiaoIntermediariaNome(const Value: string);
begin
  FRegiaoIntermediariaNome := Value;
end;

procedure TMunicipio.SetUFId(const Value: Integer);
begin
  FUFId := Value;
end;

procedure TMunicipio.SetUFNome(const Value: string);
begin
  FUFNome := Value;
end;

procedure TMunicipio.SetUFRegiaoId(const Value: Integer);
begin
  FUFRegiaoId := Value;
end;

procedure TMunicipio.SetUFRegiaoNome(const Value: string);
begin
  FUFRegiaoNome := Value;
end;

procedure TMunicipio.SetUFSigla(const Value: string);
begin
  FUFSigla := Value;
end;

end.
