inherited frmConsultarIndicadores: TfrmConsultarIndicadores
  BorderStyle = bsDialog
  BorderWidth = 10
  Caption = 'Consultar...'
  ClientHeight = 428
  ClientWidth = 595
  Position = poDesktopCenter
  ExplicitWidth = 621
  ExplicitHeight = 476
  PixelsPerInch = 96
  TextHeight = 13
  object grdConsultar: TcxGrid [0]
    Left = 0
    Top = 0
    Width = 595
    Height = 395
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 272
    ExplicitTop = 152
    ExplicitWidth = 250
    ExplicitHeight = 200
    object grdConsultarDBTableView1: TcxGridDBTableView
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
      DataController.DataSource = dmIndicadores.dsAcessos
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHorzSizing = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
    end
    object grdConsultarLevel1: TcxGridLevel
      GridView = grdConsultarDBTableView1
    end
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 395
    Width = 595
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 312
    ExplicitWidth = 489
    DesignSize = (
      595
      33)
    object btnOK: TButton
      Left = 520
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&OK'
      ModalResult = 1
      TabOrder = 0
      ExplicitLeft = 414
    end
  end
  object EnterAsTab: TJvEnterAsTab
    Left = 50
    Top = 128
  end
end
