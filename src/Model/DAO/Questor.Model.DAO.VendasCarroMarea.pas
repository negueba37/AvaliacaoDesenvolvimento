unit Questor.Model.DAO.VendasCarroMarea;

interface

uses Questor.Model.DAO.Interfaces,
  Questor.Model.Services.Sorteio,
  Questor.Model.Components.Connections.Interfaces,
  Questor.Model.Components.Connections.FireDac, Data.DB;

type
  TModelServicesVendasCarroMarea = class(TInterfacedObject,iModelDAOServices)
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



constructor TModelServicesVendasCarroMarea.Create;
begin
  FConnection := TModelComponentsConnectionsFireDac.New;
end;

function TModelServicesVendasCarroMarea.DataSource(aValue:TDataSource): iModelDAOServices;
begin
  Result := Self;
  aValue.DataSet := FConnection.DataSet;
end;

function TModelServicesVendasCarroMarea.Delete: iModelDAOServices;
begin

end;

destructor TModelServicesVendasCarroMarea.Destroy;
begin

  inherited;
end;

function TModelServicesVendasCarroMarea.Get: iModelDAOServices;
begin
  Result := Self;
  FConnection
  .Close
  .SQLClear
  .SQLAdd('SELECT COUNT(*) QT_VENDAS FROM VENDAS')
  .SQLAdd('LEFT JOIN CARROS ON CARROS.CODIGO = VENDAS.CODIGOCARRO')
  .SQLAdd('WHERE UPPER(CARROS.MODELO) = ''MAREA''')
  .Open
end;

class function TModelServicesVendasCarroMarea.New : iModelDAOServices;
begin
  Result := Self.Create;
end;


end.
