unit cadastro.pessoa.base;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, biblioteca.form.cadastro, JvComponentBase, JvEmbeddedForms, JvValidators,
  JvErrorIndicator, biblioteca.form.base, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, ActnList, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, RzTabs, ExtCtrls, datamodule.pessoa.base, StdCtrls,
  cxContainer, cxTextEdit, cxDBEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxButtonEdit, cxLabel, cxDBLabel,
  cxGridCardView, cxGridDBCardView, cxFilterControl, cxDBFilterControl,
  JvPageList, JvExControls, ComCtrls, JvExComCtrls, JvPageListTreeView,
  JvEnterTab;

type
  TfmPessoaBase = class(TfrmCadBase)
    dgConsultaDBTableView1Codigo: TcxGridDBColumn;
    dgConsultaDBTableView1RazaoSocial: TcxGridDBColumn;
    lblCodigo: TLabel;
    dteCodigo: TcxDBTextEdit;
    lblRazaoSocial: TLabel;
    dteRazaoSocial: TcxDBTextEdit;
    lblNomeFantasia: TLabel;
    dteNomeFantasia: TcxDBTextEdit;
    lblTipoPessoa: TLabel;
    dlcTipoPessoa: TcxDBLookupComboBox;
    lblDocumento: TLabel;
    lblEndereco: TLabel;
    dteEndereco: TcxDBTextEdit;
    lblNroEndereco: TLabel;
    dteNroEndereco: TcxDBTextEdit;
    lblComplementoEndereco: TLabel;
    dteComplementoEndereco: TcxDBTextEdit;
    lblCEP: TLabel;
    bedDocumento: TcxDBButtonEdit;
    bedCEP: TcxDBButtonEdit;
    lblSite: TLabel;
    bedSite: TcxDBButtonEdit;
    lblContatos: TLabel;
    grdContatos: TcxGrid;
    grdContatosLevel: TcxGridLevel;
    grdContatosDBCardView: TcxGridDBCardView;
    grdContatosDBCardViewTIPO: TcxGridDBCardViewRow;
    grdContatosDBCardViewNOME: TcxGridDBCardViewRow;
    grdContatosDBCardViewTELEFONE: TcxGridDBCardViewRow;
    grdContatosDBCardViewEMAIL: TcxGridDBCardViewRow;
    lblCidade: TLabel;
    dteCidade: TcxDBTextEdit;
    lblEstado: TLabel;
    dteEstado: TcxDBTextEdit;
    procedure bedDocumentoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure bedCEPPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ValidationSummaryAddError(Sender: TObject);
    procedure bedSitePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure aclCadastroUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure grdContatosDBCardViewEMAILPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
    function GetPessoaDataModule: TdmPessoaBase;
  protected
    procedure ConfigureComponents; override;
    procedure ConfigureGridViews; override;
  public
    { Public declarations }
    property PessoaDataModule: TdmPessoaBase read GetPessoaDataModule;
  end;

//var
//  fmPessoaBase: TfmPessoaBase;

implementation

uses
  biblioteca.datamodule.cadastro, biblioteca.datamodule.base;

{$R *.dfm}

procedure TfmPessoaBase.aclCadastroUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  inherited;
  grdContatosDBCardView.NavigatorButtons.Append.Enabled := PessoaDataModule.State in [sInsert, sEdit];
  grdContatosDBCardView.NavigatorButtons.Edit.Enabled   := (PessoaDataModule.State in [sInsert, sEdit]) and
                                                           (not PessoaDataModule.cdsBase_Pessoa_Contato.IsEmpty);
  grdContatosDBCardView.NavigatorButtons.Delete.Enabled := (PessoaDataModule.State in [sInsert, sEdit]) and
                                                           (not PessoaDataModule.cdsBase_Pessoa_Contato.IsEmpty);
end;

procedure TfmPessoaBase.bedCEPPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  OpenWebPage('http://www.buscacep.correios.com.br/servicos/dnec/index.do');
end;

procedure TfmPessoaBase.bedDocumentoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  LinkValidacao: string;
begin
  inherited;
  if PessoaDataModule.cdsBase_PessoaTIPO_PESSOA.IsNull then
    raise Exception.Create('Informe o tipo de pessoa para validar o documento.');

  if (PessoaDataModule.cdsBase_PessoaTIPO_PESSOA.AsString = 'F') then
    LinkValidacao := 'http://www.receita.fazenda.gov.br/PessoaFisica/CPF/CadastroPF.htm'
  else
    LinkValidacao := 'http://www.receita.fazenda.gov.br/PessoaJuridica/CNPJ/cnpjreva/Cnpjreva_Solicitacao.asp';

  OpenWebPage( LinkValidacao );
end;

procedure TfmPessoaBase.bedSitePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  if not PessoaDataModule.cdsBase_PessoaSITE.IsNull then
    OpenWebPage( PessoaDataModule.cdsBase_PessoaSITE.AsString );
end;

procedure TfmPessoaBase.ConfigureComponents;
begin
  inherited;
  // Configura datasources
  dteEstado.DataBinding.DataSource                := MainDataModule.MainDataSource;
  bedSite.DataBinding.DataSource                  := MainDataModule.MainDataSource;
  bedCEP.DataBinding.DataSource                   := MainDataModule.MainDataSource;
  dteCidade.DataBinding.DataSource                := MainDataModule.MainDataSource;
  dteEndereco.DataBinding.DataSource              := MainDataModule.MainDataSource;
  dteNroEndereco.DataBinding.DataSource           := MainDataModule.MainDataSource;
  dteComplementoEndereco.DataBinding.DataSource   := MainDataModule.MainDataSource;
  bedDocumento.DataBinding.DataSource             := MainDataModule.MainDataSource;
  dlcTipoPessoa.DataBinding.DataSource            := MainDataModule.MainDataSource;
  dteNomeFantasia.DataBinding.DataSource          := MainDataModule.MainDataSource;
  dteRazaoSocial.DataBinding.DataSource           := MainDataModule.MainDataSource;
  dteCodigo.DataBinding.DataSource                := MainDataModule.MainDataSource;
  grdContatosDBCardView.DataController.DataSource := PessoaDataModule.dsBase_Pessoa_Contato;

  // Configura validações
  if Self.ClassNameIs('TfrmCadFuncionario') then
    AdicionarValidacao('valRazaoSocial', dteRazaoSocial, 'Nome deve ser informada.')
  else
    AdicionarValidacao('valRazaoSocial', dteRazaoSocial, 'Razão social deve ser informada.');

  // Configura filtros
  AdicionarFiltro('Código', PessoaDataModule.cdsBase_PessoaCODIGO);
  AdicionarFiltro('Documento', PessoaDataModule.cdsBase_PessoaDOCUMENTO);
  if Self.ClassNameIs('TfrmCadFuncionario') then
    AdicionarFiltro('Nome', PessoaDataModule.cdsBase_PessoaRAZAO_SOCIAL)
  else
    AdicionarFiltro('Razão Social', PessoaDataModule.cdsBase_PessoaRAZAO_SOCIAL);
end;

procedure TfmPessoaBase.ConfigureGridViews;
begin
  inherited;
  grdContatosDBCardView.OptionsData.Appending  := True;
  grdContatosDBCardView.OptionsData.Editing    := True;
end;

function TfmPessoaBase.GetPessoaDataModule: TdmPessoaBase;
begin
  Result := TdmPessoaBase(MainDataModule);
end;

procedure TfmPessoaBase.grdContatosDBCardViewEMAILPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  OpenWebPage('mailto:' + PessoaDataModule.cdsBase_Pessoa_ContatoEMAIL.AsString);
end;

procedure TfmPessoaBase.ValidationSummaryAddError(Sender: TObject);
begin
  inherited;
//
end;

end.
