inherited frmCadPermissoes: TfrmCadPermissoes
  BorderWidth = 10
  Caption = 'Cadastro de permiss'#245'es'
  ClientHeight = 462
  ClientWidth = 710
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitWidth = 746
  ExplicitHeight = 520
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel: TBevel [0]
    Left = 0
    Top = 60
    Width = 710
    Height = 5
    Align = alTop
    Shape = bsSpacer
    ExplicitTop = 65
    ExplicitWidth = 610
  end
  object gbxGrupoUsuario: TGroupBox [1]
    Left = 0
    Top = 0
    Width = 710
    Height = 60
    Align = alTop
    Caption = ' Grupo de usu'#225'rio '
    TabOrder = 0
    object cbGrupoUsuario: TcxComboBox
      Left = 16
      Top = 24
      Properties.DropDownListStyle = lsEditFixedList
      Properties.OnChange = cbGrupoUsuarioPropertiesChange
      TabOrder = 0
      Width = 353
    end
  end
  object grdPermissoes: TcxGrid [2]
    Left = 0
    Top = 65
    Width = 710
    Height = 397
    Align = alClient
    TabOrder = 1
    ExplicitHeight = 277
    object grdPermissoesDBTableView1: TcxGridDBTableView
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
      DataController.DataSource = dmPermissao.dsBase_Permissao
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      object grdPermissoesDBTableView1Nome_Programa: TcxGridDBColumn
        Caption = 'Programa'
        DataBinding.FieldName = 'Nome_Programa'
      end
      object grdPermissoesDBTableView1PERMITE_EXECUTAR: TcxGridDBColumn
        Caption = 'Executar'
        DataBinding.FieldName = 'PERMITE_EXECUTAR'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        HeaderAlignmentHorz = taCenter
      end
      object grdPermissoesDBTableView1PERMITE_INCLUIR: TcxGridDBColumn
        Caption = 'Incluir'
        DataBinding.FieldName = 'PERMITE_INCLUIR'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        HeaderAlignmentHorz = taCenter
      end
      object grdPermissoesDBTableView1PERMITE_EDITAR: TcxGridDBColumn
        Caption = 'Editar'
        DataBinding.FieldName = 'PERMITE_EDITAR'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        HeaderAlignmentHorz = taCenter
      end
      object grdPermissoesDBTableView1PERMITE_EXCLUIR: TcxGridDBColumn
        Caption = 'Excluir'
        DataBinding.FieldName = 'PERMITE_EXCLUIR'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        HeaderAlignmentHorz = taCenter
      end
    end
    object grdPermissoesDBTableView2: TcxGridDBTableView
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
      DataController.DataSource = dmPermissao.dsBase_Permissao_Adicional
      DataController.DetailKeyFieldNames = 'ID_BASE_PERMISSAO'
      DataController.KeyFieldNames = 'ID_BASE_PERMISSAO_ADICIONAL'
      DataController.MasterKeyFieldNames = 'ID_BASE_PERMISSAO'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      object grdPermissoesDBTableView2IDENTIFICADOR: TcxGridDBColumn
        Caption = 'Descri'#231#227'o'
        DataBinding.FieldName = 'DESCRICAO'
        Width = 393
      end
      object grdPermissoesDBTableView2PERMISSAO: TcxGridDBColumn
        Caption = 'Permitir'
        DataBinding.FieldName = 'PERMISSAO'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ImmediatePost = True
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        HeaderAlignmentHorz = taCenter
      end
    end
    object grdPermissoesLevel1: TcxGridLevel
      GridView = grdPermissoesDBTableView1
      object grdPermissoesLevel2: TcxGridLevel
        GridView = grdPermissoesDBTableView2
      end
    end
  end
  inherited FormLink: TJvEmbeddedFormLink
    Left = 512
    Top = 160
  end
  inherited Validador: TJvValidators
    Left = 512
    Top = 208
  end
end
