inherited FQuestorViewVenda: TFQuestorViewVenda
  Caption = 'Cadastro de Venda'
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgCadastro: TDBGrid
    OnDblClick = dbgCadastroDblClick
  end
  inherited pnAcoes: TPanel
    inherited btDeletar: TButton
      OnClick = btDeletarClick
    end
    inherited btEditar: TButton
      OnClick = btEditarClick
    end
    inherited btIncluir: TButton
      OnClick = btIncluirClick
    end
  end
  inherited pnFields: TPanel
    object Label3: TLabel
      Left = 8
      Top = 24
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 72
      Top = 24
      Width = 34
      Height = 13
      Caption = 'Pessoa'
    end
    object Label1: TLabel
      Left = 216
      Top = 24
      Width = 27
      Height = 13
      Caption = 'Carro'
    end
    object Label4: TLabel
      Left = 400
      Top = 25
      Width = 56
      Height = 13
      Caption = 'Data Venda'
    end
    object edCodigo: TEdit
      Left = 8
      Top = 44
      Width = 49
      Height = 21
      TabOrder = 0
    end
    object edPessoa: TEdit
      Left = 72
      Top = 44
      Width = 95
      Height = 21
      TabOrder = 1
    end
    object edCarro: TEdit
      Left = 216
      Top = 44
      Width = 113
      Height = 21
      TabOrder = 2
    end
    object edDtVenda: TDateTimePicker
      Left = 400
      Top = 44
      Width = 186
      Height = 21
      Date = 44338.000000000000000000
      Time = 0.848086273144872400
      TabOrder = 3
    end
  end
end
