inherited FQuestorViewCarro: TFQuestorViewCarro
  Caption = 'Cadastro de Carro'
  ClientHeight = 321
  ClientWidth = 648
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 664
  ExplicitHeight = 360
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgCadastro: TDBGrid
    Top = 112
    Width = 648
    Height = 209
    OnDblClick = dbgCadastroDblClick
  end
  inherited pnAcoes: TPanel
    Width = 648
    ExplicitWidth = 648
    inherited btListar: TButton
      OnClick = btListarClick
      ExplicitLeft = 328
    end
    inherited btDeletar: TButton
      OnClick = btDeletarClick
      ExplicitLeft = 110
    end
    inherited btEditar: TButton
      OnClick = btEditarClick
      ExplicitLeft = 219
    end
    inherited btIncluir: TButton
      OnClick = btIncluirClick
    end
  end
  inherited pnFields: TPanel
    Width = 648
    Height = 71
    ExplicitWidth = 648
    ExplicitHeight = 71
    object Label1: TLabel
      Left = 441
      Top = 24
      Width = 84
      Height = 13
      Caption = 'Data Lancamento'
    end
    object Label2: TLabel
      Left = 73
      Top = 24
      Width = 34
      Height = 13
      Caption = 'Modelo'
    end
    object Label3: TLabel
      Left = 9
      Top = 24
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object edModelo: TEdit
      Left = 73
      Top = 44
      Width = 353
      Height = 21
      TabOrder = 0
    end
    object edCodigo: TEdit
      Left = 9
      Top = 44
      Width = 49
      Height = 21
      TabOrder = 1
    end
    object edDtLancamento: TDateTimePicker
      Left = 441
      Top = 44
      Width = 133
      Height = 21
      Date = 44338.000000000000000000
      Time = 0.449841331021161800
      TabOrder = 2
    end
  end
end
