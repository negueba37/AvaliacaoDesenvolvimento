unit Questor.Model.Components.Connections.FireDac;

interface

uses
  Questor.Model.Components.Connections.Interfaces,
  Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.FB,
  FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

  type
  TModelComponentsConnectionsFireDac = class(TInterfacedObject,iModelComponentsConnections)
    private
    FQuery : TFDQuery;
    FConnection : TFDConnection;
    public
    constructor Create();
    destructor Destroy;override;
    class function New :iModelComponentsConnections;
    function Close:iModelComponentsConnections;
    function DataSet:TDataSet;
    function ExecSQL:iModelComponentsConnections;
    function Open:iModelComponentsConnections;
    function ParamByName(aParam:string;aValue:Variant):iModelComponentsConnections;
    function SQLAdd(aValue:string):iModelComponentsConnections;
    function SQLClear:iModelComponentsConnections;
  end;
implementation

{ TModelComponentsConnectionsFireDac }

function TModelComponentsConnectionsFireDac.Close: iModelComponentsConnections;
begin
  Result := Self;
  FQuery.Close;
end;

constructor TModelComponentsConnectionsFireDac.Create;
begin
  FConnection                 := TFDConnection.Create(nil);
  FConnection.Connected       := False;
  FConnection.Params.DriverID := 'FB';
  FConnection.LoginPrompt     := False;
  FConnection.Params.Database := '';
  FConnection.Params.UserName := '';
  FConnection.Params.Password := '';
  FConnection.Connected       := True;

  FQuery            := TFDQuery.Create(nil);
  FQuery.Connection := FConnection;
end;

function TModelComponentsConnectionsFireDac.DataSet: TDataSet;
begin
  Result := FQuery;
end;

destructor TModelComponentsConnectionsFireDac.Destroy;
begin
  FConnection.DisposeOf;
  FQuery.DisposeOf;
  inherited;
end;

function TModelComponentsConnectionsFireDac.ExecSQL: iModelComponentsConnections;
begin
  Result := Self;
  FQuery.ExecSQL;
end;

class function TModelComponentsConnectionsFireDac.New: iModelComponentsConnections;
begin
  Result := Self.Create;
end;

function TModelComponentsConnectionsFireDac.Open: iModelComponentsConnections;
begin
  Result := Self;
  FQuery.Open();
end;

function TModelComponentsConnectionsFireDac.ParamByName(aParam: string;
  aValue: Variant): iModelComponentsConnections;
begin
  Result := Self;
  FQuery.ParamByName(aParam).Value := aValue;
end;

function TModelComponentsConnectionsFireDac.SQLAdd(
  aValue: string): iModelComponentsConnections;
begin
  Result := Self;
  FQuery.SQL.Add(aValue);
end;

function TModelComponentsConnectionsFireDac.SQLClear: iModelComponentsConnections;
begin
  Result := Self;
  FQuery.SQL.Clear;
end;

end.
