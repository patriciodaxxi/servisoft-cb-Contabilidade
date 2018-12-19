inherited frmRecado: TfrmRecado
  BorderStyle = bsDialog
  BorderWidth = 10
  Caption = 'Recados'
  ClientHeight = 283
  ClientWidth = 439
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 465
  ExplicitHeight = 331
  PixelsPerInch = 96
  TextHeight = 13
  object lblDe: TLabel [0]
    Left = 0
    Top = 0
    Width = 13
    Height = 13
    Caption = 'De'
  end
  object lblPara: TLabel [1]
    Left = 0
    Top = 43
    Width = 22
    Height = 13
    Caption = 'Para'
  end
  object lblAssunto: TLabel [2]
    Left = 0
    Top = 86
    Width = 39
    Height = 13
    Caption = 'Assunto'
  end
  object dteDe: TcxDBTextEdit [3]
    Left = 0
    Top = 16
    DataBinding.DataField = 'DE'
    DataBinding.DataSource = dmRecados.dsContab_Recado
    TabOrder = 0
    Width = 438
  end
  object cbPara: TcxDBExtLookupComboBox [4]
    Left = 0
    Top = 59
    DataBinding.DataField = 'PARA'
    DataBinding.DataSource = dmRecados.dsContab_Recado
    Properties.DropDownAutoSize = True
    Properties.GridMode = True
    Properties.ImmediatePost = True
    Properties.View = gvrFuncionarios
    Properties.KeyFieldNames = 'ID_PESSOA'
    Properties.ListFieldItem = gvrFuncionariosCODIGO
    Properties.OnChange = cbParaPropertiesChange
    TabOrder = 1
    OnExit = cbParaExit
    Width = 65
  end
  object edtPara: TcxTextEdit [5]
    Left = 71
    Top = 59
    Enabled = False
    TabOrder = 2
    Width = 367
  end
  object dmeAssunto: TcxDBMemo [6]
    Left = 0
    Top = 102
    DataBinding.DataField = 'ASSUNTO'
    DataBinding.DataSource = dmRecados.dsContab_Recado
    Properties.ScrollBars = ssVertical
    TabOrder = 3
    Height = 148
    Width = 438
  end
  object btnEnviar: TButton [7]
    Left = 282
    Top = 256
    Width = 75
    Height = 25
    Caption = '&Enviar'
    TabOrder = 4
    OnClick = btnEnviarClick
  end
  object btnCancelar: TButton [8]
    Left = 363
    Top = 256
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 5
    OnClick = btnCancelarClick
  end
  inherited FormLink: TJvEmbeddedFormLink
    Left = 192
    Top = 0
  end
  inherited Validador: TJvValidators
    Left = 192
    Top = 48
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
      DataController.DataModeController.GridMode = True
      DataController.DataSource = dmRecados.dsFuncionario
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
  object EnterAsTab: TJvEnterAsTab
    Left = 192
    Top = 100
  end
end
