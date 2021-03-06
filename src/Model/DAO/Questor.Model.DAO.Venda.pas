unit Questor.Model.DAO.Venda;

interface

uses Questor.Model.DAO.Interfaces, Data.DB,
  Questor.Model.Components.Connections.FireDac,
  Questor.Model.Components.Connections.Interfaces, Questor.Model.Entities.Venda;

type
  TModelDAOVenda = class(TInterfacedObject,iModelDAOInterfaces<TModelEntitiesVenda>)
    private
    FEntity:TModelEntitiesVenda;
    FConnection : iModelComponentsConnections;
    public
    constructor Create();
    destructor Destroy; override;
    class function New: iModelDAOInterfaces<TModelEntitiesVenda>;
    function DataSource(AValue: TDataSource): iModelDAOInterfaces<TModelEntitiesVenda>;
    function Delete: iModelDAOInterfaces<TModelEntitiesVenda>;
    function Get: iModelDAOInterfaces<TModelEntitiesVenda>;
    function Insert: iModelDAOInterfaces<TModelEntitiesVenda>;
    function Update: iModelDAOInterfaces<TModelEntitiesVenda>;
    function This: TModelEntitiesVenda;

  end;

implementation

{ TModelDAOVenda }

constructor TModelDAOVenda.Create();
begin
  FConnection := TModelComponentsConnectionsFireDac.New;
  FEntity := TModelEntitiesVenda.Create(self);
end;

function TModelDAOVenda.DataSource(AValue: TDataSource): iModelDAOInterfaces<TModelEntitiesVenda>;
begin
  Result := Self;
  AValue.DataSet := FConnection.DataSet;
end;

function TModelDAOVenda.Delete: iModelDAOInterfaces<TModelEntitiesVenda>;
begin
  Result := Self;
  FConnection.Close
  .SQLClear
  .SQLAdd('DELETE FROM VENDAS')
  .SQLAdd('WHERE CODIGO = :CODIGO')
  .ParamByName('CODIGO',FEntity.Codigo)
  .ExecSQL;
end;

destructor TModelDAOVenda.Destroy;
begin
  FEntity.Free;
  inherited;
end;

function TModelDAOVenda.Get: iModelDAOInterfaces<TModelEntitiesVenda>;
begin
  Result := Self;
  FConnection.Close
  .SQLClear
  .SQLAdd('SELECT VENDAS.CODIGO,CLIENTE.CODIGO PESSOA, CLIENTE.CPF, VENDAS.CODIGOCARRO CARRO,CARROS.MODELO,VENDAS.DATAVENDA FROM VENDAS')
  .SQLAdd('LEFT JOIN CLIENTE ON CLIENTE.CODIGO = VENDAS.CODIGOCLIENTE')
  .SQLAdd('LEFT JOIN CARROS ON CARROS.CODIGO = VENDAS.CODIGOCLIENTE')
  .Open;
end;

function TModelDAOVenda.Insert: iModelDAOInterfaces<TModelEntitiesVenda>;
begin
  Result := Self;
  FConnection.Close
  .SQLClear
  .SQLAdd('INSERT INTO VENDAS (CODIGO,CODIGOCLIENTE,CODIGOCARRO,DATAVENDA)')
  .SQLAdd('VALUES (:CODIGO,:CODIGOCLIENTE,:CODIGOCARRO,:DATAVENDA)')
  .ParamByName('CODIGO',FEntity.Codigo)
  .ParamByName('CODIGOCLIENTE',FEntity.CodigoCliente)
  .ParamByName('CODIGOCARRO',FEntity.CodigoCarro)
  .ParamByName('DATAVENDA',FEntity.DataVendaSQL)
  .ExecSQL;
end;

class function TModelDAOVenda.New: iModelDAOInterfaces<TModelEntitiesVenda>;
begin
  Result := Self.Create();
end;

function TModelDAOVenda.This: TModelEntitiesVenda;
begin
  Result := FEntity;
end;

function TModelDAOVenda.Update: iModelDAOInterfaces<TModelEntitiesVenda>;
begin
  Result := Self;
  FConnection.Close
  .SQLClear
  .SQLAdd('UPDATE VENDAS SET CODIGOCLIENTE = :CODIGOCLIENTE,')
  .SQLAdd('CODIGOCARRO = :CODIGOCARRO')
  .SQLAdd('WHERE CODIGO = :CODIGO')
  .ParamByName('CODIGO',FEntity.Codigo)
  .ParamByName('CODIGOCLIENTE',FEntity.CodigoCliente)
  .ParamByName('CODIGOCARRO',FEntity.CodigoCarro)
  .ExecSQL;
end;

end.
