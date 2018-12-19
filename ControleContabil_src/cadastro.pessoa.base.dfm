inherited fmPessoaBase: TfmPessoaBase
  Caption = 'fmPessoaBase'
  ClientHeight = 429
  ExplicitWidth = 320
  ExplicitHeight = 487
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlCadBase: TPanel
    Height = 399
    ExplicitHeight = 429
    inherited pcCadastro: TRzPageControl
      Height = 399
      ActivePage = tsConsulta
      TabIndex = 0
      ExplicitHeight = 429
      FixedDimension = 20
      inherited tsConsulta: TRzTabSheet
        ExplicitHeight = 377
        inherited pnlConsulta: TPanel
          Height = 377
          ExplicitHeight = 377
          inherited dgConsulta: TcxGrid
            Height = 206
            ExplicitHeight = 236
            inherited dgConsultaDBTableView1: TcxGridDBTableView
              DataController.DataSource = dmPessoaBase.dsBase_Pessoa
              object dgConsultaDBTableView1Codigo: TcxGridDBColumn
                Caption = 'C'#243'digo'
                DataBinding.FieldName = 'CODIGO'
              end
              object dgConsultaDBTableView1RazaoSocial: TcxGridDBColumn
                Caption = 'Raz'#227'o Social'
                DataBinding.FieldName = 'RAZAO_SOCIAL'
              end
            end
          end
          inherited pnlFiltro: TPanel
            inherited fcFiltro: TcxDBFilterControl
              SortItems = True
            end
            inherited btnAplicarConsulta: TButton
              Top = 119
              ExplicitTop = 119
            end
            inherited btnLimparConsulta: TButton
              Top = 119
              ExplicitTop = 119
            end
            inherited btnFecharConsulta: TButton
              Top = 119
              ExplicitTop = 119
            end
          end
        end
      end
      inherited tsCadastro: TRzTabSheet
        ExplicitHeight = 407
        inherited pnl: TPanel
          Height = 377
          ExplicitHeight = 407
          inherited bvSepCadastro: TBevel
            Height = 357
            ExplicitHeight = 387
          end
          inherited stvCadastro: TJvSettingsTreeView
            Height = 357
            Items.Links = {0100000000000000}
            ExplicitHeight = 387
          end
          inherited pglCadastro: TJvPageList
            Height = 357
            ExplicitHeight = 357
            inherited pgPrincipal: TJvStandardPage
              Height = 357
              ExplicitHeight = 357
              inherited pnlCadastro: TPanel
                Height = 357
                ParentShowHint = False
                ShowHint = True
                ExplicitHeight = 357
                DesignSize = (
                  797
                  357)
                object lblCodigo: TLabel
                  Left = 10
                  Top = 10
                  Width = 33
                  Height = 14
                  Caption = 'C'#243'digo'
                end
                object lblRazaoSocial: TLabel
                  Left = 81
                  Top = 10
                  Width = 63
                  Height = 14
                  Caption = 'Raz'#227'o Social'
                end
                object lblNomeFantasia: TLabel
                  Left = 10
                  Top = 55
                  Width = 71
                  Height = 14
                  Caption = 'Nome Fantasia'
                end
                object lblTipoPessoa: TLabel
                  Left = 263
                  Top = 55
                  Width = 20
                  Height = 14
                  Caption = 'Tipo'
                end
                object lblDocumento: TLabel
                  Left = 359
                  Top = 55
                  Width = 54
                  Height = 14
                  Caption = 'Documento'
                end
                object lblEndereco: TLabel
                  Left = 10
                  Top = 100
                  Width = 46
                  Height = 14
                  Caption = 'Endere'#231'o'
                end
                object lblNroEndereco: TLabel
                  Left = 263
                  Top = 100
                  Width = 37
                  Height = 14
                  Caption = 'N'#250'mero'
                end
                object lblComplementoEndereco: TLabel
                  Left = 359
                  Top = 100
                  Width = 64
                  Height = 14
                  Caption = 'Complemento'
                end
                object lblCEP: TLabel
                  Left = 10
                  Top = 186
                  Width = 19
                  Height = 14
                  Caption = 'CEP'
                end
                object lblSite: TLabel
                  Left = 111
                  Top = 186
                  Width = 18
                  Height = 14
                  Caption = 'Site'
                end
                object lblContatos: TLabel
                  Left = 10
                  Top = 231
                  Width = 43
                  Height = 14
                  Caption = 'Contatos'
                end
                object lblCidade: TLabel
                  Left = 10
                  Top = 145
                  Width = 33
                  Height = 14
                  Caption = 'Cidade'
                end
                object lblEstado: TLabel
                  Left = 480
                  Top = 145
                  Width = 33
                  Height = 14
                  Caption = 'Estado'
                end
                object dteCodigo: TcxDBTextEdit
                  Left = 10
                  Top = 27
                  DataBinding.DataField = 'CODIGO'
                  DataBinding.DataSource = dmPessoaBase.dsBase_Pessoa
                  TabOrder = 0
                  Width = 65
                end
                object dteRazaoSocial: TcxDBTextEdit
                  Left = 81
                  Top = 27
                  DataBinding.DataField = 'RAZAO_SOCIAL'
                  DataBinding.DataSource = dmPessoaBase.dsBase_Pessoa
                  TabOrder = 1
                  Width = 456
                end
                object dteNomeFantasia: TcxDBTextEdit
                  Left = 10
                  Top = 72
                  DataBinding.DataField = 'NOME_FANTASIA'
                  DataBinding.DataSource = dmPessoaBase.dsBase_Pessoa
                  TabOrder = 2
                  Width = 247
                end
                object dlcTipoPessoa: TcxDBLookupComboBox
                  Left = 263
                  Top = 72
                  DataBinding.DataField = 'TIPO_PESSOA'
                  DataBinding.DataSource = dmPessoaBase.dsBase_Pessoa
                  Properties.KeyFieldNames = 'TIPO'
                  Properties.ListColumns = <
                    item
                      Caption = 'Descri'#231#227'o'
                      FieldName = 'DESCRICAO'
                    end>
                  Properties.ListSource = dmPessoaBase.dsTipo_Pessoa
                  TabOrder = 3
                  Width = 90
                end
                object dteEndereco: TcxDBTextEdit
                  Left = 10
                  Top = 117
                  DataBinding.DataField = 'ENDERECO'
                  DataBinding.DataSource = dmPessoaBase.dsBase_Pessoa
                  TabOrder = 5
                  Width = 247
                end
                object dteNroEndereco: TcxDBTextEdit
                  Left = 263
                  Top = 117
                  DataBinding.DataField = 'NUMERO'
                  DataBinding.DataSource = dmPessoaBase.dsBase_Pessoa
                  TabOrder = 6
                  Width = 90
                end
                object dteComplementoEndereco: TcxDBTextEdit
                  Left = 359
                  Top = 117
                  DataBinding.DataField = 'COMPLEMENTO'
                  DataBinding.DataSource = dmPessoaBase.dsBase_Pessoa
                  TabOrder = 7
                  Width = 178
                end
                object bedDocumento: TcxDBButtonEdit
                  Left = 359
                  Top = 72
                  DataBinding.DataField = 'DOCUMENTO'
                  DataBinding.DataSource = dmPessoaBase.dsBase_Pessoa
                  Properties.Buttons = <
                    item
                      Default = True
                      Hint = 'Clique aqui para abrir a valida'#231#227'o'
                      Kind = bkEllipsis
                    end>
                  Properties.OnButtonClick = bedDocumentoPropertiesButtonClick
                  TabOrder = 4
                  Width = 178
                end
                object bedCEP: TcxDBButtonEdit
                  Left = 10
                  Top = 203
                  DataBinding.DataField = 'CEP'
                  DataBinding.DataSource = dmPessoaBase.dsBase_Pessoa
                  Properties.Buttons = <
                    item
                      Default = True
                      Kind = bkEllipsis
                    end>
                  Properties.OnButtonClick = bedCEPPropertiesButtonClick
                  TabOrder = 10
                  Width = 95
                end
                object bedSite: TcxDBButtonEdit
                  Left = 111
                  Top = 203
                  DataBinding.DataField = 'SITE'
                  DataBinding.DataSource = dmPessoaBase.dsBase_Pessoa
                  Properties.Buttons = <
                    item
                      Default = True
                      Kind = bkEllipsis
                    end>
                  Properties.OnButtonClick = bedSitePropertiesButtonClick
                  TabOrder = 11
                  Width = 426
                end
                object grdContatos: TcxGrid
                  Left = 10
                  Top = 248
                  Width = 527
                  Height = 95
                  Anchors = [akLeft, akTop, akBottom]
                  TabOrder = 12
                  ExplicitHeight = 125
                  object grdContatosDBCardView: TcxGridDBCardView
                    NavigatorButtons.ConfirmDelete = False
                    NavigatorButtons.Insert.Visible = False
                    NavigatorButtons.Append.Visible = True
                    NavigatorButtons.Refresh.Visible = False
                    NavigatorButtons.SaveBookmark.Visible = False
                    NavigatorButtons.GotoBookmark.Enabled = False
                    NavigatorButtons.GotoBookmark.Visible = False
                    NavigatorButtons.Filter.Visible = False
                    DataController.DataSource = dmPessoaBase.dsBase_Pessoa_Contato
                    DataController.Summary.DefaultGroupSummaryItems = <>
                    DataController.Summary.FooterSummaryItems = <>
                    DataController.Summary.SummaryGroups = <>
                    LayoutDirection = ldVertical
                    OptionsBehavior.FocusCellOnTab = True
                    OptionsBehavior.FocusFirstCellOnNewRecord = True
                    OptionsBehavior.GoToNextCellOnEnter = True
                    OptionsData.Appending = True
                    OptionsView.Navigator = True
                    OptionsView.CardAutoWidth = True
                    OptionsView.CardWidth = 400
                    object grdContatosDBCardViewTIPO: TcxGridDBCardViewRow
                      Caption = 'Tipo'
                      DataBinding.FieldName = 'TIPO'
                      PropertiesClassName = 'TcxLookupComboBoxProperties'
                      Properties.KeyFieldNames = 'TIPO'
                      Properties.ListColumns = <
                        item
                          Caption = 'Descri'#231#227'o'
                          FieldName = 'DESCRICAO'
                        end>
                      Properties.ListSource = dmPessoaBase.dsTipo_Contato
                      Position.BeginsLayer = True
                    end
                    object grdContatosDBCardViewNOME: TcxGridDBCardViewRow
                      Caption = 'Contato'
                      DataBinding.FieldName = 'NOME'
                      Position.BeginsLayer = True
                    end
                    object grdContatosDBCardViewTELEFONE: TcxGridDBCardViewRow
                      Caption = 'Telefone'
                      DataBinding.FieldName = 'TELEFONE'
                      Position.BeginsLayer = True
                    end
                    object grdContatosDBCardViewEMAIL: TcxGridDBCardViewRow
                      Caption = 'E-mail'
                      DataBinding.FieldName = 'EMAIL'
                      PropertiesClassName = 'TcxButtonEditProperties'
                      Properties.Buttons = <
                        item
                          Default = True
                          Kind = bkEllipsis
                        end>
                      Properties.OnButtonClick = grdContatosDBCardViewEMAILPropertiesButtonClick
                      Position.BeginsLayer = True
                    end
                  end
                  object grdContatosLevel: TcxGridLevel
                    GridView = grdContatosDBCardView
                  end
                end
                object dteCidade: TcxDBTextEdit
                  Left = 10
                  Top = 162
                  DataBinding.DataField = 'CIDADE'
                  DataBinding.DataSource = dmPessoaBase.dsBase_Pessoa
                  TabOrder = 8
                  Width = 464
                end
                object dteEstado: TcxDBTextEdit
                  Left = 480
                  Top = 162
                  DataBinding.DataField = 'UF'
                  DataBinding.DataSource = dmPessoaBase.dsBase_Pessoa
                  TabOrder = 9
                  Width = 57
                end
              end
            end
          end
        end
      end
    end
  end
  inherited pnlBarraInferior: TPanel
    Top = 399
  end
  inherited Validador: TJvValidators
    Top = 72
  end
end
