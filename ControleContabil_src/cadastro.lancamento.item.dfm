inherited frmLancamentoItem: TfrmLancamentoItem
  Caption = 'Cadastro de itens para lan'#231'amento'
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlCadBase: TPanel
    ExplicitHeight = 392
    inherited pcCadastro: TRzPageControl
      ExplicitHeight = 392
      FixedDimension = 20
      inherited tsConsulta: TRzTabSheet
        ExplicitHeight = 370
        inherited pnlConsulta: TPanel
          ExplicitHeight = 370
          inherited dgConsulta: TcxGrid
            ExplicitHeight = 199
            inherited dgConsultaDBTableView1: TcxGridDBTableView
              DataController.DataSource = dmLancamentoItem.dsContab_Item_Lancamento
              object dgConsultaDBTableView1CODIGO: TcxGridDBColumn
                Caption = 'C'#243'digo'
                DataBinding.FieldName = 'CODIGO'
              end
              object dgConsultaDBTableView1DESCRICAO: TcxGridDBColumn
                Caption = 'Descri'#231#227'o'
                DataBinding.FieldName = 'DESCRICAO'
              end
            end
          end
        end
      end
      inherited tsCadastro: TRzTabSheet
        ExplicitHeight = 370
        inherited pnl: TPanel
          ExplicitHeight = 370
          inherited stvCadastro: TJvSettingsTreeView
            Items.Links = {0100000000000000}
            ExplicitHeight = 350
          end
          inherited pglCadastro: TJvPageList
            ExplicitHeight = 350
            inherited pgPrincipal: TJvStandardPage
              ExplicitHeight = 350
              inherited pnlCadastro: TPanel
                ExplicitHeight = 350
                object lblCodigo: TLabel
                  Left = 10
                  Top = 10
                  Width = 33
                  Height = 14
                  Caption = 'C'#243'digo'
                end
                object lblDescricao: TLabel
                  Left = 81
                  Top = 10
                  Width = 49
                  Height = 14
                  Caption = 'Descri'#231#227'o'
                end
                object lblValor: TLabel
                  Left = 10
                  Top = 55
                  Width = 25
                  Height = 14
                  Caption = 'Valor'
                end
                object dteCodigo: TcxDBTextEdit
                  Left = 10
                  Top = 27
                  DataBinding.DataField = 'CODIGO'
                  DataBinding.DataSource = dmLancamentoItem.dsContab_Item_Lancamento
                  TabOrder = 0
                  Width = 65
                end
                object dteDescricao: TcxDBTextEdit
                  Left = 81
                  Top = 27
                  DataBinding.DataField = 'DESCRICAO'
                  DataBinding.DataSource = dmLancamentoItem.dsContab_Item_Lancamento
                  TabOrder = 1
                  Width = 504
                end
                object dteValor: TcxDBCurrencyEdit
                  Left = 10
                  Top = 72
                  DataBinding.DataField = 'VALOR'
                  DataBinding.DataSource = dmLancamentoItem.dsContab_Item_Lancamento
                  TabOrder = 2
                  Width = 121
                end
              end
            end
          end
        end
      end
    end
  end
  inherited pnlBarraInferior: TPanel
    ExplicitTop = 392
  end
end
