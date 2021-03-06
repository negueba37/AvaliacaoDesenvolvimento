unit Questor.View.Cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Questor.View.Base, Data.DB,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Questor.Model.DAO.Cliente,
  Questor.Model.DAO.Interfaces, Questor.Model.Entities.Cliente,
  Questor.Model.Components.Helper.Edit;

type
  TFQuestorViewCliente = class(TFQuestorViewBase)
    Label3: TLabel;
    Label2: TLabel;
    edCodigo: TEdit;
    edCpf: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure btDeletarClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure btListarClick(Sender: TObject);
    procedure dbgCadastroDblClick(Sender: TObject);
  private
    FController:iModelDAOInterfaces<TModelEntitiesCliente>;
  public

  end;

var
  FQuestorViewCliente: TFQuestorViewCliente;

implementation

{$R *.dfm}

procedure TFQuestorViewCliente.btDeletarClick(Sender: TObject);
begin
  inherited;
  FController.This
  .Codigo(edCodigo.ToInteger)
  .&End
  .Delete.Get;
end;

procedure TFQuestorViewCliente.btEditarClick(Sender: TObject);
begin
  inherited;
  FController.This
  .Codigo(edCodigo.ToInteger)
  .CPF(edCpf.Text)
  .&End
  .Update.Get;
end;

procedure TFQuestorViewCliente.btIncluirClick(Sender: TObject);
begin
  inherited;
  FController.This
  .Codigo(edCodigo.ToInteger)
  .CPF(edCpf.Text)
  .&End
  .Insert.Get;

   edCodigo.SetFocus;
   edCodigo.Clear;
   edCpf.Clear;
end;

procedure TFQuestorViewCliente.btListarClick(Sender: TObject);
begin
  inherited;
  FController.Get;
end;

procedure TFQuestorViewCliente.dbgCadastroDblClick(Sender: TObject);
begin
  inherited;
  if dsCadastro.DataSet.RecordCount > 0 then
  begin
    edCodigo.Text := dsCadastro.DataSet.FieldByName('CODIGO').AsString;
    edCpf.Text := dsCadastro.DataSet.FieldByName('CPF').AsString;
  end;
end;

procedure TFQuestorViewCliente.FormCreate(Sender: TObject);
begin
  inherited;
  FController := TModelDAOCliente.New;
  FController.DataSource(dsCadastro).Get;
end;

procedure TFQuestorViewCliente.FormShow(Sender: TObject);
begin
  inherited;
  edCodigo.SetFocus;
end;

end.
