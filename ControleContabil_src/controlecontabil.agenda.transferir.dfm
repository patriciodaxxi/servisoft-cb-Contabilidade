inherited frmTransferirCompromisso: TfrmTransferirCompromisso
  BorderStyle = bsDialog
  BorderWidth = 10
  Caption = 'Transferir para...'
  ClientHeight = 76
  ClientWidth = 208
  Position = poDesktopCenter
  ExplicitWidth = 234
  ExplicitHeight = 124
  PixelsPerInch = 96
  TextHeight = 13
  object lblQuando: TLabel [0]
    Left = 0
    Top = 0
    Width = 38
    Height = 13
    Caption = 'Quando'
  end
  object dteQuando: TcxDateEdit [1]
    Left = 0
    Top = 16
    Properties.DateButtons = [btnClear, btnNow, btnToday]
    Properties.ImmediatePost = True
    Properties.Kind = ckDateTime
    TabOrder = 0
    Width = 137
  end
  object btnSalvar: TButton [2]
    Left = 50
    Top = 43
    Width = 75
    Height = 25
    Caption = '&Salvar'
    TabOrder = 1
    OnClick = btnSalvarClick
  end
  object btnCancelar: TButton [3]
    Left = 131
    Top = 43
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 2
  end
end
