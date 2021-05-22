unit Questor.Model.Entities.Carro;

interface

uses
  Questor.Model.DAO.Interfaces, System.SysUtils;

type
  TModelEntitiesCarro = class
    private
    [weak]
    FParent:iModelDAOInterfaces<TModelEntitiesCarro>;
    FCodigo:Integer;
    FModelo:string;
    FDataLancamento:TDate;
    public
    constructor Create(aParent:iModelDAOInterfaces<TModelEntitiesCarro>);
    destructor Destroy;Override;
    function Codigo : Integer;overload;
    function Codigo(aValue : Integer) : TModelEntitiesCarro;overload;
    function Modelo:string;overload;
    function Modelo(aValue : string) : TModelEntitiesCarro;overload;
    function DataLancamento:TDate;overload;
    function DataLancamentoSQL:string;
    function DataLancamento(aValue : TDate) : TModelEntitiesCarro;overload;
    function &End:iModelDAOInterfaces<TModelEntitiesCarro>;
  end;

implementation

{ TModelEntitiesCarro }

function TModelEntitiesCarro.Codigo: Integer;
begin
  Result := FCodigo;
end;

function TModelEntitiesCarro.&End: iModelDAOInterfaces<TModelEntitiesCarro>;
begin
  Result := FParent;
end;

function TModelEntitiesCarro.Codigo(aValue: Integer): TModelEntitiesCarro;
begin
  Result := Self;
  FCodigo := aValue;
end;

constructor TModelEntitiesCarro.Create(
  aParent: iModelDAOInterfaces<TModelEntitiesCarro>);
begin
  FParent := aParent;
end;

function TModelEntitiesCarro.DataLancamento(aValue: TDate): TModelEntitiesCarro;
begin
  Result := Self;
  FDataLancamento := aValue;
end;

function TModelEntitiesCarro.DataLancamentoSQL: string;
begin
  Result := StringReplace(DateToStr(FDataLancamento),'/','.',[rfReplaceAll]);
end;

destructor TModelEntitiesCarro.Destroy;
begin

  inherited;
end;

function TModelEntitiesCarro.DataLancamento: TDate;
begin
  Result := FDataLancamento;
end;

function TModelEntitiesCarro.Modelo: string;
begin
  Result := FModelo;
end;

function TModelEntitiesCarro.Modelo(aValue: string): TModelEntitiesCarro;
begin
  Result := Self;
  FModelo := aValue;
end;

end.