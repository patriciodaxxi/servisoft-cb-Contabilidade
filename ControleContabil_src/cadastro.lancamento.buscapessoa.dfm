inherited frmBuscaPessoa: TfrmBuscaPessoa
  BorderStyle = bsDialog
  BorderWidth = 10
  Caption = 'Localizar pessoa...'
  ClientHeight = 360
  ClientWidth = 491
  Position = poDesktopCenter
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 517
  ExplicitHeight = 408
  PixelsPerInch = 96
  TextHeight = 13
  object grBusca: TcxGrid [0]
    Left = 0
    Top = 0
    Width = 491
    Height = 329
    Align = alClient
    TabOrder = 0
    object grBuscaDBTableView1: TcxGridDBTableView
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
      FilterBox.Visible = fvAlways
      DataController.DataSource = dsPessoas
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      object grBuscaDBTableView1CODIGO: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'CODIGO'
      end
      object grBuscaDBTableView1RAZAO_SOCIAL: TcxGridDBColumn
        Caption = 'Nome'
        DataBinding.FieldName = 'RAZAO_SOCIAL'
        Width = 388
      end
    end
    object grBuscaLevel1: TcxGridLevel
      GridView = grBuscaDBTableView1
    end
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 329
    Width = 491
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      491
      31)
    object btnOK: TButton
      Left = 335
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Ok'
      ModalResult = 1
      TabOrder = 0
    end
    object btnCancelar: TButton
      Left = 416
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object btnCadastrar: TButton
      Left = 0
      Top = 6
      Width = 129
      Height = 25
      Caption = 'Cadastrar contato'
      TabOrder = 2
      OnClick = btnCadastrarClick
    end
  end
  object sdsPessoas: TSimpleDataSet
    Aggregates = <>
    Connection = dmDados.soConexao
    DataSet.CommandText = 
      'SELECT ID_PESSOA'#13#10'     ,  CODIGO'#13#10'     , RAZAO_SOCIAL'#13#10'  FROM BA' +
      'SE_PESSOA A'#13#10' WHERE CATEGORIA_CADASTRO = :CATEGORIA_CADASTRO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftString
        Name = 'CATEGORIA_CADASTRO'
        ParamType = ptInput
      end>
    Params = <>
    Left = 48
    Top = 136
    object sdsPessoasCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object sdsPessoasRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Required = True
      Size = 65
    end
    object sdsPessoasID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      Required = True
    end
  end
  object dsPessoas: TDataSource
    DataSet = sdsPessoas
    Left = 48
    Top = 184
  end
  object EnterAsTab: TJvEnterAsTab
    Left = 104
    Top = 80
  end
end
