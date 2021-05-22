unit Questor.Model.Services.Sorteio;

interface

uses Questor.Model.DAO.Interfaces;
  type
    TModelServicesSorteio = class
      private
      [weak]
      FDAO : iModelDAOServices;
      FCodigoCarro:Integer;
      FCodigoCliente:Integer;
      FCodigoVenda:Integer;
      public
      constructor Create();
      destructor Destroy;override;
      function CodigoVenda:integer;overload;
      function CodigoVenda(aValue:Integer) : TModelServicesSorteio;overload;
      function CodigoCarro:Integer;overload;
      function CodigoCarro(aValue:Integer) : TModelServicesSorteio;overload;
      function CodigoCliente:Integer;overload;
      function CodigoCliente(aValue:Integer) : TModelServicesSorteio;overload;

    end;
implementation

{ TModelServicesSorteio }

function TModelServicesSorteio.CodigoCarro: Integer;
begin
  Result := FCodigoCarro;
end;


function TModelServicesSorteio.CodigoCarro(
  aValue: Integer): TModelServicesSorteio;
begin
  Result := Self;
  FCodigoCarro := aValue;
end;

function TModelServicesSorteio.CodigoCliente(
  aValue: Integer): TModelServicesSorteio;
begin
  Result := Self;
  FCodigoCliente := aValue;
end;

function TModelServicesSorteio.CodigoCliente: Integer;
begin
  Result := FCodigoCliente;
end;

function TModelServicesSorteio.CodigoVenda: integer;
begin
  Result := FCodigoVenda;
end;

function TModelServicesSorteio.CodigoVenda(
  aValue: Integer): TModelServicesSorteio;
begin
  Result := Self;
  FCodigoVenda := aValue;
end;

constructor TModelServicesSorteio.Create();
begin
  //FDAO := aParent;
end;

destructor TModelServicesSorteio.Destroy;
begin

  inherited;
end;

end.
