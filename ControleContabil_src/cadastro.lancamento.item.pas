unit cadastro.lancamento.item;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, biblioteca.form.cadastro, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ActnList, JvValidators, JvComponentBase,
  JvEmbeddedForms, JvPageList, JvExControls, ComCtrls, JvExComCtrls,
  JvPageListTreeView, ExtCtrls, StdCtrls, cxFilterControl, cxDBFilterControl,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, RzTabs, biblioteca.datamodule.cadastro,
  datamodule.lancamento.item, cxContainer, cxTextEdit, cxDBEdit, JvEnterTab,
  cxCurrencyEdit;

type
  TfrmLancamentoItem = class(TfrmCadBase)
    lblCodigo: TLabel;
    dteCodigo: TcxDBTextEdit;
    lblDescricao: TLabel;
    dteDescricao: TcxDBTextEdit;
    dgConsultaDBTableView1CODIGO: TcxGridDBColumn;
    dgConsultaDBTableView1DESCRICAO: TcxGridDBColumn;
    lblValor: TLabel;
    dteValor: TcxDBCurrencyEdit;
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FDmLancamentoItem: TdmLancamentoItem;
  protected
    function GetMainDataModule: TdmCadBase; override;
    procedure ConfigureComponents; override;
  public
    { Public declarations }
  end;

var
  frmLancamentoItem: TfrmLancamentoItem;

implementation

uses
  controlecontabil.dados;

{$R *.dfm}

{ TfrmLancamentoItem }

procedure TfrmLancamentoItem.ConfigureComponents;
begin
  inherited;
  dgConsultaDBTableView1.DataController.DataSource := MainDataModule.MainDataSource;
  dteCodigo.DataBinding.DataSource    := MainDataModule.MainDataSource;
  dteDescricao.DataBinding.DataSource := MainDataModule.MainDataSource;

  // Configuração de validações
  AdicionarValidacao('valCodigo', dteCodigo, 'Código deve ser informado.');
  AdicionarValidacao('valDescricao', dteDescricao, 'Descrição deve ser informada.');

  // Configurãção de filtros de pesquisa
  AdicionarFiltro('Código', FDmLancamentoItem.cdsContab_Item_LancamentoCODIGO);
  AdicionarFiltro('Descrição', FDmLancamentoItem.cdsContab_Item_LancamentoDESCRICAO);
end;

procedure TfrmLancamentoItem.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FDmLancamentoItem);
end;

procedure TfrmLancamentoItem.FormShow(Sender: TObject);
begin
  inherited;
  lblValor.Visible := dmDados.PermiteExecutar('EXIBIR_VALORES_ITEM', False);
  dteValor.Visible := lblValor.Visible;
end;

function TfrmLancamentoItem.GetMainDataModule: TdmCadBase;
begin
  if not Assigned(FDmLancamentoItem) then
    FDmLancamentoItem := TdmLancamentoItem.Create(Self);

  Result := FDmLancamentoItem;
end;

initialization
  RegisterClass(TfrmLancamentoItem);

end.
