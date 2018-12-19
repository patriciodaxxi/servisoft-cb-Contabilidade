unit datamodule.pessoa.funcionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, datamodule.pessoa.base, FMTBcd, DB, DBClient, Provider, SqlExpr,
  IdBaseComponent, IdCoder, IdCoder3to4, IdCoderMIME, SimpleDS;

type
  TdmCadFuncionario = class(TdmPessoaBase)
    sdsContab_Funcionario: TSQLDataSet;
    cdsBase_PessoasdsContab_Funcionario: TDataSetField;
    cdsContab_Funcionario: TClientDataSet;
    sdsContab_FuncionarioID_CONTAB_FUNCIONARIO: TIntegerField;
    sdsContab_FuncionarioID_PESSOA: TIntegerField;
    cdsContab_FuncionarioID_CONTAB_FUNCIONARIO: TIntegerField;
    cdsContab_FuncionarioID_PESSOA: TIntegerField;
    dsContab_Funcionario: TDataSource;
    sdsContab_FuncionarioLOGIN: TStringField;
    sdsContab_FuncionarioSENHA: TStringField;
    sdsContab_FuncionarioATIVO: TIntegerField;
    cdsContab_FuncionarioLOGIN: TStringField;
    cdsContab_FuncionarioSENHA: TStringField;
    cdsContab_FuncionarioATIVO: TIntegerField;
    sdsBase_PessoaLOGIN: TStringField;
    sdsBase_PessoaATIVO: TIntegerField;
    cdsBase_PessoaLOGIN: TStringField;
    cdsBase_PessoaATIVO: TIntegerField;
    Enconder64: TIdEncoderMIME;
    sdsContab_FuncionarioID_BASE_GRUPO_USUARIO: TIntegerField;
    cdsContab_FuncionarioID_BASE_GRUPO_USUARIO: TIntegerField;
    sdsGrupoUsuario: TSimpleDataSet;
    sdsGrupoUsuarioID_BASE_GRUPO_USUARIO: TIntegerField;
    sdsGrupoUsuarioNOME: TStringField;
    dsGrupoUsuario: TDataSource;
    procedure cdsContab_FuncionarioAfterInsert(DataSet: TDataSet);
    procedure cdsContab_FuncionarioSENHASetText(Sender: TField;
      const Text: string);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure BeforeSaveRecord; override;
    function CategoriaCadastro: string; override;
  public
    { Public declarations }
  end;

//var
//  dmCadFuncionario: TdmCadFuncionario;

implementation

uses
  controlecontabil.dados;

{$R *.dfm}

procedure TdmCadFuncionario.BeforeSaveRecord;
begin
  inherited;
  if cdsContab_Funcionario.IsEmpty then
  begin
    cdsContab_Funcionario.Append;
    cdsContab_Funcionario.Post;
  end;
end;

function TdmCadFuncionario.CategoriaCadastro: string;
begin
  Result := 'Funcionário';
end;

procedure TdmCadFuncionario.cdsContab_FuncionarioAfterInsert(DataSet: TDataSet);
begin
  inherited;
  cdsContab_FuncionarioID_CONTAB_FUNCIONARIO.AsInteger := GenTableID('CONTAB_FUNCIONARIO');
  cdsContab_FuncionarioID_PESSOA.AsInteger             := cdsBase_PessoaID_PESSOA.AsInteger;
  cdsContab_FuncionarioATIVO.AsInteger                 := 1;
end;

procedure TdmCadFuncionario.cdsContab_FuncionarioSENHASetText(Sender: TField;
  const Text: string);
begin
  inherited;
  Sender.AsString := Enconder64.Encode(Text);
end;

procedure TdmCadFuncionario.DataModuleCreate(Sender: TObject);
begin
  inherited;
  sdsGrupoUsuario.Open;
end;

procedure TdmCadFuncionario.DataModuleDestroy(Sender: TObject);
begin
  inherited;
  sdsGrupoUsuario.Close;
end;

end.
