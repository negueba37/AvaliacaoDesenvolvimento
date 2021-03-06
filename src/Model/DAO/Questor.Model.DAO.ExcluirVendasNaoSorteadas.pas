unit Questor.Model.DAO.ExcluirVendasNaoSorteadas;

interface

uses Questor.Model.DAO.Interfaces,
  Questor.Model.Services.Sorteio,
  Questor.Model.Components.Connections.Interfaces,
  Questor.Model.Components.Connections.FireDac, Data.DB;

type
  TModelDAOExcluirVendasNaoSorteadas = class(TInterfacedObject,iModelDAOServices)
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



constructor TModelDAOExcluirVendasNaoSorteadas.Create;
begin
  FConnection := TModelComponentsConnectionsFireDac.New;
end;

function TModelDAOExcluirVendasNaoSorteadas.DataSource(aValue:TDataSource): iModelDAOServices;
begin
  Result := Self;
  aValue.DataSet := FConnection.DataSet;
end;

function TModelDAOExcluirVendasNaoSorteadas.Delete: iModelDAOServices;
begin
  Result := Self;
  FConnection
  .Close
  .SQLClear
  .SQLAdd('EXECUTE PROCEDURE EXCLUSAO_VENDA;')
  .ExecSQL
end;

destructor TModelDAOExcluirVendasNaoSorteadas.Destroy;
begin

  inherited;
end;

function TModelDAOExcluirVendasNaoSorteadas.Get: iModelDAOServices;
begin
  Result := Self;
  FConnection
  .Close
  .SQLClear
  .SQLAdd('SELECT SKIP 15 VENDAS.* FROM VENDAS')
  .SQLAdd('LEFT JOIN CLIENTE ON CLIENTE.CODIGO = VENDAS.CODIGOCLIENTE')
  .SQLAdd('LEFT JOIN CARROS ON CARROS.CODIGO = VENDAS.CODIGOCARRO')
  .SQLAdd('WHERE SUBSTRING(CLIENTE.CPF FROM 1 FOR 1) <> 0')
  .SQLAdd('AND EXTRACT(YEAR FROM CARROS.DATALANCAMENTO) < 2021')
  .Open
end;

class function TModelDAOExcluirVendasNaoSorteadas.New : iModelDAOServices;
begin
  Result := Self.Create;
end;


end.

