object FQuestorViewMain: TFQuestorViewMain
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Teste Questor'
  ClientHeight = 418
  ClientWidth = 952
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 952
    Height = 41
    Align = alTop
    Caption = 'Cadastro'
    TabOrder = 0
    object btObs: TButton
      Left = 839
      Top = 1
      Width = 112
      Height = 39
      Align = alRight
      Caption = 'Observa'#231#227'o'
      TabOrder = 0
      OnClick = btObsClick
      ExplicitLeft = 9
      ExplicitTop = 2
    end
    object btConfiguração: TButton
      Left = 727
      Top = 1
      Width = 112
      Height = 39
      Align = alRight
      Caption = 'Configura'#231#227'o'
      TabOrder = 1
      OnClick = btConfiguraçãoClick
      ExplicitLeft = 9
      ExplicitTop = 2
    end
  end
  object Panel4: TPanel
    AlignWithMargins = True
    Left = 0
    Top = 129
    Width = 952
    Height = 32
    Margins.Left = 0
    Margins.Top = 5
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    TabOrder = 1
    object btSorteado: TButton
      Left = 1
      Top = 1
      Width = 112
      Height = 30
      Align = alLeft
      Caption = 'Clientes Sorteados'
      TabOrder = 0
      OnClick = btSorteadoClick
    end
    object Button2: TButton
      Left = 705
      Top = 1
      Width = 168
      Height = 30
      Align = alLeft
      Caption = 'Deletar vendas n'#227'o sorteadas'
      TabOrder = 1
      OnClick = Button2Click
    end
    object btVendasMarea: TButton
      Left = 113
      Top = 1
      Width = 112
      Height = 30
      Align = alLeft
      Caption = 'Vendas Marea'
      TabOrder = 2
      OnClick = btVendasMareaClick
    end
    object btVendasUno: TButton
      Left = 225
      Top = 1
      Width = 112
      Height = 30
      Align = alLeft
      Caption = 'Vendas Uno'
      TabOrder = 3
      OnClick = btVendasUnoClick
    end
    object btClienteSemHistoricoDeCompra: TButton
      Left = 337
      Top = 1
      Width = 200
      Height = 30
      Align = alLeft
      Caption = 'Cliente sem historico de compra'
      TabOrder = 4
      OnClick = btClienteSemHistoricoDeCompraClick
    end
    object btMostrarVendasNaoSorteadas: TButton
      Left = 537
      Top = 1
      Width = 168
      Height = 30
      Align = alLeft
      Caption = 'Mostrar vendas n'#227'o sorteadas'
      TabOrder = 5
      OnClick = btMostrarVendasNaoSorteadasClick
      ExplicitLeft = 531
      ExplicitTop = -2
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 0
    Top = 46
    Width = 952
    Height = 32
    Margins.Left = 0
    Margins.Top = 5
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    TabOrder = 2
    object btCarro: TButton
      Left = 1
      Top = 1
      Width = 112
      Height = 30
      Align = alLeft
      Caption = 'Carro'
      TabOrder = 0
      OnClick = btCarroClick
    end
    object btVenda: TButton
      Left = 225
      Top = 1
      Width = 112
      Height = 30
      Align = alLeft
      Caption = 'Venda'
      TabOrder = 1
      OnClick = btVendaClick
    end
    object Cliente: TButton
      Left = 113
      Top = 1
      Width = 112
      Height = 30
      Align = alLeft
      Caption = 'Cliente'
      TabOrder = 2
      OnClick = ClienteClick
    end
  end
  object dbgSorteio: TDBGrid
    Left = 0
    Top = 161
    Width = 952
    Height = 257
    Align = alClient
    DataSource = dsSorteio
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel3: TPanel
    AlignWithMargins = True
    Left = 0
    Top = 83
    Width = 952
    Height = 41
    Margins.Left = 0
    Margins.Top = 5
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Caption = 'Sorteio'
    TabOrder = 4
  end
  object dsSorteio: TDataSource
    Left = 600
    Top = 336
  end
end
