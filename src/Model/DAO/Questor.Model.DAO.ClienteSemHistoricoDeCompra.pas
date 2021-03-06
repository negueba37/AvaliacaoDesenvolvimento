unit Questor.Model.DAO.ClienteSemHistoricoDeCompra;

interface

uses Questor.Model.DAO.Interfaces,
  Questor.Model.Services.Sorteio,
  Questor.Model.Components.Connections.Interfaces,
  Questor.Model.Components.Connections.FireDac, Data.DB;

type
  TModelDAOClienteSemHistoricoDeCompra = class(TInterfacedObject,iModelDAOServices)
  private
    FConnection : iModelComponentsConnections;
  public
    constructor Create();
    destructor Destroy; override;
    class function New: iModelDAOServices;
    function DataSource(aValue:TDataSource): iModelDAOServices;
    function Delete:iModelDAOServices;
    function Get: iModelDAOServices;

  end;

implementation



constructor TModelDAOClienteSemHistoricoDeCompra.Create;
begin
  FConnection := TModelComponentsConnectionsFireDac.New;
end;

function TModelDAOClienteSemHistoricoDeCompra.DataSource(aValue:TDataSource): iModelDAOServices;
begin
  Result := Self;
  aValue.DataSet := FConnection.DataSet;
end;

function TModelDAOClienteSemHistoricoDeCompra.Delete: iModelDAOServices;
begin

end;

destructor TModelDAOClienteSemHistoricoDeCompra.Destroy;
begin

  inherited;
end;

function TModelDAOClienteSemHistoricoDeCompra.Get: iModelDAOServices;
begin
  Result := Self;
  FConnection
  .Close
  .SQLClear
  .SQLAdd('SELECT COUNT(*) QT_CLIENTES FROM CLIENTE')
  .SQLAdd('WHERE CLIENTE.CODIGO NOT IN (')
  .SQLAdd('SELECT DISTINCT(CLIENTE.CODIGO) FROM VENDAS')
  .SQLAdd('LEFT JOIN CLIENTE ON CLIENTE.CODIGO = VENDAS.CODIGOCLIENTE)')
  .Open
end;

class function TModelDAOClienteSemHistoricoDeCompra.New : iModelDAOServices;
begin
  Result := Self.Create;
end;


end.
