inherited frmCompromissos: TfrmCompromissos
  BorderStyle = bsDialog
  BorderWidth = 10
  Caption = 'Compromissos'
  ClientHeight = 350
  ClientWidth = 439
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 465
  ExplicitHeight = 398
  PixelsPerInch = 96
  TextHeight = 13
  object lblQuem: TLabel [0]
    Left = 0
    Top = 0
    Width = 28
    Height = 13
    Caption = 'Quem'
  end
  object lblOQue: TLabel [1]
    Left = 0
    Top = 127
    Width = 29
    Height = 13
    Caption = 'O que'
  end
  object lblOnde: TLabel [2]
    Left = 0
    Top = 234
    Width = 26
    Height = 13
    Caption = 'Onde'
  end
  object lblQuando: TLabel [3]
    Left = 0
    Top = 191
    Width = 38
    Height = 13
    Caption = 'Quando'
  end
  object grdQuem: TcxGrid [4]
    Left = 0
    Top = 16
    Width = 438
    Height = 105
    TabOrder = 0
    object grdQuemDBTableView1: TcxGridDBTableView
      OnKeyPress = grdQuemDBTableView1KeyPress
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
      DataController.DataSource = dmCompromissos.dsTmpPessoas
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NewItemRow.Visible = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.PullFocusing = True
      OptionsData.Appending = True
      OptionsData.Inserting = False
      OptionsView.Navigator = True
      OptionsView.GroupByBox = False
      object grdQuemDBTableView1ID_PESSOA: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'ID_PESSOA'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Properties.DropDownAutoSize = True
        Properties.View = gvrFuncionarios
        Properties.KeyFieldNames = 'ID_PESSOA'
        Properties.ListFieldItem = gvrFuncionariosCODIGO
      end
      object grdQuemDBTableView1Nome: TcxGridDBColumn
        Caption = 'Nome'
        DataBinding.FieldName = 'NOME'
        Options.Editing = False
        Width = 347
      end
    end
    object grdQuemLevel1: TcxGridLevel
      GridView = grdQuemDBTableView1
    end
  end
  object dmeOQue: TcxDBMemo [5]
    Left = 0
    Top = 143
    DataBinding.DataField = 'ASSUNTO'
    DataBinding.DataSource = dmCompromissos.dsContab_Compromisso
    Properties.ScrollBars = ssVertical
    TabOrder = 1
    Height = 42
    Width = 438
  end
  object dmeOnde: TcxDBMemo [6]
    Left = 0
    Top = 250
    DataBinding.DataField = 'LOCAL'
    DataBinding.DataSource = dmCompromissos.dsContab_Compromisso
    Properties.ScrollBars = ssVertical
    TabOrder = 3
    Height = 42
    Width = 438
  end
  object dteQuando: TcxDBDateEdit [7]
    Left = 0
    Top = 207
    DataBinding.DataField = 'QUANDO'
    DataBinding.DataSource = dmCompromissos.dsContab_Compromisso
    Properties.DateButtons = [btnClear, btnNow, btnToday]
    Properties.ImmediatePost = True
    Properties.Kind = ckDateTime
    TabOrder = 2
    Width = 137
  end
  object btnSalvar: TButton [8]
    Left = 282
    Top = 320
    Width = 75
    Height = 25
    Caption = '&Salvar'
    TabOrder = 5
    OnClick = btnSalvarClick
  end
  object btnCancelar: TButton [9]
    Left = 363
    Top = 320
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 6
    OnClick = btnCancelarClick
  end
  object cbxPublico: TcxDBCheckBox [10]
    Left = 0
    Top = 298
    Caption = 'Compromisso p'#250'blico?'
    DataBinding.DataField = 'VISIBILIDADE'
    DataBinding.DataSource = dmCompromissos.dsContab_Compromisso
    Properties.Alignment = taLeftJustify
    Properties.ValueChecked = '1'
    Properties.ValueUnchecked = '0'
    TabOrder = 4
    Width = 137
  end
  inherited FormLink: TJvEmbeddedFormLink
    Left = 192
    Top = 8
  end
  inherited Validador: TJvValidators
    Left = 192
    Top = 56
  end
  object EnterAsTab: TJvEnterAsTab
    OnHandleEnter = EnterAsTabHandleEnter
    Left = 192
    Top = 100
  end
  object ViewRepository: TcxGridViewRepository
    Left = 96
    object gvrFuncionarios: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.First.Visible = True
      NavigatorButtons.PriorPage.Visible = True
      NavigatorButtons.Prior.Visible = True
      NavigatorButtons.Next.Visible = True
      NavigatorButtons.NextPage.Visible = True
      NavigatorButtons.Last.Visible = True
      NavigatorButtons.Insert.Visible = True
      NavigatorButtons.Append.Visible = False
      NavigatorButtons.Delete.Visible = True
      NavigatorButtons.Edit.Visible = True
      NavigatorButtons.Post.Visible = True
      NavigatorButtons.Cancel.Visible = True
      NavigatorButtons.Refresh.Visible = True
      NavigatorButtons.SaveBookmark.Visible = True
      NavigatorButtons.GotoBookmark.Visible = True
      NavigatorButtons.Filter.Visible = True
      DataController.DataSource = dmCompromissos.dsFuncionario
      DataController.KeyFieldNames = 'ID_PESSOA'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gvrFuncionariosCODIGO: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'CODIGO'
      end
      object gvrFuncionariosRAZAO_SOCIAL: TcxGridDBColumn
        Caption = 'Nome'
        DataBinding.FieldName = 'RAZAO_SOCIAL'
        Width = 200
      end
    end
  end
end
