unit cadastro.permissao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, biblioteca.form.base, JvValidators, JvComponentBase, JvEmbeddedForms,
  StdCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit, ExtCtrls,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, datamodule.permissao, cxCheckBox,
  Grids, DBGrids;

type
  TfrmCadPermissoes = class(TfrmBase)
    gbxGrupoUsuario: TGroupBox;
    cbGrupoUsuario: TcxComboBox;
    Bevel: TBevel;
    grdPermissoesDBTableView1: TcxGridDBTableView;
    grdPermissoesLevel1: TcxGridLevel;
    grdPermissoes: TcxGrid;
    grdPermissoesDBTableView1PERMITE_EXECUTAR: TcxGridDBColumn;
    grdPermissoesDBTableView1PERMITE_INCLUIR: TcxGridDBColumn;
    grdPermissoesDBTableView1PERMITE_EDITAR: TcxGridDBColumn;
    grdPermissoesDBTableView1PERMITE_EXCLUIR: TcxGridDBColumn;
    grdPermissoesDBTableView1Nome_Programa: TcxGridDBColumn;
    grdPermissoesLevel2: TcxGridLevel;
    grdPermissoesDBTableView2: TcxGridDBTableView;
    grdPermissoesDBTableView2IDENTIFICADOR: TcxGridDBColumn;
    grdPermissoesDBTableView2PERMISSAO: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbGrupoUsuarioPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    FDmPermissao: TdmPermissao;
  public
    { Public declarations }
    procedure Salvar;
    procedure Cancelar;
    function PossuiAlteracoes: Boolean;
  end;

var
  frmCadPermissoes: TfrmCadPermissoes;

implementation

{$R *.dfm}

procedure TfrmCadPermissoes.Cancelar;
begin
  FDmPermissao.CancelRecord;
end;

procedure TfrmCadPermissoes.cbGrupoUsuarioPropertiesChange(Sender: TObject);
begin
  inherited;
  FDmPermissao.ListarPermissoes( cbGrupoUsuario.Text );
end;

procedure TfrmCadPermissoes.FormCreate(Sender: TObject);
begin
  inherited;
  FDmPermissao := TdmPermissao.Create(nil);
  FDmPermissao.ListarGruposUsuarios(cbGrupoUsuario.Properties.Items);
  cbGrupoUsuario.ItemIndex := 0;
end;

procedure TfrmCadPermissoes.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FDmPermissao);
end;

function TfrmCadPermissoes.PossuiAlteracoes: Boolean;
begin
  Result := FDmPermissao.PossuiAlteracoes;
  cbGrupoUsuario.Enabled := not Result;
end;

procedure TfrmCadPermissoes.Salvar;
begin
  FDmPermissao.SaveRecord;
end;

initialization
   RegisterClass(TfrmCadPermissoes);

end.
