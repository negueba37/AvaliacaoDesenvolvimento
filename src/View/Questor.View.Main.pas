unit Questor.View.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Questor.View.Carro, Vcl.StdCtrls,
  Questor.View.Venda, Questor.View.Cliente, Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Questor.Model.DAO.Ganhadores,
  Questor.Model.DAO.Interfaces, Questor.Model.DAO.VendasCarroMarea,
  Questor.Model.DAO.VendasCarroUno,
  Questor.Model.DAO.ClienteSemHistoricoDeCompra,
  Questor.Model.DAO.VendasNaoSorteadas,
  Questor.Model.DAO.ExcluirVendasNaoSorteadas;

type
  TFQuestorViewMain = class(TForm)
    Panel1: TPanel;
    Panel4: TPanel;
    Panel2: TPanel;
    btCarro: TButton;
    btVenda: TButton;
    Cliente: TButton;
    btSorteado: TButton;
    Button2: TButton;
    btVendasMarea: TButton;
    btVendasUno: TButton;
    btClienteSemHistoricoDeCompra: TButton;
    btMostrarVendasNaoSorteadas: TButton;
    dbgSorteio: TDBGrid;
    Panel3: TPanel;
    dsSorteio: TDataSource;
    btObs: TButton;
    btConfiguração: TButton;

    procedure Button2Click(Sender: TObject);
    procedure btVendasMareaClick(Sender: TObject);
    procedure btCarroClick(Sender: TObject);
    procedure ClienteClick(Sender: TObject);
    procedure btVendaClick(Sender: TObject);
    procedure btSorteadoClick(Sender: TObject);
    procedure btVendasUnoClick(Sender: TObject);
    procedure btClienteSemHistoricoDeCompraClick(Sender: TObject);
    procedure btMostrarVendasNaoSorteadasClick(Sender: TObject);
    procedure btConfiguraçãoClick(Sender: TObject);
    procedure btObsClick(Sender: TObject);
  private
    FController : iModelDAOServices;
  public
    { Public declarations }
  end;

var
  FQuestorViewMain: TFQuestorViewMain;

implementation

{$R *.dfm}

procedure TFQuestorViewMain.btCarroClick(Sender: TObject);
var
  FormCarro:TFQuestorViewCarro;
begin
  FormCarro := TFQuestorViewCarro.Create(nil);
  try
    FormCarro.ShowModal;
  finally
    FormCarro.Free;
  end;
end;

procedure TFQuestorViewMain.btSorteadoClick(Sender: TObject);
begin
  FController := TModelServicesGanhadores.New.DataSource(dsSorteio).Get;
end;

procedure TFQuestorViewMain.btVendaClick(Sender: TObject);
var
  FormVenda:TFQuestorViewVenda;
begin
  FormVenda := TFQuestorViewVenda.Create(nil);
  try
    FormVenda.ShowModal;
  finally
    FormVenda.Free;
  end;
end;

procedure TFQuestorViewMain.btClienteSemHistoricoDeCompraClick(Sender: TObject);
begin
  FController :=  TModelDAOClienteSemHistoricoDeCompra.New.DataSource(dsSorteio).Get;
end;

procedure TFQuestorViewMain.btMostrarVendasNaoSorteadasClick(Sender: TObject);
begin
  FController :=  TModelDAOVendasNaoSorteadas.New.DataSource(dsSorteio).Get;
end;

procedure TFQuestorViewMain.btObsClick(Sender: TObject);
begin
  ShowMessage('Não foi implementado a camada de Controller e o padrão Factory para reduzir o acoplamento');
end;

procedure TFQuestorViewMain.btConfiguraçãoClick(Sender: TObject);
begin
  ShowMessage('Mudar dados do banco no metodo "create" da clase "TModelComponentsConnectionsFireDac"');
end;

procedure TFQuestorViewMain.Button2Click(Sender: TObject);
begin
  FController := TModelDAOExcluirVendasNaoSorteadas.New.DataSource(dsSorteio);
end;

procedure TFQuestorViewMain.btVendasUnoClick(Sender: TObject);
begin
  FController := TModelServicesVendasCarroUno.New.DataSource(dsSorteio).Get;
end;

procedure TFQuestorViewMain.btVendasMareaClick(Sender: TObject);
begin
  FController := TModelServicesVendasCarroMarea.New.DataSource(dsSorteio).Get;
end;

procedure TFQuestorViewMain.ClienteClick(Sender: TObject);
var
  FormCliente:TFQuestorViewCliente;
begin
  FormCliente := TFQuestorViewCliente.Create(nil);
  try
    FormCliente.ShowModal;
  finally
    FormCliente.Free;
  end;
end;

end.
