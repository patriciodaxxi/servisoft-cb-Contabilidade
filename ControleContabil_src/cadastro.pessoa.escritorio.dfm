inherited frmCadEscritorio: TfrmCadEscritorio
  Caption = 'frmCadEscritorio'
  OnDestroy = FormDestroy
  ExplicitWidth = 1000
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlCadBase: TPanel
    inherited pcCadastro: TRzPageControl
      ActivePage = tsCadastro
      TabIndex = 1
      FixedDimension = 20
      inherited tsCadastro: TRzTabSheet
        inherited pnl: TPanel
          inherited stvCadastro: TJvSettingsTreeView
            Items.Links = {0100000000000000}
          end
          inherited pglCadastro: TJvPageList
            inherited pgPrincipal: TJvStandardPage
              inherited pnlCadastro: TPanel
                object lblLogotipo: TLabel [9]
                  Left = 562
                  Top = 10
                  Width = 41
                  Height = 14
                  Caption = 'Logotipo'
                end
                object Bevel1: TBevel [12]
                  Left = 553
                  Top = 4
                  Width = 16
                  Height = 378
                  Anchors = [akLeft, akTop, akBottom]
                  Shape = bsLeftLine
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
                object dimgLogotipo: TcxDBImage [23]
                  Left = 562
                  Top = 27
                  DataBinding.DataField = 'LOGOTIPO'
                  DataBinding.DataSource = dmCadEscritorio.dsContab_Escritorio
                  Properties.GraphicClassName = 'TJPEGImage'
                  TabOrder = 14
                  Height = 143
                  Width = 186
                end
                object btnExcluirImagem: TButton [24]
                  Left = 658
                  Top = 176
                  Width = 90
                  Height = 25
                  Action = actExcImagem
                  TabOrder = 15
                end
                object btnIncluirImagem: TButton [25]
                  Left = 562
                  Top = 176
                  Width = 90
                  Height = 25
                  Action = actIncImagem
                  TabOrder = 13
                end
                inherited bedCEP: TcxDBButtonEdit
                  ExplicitHeight = 22
                end
                inherited bedSite: TcxDBButtonEdit
                  ExplicitHeight = 22
                end
                inherited dteCidade: TcxDBTextEdit
                  ExplicitHeight = 22
                end
                inherited dteEstado: TcxDBTextEdit
                  ExplicitHeight = 22
                end
              end
            end
          end
        end
      end
    end
  end
  inherited aclCadastro: TActionList
    object actIncImagem: TAction
      Caption = 'Inc. Imagem'
      OnExecute = actIncImagemExecute
    end
    object actExcImagem: TAction
      Caption = 'Exc. Imagem'
      OnExecute = actExcImagemExecute
    end
  end
  object OpenPictureDialog: TOpenPictureDialog
    Filter = 'JPEG Image File (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg'
    Left = 48
    Top = 280
  end
end
