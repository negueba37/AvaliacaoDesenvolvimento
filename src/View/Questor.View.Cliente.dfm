inherited FQuestorViewCliente: TFQuestorViewCliente
  Caption = 'Cadastro de Cliente'
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgCadastro: TDBGrid
    OnDblClick = dbgCadastroDblClick
  end
  inherited pnAcoes: TPanel
    inherited btListar: TButton
      OnClick = btListarClick
    end
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
      Width = 19
      Height = 13
      Caption = 'CPF'
    end
    object edCodigo: TEdit
      Left = 8
      Top = 44
      Width = 49
      Height = 21
      TabOrder = 0
    end
    object edCpf: TEdit
      Left = 72
      Top = 44
      Width = 95
      Height = 21
      TabOrder = 1
    end
  end
end
