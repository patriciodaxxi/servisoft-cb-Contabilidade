unit datamodule.permissao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, biblioteca.datamodule.cadastro, FMTBcd, DB, SqlExpr, DBClient,
  Provider, SimpleDS;

type
  TdmPermissao = class(TdmCadBase)
    sdsBase_Permissao: TSQLDataSet;
    sdsBase_PermissaoID_BASE_PERMISSAO: TIntegerField;
    sdsBase_PermissaoID_GRUPO_USUARIO: TIntegerField;
    sdsBase_PermissaoID_PROGRAMA: TIntegerField;
    sdsBase_PermissaoPERMITE_EXECUTAR: TIntegerField;
    sdsBase_PermissaoPERMITE_INCLUIR: TIntegerField;
    sdsBase_PermissaoPERMITE_EDITAR: TIntegerField;
    sdsBase_PermissaoPERMITE_EXCLUIR: TIntegerField;
    dspBase_Permissao: TDataSetProvider;
    cdsBase_Permissao: TClientDataSet;
    dsBase_Permissao: TDataSource;
    cdsBase_PermissaoID_BASE_PERMISSAO: TIntegerField;
    cdsBase_PermissaoID_GRUPO_USUARIO: TIntegerField;
    cdsBase_PermissaoID_PROGRAMA: TIntegerField;
    cdsBase_PermissaoPERMITE_EXECUTAR: TIntegerField;
    cdsBase_PermissaoPERMITE_INCLUIR: TIntegerField;
    cdsBase_PermissaoPERMITE_EDITAR: TIntegerField;
    cdsBase_PermissaoPERMITE_EXCLUIR: TIntegerField;
    sdsProgramas: TSimpleDataSet;
    sdsProgramasID_BASE_PROGRAMA: TIntegerField;
    sdsProgramasNOME: TStringField;
    dsProgramas: TDataSource;
    cdsBase_PermissaoNome_Programa: TStringField;
    sdsGruposUsuarios: TSimpleDataSet;
    sdsGruposUsuariosID_BASE_GRUPO_USUARIO: TIntegerField;
    sdsGruposUsuariosNOME: TStringField;
    sdsBase_Permissao_Adicional: TSQLDataSet;
    sdsBase_Permissao_AdicionalID_BASE_PERMISSAO_ADICIONAL: TIntegerField;
    sdsBase_Permissao_AdicionalID_BASE_PERMISSAO: TIntegerField;
    sdsBase_Permissao_AdicionalIDENTIFICADOR: TStringField;
    sdsBase_Permissao_AdicionalPERMISSAO: TIntegerField;
    dspBase_Permissao_Adicional: TDataSetProvider;
    cdsBase_Permissao_Adicional: TClientDataSet;
    cdsBase_Permissao_AdicionalID_BASE_PERMISSAO_ADICIONAL: TIntegerField;
    cdsBase_Permissao_AdicionalID_BASE_PERMISSAO: TIntegerField;
    cdsBase_Permissao_AdicionalIDENTIFICADOR: TStringField;
    cdsBase_Permissao_AdicionalPERMISSAO: TIntegerField;
    dsBase_Permissao_Adicional: TDataSource;
    sdsBase_Permissao_AdicionalDESCRICAO: TStringField;
    cdsBase_Permissao_AdicionalDESCRICAO: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure cdsBase_PermissaoAfterOpen(DataSet: TDataSet);
    procedure cdsBase_PermissaoAfterClose(DataSet: TDataSet);
  private
    { Private declarations }
  protected
    procedure GetMainDataSource(var DataSource: TDataSource); override;
    procedure AfterCancelRecord; override;
    procedure AfterSaveRecord; override;
    procedure BeforeApplyUpdates; override;
    procedure BeforeSaveRecord; override;
  public
    { Public declarations }
    function ExistePesquisa: Boolean; override;
    function PossuiAlteracoes: Boolean;
    procedure ListarGruposUsuarios(ALista: TStrings);
    procedure ListarPermissoes(AGrupo: string);
  end;

var
  dmPermissao: TdmPermissao;

implementation

uses
  controlecontabil.dados;

{$R *.dfm}

{ TdmCadBase1 }

procedure TdmPermissao.AfterCancelRecord;
begin
  inherited;
  EnabledAutoEdit;
end;

procedure TdmPermissao.AfterSaveRecord;
begin
  inherited;
  EnabledAutoEdit;
end;

procedure TdmPermissao.BeforeApplyUpdates;
begin
  inherited;
  if cdsBase_Permissao_Adicional.ChangeCount > 0 then
    if cdsBase_Permissao_Adicional.ApplyUpdates(0) > 0 then
      Abort;
end;

procedure TdmPermissao.BeforeSaveRecord;
begin
  inherited;
  if cdsBase_Permissao_Adicional.State in [dsEdit, dsInsert] then
    cdsBase_Permissao_Adicional.Post;
end;

procedure TdmPermissao.cdsBase_PermissaoAfterClose(DataSet: TDataSet);
begin
  inherited;
  cdsBase_Permissao_Adicional.Close;
end;

procedure TdmPermissao.cdsBase_PermissaoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  cdsBase_Permissao_Adicional.Open;
end;

procedure TdmPermissao.DataModuleCreate(Sender: TObject);
begin
  inherited;
  sdsGruposUsuarios.Open;
  sdsProgramas.Open;
  EnabledAutoEdit;
end;

procedure TdmPermissao.DataModuleDestroy(Sender: TObject);
begin
  inherited;
  sdsGruposUsuarios.Close;
  sdsProgramas.Close;
end;

function TdmPermissao.ExistePesquisa: Boolean;
begin
  Result := True;
end;

procedure TdmPermissao.GetMainDataSource(var DataSource: TDataSource);
begin
  inherited;
  DataSource := dsBase_Permissao;
end;

procedure TdmPermissao.ListarGruposUsuarios(ALista: TStrings);
begin
  ALista.Clear;
  sdsGruposUsuarios.First;
  while not sdsGruposUsuarios.Eof do
  begin
    ALista.Add( sdsGruposUsuariosNOME.AsString );
    sdsGruposUsuarios.Next;
  end;
end;

procedure TdmPermissao.ListarPermissoes(AGrupo: string);
var
  Codigo: Variant;
begin
  Codigo := sdsGruposUsuarios.Lookup('NOME', AGrupo, 'ID_BASE_GRUPO_USUARIO');
  if not VarIsNull(Codigo) then
  begin
    ExecuteQuery('ID_GRUPO_USUARIO = ' + VarToStr(Codigo));
  end;
end;

function TdmPermissao.PossuiAlteracoes: Boolean;
begin
  Result := (cdsBase_Permissao.ChangeCount > 0) or
            (cdsBase_Permissao.State in dsEditModes) or
            (cdsBase_Permissao_Adicional.ChangeCount > 0) or
            (cdsBase_Permissao_Adicional.State in dsEditModes);
end;

end.
