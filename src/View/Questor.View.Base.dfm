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
      AlignWithMargins = True
      Left = 328
      Top = 1
      Width = 104
      Height = 39
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 5
      Margins.Bottom = 0
      Align = alLeft
      Caption = 'Listar [ F4 ]'
      TabOrder = 0
      ExplicitLeft = 313
    end
    object btDeletar: TButton
      AlignWithMargins = True
      Left = 110
      Top = 1
      Width = 104
      Height = 39
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 5
      Margins.Bottom = 0
      Align = alLeft
      Caption = 'Deletar [ F2 ]'
      TabOrder = 1
      ExplicitLeft = 105
    end
    object btEditar: TButton
      AlignWithMargins = True
      Left = 219
      Top = 1
      Width = 104
      Height = 39
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 5
      Margins.Bottom = 0
      Align = alLeft
      Caption = 'Editar [ F3 ]'
      TabOrder = 2
      ExplicitLeft = 209
    end
    object btIncluir: TButton
      AlignWithMargins = True
      Left = 1
      Top = 1
      Width = 104
      Height = 39
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 5
      Margins.Bottom = 0
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
