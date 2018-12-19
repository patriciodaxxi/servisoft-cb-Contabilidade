inherited frmCadFuncionario: TfrmCadFuncionario
  Caption = 'Cadastro de funcion'#225'rio'
  OnDestroy = FormDestroy
  ExplicitWidth = 1000
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlCadBase: TPanel
    ExplicitHeight = 399
    inherited pcCadastro: TRzPageControl
      ActivePage = tsCadastro
      TabIndex = 1
      ExplicitHeight = 399
      FixedDimension = 20
      inherited tsConsulta: TRzTabSheet
        inherited pnlConsulta: TPanel
          inherited dgConsulta: TcxGrid
            ExplicitHeight = 206
            inherited dgConsultaDBTableView1: TcxGridDBTableView
              object dgConsultaDBTableView1Column1: TcxGridDBColumn
                Caption = 'Login'
                DataBinding.FieldName = 'LOGIN'
              end
              object dgConsultaDBTableView1Column2: TcxGridDBColumn
                Caption = 'Ativo'
                DataBinding.FieldName = 'ATIVO'
                PropertiesClassName = 'TcxCheckBoxProperties'
                Properties.ValueChecked = '1'
                Properties.ValueUnchecked = '0'
                HeaderAlignmentHorz = taCenter
              end
            end
          end
        end
      end
      inherited tsCadastro: TRzTabSheet
        ExplicitLeft = 1
        ExplicitTop = 21
        ExplicitWidth = 962
        ExplicitHeight = 377
        inherited pnl: TPanel
          ExplicitHeight = 377
          inherited stvCadastro: TJvSettingsTreeView
            Items.Links = {0100000000000000}
            ExplicitHeight = 357
          end
          inherited pglCadastro: TJvPageList
            inherited pgPrincipal: TJvStandardPage
              inherited pnlCadastro: TPanel
                inherited lblRazaoSocial: TLabel
                  Width = 27
                  Caption = 'Nome'
                  ExplicitWidth = 27
                end
                inherited lblNomeFantasia: TLabel
                  Visible = False
                end
                inherited lblTipoPessoa: TLabel
                  Left = 10
                  ExplicitLeft = 10
                end
                inherited lblDocumento: TLabel
                  Left = 106
                  ExplicitLeft = 106
                end
                inherited lblSite: TLabel
                  Visible = False
                end
                object Bevel: TBevel [13]
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
                  Visible = False
                  ExplicitHeight = 22
                end
                inherited dlcTipoPessoa: TcxDBLookupComboBox
                  Left = 10
                  ExplicitLeft = 10
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
                  Left = 106
                  ExplicitLeft = 106
                  ExplicitHeight = 22
                end
                inherited bedCEP: TcxDBButtonEdit
                  ExplicitHeight = 22
                end
                inherited bedSite: TcxDBButtonEdit
                  Visible = False
                  ExplicitHeight = 22
                end
                inherited grdContatos: TcxGrid
                  ExplicitHeight = 95
                end
                inherited dteCidade: TcxDBTextEdit
                  ExplicitHeight = 22
                end
                inherited dteEstado: TcxDBTextEdit
                  ExplicitHeight = 22
                end
                object pnlDadosAcesso: TPanel
                  Left = 561
                  Top = 4
                  Width = 223
                  Height = 180
                  BevelOuter = bvNone
                  Caption = 'pnlDadosAcesso'
                  ShowCaption = False
                  TabOrder = 13
                  object lblGrupoUsuario: TLabel
                    Left = 2
                    Top = 124
                    Width = 84
                    Height = 14
                    Caption = 'Grupo de usu'#225'rio'
                  end
                  object lblSenha: TLabel
                    Left = 2
                    Top = 51
                    Width = 31
                    Height = 14
                    Caption = 'Senha'
                  end
                  object lblLogin: TLabel
                    Left = 2
                    Top = 6
                    Width = 26
                    Height = 14
                    Caption = 'Login'
                  end
                  object dteLogin: TcxDBTextEdit
                    Left = 2
                    Top = 23
                    DataBinding.DataField = 'LOGIN'
                    DataBinding.DataSource = dmCadFuncionario.dsContab_Funcionario
                    Properties.ValidateOnEnter = True
                    TabOrder = 0
                    Width = 185
                  end
                  object dlcGrupoUsuario: TcxDBLookupComboBox
                    Left = 2
                    Top = 141
                    DataBinding.DataField = 'ID_BASE_GRUPO_USUARIO'
                    DataBinding.DataSource = dmCadFuncionario.dsContab_Funcionario
                    Properties.DropDownAutoSize = True
                    Properties.ImmediatePost = True
                    Properties.KeyFieldNames = 'ID_BASE_GRUPO_USUARIO'
                    Properties.ListColumns = <
                      item
                        Caption = 'Nome'
                        FieldName = 'NOME'
                      end>
                    Properties.ListSource = dmCadFuncionario.dsGrupoUsuario
                    Properties.PostPopupValueOnTab = True
                    TabOrder = 1
                    Width = 185
                  end
                  object dckAtivo: TcxDBCheckBox
                    Left = -5
                    Top = 96
                    Caption = 'Usu'#225'rio ativo'
                    DataBinding.DataField = 'ATIVO'
                    DataBinding.DataSource = dmCadFuncionario.dsContab_Funcionario
                    Properties.Alignment = taLeftJustify
                    Properties.ImmediatePost = True
                    Properties.ReadOnly = False
                    Properties.ValueChecked = '1'
                    Properties.ValueUnchecked = '0'
                    TabOrder = 2
                    Width = 121
                  end
                  object dteSenha: TcxDBTextEdit
                    Left = 2
                    Top = 68
                    DataBinding.DataField = 'SENHA'
                    DataBinding.DataSource = dmCadFuncionario.dsContab_Funcionario
                    Properties.EchoMode = eemPassword
                    Properties.ValidateOnEnter = True
                    Style.Shadow = False
                    TabOrder = 3
                    Width = 185
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
