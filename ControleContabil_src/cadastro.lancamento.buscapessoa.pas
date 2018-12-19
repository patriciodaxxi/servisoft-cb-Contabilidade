unit cadastro.lancamento.buscapessoa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, biblioteca.form.base, JvValidators, JvComponentBase, JvEmbeddedForms,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ExtCtrls, StdCtrls, DBClient,
  SimpleDS, JvEnterTab;

type
  TfrmBuscaPessoa = class(TfrmBase)
    grBuscaDBTableView1: TcxGridDBTableView;
    grBuscaLevel1: TcxGridLevel;
    grBusca: TcxGrid;
    Panel1: TPanel;
    btnOK: TButton;
    btnCancelar: TButton;
    sdsPessoas: TSimpleDataSet;
    sdsPessoasCODIGO: TIntegerField;
    sdsPessoasRAZAO_SOCIAL: TStringField;
    dsPessoas: TDataSource;
    grBuscaDBTableView1CODIGO: TcxGridDBColumn;
    grBuscaDBTableView1RAZAO_SOCIAL: TcxGridDBColumn;
    sdsPessoasID_PESSOA: TIntegerField;
    EnterAsTab: TJvEnterAsTab;
    btnCadastrar: TButton;
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
  private
    { Private declarations }
    FClasse: string;
    function ListarPessoas(ACategoria: string; var ACodigo: Integer; var ANome: string): Boolean;
  public
    { Public declarations }
    class function BuscarFuncionarios(var ACodigo: Integer; var ANome: string): Boolean;
    class function BuscarClientes(var ACodigo: Integer; var ANome: string): Boolean;
  end;


implementation

uses
  controlecontabil.principal, controlecontabil.dados;

{$R *.dfm}

{ TfrmBuscaPessoa }

procedure TfrmBuscaPessoa.btnCadastrarClick(Sender: TObject);
begin
  inherited;
  if not dmDados.PermiteIncluir(FClasse, True) then
    raise Exception.Create('Você não tem permissão para inserir um novo registro, verifique com seu gerente.');

  frmPrincipal.AbrirTelaModal(FClasse);
  sdsPessoas.Refresh;
end;

class function TfrmBuscaPessoa.BuscarClientes(var ACodigo: Integer;
  var ANome: string): Boolean;
var
  Frm: TfrmBuscaPessoa;
begin
  Frm := TfrmBuscaPessoa.Create(nil);
  try
    Result := Frm.ListarPessoas('Contatos', ACodigo, ANome);
  finally
    FreeAndNil(Frm);
  end;
end;

class function TfrmBuscaPessoa.BuscarFuncionarios(var ACodigo: Integer; var ANome: string): Boolean;
var
  Frm: TfrmBuscaPessoa;
begin
  Frm := TfrmBuscaPessoa.Create(nil);
  try
    Result := Frm.ListarPessoas('Funcionário', ACodigo, ANome);
  finally
    FreeAndNil(Frm);
  end;
end;

procedure TfrmBuscaPessoa.FormDestroy(Sender: TObject);
begin
  inherited;
  sdsPessoas.Close;
end;

procedure TfrmBuscaPessoa.FormShow(Sender: TObject);
begin
  inherited;
  grBuscaDBTableView1.DataController.DataSource := dsPessoas;
end;

function TfrmBuscaPessoa.ListarPessoas(ACategoria: string; var ACodigo: Integer; var ANome: string): Boolean;
begin
  sdsPessoas.Close;
  sdsPessoas.DataSet.ParamByName('CATEGORIA_CADASTRO').AsString := ACategoria;
  sdsPessoas.Open;

  ACodigo := -1;
  ANome   := EmptyStr;

  if SameText(ACategoria, 'Contatos') then
  begin
    btnCadastrar.Caption := 'Ca&dastrar contato';
    FClasse := 'cadastro.pessoa.cliente.TfrmCadCliente';
  end
  else
  begin
    btnCadastrar.Caption := 'Ca&dastrar funcionário';
    FClasse := 'cadastro.pessoa.funcionario.TfrmCadFuncionario';
  end;

  Result := Self.ShowModal = mrOk;
  if Result then
  begin
    ACodigo := sdsPessoasID_PESSOA.AsInteger;
    ANome   := sdsPessoasRAZAO_SOCIAL.AsString;
  end;
end;

end.
