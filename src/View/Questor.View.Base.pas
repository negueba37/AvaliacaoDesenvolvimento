unit Questor.View.Base;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFQuestorViewBase = class(TForm)
    dbgCadastro: TDBGrid;
    dsCadastro: TDataSource;
    pnAcoes: TPanel;
    btListar: TButton;
    btDeletar: TButton;
    btEditar: TButton;
    btIncluir: TButton;
    pnFields: TPanel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FQuestorViewBase: TFQuestorViewBase;

implementation

{$R *.dfm}

procedure TFQuestorViewBase.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F1 then
  begin
    btIncluir.OnClick(Sender);
    Key := 0;
  end
  else if Key = VK_F2 then
  begin
    btDeletar.OnClick(Sender);
    Key := 0;
  end
  else if Key = VK_F3 then
  begin
    btEditar.OnClick(Sender);
    Key := 0;
  end
  else if Key = VK_F4 then
  begin
    btListar.OnClick(Sender);
    Key := 0;
  end
  else if Key = VK_ESCAPE then
  begin
    Close;
    Key := 0;
  end;
end;

end.
