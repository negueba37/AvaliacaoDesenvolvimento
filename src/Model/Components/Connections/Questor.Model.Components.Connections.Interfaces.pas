unit Questor.Model.Components.Connections.Interfaces;

interface
uses
  Data.DB;
  type iModelComponentsConnections = interface
    ['{B3F46183-255F-4BF1-B035-4BA8C69252D9}']
    function Close:iModelComponentsConnections;
    function DataSet:TDataSet;
    function ExecSQL:iModelComponentsConnections;
    function Open:iModelComponentsConnections;
    function ParamByName(aParam:string;aValue:Variant):iModelComponentsConnections;
    function SQLAdd(aValue:string):iModelComponentsConnections;
    function SQLClear:iModelComponentsConnections;
  end;

implementation

end.
