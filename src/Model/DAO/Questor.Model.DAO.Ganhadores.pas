unit Questor.Model.DAO.Ganhadores;

interface

uses Questor.Model.DAO.Interfaces,
  Questor.Model.Services.Sorteio,
  Questor.Model.Components.Connections.Interfaces,
  Questor.Model.Components.Connections.FireDac, Data.DB;

type
  TModelServicesGanhadores = class(TInterfacedObject,iModelDAOServices)
  private
    FEntity:TModelServicesSorteio;
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

{ TModelServicesGanhadores }

constructor TModelServicesGanhadores.Create;
begin
  FEntity := TModelServicesSorteio.Create();
  FConnection := TModelComponentsConnectionsFireDac.New;
end;

function TModelServicesGanhadores.DataSource(aValue:TDataSource): iModelDAOServices;
begin
  Result := Self;
  aValue.DataSet := FConnection.DataSet;
end;

function TModelServicesGanhadores.Delete: iModelDAOServices;
begin

end;

destructor TModelServicesGanhadores.Destroy;
begin
  FEntity.Destroy;
  inherited;
end;

function TModelServicesGanhadores.Get: iModelDAOServices;
begin
  Result := Self;
  FConnection
  .Close
  .SQLClear
  .SQLAdd('SELECT FIRST 15 CLIENTE.CODIGO,CLIENTE.CPF FROM VENDAS')
  .SQLAdd('LEFT JOIN CLIENTE ON CLIENTE.CODIGO = VENDAS.CODIGOCLIENTE')
  .SQLAdd('LEFT JOIN CARROS ON VENDAS.CODIGOCARRO = CARROS.CODIGO')
  .SQLAdd('WHERE SUBSTRING(CLIENTE.CPF FROM 1 FOR 1) = 0')
  .SQLAdd('AND EXTRACT(YEAR FROM CARROS.DATALANCAMENTO) = 2021')
  .SQLAdd('AND CLIENTE.CODIGO NOT IN  (')
  .SQLAdd('    SELECT CODIGO FROM (')
  .SQLAdd('    SELECT CLIENTE.CODIGO,COUNT(*) QT_COMPRAS FROM VENDAS')
  .SQLAdd('    LEFT JOIN CLIENTE ON CLIENTE.CODIGO = VENDAS.CODIGOCLIENTE')
  .SQLAdd('    LEFT JOIN CARROS ON CARROS.CODIGO = VENDAS.CODIGOCARRO')
  .SQLAdd('    WHERE UPPER(CARROS.MODELO) = ''MAREA''')
  .SQLAdd('    GROUP BY CLIENTE.CODIGO )')
  .SQLAdd('    WHERE QT_COMPRAS = 2')
  .SQLAdd('    )')
  .SQLAdd('GROUP BY CLIENTE.CODIGO,CLIENTE.CPF')
  .Open
end;

class function TModelServicesGanhadores.New : iModelDAOServices;
begin
  Result := Self.Create;
end;


end.
