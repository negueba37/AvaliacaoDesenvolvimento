program Questor;

uses
  Vcl.Forms,
  Questor.Model.Components.Connections.FireDac in 'src\Model\Components\Connections\Questor.Model.Components.Connections.FireDac.pas',
  Questor.Model.Components.Connections.Interfaces in 'src\Model\Components\Connections\Questor.Model.Components.Connections.Interfaces.pas',
  Questor.Model.DAO.Carro in 'src\Model\DAO\Questor.Model.DAO.Carro.pas',
  Questor.Model.DAO.Cliente in 'src\Model\DAO\Questor.Model.DAO.Cliente.pas',
  Questor.Model.DAO.Interfaces in 'src\Model\DAO\Questor.Model.DAO.Interfaces.pas',
  Questor.Model.DAO.Venda in 'src\Model\DAO\Questor.Model.DAO.Venda.pas',
  Questor.Model.Entities.Carro in 'src\Model\Entities\Questor.Model.Entities.Carro.pas',
  Questor.Model.Entities.Cliente in 'src\Model\Entities\Questor.Model.Entities.Cliente.pas',
  Questor.Model.Entities.Venda in 'src\Model\Entities\Questor.Model.Entities.Venda.pas',
  Questor.Model.Services.Interfaces in 'src\Model\Services\Questor.Model.Services.Interfaces.pas',
  Questor.View.Base in 'src\View\Questor.View.Base.pas' {FQuestorViewBase},
  Questor.View.Carro in 'src\View\Questor.View.Carro.pas' {FQuestorViewCarro},
  Questor.View.Cliente in 'src\View\Questor.View.Cliente.pas' {FQuestorViewCliente},
  Questor.View.Main in 'src\View\Questor.View.Main.pas' {FQuestorViewMain},
  Questor.View.Venda in 'src\View\Questor.View.Venda.pas' {FQuestorViewVenda},
  Questor.Model.Components.Helper.Edit in 'src\Model\Components\Helper\Questor.Model.Components.Helper.Edit.pas',
  Questor.Model.DAO.Ganhadores in 'src\Model\DAO\Questor.Model.DAO.Ganhadores.pas',
  Questor.Model.Services.Sorteio in 'src\Model\Services\Questor.Model.Services.Sorteio.pas',
  Questor.Model.DAO.VendasCarroMarea in 'src\Model\DAO\Questor.Model.DAO.VendasCarroMarea.pas',
  Questor.Model.DAO.VendasCarroUno in 'src\Model\DAO\Questor.Model.DAO.VendasCarroUno.pas',
  Questor.Model.DAO.ClienteSemHistoricoDeCompra in 'src\Model\DAO\Questor.Model.DAO.ClienteSemHistoricoDeCompra.pas',
  Questor.Model.DAO.VendasNaoSorteadas in 'src\Model\DAO\Questor.Model.DAO.VendasNaoSorteadas.pas',
  Questor.Model.DAO.ExcluirVendasNaoSorteadas in 'src\Model\DAO\Questor.Model.DAO.ExcluirVendasNaoSorteadas.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  ReportMemoryLeaksOnShutdown := True;
  Application.CreateForm(TFQuestorViewMain, FQuestorViewMain);
  Application.CreateForm(TFQuestorViewBase, FQuestorViewBase);
  Application.Run;
end.
