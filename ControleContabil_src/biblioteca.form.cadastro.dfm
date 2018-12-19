inherited frmCadBase: TfrmCadBase
  Left = 428
  Top = 258
  BorderWidth = 10
  Caption = 'frmCadBase'
  ClientHeight = 422
  ClientWidth = 964
  OldCreateOrder = True
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 1000
  ExplicitHeight = 480
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCadBase: TPanel [0]
    Left = 0
    Top = 0
    Width = 964
    Height = 392
    Align = alClient
    BevelOuter = bvNone
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 0
    ExplicitHeight = 422
    object pcCadastro: TRzPageControl
      Left = 0
      Top = 0
      Width = 964
      Height = 392
      ActivePage = tsCadastro
      ActivePageDefault = tsConsulta
      Align = alClient
      BoldCurrentTab = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ShowShadow = False
      TabIndex = 1
      TabOrder = 0
      TabStop = False
      OnChange = pcCadastroChange
      OnEnter = pcCadastroTabClick
      OnTabClick = pcCadastroTabClick
      ExplicitHeight = 422
      FixedDimension = 20
      object tsConsulta: TRzTabSheet
        Caption = 'Consulta'
        ExplicitHeight = 400
        object pnlConsulta: TPanel
          Left = 0
          Top = 0
          Width = 962
          Height = 370
          Align = alClient
          BevelOuter = bvNone
          BorderWidth = 10
          TabOrder = 0
          ExplicitHeight = 400
          object dgConsulta: TcxGrid
            Left = 10
            Top = 161
            Width = 942
            Height = 199
            Align = alClient
            TabOrder = 0
            ExplicitHeight = 229
            object dgConsultaDBTableView1: TcxGridDBTableView
              NavigatorButtons.ConfirmDelete = False
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
            end
            object dgConsultaLevel1: TcxGridLevel
              GridView = dgConsultaDBTableView1
            end
          end
          object pnlFiltro: TPanel
            Left = 10
            Top = 10
            Width = 942
            Height = 151
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            Visible = False
            DesignSize = (
              942
              151)
            object fcFiltro: TcxDBFilterControl
              Left = 0
              Top = 0
              Width = 942
              Height = 113
              Align = alTop
              Items = <>
              FilterOptions.DateTimeFormat = 'dd/mm/yyyy'
              FilterOptions.TranslateBetween = True
              FilterOptions.TranslateIn = True
              FilterOptions.TranslateLike = True
              TabOrder = 0
            end
            object btnAplicarConsulta: TButton
              Left = 650
              Top = 120
              Width = 75
              Height = 25
              Anchors = [akTop, akRight]
              Caption = 'Aplicar'
              TabOrder = 1
              OnClick = btnAplicarConsultaClick
            end
            object btnLimparConsulta: TButton
              Left = 731
              Top = 120
              Width = 75
              Height = 25
              Anchors = [akTop, akRight]
              Caption = 'Limpar'
              TabOrder = 2
              OnClick = btnLimparConsultaClick
            end
            object btnFecharConsulta: TButton
              Left = 825
              Top = 120
              Width = 117
              Height = 25
              Anchors = [akTop, akRight]
              Caption = 'Fechar consulta'
              TabOrder = 3
              OnClick = btnFecharConsultaClick
            end
          end
        end
      end
      object tsCadastro: TRzTabSheet
        Caption = 'Cadastro'
        ExplicitHeight = 359
        object pnl: TPanel
          Left = 0
          Top = 0
          Width = 962
          Height = 370
          Align = alClient
          BevelOuter = bvNone
          BorderWidth = 10
          TabOrder = 0
          ExplicitHeight = 359
          object bvSepCadastro: TBevel
            Left = 150
            Top = 10
            Width = 5
            Height = 350
            Align = alLeft
            Shape = bsSpacer
            ExplicitLeft = 153
            ExplicitHeight = 380
          end
          object stvCadastro: TJvSettingsTreeView
            Left = 10
            Top = 10
            Width = 140
            Height = 350
            PageDefault = 0
            PageList = pglCadastro
            Align = alLeft
            HideSelection = False
            Indent = 19
            RowSelect = True
            TabOrder = 1
            Items.NodeData = {
              0301000000300000000200000002000000FFFFFFFFFFFFFFFF00000000000000
              000000000001095000720069006E0063006900700061006C00}
            Items.Links = {0100000000000000}
            ExplicitHeight = 339
          end
          object pglCadastro: TJvPageList
            Left = 155
            Top = 10
            Width = 797
            Height = 350
            ActivePage = pgPrincipal
            PropagateEnable = False
            Align = alClient
            ExplicitHeight = 339
            object pgPrincipal: TJvStandardPage
              Left = 0
              Top = 0
              Width = 797
              Height = 350
              Caption = 'Principal'
              ExplicitHeight = 339
              object pnlCadastro: TPanel
                Left = 0
                Top = 0
                Width = 797
                Height = 350
                Align = alClient
                BevelInner = bvRaised
                BevelOuter = bvLowered
                Ctl3D = True
                ParentCtl3D = False
                TabOrder = 0
                ExplicitHeight = 339
              end
            end
          end
        end
      end
    end
  end
  object pnlBarraInferior: TPanel [1]
    Left = 0
    Top = 392
    Width = 964
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    Visible = False
    ExplicitTop = 391
    DesignSize = (
      964
      30)
    object btnSalvar: TButton
      Left = 808
      Top = 6
      Width = 75
      Height = 25
      Hint = 'Salvar'
      Anchors = [akTop, akRight]
      Caption = 'Salvar'
      ImageIndex = 4
      ModalResult = 1
      TabOrder = 0
      OnClick = btnSalvarClick
    end
    object btnCancelar: TButton
      Left = 889
      Top = 6
      Width = 75
      Height = 25
      Action = actCancelar
      Anchors = [akTop, akRight]
      ModalResult = 2
      TabOrder = 1
    end
  end
  object aclCadastro: TActionList
    OnUpdate = aclCadastroUpdate
    Left = 49
    Top = 228
    object actConsultar: TAction
      Caption = 'Consultar'
      Hint = 'Consultar'
      ImageIndex = 6
      ShortCut = 16497
      OnExecute = actConsultarExecute
    end
    object actPrimeiro: TAction
      Caption = 'Primeiro'
      Hint = 'Primeiro'
      ImageIndex = 8
      ShortCut = 16498
      OnExecute = actPrimeiroExecute
    end
    object actAnterior: TAction
      Caption = 'Anterior'
      Hint = 'Anterior'
      ImageIndex = 9
      ShortCut = 16499
      OnExecute = actAnteriorExecute
    end
    object actProximo: TAction
      Caption = 'Pr'#243'ximo'
      Hint = 'Proximo'
      ImageIndex = 10
      ShortCut = 16500
      OnExecute = actProximoExecute
    end
    object actUltimo: TAction
      Caption = #218'ltimo'
      Hint = #218'ltimo'
      ImageIndex = 11
      ShortCut = 16501
      OnExecute = actUltimoExecute
    end
    object actIncluir: TAction
      Caption = 'Incluir'
      Hint = 'Incluir'
      ImageIndex = 1
      ShortCut = 16502
      OnExecute = actIncluirExecute
    end
    object actEditar: TAction
      Caption = 'Editar'
      Hint = 'Editar'
      ImageIndex = 2
      ShortCut = 16503
      OnExecute = actEditarExecute
    end
    object actExcluir: TAction
      Caption = 'Excluir'
      Hint = 'Excluir'
      ImageIndex = 3
      ShortCut = 16504
      OnExecute = actExcluirExecute
    end
    object actSalvar: TAction
      Caption = 'Salvar'
      Hint = 'Salvar'
      ImageIndex = 4
      ShortCut = 16505
      OnExecute = actSalvarExecute
    end
    object actCancelar: TAction
      Caption = 'Cancelar'
      Hint = 'Cancelar'
      ImageIndex = 5
      ShortCut = 16506
      OnExecute = actCancelarExecute
    end
    object actVisualizar: TAction
      Caption = 'actVisualizar'
      ImageIndex = 1
      ShortCut = 16507
      OnExecute = actVisualizarExecute
    end
  end
  object EnterAsTab: TJvEnterAsTab
    Left = 104
    Top = 80
  end
end
