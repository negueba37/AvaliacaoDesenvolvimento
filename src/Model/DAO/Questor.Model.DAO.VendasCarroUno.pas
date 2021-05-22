unit Questor.Model.DAO.VendasCarroUno;

interface

uses Questor.Model.DAO.Interfaces,
  Questor.Model.Services.Sorteio,
  Questor.Model.Components.Connections.Interfaces,
  Questor.Model.Components.Connections.FireDac, Data.DB;

type
  TModelServicesVendasCarroUno = class(TInterfacedObject,iModelDAOServices)
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



constructor TModelServicesVendasCarroUno.Create;
begin
  FConnection := TModelComponentsConnectionsFireDac.New;
end;

function TModelServicesVendasCarroUno.DataSource(aValue:TDataSource): iModelDAOServices;
begin
  Result := Self;
  aValue.DataSet := FConnection.DataSet;
end;

function TModelServicesVendasCarroUno.Delete: iModelDAOServices;
begin

end;

destructor TModelServicesVendasCarroUno.Destroy;
begin

  inherited;
end;

function TModelServicesVendasCarroUno.Get: iModelDAOServices;
begin
  Result := Self;
  FConnection
  .Close
  .SQLClear
  .SQLAdd('SELECT CLIENTE.CODIGO,CLIENTE.CPF,COUNT (*) QT_VENDAS  FROM VENDAS')
  .SQLAdd('LEFT JOIN CARROS ON CARROS.CODIGO = VENDAS.CODIGOCARRO')
  .SQLAdd('LEFT JOIN CLIENTE ON CLIENTE.CODIGO = VENDAS.CODIGOCLIENTE')
  .SQLAdd('WHERE UPPER(CARROS.MODELO) = ''UNO''')
  .SQLAdd('GROUP BY CLIENTE.CODIGO, CLIENTE.CPF')
  .Open
end;

class function TModelServicesVendasCarroUno.New : iModelDAOServices;
begin
  Result := Self.Create;
end;


end.
