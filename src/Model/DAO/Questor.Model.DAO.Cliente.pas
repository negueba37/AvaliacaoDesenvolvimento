unit Questor.Model.DAO.Cliente;

interface

uses Questor.Model.DAO.Interfaces, Questor.Model.Entities.Cliente, Data.DB,
  Questor.Model.Components.Connections.Interfaces,
  Questor.Model.Components.Connections.FireDac;

  type TModelDAOCliente = class(TInterfacedObject,iModelDAOInterfaces<TModelEntitiesCliente>)
    private
    FEntity : TModelEntitiesCliente;
    FConnection : iModelComponentsConnections;
    public
    constructor Create();
    destructor Destroy;override;
    class function New : iModelDAOInterfaces<TModelEntitiesCliente>;
    function DataSource(AValue:TDataSource):iModelDAOInterfaces<TModelEntitiesCliente>;
    function Delete : iModelDAOInterfaces<TModelEntitiesCliente>;
    function Get : iModelDAOInterfaces<TModelEntitiesCliente>;
    function Insert : iModelDAOInterfaces<TModelEntitiesCliente>;
    function Update : iModelDAOInterfaces<TModelEntitiesCliente>;
    function This : TModelEntitiesCliente;

  end;

implementation

{ TModelDAOPessoa }

constructor TModelDAOCliente.Create;
begin
  FEntity := TModelEntitiesCliente.Create(Self);
  FConnection := TModelComponentsConnectionsFireDac.New;
end;

function TModelDAOCliente.DataSource(
  AValue: TDataSource): iModelDAOInterfaces<TModelEntitiesCliente>;
begin
  Result := Self;
  AValue.DataSet := FConnection.DataSet;
end;

function TModelDAOCliente.Delete: iModelDAOInterfaces<TModelEntitiesCliente>;
begin
  Result := Self;
end;

destructor TModelDAOCliente.Destroy;
begin
  FEntity.DisposeOf;
  inherited;
end;

function TModelDAOCliente.Get: iModelDAOInterfaces<TModelEntitiesCliente>;
begin
  Result := Self;
  FConnection.Close
  .SQLClear
  .SQLAdd('SELECT * FROM CLIENTE')
  .Open;
end;

function TModelDAOCliente.Insert: iModelDAOInterfaces<TModelEntitiesCliente>;
begin
  Result := Self;
  FConnection.Close
  .SQLClear
  .SQLAdd('INSERT INTO CLIENTE (CODIGO,CPF)')
  .SQLAdd('VALUES (:CODIGO,:CPF)')
  .ParamByName('CODIGO',FEntity.Codigo)
  .ParamByName('CPF',FEntity.CPF)
  .ExecSQL;
end;

class function TModelDAOCliente.New: iModelDAOInterfaces<TModelEntitiesCliente>;
begin
  Result := Self.Create;
end;

function TModelDAOCliente.This: TModelEntitiesCliente;
begin
  Result := FEntity;
end;

function TModelDAOCliente.Update: iModelDAOInterfaces<TModelEntitiesCliente>;
begin
  Result := Self;
  FConnection.Close
  .SQLClear
  .SQLAdd('UPDATE CLIENTE SET CPF = :CPF')
  .SQLAdd('WHERE CODIGO = :CODIGO')
  .ParamByName('CODIGO',FEntity.Codigo)
  .ParamByName('CPF',FEntity.CPF)
  .ExecSQL;
end;

end.
