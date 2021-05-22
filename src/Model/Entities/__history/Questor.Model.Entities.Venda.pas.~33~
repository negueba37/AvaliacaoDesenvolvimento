unit Questor.Model.Entities.Venda;

interface

uses
  System.SysUtils,
  Questor.Model.DAO.Interfaces;


  type
    TModelEntitiesVenda = class
      private
      [weak]
      FDao:iModelDAOInterfaces<TModelEntitiesVenda>;
      FCodigo:integer;
      FCodigoCliente:integer;
      FCodigoCarro:integer;
      FDataVenda:TDate;
    function DataLancamento: TDate;
      public
      constructor Create(aParent : iModelDAOInterfaces<TModelEntitiesVenda>);
      destructor Destroy;Override;
      function Codigo:Integer;overload;
      function Codigo(aValue:Integer) : TModelEntitiesVenda;overload;
      function CodigoCliente:Integer;overload;
      function CodigoCliente(aValue:Integer) : TModelEntitiesVenda;overload;
      function CodigoCarro:Integer;overload;
      function CodigoCarro(aValue:Integer) : TModelEntitiesVenda;overload;
      function DataVendaSQL : string;
      function DataVenda:TDate;overload;
      function DataVenda(aValue:TDate) : TModelEntitiesVenda;overload;
      function &End: iModelDAOInterfaces<TModelEntitiesVenda>;

    end;

implementation

{ TModelEntitiesVenda }

function TModelEntitiesVenda.&End: iModelDAOInterfaces<TModelEntitiesVenda>;
begin
  Result := FDao;
end;

function TModelEntitiesVenda.Codigo(aValue: Integer): TModelEntitiesVenda;
begin
  Result := Self;
  FCodigo := aValue;
end;

function TModelEntitiesVenda.CodigoCarro: Integer;
begin
  Result := FCodigoCarro;
end;

function TModelEntitiesVenda.CodigoCarro(aValue: Integer): TModelEntitiesVenda;
begin
  Result := Self;
  FCodigoCarro := aValue;
end;

function TModelEntitiesVenda.CodigoCliente: Integer;
begin
  Result := FCodigoCliente;
end;

function TModelEntitiesVenda.CodigoCliente(
  aValue: Integer): TModelEntitiesVenda;
begin
  Result := Self;
  FCodigoCliente := aValue;
end;

function TModelEntitiesVenda.Codigo: Integer;
begin
  Result := FCodigo;
end;

constructor TModelEntitiesVenda.Create(aParent : iModelDAOInterfaces<TModelEntitiesVenda>);
begin
  FDao := aParent;
end;

function TModelEntitiesVenda.DataLancamento: TDate;
begin
  Result := FDataVenda;
end;


function TModelEntitiesVenda.DataVenda: TDate;
begin
  Result := FDataVenda
end;

function TModelEntitiesVenda.DataVenda(aValue: TDate): TModelEntitiesVenda;
begin
  Result := Self;
  FDataVenda := aValue;
end;

function TModelEntitiesVenda.DataVendaSQL: string;
begin
  Result := StringReplace(DateToStr(FDataVenda),'/','.',[rfReplaceAll]);
end;

destructor TModelEntitiesVenda.Destroy;
begin

  inherited;
end;

end.
