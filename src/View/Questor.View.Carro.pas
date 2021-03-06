unit Questor.View.Carro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Questor.View.Base, Data.DB,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Questor.Model.Entities.Carro, Questor.Model.DAO.Interfaces, Vcl.ComCtrls,
  Questor.Model.Components.Helper.Edit, Questor.Model.DAO.Carro;

type
  TFQuestorViewCarro = class(TFQuestorViewBase)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edModelo: TEdit;
    edCodigo: TEdit;
    edDtLancamento: TDateTimePicker;
    procedure btIncluirClick(Sender: TObject);
    procedure btDeletarClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure btListarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgCadastroDblClick(Sender: TObject);
  private
    FController:iModelDAOInterfaces<TModelEntitiesCarro>;
  public
    { Public declarations }
  end;

var
  FQuestorViewCarro: TFQuestorViewCarro;

implementation

{$R *.dfm}

procedure TFQuestorViewCarro.btDeletarClick(Sender: TObject);
begin
  inherited;
  FController.This
  .Codigo(dsCadastro.DataSet.FieldByName('CODIGO').AsInteger)
  .&End
  .Delete.Get;

end;

procedure TFQuestorViewCarro.btEditarClick(Sender: TObject);
begin
  inherited;
  FController
   .This
     .Codigo(edCodigo.ToInteger)
     .Modelo(edModelo.Text)
     .DataLancamento(edDtLancamento.Date)
   .&End
   .Update.Get;
end;

procedure TFQuestorViewCarro.btIncluirClick(Sender: TObject);
begin
  inherited;
  FController
   .This
     .Codigo(edCodigo.ToInteger)
     .Modelo(edModelo.Text)
     .DataLancamento(edDtLancamento.Date)
   .&End
   .Insert.Get;
   edCodigo.SetFocus;
   edCodigo.Clear;
   edModelo.Clear;
end;

procedure TFQuestorViewCarro.btListarClick(Sender: TObject);
begin
  inherited;
  FController.Get;
end;

procedure TFQuestorViewCarro.dbgCadastroDblClick(Sender: TObject);
begin
  inherited;
  if (dsCadastro.DataSet.RecordCount > 0) then
  begin
    edCodigo.Text       := dsCadastro.DataSet.FieldByName('CODIGO').AsString;
    edModelo.Text       := dsCadastro.DataSet.FieldByName('MODELO').AsString;
    edDtLancamento.Date := dsCadastro.DataSet.FieldByName('DATALANCAMENTO').AsDateTime;
  end;

end;

procedure TFQuestorViewCarro.FormCreate(Sender: TObject);
begin
  inherited;
  FController := TModelDAOCarro.New;
  FController.DataSource(dsCadastro).Get;
end;

procedure TFQuestorViewCarro.FormShow(Sender: TObject);
begin
  inherited;
  edDtLancamento.Date := Date;
end;

end.
