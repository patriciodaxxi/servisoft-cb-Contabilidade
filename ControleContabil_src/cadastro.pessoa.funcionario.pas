unit cadastro.pessoa.funcionario;

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
  cxLookupEdit, cxDBLookupEdit, cxTextEdit, StdCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, RzTabs, ExtCtrls, datamodule.pessoa.funcionario,
  cxCheckBox, biblioteca.datamodule.cadastro, cxFilterControl, cxDBFilterControl,
  JvPageList, JvExControls, ComCtrls, JvExComCtrls, JvPageListTreeView,
  JvEnterTab;

type
  TfrmCadFuncionario = class(TfmPessoaBase)
    Bevel: TBevel;
    dgConsultaDBTableView1Column1: TcxGridDBColumn;
    dgConsultaDBTableView1Column2: TcxGridDBColumn;
    pnlDadosAcesso: TPanel;
    dteLogin: TcxDBTextEdit;
    dlcGrupoUsuario: TcxDBLookupComboBox;
    lblGrupoUsuario: TLabel;
    dckAtivo: TcxDBCheckBox;
    dteSenha: TcxDBTextEdit;
    lblSenha: TLabel;
    lblLogin: TLabel;
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FDmCadFuncionario: TdmCadFuncionario;
  protected
    function GetMainDataModule: TdmCadBase; override;
    procedure ConfigureComponents; override;
  public
    { Public declarations }
  end;

//var
//  frmCadFuncionario: TfrmCadFuncionario;

implementation

uses
  controlecontabil.dados;

{$R *.dfm}

{ TfrmCadFuncionario }

procedure TfrmCadFuncionario.ConfigureComponents;
begin
  inherited ConfigureComponents;
  dteLogin.DataBinding.DataSource := FDmCadFuncionario.dsContab_Funcionario;
  dteSenha.DataBinding.DataSource := FDmCadFuncionario.dsContab_Funcionario;
  dckAtivo.DataBinding.DataSource := FDmCadFuncionario.dsContab_Funcionario;

  AdicionarValidacao('valLogin', dteLogin, 'Login deve ser informada.');
  AdicionarValidacao('valSenha', dteSenha, 'Senha deve ser informada.');
end;

procedure TfrmCadFuncionario.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FDmCadFuncionario);
end;

procedure TfrmCadFuncionario.FormShow(Sender: TObject);
begin
  inherited;
  pnlDadosAcesso.Visible := dmDados.PermiteExecutar('EXIBIR_DADOS_ACESSO', False);
end;

function TfrmCadFuncionario.GetMainDataModule: TdmCadBase;
begin
  if not Assigned(FDmCadFuncionario) then
    FDmCadFuncionario := TdmCadFuncionario.Create(Self);

  Result := FDmCadFuncionario;
end;

initialization
  RegisterClass(TfrmCadFuncionario);

end.
