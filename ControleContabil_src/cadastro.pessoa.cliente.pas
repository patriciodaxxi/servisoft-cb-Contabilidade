unit cadastro.pessoa.cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cadastro.pessoa.base, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxDBLookupComboBox, cxButtonEdit,
  cxContainer, ActnList, JvValidators, JvComponentBase, JvEmbeddedForms,
  cxGridCardView, cxGridDBCardView, cxDBEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxTextEdit, StdCtrls, cxFilterControl,
  cxDBFilterControl, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, RzTabs, ExtCtrls,
  datamodule.pessoa.cliente, cxCalendar, cxSpinEdit, cxCurrencyEdit, cxCalc,
  cxMemo, biblioteca.datamodule.cadastro, cxNavigator, cxDBNavigator, DBCGrids,
  cxGridBandedTableView, cxGridDBBandedTableView, JvPageList, JvExControls,
  ComCtrls, JvExComCtrls, JvPageListTreeView, JvEnterTab, cxCheckBox;

type
  TfrmCadCliente = class(TfmPessoaBase)
    Bevel: TBevel;
    lblStatus: TLabel;
    dlcStatus: TcxDBLookupComboBox;
    lblDataCadastro: TLabel;
    dteDataCadastro: TcxDBDateEdit;
    lblDataInativo: TLabel;
    dteDataInativo: TcxDBDateEdit;
    pgDadosAdicionais: TJvStandardPage;
    pgAcessos: TJvStandardPage;
    pgParcelamentos: TJvStandardPage;
    pgAnotacoes: TJvStandardPage;
    pnlAcessos: TPanel;
    grdAcessos: TcxGrid;
    grdAcessosDBBandedTableView1: TcxGridDBBandedTableView;
    grdAcessosDBBandedTableView1TIPO_ACESSO: TcxGridDBBandedColumn;
    grdAcessosDBBandedTableView1DESCRICAO: TcxGridDBBandedColumn;
    grdAcessosDBBandedTableView1LOGIN: TcxGridDBBandedColumn;
    grdAcessosDBBandedTableView1SENHA: TcxGridDBBandedColumn;
    grdAcessosDBBandedTableView1PUK: TcxGridDBBandedColumn;
    grdAcessosDBBandedTableView1VALIDADE: TcxGridDBBandedColumn;
    grdAcessosDBBandedTableView1OBS: TcxGridDBBandedColumn;
    grdAcessosLevel1: TcxGridLevel;
    pnlAnotacoes: TPanel;
    dmeAnotacoes: TcxDBMemo;
    pnlParcelamentos: TPanel;
    lblParcelamentoFederal: TLabel;
    lblParcelamentoEstadual: TLabel;
    lblParcelamentoMunicipal: TLabel;
    lblParcelamentoPrevidenciario: TLabel;
    lblParcelamentoFGTS: TLabel;
    lblParcelamentoOutros: TLabel;
    dmeParcelamentoFederal: TcxDBMemo;
    dmeParcelamentoEstadual: TcxDBMemo;
    dmeParcelamentoMunicipal: TcxDBMemo;
    dmeParcelamentoPrevidenciario: TcxDBMemo;
    dmeParcelamentoFGTS: TcxDBMemo;
    dmeParcelamentoOutros: TcxDBMemo;
    pnlDadosAdicionais: TPanel;
    lblCNAE: TLabel;
    lblNatJuridicaCodigo: TLabel;
    lblInscricaoEstadual: TLabel;
    lblInscricaoMunicipal: TLabel;
    lblConstituicao: TLabel;
    lblConstituicaoData: TLabel;
    lblNIRE: TLabel;
    lblNIREData: TLabel;
    lblUltimaAlteracao: TLabel;
    lblUltimaAlteracaoData: TLabel;
    lblCapitalSocial: TLabel;
    lblSocioResponsavel: TLabel;
    lblSocioResponsavelCPF: TLabel;
    lblSocioResponsavelParticipacao: TLabel;
    lblSocio1: TLabel;
    lblSocio1CPF: TLabel;
    lblSocio1Participacao: TLabel;
    lblSocio2: TLabel;
    lblSocio2CPF: TLabel;
    lblSocio2Particopacao: TLabel;
    lblSocio3: TLabel;
    lblSocio3CPF: TLabel;
    lblSocio3Participacao: TLabel;
    bv1: TBevel;
    lblDadosResponsavel: TLabel;
    lblResponsavelDataNascimento: TLabel;
    lblResponsavelRG: TLabel;
    lblResponsavelExpedicao: TLabel;
    lblReponsavelTituloEleitor: TLabel;
    lblResponsavelZona: TLabel;
    lblResponsavelSecao: TLabel;
    lblResponsavelIRAtual: TLabel;
    lblResponsavelIRAnterior: TLabel;
    lblDadosSocios: TLabel;
    lblEnquadramentoFiscal: TLabel;
    lblTributacao: TLabel;
    dteCNAECodigo: TcxDBTextEdit;
    dteCNAEDescricao: TcxDBButtonEdit;
    dteNatJuridicaCodigo: TcxDBTextEdit;
    dteNatJuridicaDescricao: TcxDBButtonEdit;
    dteIscricaoEstadual: TcxDBTextEdit;
    dteInscricaoMunicipal: TcxDBTextEdit;
    dteConstituicao: TcxDBTextEdit;
    dteConstituicaoData: TcxDBDateEdit;
    dteNIRE: TcxDBTextEdit;
    dteNIREData: TcxDBDateEdit;
    dteUltimaAlteracao: TcxDBTextEdit;
    edtUltimaAlteracaoData: TcxDBDateEdit;
    edtCapitalSocial: TcxDBCurrencyEdit;
    dteSocioResponsavel: TcxDBTextEdit;
    dteSocioResponsavelCPF: TcxDBTextEdit;
    dteSocio1: TcxDBTextEdit;
    dteSocio1CPF: TcxDBTextEdit;
    dteSocio2: TcxDBTextEdit;
    dteSocio2CPF: TcxDBTextEdit;
    dteSocio3: TcxDBTextEdit;
    dteSocio3CPF: TcxDBTextEdit;
    dteResponsavelDataNascimento: TcxDBDateEdit;
    dteResponsavelRG: TcxDBTextEdit;
    dteResponsavelExpedicao: TcxDBTextEdit;
    dteResponsaveTituloEleitor: TcxDBTextEdit;
    dteResponsavelZona: TcxDBTextEdit;
    dteResponsavelSecao: TcxDBTextEdit;
    dteResponsavelIRAtual: TcxDBTextEdit;
    dteResponsavelIRAnterior: TcxDBTextEdit;
    dteSocioResponsavelParticipacao: TcxDBCurrencyEdit;
    dteSocio1Participacao: TcxDBCurrencyEdit;
    dteSocio2Participacao: TcxDBCurrencyEdit;
    dteSocio3Participacao: TcxDBCurrencyEdit;
    dlcEnquadramentoFiscal: TcxDBLookupComboBox;
    dlcTributacao: TcxDBLookupComboBox;
    pnlAnotacoesSigilosas: TPanel;
    gbxAnotacoesSigilosas: TGroupBox;
    ckSigilosaMostrarMensagem: TcxDBCheckBox;
    dteSigilosaDataHora: TcxDBDateEdit;
    lblSigilosaDataHora: TLabel;
    lblSigilosaAnotacao: TLabel;
    dmeSigilosaAnotacao: TcxDBMemo;
    pnlValores: TPanel;
    lblDataPagamento: TLabel;
    lblValorHonorarios: TLabel;
    lblHistorico: TLabel;
    dteDiaPagamento: TcxDBSpinEdit;
    dteValorHonorarios: TcxDBCurrencyEdit;
    grdHistoricoReajuste: TcxGrid;
    grdHistoricoReajusteDBTableView1: TcxGridDBTableView;
    grdHistoricoReajusteDBTableView1DATA: TcxGridDBColumn;
    grdHistoricoReajusteDBTableView1VALOR_HONORARIO: TcxGridDBColumn;
    grdHistoricoReajusteLevel1: TcxGridLevel;
    Bevel1: TBevel;
    procedure FormDestroy(Sender: TObject);
    procedure aclCadastroUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure grdAcessosDBBandedTableView1TIPO_ACESSOPropertiesChange(
      Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FDmCadCliente: TdmCadCliente;
    procedure TipoAcessoButtonClick(Sender: TObject; AButtonIndex: Integer);
  protected
    function GetMainDataModule: TdmCadBase; override;
    procedure ConfigureComponents; override;
    procedure ConfigureGridViews; override;
  public
    { Public declarations }
  end;

//var
//  frmCadCliente: TfrmCadCliente;

implementation

uses
  controlecontabil.dados;

{$R *.dfm}

{ TfrmCadCliente }

procedure TfrmCadCliente.aclCadastroUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  inherited;
//  dnvAcessos
  grdAcessosDBBandedTableView1.NavigatorButtons.Append.Enabled := PessoaDataModule.State in [sInsert, sEdit];
  grdAcessosDBBandedTableView1.NavigatorButtons.Edit.Enabled   := (PessoaDataModule.State in [sInsert, sEdit]) and
                                                                  (not PessoaDataModule.cdsBase_Pessoa_Contato.IsEmpty);
  grdAcessosDBBandedTableView1.NavigatorButtons.Delete.Enabled := (PessoaDataModule.State in [sInsert, sEdit]) and
                                                                  (not PessoaDataModule.cdsBase_Pessoa_Contato.IsEmpty);
end;

procedure TfrmCadCliente.ConfigureComponents;
begin
  inherited;
  AdicionarValidacao('valStatus', dlcStatus, 'Status deve ser informado.');
  AdicionarValidacao('valDataCadastro', dteDataCadastro, 'Data Início Atividades deve ser informada.');

  // Principal
  dteValorHonorarios.DataBinding.DataSource := FDmCadCliente.dsContab_Cliente;
  dteDiaPagamento.DataBinding.DataSource    := FDmCadCliente.dsContab_Cliente;
  dteDataInativo.DataBinding.DataSource     := FDmCadCliente.dsContab_Cliente;
  dteDataCadastro.DataBinding.DataSource    := FDmCadCliente.dsContab_Cliente;
  dlcStatus.DataBinding.DataSource          := FDmCadCliente.dsContab_Cliente;
  dlcStatus.Properties.ListSource           := FDmCadCliente.dsStatus;
  grdHistoricoReajusteDBTableView1.DataController.DataSource := FDmCadCliente.dsContab_Cliente_Reajuste;

  // Dados Adicionais
  dteCNAEDescricao.DataBinding.DataSource                := FDmCadCliente.dsContab_Cliente;
  dteCNAECodigo.DataBinding.DataSource                   := FDmCadCliente.dsContab_Cliente;
  dteNatJuridicaCodigo.DataBinding.DataSource            := FDmCadCliente.dsContab_Cliente;
  dteNatJuridicaDescricao.DataBinding.DataSource         := FDmCadCliente.dsContab_Cliente;
  dteIscricaoEstadual.DataBinding.DataSource             := FDmCadCliente.dsContab_Cliente;
  dteInscricaoMunicipal.DataBinding.DataSource           := FDmCadCliente.dsContab_Cliente;
  dteNIREData.DataBinding.DataSource                     := FDmCadCliente.dsContab_Cliente;
  dteNIRE.DataBinding.DataSource                         := FDmCadCliente.dsContab_Cliente;
  dteConstituicaoData.DataBinding.DataSource             := FDmCadCliente.dsContab_Cliente;
  dteConstituicao.DataBinding.DataSource                 := FDmCadCliente.dsContab_Cliente;
  dteUltimaAlteracao.DataBinding.DataSource              := FDmCadCliente.dsContab_Cliente;
  edtUltimaAlteracaoData.DataBinding.DataSource          := FDmCadCliente.dsContab_Cliente;
  edtCapitalSocial.DataBinding.DataSource                := FDmCadCliente.dsContab_Cliente;
  dteResponsavelExpedicao.DataBinding.DataSource         := FDmCadCliente.dsContab_Cliente;
  dteResponsavelRG.DataBinding.DataSource                := FDmCadCliente.dsContab_Cliente;
  dteResponsaveTituloEleitor.DataBinding.DataSource      := FDmCadCliente.dsContab_Cliente;
  dteResponsavelZona.DataBinding.DataSource              := FDmCadCliente.dsContab_Cliente;
  dteResponsavelSecao.DataBinding.DataSource             := FDmCadCliente.dsContab_Cliente;
  dteResponsavelIRAnterior.DataBinding.DataSource        := FDmCadCliente.dsContab_Cliente;
  dteResponsavelIRAtual.DataBinding.DataSource           := FDmCadCliente.dsContab_Cliente;
  dteSocio3Participacao.DataBinding.DataSource           := FDmCadCliente.dsContab_Cliente;
  dteSocio2Participacao.DataBinding.DataSource           := FDmCadCliente.dsContab_Cliente;
  dteSocio1Participacao.DataBinding.DataSource           := FDmCadCliente.dsContab_Cliente;
  dteSocioResponsavelParticipacao.DataBinding.DataSource := FDmCadCliente.dsContab_Cliente;
  dteSocioResponsavelCPF.DataBinding.DataSource          := FDmCadCliente.dsContab_Cliente;
  dteSocio1CPF.DataBinding.DataSource                    := FDmCadCliente.dsContab_Cliente;
  dteSocio2CPF.DataBinding.DataSource                    := FDmCadCliente.dsContab_Cliente;
  dteSocio3CPF.DataBinding.DataSource                    := FDmCadCliente.dsContab_Cliente;
  dteSocio3.DataBinding.DataSource                       := FDmCadCliente.dsContab_Cliente;
  dteSocio2.DataBinding.DataSource                       := FDmCadCliente.dsContab_Cliente;
  dteSocio1.DataBinding.DataSource                       := FDmCadCliente.dsContab_Cliente;
  dteSocioResponsavel.DataBinding.DataSource             := FDmCadCliente.dsContab_Cliente;
  dteResponsavelDataNascimento.DataBinding.DataSource    := FDmCadCliente.dsContab_Cliente;
  dlcEnquadramentoFiscal.DataBinding.DataSource          := FDmCadCliente.dsContab_Cliente;
  dlcEnquadramentoFiscal.Properties.ListSource           := FDmCadCliente.dsEnqFiscal;
  dlcTributacao.DataBinding.DataSource                   := FDmCadCliente.dsContab_Cliente;
  dlcTributacao.Properties.ListSource                    := FDmCadCliente.dsTributacao;

  // Acessos
  grdAcessosDBBandedTableView1.DataController.DataSource := FDmCadCliente.dsContab_Cliente_Acesso;
  TcxLookupComboBoxProperties(grdAcessosDBBandedTableView1TIPO_ACESSO.Properties).ListSource := FDmCadCliente.dsTipoAcesso;
  TcxLookupComboBoxProperties(grdAcessosDBBandedTableView1TIPO_ACESSO.Properties).Buttons.Add;
  TcxLookupComboBoxProperties(grdAcessosDBBandedTableView1TIPO_ACESSO.Properties).Buttons[1].Kind    := bkEllipsis;
  TcxLookupComboBoxProperties(grdAcessosDBBandedTableView1TIPO_ACESSO.Properties).Buttons[1].Default := True;
  TcxLookupComboBoxProperties(grdAcessosDBBandedTableView1TIPO_ACESSO.Properties).Buttons[1].Visible := False;
  TcxLookupComboBoxProperties(grdAcessosDBBandedTableView1TIPO_ACESSO.Properties).OnButtonClick := TipoAcessoButtonClick;

  // Parcelamento / Anotações
  dmeParcelamentoEstadual.DataBinding.DataSource       := FDmCadCliente.dsContab_Cliente;
  dmeParcelamentoPrevidenciario.DataBinding.DataSource := FDmCadCliente.dsContab_Cliente;
  dmeParcelamentoOutros.DataBinding.DataSource         := FDmCadCliente.dsContab_Cliente;
  dmeAnotacoes.DataBinding.DataSource                  := FDmCadCliente.dsContab_Cliente;
  dmeParcelamentoFGTS.DataBinding.DataSource           := FDmCadCliente.dsContab_Cliente;
  dmeParcelamentoMunicipal.DataBinding.DataSource      := FDmCadCliente.dsContab_Cliente;
  dmeParcelamentoFederal.DataBinding.DataSource        := FDmCadCliente.dsContab_Cliente;
end;

procedure TfrmCadCliente.ConfigureGridViews;
begin
  inherited;
  inherited;
  grdAcessosDBBandedTableView1.OptionsData.Appending  := True;
  grdAcessosDBBandedTableView1.OptionsData.Editing    := True;
end;

procedure TfrmCadCliente.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FDmCadCliente);
end;

procedure TfrmCadCliente.FormShow(Sender: TObject);
begin
  inherited;
  pnlValores.Visible             := dmDados.PermiteExecutar('EXIBIR_VALORES', False);
  pnlAnotacoesSigilosas.Visible  := dmDados.PermiteExecutar('EXIBIR_ANOTACOES_SIGILOSAS', False);
end;

function TfrmCadCliente.GetMainDataModule: TdmCadBase;
begin
  if not Assigned(FDmCadCliente) then
    FDmCadCliente := TdmCadCliente.Create(Self);

  Result := FDmCadCliente;
end;

procedure TfrmCadCliente.grdAcessosDBBandedTableView1TIPO_ACESSOPropertiesChange(
  Sender: TObject);
var
  AcessoLink: string;
  AcessoDesc: string;
begin
  inherited;
  AcessoLink := VarToStr( FDmCadCliente.sdsTipoAcesso.Lookup('OID_CONTAB_TIPO_ACESSO', grdAcessosDBBandedTableView1TIPO_ACESSO.DataBinding.Field.AsInteger, 'LINK') );
  AcessoDesc := VarToStr( FDmCadCliente.sdsTipoAcesso.Lookup('OID_CONTAB_TIPO_ACESSO', grdAcessosDBBandedTableView1TIPO_ACESSO.DataBinding.Field.AsInteger, 'DESCRICAO') );

  TcxLookupComboBoxProperties(grdAcessosDBBandedTableView1TIPO_ACESSO.Properties).Buttons[1].Visible   := not SameText( AcessoLink, EmptyStr );
  grdAcessosDBBandedTableView1DESCRICAO.DataBinding.Field.AsString := AcessoDesc;
end;

procedure TfrmCadCliente.TipoAcessoButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  AcessoLink: string;
  begin
  if (AButtonIndex = 1) then
  begin
    AcessoLink := VarToStr( FDmCadCliente.sdsTipoAcesso.Lookup('OID_CONTAB_TIPO_ACESSO', grdAcessosDBBandedTableView1TIPO_ACESSO.DataBinding.Field.AsInteger, 'LINK') );
    if not SameText(AcessoLink, EmptyStr) then
      OpenWebPage( AcessoLink );
  end;
end;

initialization
  RegisterClass(TfrmCadCliente);

end.
