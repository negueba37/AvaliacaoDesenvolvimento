unit Questor.View.Venda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Questor.View.Base, Data.DB,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Questor.Model.DAO.Interfaces, Questor.Model.Entities.Venda,
  Questor.Model.DAO.Venda, Questor.Model.Components.Helper.Edit, Vcl.ComCtrls;

type
  TFQuestorViewVenda = class(TFQuestorViewBase)
    Label3: TLabel;
    edCodigo: TEdit;
    Label2: TLabel;
    edPessoa: TEdit;
    edCarro: TEdit;
    Label1: TLabel;
    edDtVenda: TDateTimePicker;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure dbgCadastroDblClick(Sender: TObject);
    procedure btDeletarClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FController : iModelDAOInterfaces<TModelEntitiesVenda>;
  public
    { Public declarations }
  end;

var
  FQuestorViewVenda: TFQuestorViewVenda;

implementation

{$R *.dfm}

procedure TFQuestorViewVenda.btDeletarClick(Sender: TObject);
begin
  inherited;
  FController.This
  .Codigo(edCodigo.ToInteger)
  .&End
  .Delete.Get;
end;

procedure TFQuestorViewVenda.btEditarClick(Sender: TObject);
begin
  inherited;
  FController.This
  .Codigo(edCodigo.ToInteger)
  .CodigoCliente(edPessoa.ToInteger)
  .CodigoCarro(edCarro.ToInteger)
  .DataVenda(edDtVenda.Date)
  .&End
  .Update.Get;

end;

procedure TFQuestorViewVenda.btIncluirClick(Sender: TObject);
begin
  inherited;
  FController.This
  .Codigo(edCodigo.ToInteger)
  .CodigoCliente(edPessoa.ToInteger)
  .CodigoCarro(edCarro.ToInteger)
  .DataVenda(edDtVenda.Date)
  .&End
  .Insert.Get;
end;

procedure TFQuestorViewVenda.dbgCadastroDblClick(Sender: TObject);
begin
  inherited;
  if(dsCadastro.DataSet.RecordCount > 0)then
  begin
    edCodigo.Text := dsCadastro.DataSet.FieldByName('CODIGO').AsString;
    edPessoa.Text := dsCadastro.DataSet.FieldByName('PESSOA').AsString;
    edCarro.Text  := dsCadastro.DataSet.FieldByName('CARRO').AsString;
  end;
end;

procedure TFQuestorViewVenda.FormCreate(Sender: TObject);
begin
  inherited;
  FController := TModelDAOVenda.New;
  FController.DataSource(dsCadastro).Get;
end;

procedure TFQuestorViewVenda.FormShow(Sender: TObject);
begin
  inherited;
  edDtVenda.Date := Date;
end;

end.
