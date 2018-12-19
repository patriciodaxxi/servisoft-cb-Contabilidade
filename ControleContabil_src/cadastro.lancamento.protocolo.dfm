inherited frmLancamentoProtocolo: TfrmLancamentoProtocolo
  BorderStyle = bsDialog
  BorderWidth = 10
  Caption = 'Protocolo'
  ClientHeight = 563
  ClientWidth = 473
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 499
  ExplicitHeight = 611
  PixelsPerInch = 96
  TextHeight = 13
  object lblCliente: TLabel [0]
    Left = 0
    Top = 43
    Width = 33
    Height = 13
    Caption = 'Cliente'
  end
  object lblEntregador: TLabel [1]
    Left = 0
    Top = 86
    Width = 54
    Height = 13
    Caption = 'Entregador'
  end
  object lblCompetencia: TLabel [2]
    Left = 0
    Top = 129
    Width = 62
    Height = 13
    Caption = 'Compet'#234'ncia'
  end
  object lblTipo: TLabel [3]
    Left = 112
    Top = 129
    Width = 20
    Height = 13
    Caption = 'Tipo'
  end
  object lblDestinatario: TLabel [4]
    Left = 0
    Top = 172
    Width = 58
    Height = 13
    Caption = 'Destinat'#225'rio'
  end
  object lblObservacao: TLabel [5]
    Left = 0
    Top = 215
    Width = 58
    Height = 13
    Caption = 'Observa'#231#227'o'
  end
  object Bevel: TBevel [6]
    Left = 0
    Top = 314
    Width = 473
    Height = 2
    Shape = bsBottomLine
  end
  object bvProtItens: TBevel [7]
    Left = 0
    Top = 525
    Width = 473
    Height = 5
    Shape = bsBottomLine
  end
  object lblCodigo: TLabel [8]
    Left = 0
    Top = 0
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object dteCliente: TcxDBTextEdit [9]
    Left = 0
    Top = 59
    DataBinding.DataField = 'CLIENTE'
    DataBinding.DataSource = dmLancamentoProtocolo.dsContab_Protocolo
    TabOrder = 0
    OnKeyDown = dteClienteKeyDown
    OnKeyPress = dteClienteKeyPress
    Width = 473
  end
  object dteEntregador: TcxDBTextEdit [10]
    Left = 0
    Top = 102
    DataBinding.DataField = 'ENTREGADOR'
    DataBinding.DataSource = dmLancamentoProtocolo.dsContab_Protocolo
    TabOrder = 1
    OnKeyDown = dteEntregadorKeyDown
    OnKeyPress = dteEntregadorKeyPress
    Width = 473
  end
  object dteCompetencia: TcxDBDateEdit [11]
    Left = 0
    Top = 145
    DataBinding.DataField = 'DATA'
    DataBinding.DataSource = dmLancamentoProtocolo.dsContab_Protocolo
    Properties.InputKind = ikStandard
    Properties.ShowTime = False
    TabOrder = 2
    Width = 105
  end
  object dlcTipo: TcxDBLookupComboBox [12]
    Left = 111
    Top = 145
    DataBinding.DataField = 'TIPO_PROTOCOLO'
    DataBinding.DataSource = dmLancamentoProtocolo.dsContab_Protocolo
    Properties.ImmediatePost = True
    Properties.KeyFieldNames = 'ID_TIPO'
    Properties.ListColumns = <
      item
        Caption = 'Descri'#231#227'o'
        FieldName = 'DESCRICAO'
      end>
    Properties.ListSource = dmLancamentoProtocolo.dsTipo
    Properties.PostPopupValueOnTab = True
    TabOrder = 3
    Width = 145
  end
  object dteDestinatario: TcxDBTextEdit [13]
    Left = 0
    Top = 188
    DataBinding.DataField = 'DESTINATARIO'
    DataBinding.DataSource = dmLancamentoProtocolo.dsContab_Protocolo
    TabOrder = 4
    Width = 473
  end
  object dmeObservacao: TcxDBMemo [14]
    Left = 0
    Top = 231
    DataBinding.DataField = 'OBSERVACOES'
    DataBinding.DataSource = dmLancamentoProtocolo.dsContab_Protocolo
    TabOrder = 5
    Height = 77
    Width = 473
  end
  object grdProtocoloItens: TcxGrid [15]
    Left = 0
    Top = 322
    Width = 473
    Height = 200
    TabOrder = 6
    object grdProtocoloItensDBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.First.Visible = True
      NavigatorButtons.PriorPage.Visible = True
      NavigatorButtons.Prior.Visible = True
      NavigatorButtons.Next.Visible = True
      NavigatorButtons.NextPage.Visible = True
      NavigatorButtons.Last.Visible = True
      NavigatorButtons.Insert.Visible = False
      NavigatorButtons.Append.Visible = True
      NavigatorButtons.Delete.Visible = True
      NavigatorButtons.Edit.Visible = True
      NavigatorButtons.Post.Visible = True
      NavigatorButtons.Cancel.Visible = True
      NavigatorButtons.Refresh.Visible = False
      NavigatorButtons.SaveBookmark.Visible = False
      NavigatorButtons.GotoBookmark.Visible = False
      NavigatorButtons.Filter.Visible = False
      OnEditKeyDown = grdProtocoloItensDBTableView1EditKeyDown
      OnEditKeyPress = grdProtocoloItensDBTableView1EditKeyPress
      DataController.DataSource = dmLancamentoProtocolo.dsContab_Protocolo_Itens
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NewItemRow.Visible = True
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsCustomize.ColumnHorzSizing = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.Appending = True
      OptionsView.Navigator = True
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object grdProtocoloItensDBTableView1ID_ITEM_LANCAMENTO: TcxGridDBColumn
        Caption = 'C'#243'digo Item'
        DataBinding.FieldName = 'ID_ITEM_LANCAMENTO'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownAutoSize = True
        Properties.HideSelection = False
        Properties.KeyFieldNames = 'ID_CONTAB_ITEM_LANCAMENTO'
        Properties.ListColumns = <
          item
            Caption = 'C'#243'digo'
            FieldName = 'CODIGO'
          end
          item
            Caption = 'Descri'#231#227'o'
            FieldName = 'DESCRICAO'
          end>
        Properties.ListSource = dmLancamentoProtocolo.dsItensLancamento
      end
      object grdProtocoloItensDBTableView1DescricaoItemLancamento: TcxGridDBColumn
        Caption = 'Descri'#231#227'o Item'
        DataBinding.FieldName = 'DescricaoItemLancamento'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        Width = 150
      end
      object grdProtocoloItensDBTableView1OBSERVACAO: TcxGridDBColumn
        Caption = 'Observa'#231#227'o'
        DataBinding.FieldName = 'OBSERVACAO'
        PropertiesClassName = 'TcxMemoProperties'
        Width = 200
      end
    end
    object grdProtocoloItensLevel1: TcxGridLevel
      GridView = grdProtocoloItensDBTableView1
    end
  end
  object btnConfirmar: TButton [16]
    Left = 317
    Top = 536
    Width = 75
    Height = 25
    Caption = 'C&onfirmar'
    ModalResult = 2
    TabOrder = 7
    OnClick = btnConfirmarClick
  end
  object btnCancelar: TButton [17]
    Left = 398
    Top = 536
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 8
    OnClick = btnCancelarClick
  end
  object dteCodigo: TcxDBTextEdit [18]
    Left = 0
    Top = 16
    DataBinding.DataField = 'ID_CONTAB_PROTOCOLO'
    DataBinding.DataSource = dmLancamentoProtocolo.dsContab_Protocolo
    Enabled = False
    Properties.ReadOnly = True
    TabOrder = 9
    Width = 54
  end
  inherited FormLink: TJvEmbeddedFormLink
    Left = 288
    Top = 139
  end
  inherited Validador: TJvValidators
    Left = 344
    Top = 139
    object JvCustomValidator1: TJvCustomValidator
    end
  end
  object EnterAsTab: TJvEnterAsTab
    Left = 400
    Top = 139
  end
end
