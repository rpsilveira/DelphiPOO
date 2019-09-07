object F_Pesquisa: TF_Pesquisa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'F_Pesquisa'
  ClientHeight = 273
  ClientWidth = 645
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPesquisa: TPanel
    Left = 0
    Top = 0
    Width = 645
    Height = 41
    Align = alTop
    TabOrder = 0
    object btnLimpar: TSpeedButton
      Left = 608
      Top = 12
      Width = 23
      Height = 19
      Hint = 'Limpar pesquisa'
      Caption = 'X'
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = btnLimparClick
    end
    object edtPesquisa: TEdit
      Left = 16
      Top = 11
      Width = 588
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = edtPesquisaChange
    end
  end
  object lstPesquisa: TListView
    Left = 0
    Top = 41
    Width = 645
    Height = 191
    Hint = 'Duplo clique para confirmar'
    Align = alClient
    Columns = <>
    ReadOnly = True
    RowSelect = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    ViewStyle = vsReport
    OnDblClick = btnConfirmaClick
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 232
    Width = 645
    Height = 41
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      645
      41)
    object btnConfirma: TBitBtn
      Left = 475
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Confirmar'
      TabOrder = 0
      OnClick = btnConfirmaClick
    end
    object btnCancela: TBitBtn
      Left = 556
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
  end
end
