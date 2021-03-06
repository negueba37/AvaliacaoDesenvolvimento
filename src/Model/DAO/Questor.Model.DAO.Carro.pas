unit Questor.Model.DAO.Carro;

interface

uses
  Questor.Model.DAO.Interfaces,
  Questor.Model.Components.Connections.FireDac,
  Questor.Model.Components.Connections.Interfaces,
  Questor.Model.Entities.Carro, Data.DB;

type
  TModelDAOCarro = class(TInterfacedObject, iModelDAOInterfaces<TModelEntitiesCarro>)
  public
    FConnection:iModelComponentsConnections;
    FEntity:TModelEntitiesCarro;
    constructor Create();
    destructor Destroy; override;
    class function New: iModelDAOInterfaces<TModelEntitiesCarro>;
    function DataSource(AValue:TDataSource):iModelDAOInterfaces<TModelEntitiesCarro>;
    function Delete : iModelDAOInterfaces<TModelEntitiesCarro>;
    function Get: iModelDAOInterfaces<TModelEntitiesCarro>;
    function Insert: iModelDAOInterfaces<TModelEntitiesCarro>;
    function Update : iModelDAOInterfaces<TModelEntitiesCarro>;
    function This : TModelEntitiesCarro;
  end;

implementation

{ TModelDAOCarro }


constructor TModelDAOCarro.Create;
begin
  FConnection := TModelComponentsConnectionsFireDac.New;
  FEntity := TModelEntitiesCarro.Create(self);
end;

function TModelDAOCarro.DataSource(
  AValue: TDataSource): iModelDAOInterfaces<TModelEntitiesCarro>;
begin
  Result := Self;
  AValue.DataSet := FConnection.DataSet
end;

function TModelDAOCarro.Delete: iModelDAOInterfaces<TModelEntitiesCarro>;
begin
  Result := Self;
  FConnection
  .Close
  .SQLClear
  .SQLAdd('DELETE FROM CARROS')
  .SQLAdd('WHERE CODIGO = :CODIGO')
  .ParamByName('CODIGO',FEntity.Codigo)
  .ExecSQL;
end;

destructor TModelDAOCarro.Destroy;
begin
  FEntity.Free;
  inherited;
end;

function TModelDAOCarro.Get: iModelDAOInterfaces<TModelEntitiesCarro>;
begin
  Result := Self;
  FConnection
  .Close
  .SQLClear
  .SQLAdd('SELECT * FROM CARROS')
  .Open;
end;

function TModelDAOCarro.Insert: iModelDAOInterfaces<TModelEntitiesCarro>;
begin
  Result := Self;
  FConnection.Close
  .SQLClear
  .SQLAdd('INSERT INTO CARROS (CODIGO,MODELO,DATALANCAMENTO)')
  .SQLAdd('VALUES (:CODIGO,:MODELO,:DATALANCAMENTO)')
  .ParamByName('CODIGO',FEntity.Codigo)
  .ParamByName('MODELO',FEntity.Modelo)
  .ParamByName('DATALANCAMENTO',FEntity.DataLancamentoSQL)
  .ExecSQL;
end;

class function TModelDAOCarro.New: iModelDAOInterfaces<TModelEntitiesCarro>;
begin
  Result := Self.Create;
end;

function TModelDAOCarro.This: TModelEntitiesCarro;
begin
  Result := FEntity;
end;

function TModelDAOCarro.Update: iModelDAOInterfaces<TModelEntitiesCarro>;
begin
  Result := Self;
  FConnection
  .Close
  .SQLClear
  .SQLAdd('UPDATE CARROS')
  .SQLAdd('SET MODELO = :MODELO,')
  .SQLAdd('DATALANCAMENTO = :DATALANCAMENTO')
  .SQLAdd('WHERE CODIGO = :CODIGO')
  .ParamByName('CODIGO',FEntity.Codigo)
  .ParamByName('MODELO',FEntity.Modelo)
  .ParamByName('DATALANCAMENTO',FEntity.DataLancamentoSQL)
  .ExecSQL;
end;

end.
