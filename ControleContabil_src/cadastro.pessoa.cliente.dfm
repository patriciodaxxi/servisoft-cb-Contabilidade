inherited frmCadCliente: TfrmCadCliente
  Caption = 'Cadastro de Contatos'
  ClientHeight = 488
  OnDestroy = FormDestroy
  ExplicitWidth = 1000
  ExplicitHeight = 546
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlCadBase: TPanel
    Height = 458
    ExplicitHeight = 458
    inherited pcCadastro: TRzPageControl
      Height = 458
      ActivePage = tsCadastro
      TabIndex = 1
      ExplicitHeight = 458
      FixedDimension = 20
      inherited tsConsulta: TRzTabSheet
        ExplicitHeight = 436
        inherited pnlConsulta: TPanel
          Height = 436
          ExplicitHeight = 436
          inherited dgConsulta: TcxGrid
            Height = 265
            ExplicitHeight = 265
          end
        end
      end
      inherited tsCadastro: TRzTabSheet
        ExplicitHeight = 436
        inherited pnl: TPanel
          Height = 436
          ExplicitHeight = 436
          inherited bvSepCadastro: TBevel
            Height = 416
            ExplicitHeight = 446
          end
          inherited stvCadastro: TJvSettingsTreeView
            Height = 416
            Items.NodeData = {
              0305000000300000000200000002000000FFFFFFFFFFFFFFFF00000000000000
              000000000001095000720069006E0063006900700061006C003E000000FFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFF00000000010000000000000001104400610064
              006F0073002000410064006900630069006F006E006100690073002C000000FF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000002000000000000000107410063
              006500730073006F00730038000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
              0000000300000000000000010D500061007200630065006C0061006D0065006E
              0074006F00730030000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000004
              00000000000000010941006E006F0074006100E700F50065007300}
            Items.Links = {050000000000000001000000020000000300000004000000}
            ExplicitHeight = 416
          end
          inherited pglCadastro: TJvPageList
            Height = 416
            ExplicitHeight = 416
            inherited pgPrincipal: TJvStandardPage
              Height = 416
              ExplicitHeight = 416
              inherited pnlCadastro: TPanel
                Height = 416
                ExplicitHeight = 416
                object Bevel: TBevel [13]
                  Left = 553
                  Top = 4
                  Width = 16
                  Height = 408
                  Anchors = [akLeft, akTop, akBottom]
                  Shape = bsLeftLine
                  ExplicitHeight = 379
                end
                object lblStatus: TLabel [14]
                  Left = 560
                  Top = 10
                  Width = 31
                  Height = 14
                  Caption = 'Status'
                end
                object lblDataCadastro: TLabel [15]
                  Left = 560
                  Top = 55
                  Width = 102
                  Height = 14
                  Caption = 'Data In'#237'cio Atividades'
                end
                object lblDataInativo: TLabel [16]
                  Left = 560
                  Top = 100
                  Width = 56
                  Height = 14
                  Caption = 'Data Inativo'
                end
                inherited dteCodigo: TcxDBTextEdit
                  ExplicitHeight = 22
                end
                inherited dteRazaoSocial: TcxDBTextEdit
                  ExplicitHeight = 22
                end
                inherited dteNomeFantasia: TcxDBTextEdit
                  ExplicitHeight = 22
                end
                inherited dlcTipoPessoa: TcxDBLookupComboBox
                  ExplicitHeight = 22
                end
                inherited dteEndereco: TcxDBTextEdit
                  ExplicitHeight = 22
                end
                inherited dteNroEndereco: TcxDBTextEdit
                  ExplicitHeight = 22
                end
                inherited dteComplementoEndereco: TcxDBTextEdit
                  ExplicitHeight = 22
                end
                inherited bedDocumento: TcxDBButtonEdit
                  ExplicitHeight = 22
                end
                inherited bedCEP: TcxDBButtonEdit
                  ExplicitHeight = 22
                end
                inherited bedSite: TcxDBButtonEdit
                  ExplicitHeight = 22
                end
                inherited grdContatos: TcxGrid
                  Height = 148
                  ExplicitHeight = 148
                end
                inherited dteCidade: TcxDBTextEdit
                  ExplicitHeight = 22
                end
                inherited dteEstado: TcxDBTextEdit
                  ExplicitHeight = 22
                end
                object dlcStatus: TcxDBLookupComboBox
                  Left = 560
                  Top = 27
                  DataBinding.DataField = 'STATUS'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  Properties.KeyFieldNames = 'CODIGO'
                  Properties.ListColumns = <
                    item
                      Caption = 'Descri'#231#227'o'
                      FieldName = 'DESCRICAO'
                    end>
                  Properties.ListSource = dmCadCliente.dsStatus
                  TabOrder = 13
                  Width = 193
                end
                object dteDataCadastro: TcxDBDateEdit
                  Left = 560
                  Top = 72
                  DataBinding.DataField = 'DATA_CADASTRO'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  TabOrder = 14
                  Width = 193
                end
                object dteDataInativo: TcxDBDateEdit
                  Left = 560
                  Top = 117
                  DataBinding.DataField = 'DATA_INATIVIDADE'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  TabOrder = 15
                  Width = 193
                end
                object pnlValores: TPanel
                  Left = 560
                  Top = 136
                  Width = 193
                  Height = 237
                  AutoSize = True
                  BevelOuter = bvNone
                  Caption = 'pnlValores'
                  ShowCaption = False
                  TabOrder = 16
                  object lblDataPagamento: TLabel
                    Left = 0
                    Top = 15
                    Width = 71
                    Height = 14
                    Caption = 'Dia Pagamento'
                  end
                  object lblValorHonorarios: TLabel
                    Left = 85
                    Top = 15
                    Width = 81
                    Height = 14
                    Caption = 'Valor Honor'#225'rios'
                  end
                  object lblHistorico: TLabel
                    Left = 0
                    Top = 60
                    Width = 108
                    Height = 14
                    Caption = 'Hist'#243'rico de Reajustes'
                  end
                  object Bevel1: TBevel
                    Left = 0
                    Top = 0
                    Width = 193
                    Height = 9
                    Shape = bsBottomLine
                  end
                  object dteDiaPagamento: TcxDBSpinEdit
                    Left = 0
                    Top = 32
                    DataBinding.DataField = 'DIA_PAGAMENTO'
                    DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                    Properties.MaxValue = 30.000000000000000000
                    Properties.MinValue = 1.000000000000000000
                    TabOrder = 0
                    Width = 79
                  end
                  object dteValorHonorarios: TcxDBCurrencyEdit
                    Left = 85
                    Top = 32
                    DataBinding.DataField = 'VALOR_HONORARIO'
                    DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                    TabOrder = 1
                    Width = 108
                  end
                  object grdHistoricoReajuste: TcxGrid
                    Left = 0
                    Top = 77
                    Width = 193
                    Height = 160
                    TabOrder = 2
                    object grdHistoricoReajusteDBTableView1: TcxGridDBTableView
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
                      DataController.DataSource = dmCadCliente.dsContab_Cliente_Reajuste
                      DataController.Summary.DefaultGroupSummaryItems = <>
                      DataController.Summary.FooterSummaryItems = <>
                      DataController.Summary.SummaryGroups = <>
                      OptionsView.GroupByBox = False
                      object grdHistoricoReajusteDBTableView1DATA: TcxGridDBColumn
                        Caption = 'Data'
                        DataBinding.FieldName = 'DATA'
                        PropertiesClassName = 'TcxDateEditProperties'
                        Properties.InputKind = ikRegExpr
                        Properties.ShowTime = False
                        Width = 82
                      end
                      object grdHistoricoReajusteDBTableView1VALOR_HONORARIO: TcxGridDBColumn
                        Caption = 'Valor Honor'#225'rios'
                        DataBinding.FieldName = 'VALOR_HONORARIO'
                        PropertiesClassName = 'TcxCurrencyEditProperties'
                        Width = 91
                      end
                    end
                    object grdHistoricoReajusteLevel1: TcxGridLevel
                      GridView = grdHistoricoReajusteDBTableView1
                    end
                  end
                end
              end
            end
            object pgDadosAdicionais: TJvStandardPage
              Left = 0
              Top = 0
              Width = 797
              Height = 416
              Caption = 'Dados Adicionais'
              object pnlDadosAdicionais: TPanel
                Left = 0
                Top = 0
                Width = 797
                Height = 416
                Align = alClient
                BevelInner = bvRaised
                BevelOuter = bvLowered
                Padding.Left = 10
                Padding.Top = 10
                Padding.Right = 10
                Padding.Bottom = 10
                TabOrder = 0
                object lblCNAE: TLabel
                  Left = 10
                  Top = 10
                  Width = 28
                  Height = 14
                  Caption = 'CNAE'
                end
                object lblNatJuridicaCodigo: TLabel
                  Left = 384
                  Top = 10
                  Width = 84
                  Height = 14
                  Caption = 'Natureza Jur'#237'dica'
                end
                object lblInscricaoEstadual: TLabel
                  Left = 10
                  Top = 55
                  Width = 88
                  Height = 14
                  Caption = 'Inscri'#231#227'o Estadual'
                end
                object lblInscricaoMunicipal: TLabel
                  Left = 175
                  Top = 55
                  Width = 91
                  Height = 14
                  Caption = 'Inscri'#231#227'o Municipal'
                end
                object lblConstituicao: TLabel
                  Left = 10
                  Top = 100
                  Width = 59
                  Height = 14
                  Caption = 'Constitui'#231#227'o'
                end
                object lblConstituicaoData: TLabel
                  Left = 287
                  Top = 100
                  Width = 22
                  Height = 14
                  Caption = 'Data'
                end
                object lblNIRE: TLabel
                  Left = 384
                  Top = 100
                  Width = 22
                  Height = 14
                  Caption = 'NIRE'
                end
                object lblNIREData: TLabel
                  Left = 661
                  Top = 100
                  Width = 22
                  Height = 14
                  Caption = 'Data'
                end
                object lblUltimaAlteracao: TLabel
                  Left = 10
                  Top = 145
                  Width = 77
                  Height = 14
                  Caption = #218'ltima Altera'#231#227'o'
                end
                object lblUltimaAlteracaoData: TLabel
                  Left = 287
                  Top = 145
                  Width = 22
                  Height = 14
                  Caption = 'Data'
                end
                object lblCapitalSocial: TLabel
                  Left = 386
                  Top = 145
                  Width = 64
                  Height = 14
                  Caption = 'Capital Social'
                end
                object lblSocioResponsavel: TLabel
                  Left = 12
                  Top = 206
                  Width = 93
                  Height = 14
                  Caption = 'S'#243'cio Respons'#225'vel'
                end
                object lblSocioResponsavelCPF: TLabel
                  Left = 289
                  Top = 206
                  Width = 19
                  Height = 14
                  Caption = 'CPF'
                end
                object lblSocioResponsavelParticipacao: TLabel
                  Left = 401
                  Top = 206
                  Width = 72
                  Height = 14
                  Caption = 'Participa'#231#227'o %'
                end
                object lblSocio1: TLabel
                  Left = 13
                  Top = 251
                  Width = 27
                  Height = 14
                  Caption = 'S'#243'cio'
                end
                object lblSocio1CPF: TLabel
                  Left = 289
                  Top = 251
                  Width = 19
                  Height = 14
                  Caption = 'CPF'
                end
                object lblSocio1Participacao: TLabel
                  Left = 401
                  Top = 251
                  Width = 72
                  Height = 14
                  Caption = 'Participa'#231#227'o %'
                end
                object lblSocio2: TLabel
                  Left = 13
                  Top = 296
                  Width = 27
                  Height = 14
                  Caption = 'S'#243'cio'
                end
                object lblSocio2CPF: TLabel
                  Left = 290
                  Top = 296
                  Width = 19
                  Height = 14
                  Caption = 'CPF'
                end
                object lblSocio2Particopacao: TLabel
                  Left = 402
                  Top = 296
                  Width = 72
                  Height = 14
                  Caption = 'Participa'#231#227'o %'
                end
                object lblSocio3: TLabel
                  Left = 13
                  Top = 341
                  Width = 27
                  Height = 14
                  Caption = 'S'#243'cio'
                end
                object lblSocio3CPF: TLabel
                  Left = 290
                  Top = 341
                  Width = 19
                  Height = 14
                  Caption = 'CPF'
                end
                object lblSocio3Participacao: TLabel
                  Left = 402
                  Top = 341
                  Width = 72
                  Height = 14
                  Caption = 'Participa'#231#227'o %'
                end
                object bv1: TBevel
                  Left = 490
                  Top = 189
                  Width = 27
                  Height = 191
                  Shape = bsLeftLine
                end
                object lblDadosResponsavel: TLabel
                  Left = 502
                  Top = 189
                  Width = 222
                  Height = 14
                  Caption = 'Dados do Respons'#225'vel -  Receita Federal'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold, fsUnderline]
                  ParentFont = False
                end
                object lblResponsavelDataNascimento: TLabel
                  Left = 502
                  Top = 206
                  Width = 72
                  Height = 14
                  Caption = 'Dt. Nascimento'
                end
                object lblResponsavelRG: TLabel
                  Left = 502
                  Top = 251
                  Width = 15
                  Height = 14
                  Caption = 'RG'
                end
                object lblResponsavelExpedicao: TLabel
                  Left = 629
                  Top = 251
                  Width = 50
                  Height = 14
                  Caption = 'Expedi'#231#227'o'
                end
                object lblReponsavelTituloEleitor: TLabel
                  Left = 502
                  Top = 296
                  Width = 72
                  Height = 14
                  Caption = 'T'#237'tulo de Eleitor'
                end
                object lblResponsavelZona: TLabel
                  Left = 580
                  Top = 296
                  Width = 25
                  Height = 14
                  Caption = 'Zona'
                end
                object lblResponsavelSecao: TLabel
                  Left = 639
                  Top = 296
                  Width = 31
                  Height = 14
                  Caption = 'Se'#231#227'o'
                end
                object lblResponsavelIRAtual: TLabel
                  Left = 502
                  Top = 341
                  Width = 106
                  Height = 14
                  Caption = 'Recibo IR Exerc. Atual'
                end
                object lblResponsavelIRAnterior: TLabel
                  Left = 629
                  Top = 341
                  Width = 101
                  Height = 14
                  Caption = 'Recibo IR Exerc. Ant.'
                end
                object lblDadosSocios: TLabel
                  Left = 13
                  Top = 189
                  Width = 98
                  Height = 14
                  Caption = 'Dados dos S'#243'cios'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold, fsUnderline]
                  ParentFont = False
                end
                object lblEnquadramentoFiscal: TLabel
                  Left = 340
                  Top = 55
                  Width = 106
                  Height = 14
                  Caption = 'Enquadramento Fiscal'
                end
                object lblTributacao: TLabel
                  Left = 545
                  Top = 55
                  Width = 51
                  Height = 14
                  Caption = 'Tributa'#231#227'o'
                end
                object dteCNAECodigo: TcxDBTextEdit
                  Left = 10
                  Top = 27
                  DataBinding.DataField = 'CNAE_CODIGO'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  TabOrder = 0
                  Width = 47
                end
                object dteCNAEDescricao: TcxDBButtonEdit
                  Left = 63
                  Top = 27
                  DataBinding.DataField = 'CNAE_DESCRICAO'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  Properties.Buttons = <
                    item
                      Default = True
                      Kind = bkEllipsis
                    end>
                  TabOrder = 1
                  Width = 313
                end
                object dteNatJuridicaCodigo: TcxDBTextEdit
                  Left = 384
                  Top = 27
                  DataBinding.DataField = 'NAT_JUR_CODIGO'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  TabOrder = 2
                  Width = 47
                end
                object dteNatJuridicaDescricao: TcxDBButtonEdit
                  Left = 437
                  Top = 27
                  DataBinding.DataField = 'NAT_JUR_DESCRICAO'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  Properties.Buttons = <
                    item
                      Default = True
                      Kind = bkEllipsis
                    end>
                  TabOrder = 3
                  Width = 313
                end
                object dteIscricaoEstadual: TcxDBTextEdit
                  Left = 10
                  Top = 72
                  DataBinding.DataField = 'INSCRICAO_ESTADUAL'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  TabOrder = 4
                  Width = 159
                end
                object dteInscricaoMunicipal: TcxDBTextEdit
                  Left = 175
                  Top = 72
                  DataBinding.DataField = 'INSCRICAO_MUNICIPAL'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  TabOrder = 5
                  Width = 159
                end
                object dteConstituicao: TcxDBTextEdit
                  Left = 10
                  Top = 117
                  DataBinding.DataField = 'CONSTITUICAO'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  TabOrder = 6
                  Width = 271
                end
                object dteConstituicaoData: TcxDBDateEdit
                  Left = 287
                  Top = 117
                  DataBinding.DataField = 'CONSTITUICAO_DATA'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  TabOrder = 7
                  Width = 89
                end
                object dteNIRE: TcxDBTextEdit
                  Left = 384
                  Top = 117
                  DataBinding.DataField = 'NIRE'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  TabOrder = 8
                  Width = 271
                end
                object dteNIREData: TcxDBDateEdit
                  Left = 661
                  Top = 117
                  DataBinding.DataField = 'NIRE_DATA'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  TabOrder = 9
                  Width = 89
                end
                object dteUltimaAlteracao: TcxDBTextEdit
                  Left = 10
                  Top = 162
                  DataBinding.DataField = 'ULT_ALTERACAO'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  TabOrder = 10
                  Width = 271
                end
                object edtUltimaAlteracaoData: TcxDBDateEdit
                  Left = 287
                  Top = 162
                  DataBinding.DataField = 'ULT_ALTERACAO_DATA'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  TabOrder = 11
                  Width = 89
                end
                object edtCapitalSocial: TcxDBCurrencyEdit
                  Left = 386
                  Top = 162
                  DataBinding.DataField = 'CAPITAL_SOCIAL'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  TabOrder = 12
                  Width = 183
                end
                object dteSocioResponsavel: TcxDBTextEdit
                  Left = 12
                  Top = 223
                  DataBinding.DataField = 'SOCIO_RESPONSAVEL_NOME'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  TabOrder = 13
                  Width = 271
                end
                object dteSocioResponsavelCPF: TcxDBTextEdit
                  Left = 289
                  Top = 223
                  DataBinding.DataField = 'SOCIO_RESPONSAVEL_CPF'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  TabOrder = 14
                  Width = 106
                end
                object dteSocio1: TcxDBTextEdit
                  Left = 12
                  Top = 268
                  DataBinding.DataField = 'SOCIO_1_NOME'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  TabOrder = 15
                  Width = 271
                end
                object dteSocio1CPF: TcxDBTextEdit
                  Left = 289
                  Top = 268
                  DataBinding.DataField = 'SOCIO_1_CPF'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  TabOrder = 16
                  Width = 106
                end
                object dteSocio2: TcxDBTextEdit
                  Left = 13
                  Top = 313
                  DataBinding.DataField = 'SOCIO_2_NOME'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  TabOrder = 17
                  Width = 271
                end
                object dteSocio2CPF: TcxDBTextEdit
                  Left = 290
                  Top = 313
                  DataBinding.DataField = 'SOCIO_2_CPF'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  TabOrder = 18
                  Width = 106
                end
                object dteSocio3: TcxDBTextEdit
                  Left = 13
                  Top = 358
                  DataBinding.DataField = 'SOCIO_3_NOME'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  TabOrder = 19
                  Width = 271
                end
                object dteSocio3CPF: TcxDBTextEdit
                  Left = 290
                  Top = 358
                  DataBinding.DataField = 'SOCIO_3_CPF'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  TabOrder = 20
                  Width = 106
                end
                object dteResponsavelDataNascimento: TcxDBDateEdit
                  Left = 502
                  Top = 223
                  DataBinding.DataField = 'SOCIO_RESPONSAVEL_NASC'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  TabOrder = 21
                  Width = 89
                end
                object dteResponsavelRG: TcxDBTextEdit
                  Left = 502
                  Top = 268
                  DataBinding.DataField = 'SOCIO_RESPONSAVEL_RG'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  TabOrder = 22
                  Width = 121
                end
                object dteResponsavelExpedicao: TcxDBTextEdit
                  Left = 628
                  Top = 268
                  DataBinding.DataField = 'SOCIO_RESPONSAVEL_EXPED'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  TabOrder = 23
                  Width = 122
                end
                object dteResponsaveTituloEleitor: TcxDBTextEdit
                  Left = 502
                  Top = 313
                  DataBinding.DataField = 'SOCIO_RESPONSAVEL_TITULO'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  TabOrder = 24
                  Width = 72
                end
                object dteResponsavelZona: TcxDBTextEdit
                  Left = 580
                  Top = 313
                  DataBinding.DataField = 'SOCIO_RESPONSAVEL_ZONA'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  TabOrder = 25
                  Width = 53
                end
                object dteResponsavelSecao: TcxDBTextEdit
                  Left = 639
                  Top = 313
                  DataBinding.DataField = 'SOCIO_RESPONSAVEL_SECAO'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  TabOrder = 26
                  Width = 111
                end
                object dteResponsavelIRAtual: TcxDBTextEdit
                  Left = 502
                  Top = 358
                  DataBinding.DataField = 'SOCIO_RESPONSAVEL_IR_ATUAL'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  TabOrder = 27
                  Width = 121
                end
                object dteResponsavelIRAnterior: TcxDBTextEdit
                  Left = 629
                  Top = 358
                  DataBinding.DataField = 'SOCIO_RESPONSAVEL_IR_ANTERIOR'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  TabOrder = 28
                  Width = 121
                end
                object dteSocioResponsavelParticipacao: TcxDBCurrencyEdit
                  Left = 402
                  Top = 223
                  DataBinding.DataField = 'SOCIO_RESPONSAVEL_PARTIC'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  Properties.DisplayFormat = ',0.00%;-,0.00%'
                  TabOrder = 29
                  Width = 82
                end
                object dteSocio1Participacao: TcxDBCurrencyEdit
                  Left = 402
                  Top = 268
                  DataBinding.DataField = 'SOCIO_1_PARTIC'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  Properties.DisplayFormat = ',0.00%;-,0.00%'
                  TabOrder = 30
                  Width = 82
                end
                object dteSocio2Participacao: TcxDBCurrencyEdit
                  Left = 402
                  Top = 313
                  DataBinding.DataField = 'SOCIO_2_PARTIC'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  Properties.DisplayFormat = ',0.00%;-,0.00%'
                  TabOrder = 31
                  Width = 82
                end
                object dteSocio3Participacao: TcxDBCurrencyEdit
                  Left = 402
                  Top = 358
                  DataBinding.DataField = 'SOCIO_3_PARTIC'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  Properties.DisplayFormat = ',0.00%;-,0.00%'
                  TabOrder = 32
                  Width = 82
                end
                object dlcEnquadramentoFiscal: TcxDBLookupComboBox
                  Left = 340
                  Top = 72
                  DataBinding.DataField = 'ENQUADRAMENTO_FISCAL'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  Properties.KeyFieldNames = 'OID_ENQUAD_FISCAL'
                  Properties.ListColumns = <
                    item
                      Caption = 'Descri'#231#227'o'
                      FieldName = 'DESCRICAO'
                    end>
                  Properties.ListSource = dmCadCliente.dsEnqFiscal
                  TabOrder = 33
                  Width = 202
                end
                object dlcTributacao: TcxDBLookupComboBox
                  Left = 548
                  Top = 72
                  DataBinding.DataField = 'TRIBUTACAO'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  Properties.KeyFieldNames = 'OID_CONTAB_TRIBUTACAO'
                  Properties.ListColumns = <
                    item
                      Caption = 'Descri'#231#227'o'
                      FieldName = 'DESCRICAO'
                    end>
                  Properties.ListSource = dmCadCliente.dsTributacao
                  TabOrder = 34
                  Width = 202
                end
              end
            end
            object pgAcessos: TJvStandardPage
              Left = 0
              Top = 0
              Width = 797
              Height = 416
              Caption = 'Acessos'
              object pnlAcessos: TPanel
                Left = 0
                Top = 0
                Width = 797
                Height = 416
                Align = alClient
                BevelInner = bvRaised
                BevelOuter = bvLowered
                Padding.Left = 10
                Padding.Top = 10
                Padding.Right = 10
                Padding.Bottom = 10
                TabOrder = 0
                object grdAcessos: TcxGrid
                  Left = 12
                  Top = 12
                  Width = 773
                  Height = 392
                  Align = alClient
                  TabOrder = 0
                  object grdAcessosDBBandedTableView1: TcxGridDBBandedTableView
                    NavigatorButtons.ConfirmDelete = False
                    NavigatorButtons.Insert.Visible = False
                    NavigatorButtons.Append.Visible = True
                    NavigatorButtons.Refresh.Visible = False
                    NavigatorButtons.SaveBookmark.Visible = False
                    NavigatorButtons.GotoBookmark.Visible = False
                    NavigatorButtons.Filter.Visible = False
                    DataController.DataSource = dmCadCliente.dsContab_Cliente_Acesso
                    DataController.Summary.DefaultGroupSummaryItems = <>
                    DataController.Summary.FooterSummaryItems = <>
                    DataController.Summary.SummaryGroups = <>
                    OptionsView.Navigator = True
                    OptionsView.GroupByBox = False
                    OptionsView.GroupRowStyle = grsOffice11
                    OptionsView.BandHeaders = False
                    Bands = <
                      item
                      end>
                    object grdAcessosDBBandedTableView1TIPO_ACESSO: TcxGridDBBandedColumn
                      Caption = 'Tipo de acesso'
                      DataBinding.FieldName = 'TIPO_ACESSO'
                      PropertiesClassName = 'TcxLookupComboBoxProperties'
                      Properties.ImmediatePost = True
                      Properties.KeyFieldNames = 'OID_CONTAB_TIPO_ACESSO'
                      Properties.ListColumns = <
                        item
                          Caption = 'Descri'#231#227'o'
                          FieldName = 'DESCRICAO'
                        end>
                      Properties.ListSource = dmCadCliente.dsTipoAcesso
                      Properties.OnChange = grdAcessosDBBandedTableView1TIPO_ACESSOPropertiesChange
                      Width = 128
                      Position.BandIndex = 0
                      Position.ColIndex = 0
                      Position.RowIndex = 0
                    end
                    object grdAcessosDBBandedTableView1DESCRICAO: TcxGridDBBandedColumn
                      Caption = 'Descri'#231#227'o'
                      DataBinding.FieldName = 'DESCRICAO'
                      Width = 352
                      Position.BandIndex = 0
                      Position.ColIndex = 1
                      Position.RowIndex = 0
                    end
                    object grdAcessosDBBandedTableView1LOGIN: TcxGridDBBandedColumn
                      Caption = 'C'#243'digo/Login'
                      DataBinding.FieldName = 'LOGIN'
                      Width = 103
                      Position.BandIndex = 0
                      Position.ColIndex = 2
                      Position.RowIndex = 0
                    end
                    object grdAcessosDBBandedTableView1SENHA: TcxGridDBBandedColumn
                      Caption = 'Senha/PIN'
                      DataBinding.FieldName = 'SENHA'
                      Width = 126
                      Position.BandIndex = 0
                      Position.ColIndex = 3
                      Position.RowIndex = 0
                    end
                    object grdAcessosDBBandedTableView1PUK: TcxGridDBBandedColumn
                      DataBinding.FieldName = 'PUK'
                      Width = 107
                      Position.BandIndex = 0
                      Position.ColIndex = 4
                      Position.RowIndex = 0
                    end
                    object grdAcessosDBBandedTableView1VALIDADE: TcxGridDBBandedColumn
                      Caption = 'Validade'
                      DataBinding.FieldName = 'VALIDADE'
                      Width = 128
                      Position.BandIndex = 0
                      Position.ColIndex = 5
                      Position.RowIndex = 0
                    end
                    object grdAcessosDBBandedTableView1OBS: TcxGridDBBandedColumn
                      Caption = 'Observa'#231#245'es'
                      DataBinding.FieldName = 'OBS'
                      Width = 474
                      Position.BandIndex = 0
                      Position.ColIndex = 6
                      Position.RowIndex = 0
                    end
                  end
                  object grdAcessosLevel1: TcxGridLevel
                    GridView = grdAcessosDBBandedTableView1
                  end
                end
              end
            end
            object pgParcelamentos: TJvStandardPage
              Left = 0
              Top = 0
              Width = 797
              Height = 416
              Caption = 'Parcelamentos'
              object pnlParcelamentos: TPanel
                Left = 0
                Top = 0
                Width = 797
                Height = 416
                Align = alClient
                BevelInner = bvRaised
                BevelOuter = bvLowered
                Padding.Left = 10
                Padding.Top = 10
                Padding.Right = 10
                Padding.Bottom = 10
                TabOrder = 0
                object lblParcelamentoFederal: TLabel
                  Left = 10
                  Top = 10
                  Width = 36
                  Height = 14
                  Caption = 'Federal'
                end
                object lblParcelamentoEstadual: TLabel
                  Left = 401
                  Top = 10
                  Width = 41
                  Height = 14
                  Caption = 'Estadual'
                end
                object lblParcelamentoMunicipal: TLabel
                  Left = 10
                  Top = 133
                  Width = 44
                  Height = 14
                  Caption = 'Municipal'
                end
                object lblParcelamentoPrevidenciario: TLabel
                  Left = 401
                  Top = 133
                  Width = 68
                  Height = 14
                  Caption = 'Previdenci'#225'rio'
                end
                object lblParcelamentoFGTS: TLabel
                  Left = 10
                  Top = 256
                  Width = 27
                  Height = 14
                  Caption = 'FGTS'
                end
                object lblParcelamentoOutros: TLabel
                  Left = 401
                  Top = 256
                  Width = 33
                  Height = 14
                  Caption = 'Outros'
                end
                object dmeParcelamentoFederal: TcxDBMemo
                  Left = 10
                  Top = 27
                  DataBinding.DataField = 'PARCELAMENTO_FEDERAL'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  TabOrder = 0
                  Height = 100
                  Width = 385
                end
                object dmeParcelamentoEstadual: TcxDBMemo
                  Left = 401
                  Top = 27
                  DataBinding.DataField = 'PARCELAMENTO_ESTADUAL'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  TabOrder = 1
                  Height = 100
                  Width = 385
                end
                object dmeParcelamentoMunicipal: TcxDBMemo
                  Left = 10
                  Top = 150
                  DataBinding.DataField = 'PARCELAMENTO_MUNICIPAL'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  TabOrder = 2
                  Height = 100
                  Width = 385
                end
                object dmeParcelamentoPrevidenciario: TcxDBMemo
                  Left = 401
                  Top = 150
                  DataBinding.DataField = 'PARCELAMENTO_PREVIDENCIARIO'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  TabOrder = 3
                  Height = 100
                  Width = 385
                end
                object dmeParcelamentoFGTS: TcxDBMemo
                  Left = 10
                  Top = 273
                  DataBinding.DataField = 'PARCELAMENTO_FGTS'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  TabOrder = 4
                  Height = 100
                  Width = 385
                end
                object dmeParcelamentoOutros: TcxDBMemo
                  Left = 401
                  Top = 273
                  DataBinding.DataField = 'PARCELAMENTO_OUTROS'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  TabOrder = 5
                  Height = 100
                  Width = 385
                end
              end
            end
            object pgAnotacoes: TJvStandardPage
              Left = 0
              Top = 0
              Width = 797
              Height = 416
              Caption = 'Anota'#231#245'es'
              object pnlAnotacoes: TPanel
                Left = 0
                Top = 0
                Width = 797
                Height = 416
                Align = alClient
                BevelInner = bvRaised
                BevelOuter = bvLowered
                Padding.Left = 10
                Padding.Top = 10
                Padding.Right = 10
                Padding.Bottom = 10
                TabOrder = 0
                object dmeAnotacoes: TcxDBMemo
                  Left = 12
                  Top = 12
                  Align = alClient
                  DataBinding.DataField = 'ANOTACOES'
                  DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                  TabOrder = 0
                  ExplicitHeight = 392
                  Height = 212
                  Width = 773
                end
                object pnlAnotacoesSigilosas: TPanel
                  Left = 12
                  Top = 224
                  Width = 773
                  Height = 180
                  Align = alBottom
                  BevelOuter = bvNone
                  Caption = 'pnlAnotacoesSigilosas'
                  ShowCaption = False
                  TabOrder = 1
                  object gbxAnotacoesSigilosas: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 773
                    Height = 180
                    Align = alClient
                    Caption = ' Anota'#231#227'o sigilosa'
                    TabOrder = 0
                    ExplicitLeft = -6
                    ExplicitTop = 32
                    DesignSize = (
                      773
                      180)
                    object lblSigilosaDataHora: TLabel
                      Left = 16
                      Top = 40
                      Width = 48
                      Height = 14
                      Caption = 'Data/Hora'
                    end
                    object lblSigilosaAnotacao: TLabel
                      Left = 143
                      Top = 16
                      Width = 94
                      Height = 14
                      Caption = 'lblSigilosaAnotacao'
                    end
                    object ckSigilosaMostrarMensagem: TcxDBCheckBox
                      Left = 11
                      Top = 16
                      Caption = 'Mostrar mensagem'
                      DataBinding.DataField = 'SIGILOSA_MOSTAR_MENSAGEM'
                      DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                      Properties.ValueChecked = '1'
                      Properties.ValueUnchecked = '0'
                      TabOrder = 0
                      Width = 121
                    end
                    object dteSigilosaDataHora: TcxDBDateEdit
                      Left = 16
                      Top = 57
                      DataBinding.DataField = 'SIGILOSA_DATA_HORA'
                      DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                      Properties.Kind = ckDateTime
                      TabOrder = 1
                      Width = 121
                    end
                    object dmeSigilosaAnotacao: TcxDBMemo
                      Left = 143
                      Top = 33
                      Anchors = [akLeft, akTop, akRight, akBottom]
                      DataBinding.DataField = 'SIGILOSA_ANOTACAO'
                      DataBinding.DataSource = dmCadCliente.dsContab_Cliente
                      TabOrder = 2
                      Height = 139
                      Width = 621
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  inherited pnlBarraInferior: TPanel
    Top = 458
    ExplicitTop = 458
  end
end
