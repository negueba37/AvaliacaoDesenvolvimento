object FQuestorViewBase: TFQuestorViewBase
  Left = 0
  Top = 0
  Caption = 'FQuestorViewBase'
  ClientHeight = 278
  ClientWidth = 598
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object dbgCadastro: TDBGrid
    Left = 0
    Top = 129
    Width = 598
    Height = 149
    Align = alBottom
    DataSource = dsCadastro
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object pnAcoes: TPanel
    Left = 0
    Top = 0
    Width = 598
    Height = 41
    Align = alTop
    TabOrder = 1
    object btListar: TButton
      Left = 464
      Top = 1
      Width = 133
      Height = 39
      Align = alRight
      Caption = 'Listar [ F4 ]'
      TabOrder = 0
    end
    object btDeletar: TButton
      Left = 89
      Top = 1
      Width = 78
      Height = 39
      Align = alLeft
      Caption = 'Deletar [ F2 ]'
      TabOrder = 1
    end
    object btEditar: TButton
      Left = 167
      Top = 1
      Width = 78
      Height = 39
      Align = alLeft
      Caption = 'Editar [ F3 ]'
      TabOrder = 2
    end
    object btIncluir: TButton
      Left = 1
      Top = 1
      Width = 88
      Height = 39
      Align = alLeft
      Caption = 'Incluir [ F1 ]'
      TabOrder = 3
    end
  end
  object pnFields: TPanel
    Left = 0
    Top = 41
    Width = 598
    Height = 88
    Align = alClient
    TabOrder = 2
  end
  object dsCadastro: TDataSource
    Left = 296
    Top = 192
  end
end
