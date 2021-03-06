unit Questor.Model.Entities.Cliente;

interface

uses Questor.Model.DAO.Interfaces, System.SysUtils;

type
  TModelEntitiesCliente = class
    private
    [weak]
    FDAO : iModelDAOInterfaces<TModelEntitiesCliente>;
    FCodigo:Integer;
    FCPF:string;
    public
    constructor Create( aParent:iModelDAOInterfaces<TModelEntitiesCliente>);
    destructor Destroy;override;
    function Codigo:Integer;overload;
    function Codigo(aValue:Integer) : TModelEntitiesCliente;overload;
    function CPF:string;overload;
    function CPF(aValue:string) : TModelEntitiesCliente;overload;
    function &End : iModelDAOInterfaces<TModelEntitiesCliente>;

  end;

implementation

{ TModelEntitiesCliente }

function TModelEntitiesCliente.Codigo: Integer;
begin
  Result := FCodigo;
end;

function TModelEntitiesCliente.&End: iModelDAOInterfaces<TModelEntitiesCliente>;
begin
  Result := FDAO;
end;

function TModelEntitiesCliente.Codigo(aValue: Integer): TModelEntitiesCliente;
begin
  Result := Self;
  if (aValue <= 0) then
    raise Exception.Create('C?digo do cliente n?o informado !');
  FCodigo := aValue;
end;

function TModelEntitiesCliente.CPF: string;
begin
  Result := FCPF;
end;

function TModelEntitiesCliente.CPF(aValue: string): TModelEntitiesCliente;
begin
  Result := Self;
  if (Trim(aValue) = '') then
    raise Exception.Create('CPF n?o informado !');

  if (Length(aValue) > 11) then
    raise Exception.Create('CPF deve conter apenas 11 digitos !');

  FCPF := aValue;
end;

constructor TModelEntitiesCliente.Create( aParent:iModelDAOInterfaces<TModelEntitiesCliente>);
begin
  FDAO := aParent;
end;

destructor TModelEntitiesCliente.Destroy;
begin

  inherited;
end;

end.
