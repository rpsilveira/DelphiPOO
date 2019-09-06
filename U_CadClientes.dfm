inherited F_CadClientes: TF_CadClientes
  Caption = 'Cadastro de Clientes'
  ClientHeight = 362
  ClientWidth = 617
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitWidth = 623
  ExplicitHeight = 388
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 24
    Top = 19
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel [1]
    Left = 184
    Top = 19
    Width = 19
    Height = 13
    Caption = 'CPF'
  end
  object Label3: TLabel [2]
    Left = 24
    Top = 67
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object Label4: TLabel [3]
    Left = 24
    Top = 115
    Width = 45
    Height = 13
    Caption = 'Endere'#231'o'
  end
  object Label5: TLabel [4]
    Left = 24
    Top = 163
    Width = 28
    Height = 13
    Caption = 'Bairro'
  end
  object Label6: TLabel [5]
    Left = 24
    Top = 211
    Width = 33
    Height = 13
    Caption = 'Cidade'
  end
  object Label7: TLabel [6]
    Left = 24
    Top = 259
    Width = 33
    Height = 13
    Caption = 'Estado'
  end
  object Label8: TLabel [7]
    Left = 184
    Top = 259
    Width = 19
    Height = 13
    Caption = 'CEP'
  end
  inherited pnlBottom: TPanel
    Top = 321
    Width = 617
    ExplicitLeft = 0
    ExplicitTop = 354
    ExplicitWidth = 617
    inherited btnIncluir: TBitBtn
      ExplicitLeft = 4
      ExplicitTop = 4
      ExplicitHeight = 33
    end
    inherited btnAlterar: TBitBtn
      ExplicitLeft = 85
    end
    inherited btnExcluir: TBitBtn
      ExplicitLeft = 166
      ExplicitTop = 4
    end
    inherited btnSalvar: TBitBtn
      ExplicitLeft = 267
    end
    inherited btnCancelar: TBitBtn
      ExplicitLeft = 348
    end
    inherited btnPesquisar: TBitBtn
      ExplicitLeft = 449
    end
  end
  object edtCodigo: TEdit
    Left = 24
    Top = 35
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object edtCPF: TMaskEdit
    Left = 184
    Top = 35
    Width = 120
    Height = 21
    EditMask = '999\.999\.999\-99;1;_'
    MaxLength = 14
    TabOrder = 2
    Text = '   .   .   -  '
  end
  object edtNome: TEdit
    Left = 24
    Top = 83
    Width = 281
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 60
    TabOrder = 3
  end
  object edtEndereco: TEdit
    Left = 24
    Top = 131
    Width = 281
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 60
    TabOrder = 4
  end
  object edtBairro: TEdit
    Left = 24
    Top = 179
    Width = 281
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 60
    TabOrder = 5
  end
  object edtCidade: TEdit
    Left = 24
    Top = 227
    Width = 281
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 60
    TabOrder = 6
  end
  object edtEstado: TEdit
    Left = 24
    Top = 275
    Width = 121
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 2
    TabOrder = 7
  end
  object edtCEP: TMaskEdit
    Left = 184
    Top = 275
    Width = 120
    Height = 21
    EditMask = '99\.999\-999;1;_'
    MaxLength = 10
    TabOrder = 8
    Text = '  .   -   '
  end
end
