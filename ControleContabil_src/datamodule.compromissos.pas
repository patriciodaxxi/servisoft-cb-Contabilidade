unit datamodule.compromissos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, biblioteca.datamodule.cadastro, FMTBcd, DB, SqlExpr, Provider,
  DBClient, SimpleDS;

type
  TdmCompromissos = class(TdmCadBase)
    sdsContab_Compromisso: TSQLDataSet;
    sdsContab_CompromissoID_CONTAB_COMPROMISSO: TIntegerField;
    sdsContab_CompromissoASSUNTO: TMemoField;
    sdsContab_CompromissoLOCAL: TMemoField;
    sdsContab_CompromissoQUANDO: TSQLTimeStampField;
    sdsContab_CompromissoSTATUS: TIntegerField;
    sdsContab_CompromissoVISIBILIDADE: TIntegerField;
    dspContab_Compromisso: TDataSetProvider;
    cdsContab_Compromisso: TClientDataSet;
    cdsContab_CompromissoID_CONTAB_COMPROMISSO: TIntegerField;
    cdsContab_CompromissoASSUNTO: TMemoField;
    cdsContab_CompromissoLOCAL: TMemoField;
    cdsContab_CompromissoQUANDO: TSQLTimeStampField;
    cdsContab_CompromissoSTATUS: TIntegerField;
    cdsContab_CompromissoVISIBILIDADE: TIntegerField;
    dsContab_Compromisso: TDataSource;
    sdsContab_Comp_Pessoas: TSQLDataSet;
    dsLigacao: TDataSource;
    sdsContab_Comp_PessoasID_CONTAB_COMP_PESSOAS: TIntegerField;
    sdsContab_Comp_PessoasID_CONTAB_COMPROMISSOS: TIntegerField;
    sdsContab_Comp_PessoasID_PESSOA: TIntegerField;
    cdsContab_CompromissosdsContab_Comp_Pessoas: TDataSetField;
    cdsContab_Comp_Pessoas: TClientDataSet;
    dsContab_Comp_Pessoas: TDataSource;
    cdsContab_Comp_PessoasID_CONTAB_COMP_PESSOAS: TIntegerField;
    cdsContab_Comp_PessoasID_CONTAB_COMPROMISSOS: TIntegerField;
    cdsContab_Comp_PessoasID_PESSOA: TIntegerField;
    sdsFuncionario: TSimpleDataSet;
    sdsFuncionarioCODIGO: TIntegerField;
    sdsFuncionarioRAZAO_SOCIAL: TStringField;
    sdsFuncionarioID_CONTAB_FUNCIONARIO: TIntegerField;
    sdsFuncionarioID_PESSOA: TIntegerField;
    sdsFuncionarioLOGIN: TStringField;
    sdsFuncionarioSENHA: TStringField;
    sdsFuncionarioATIVO: TIntegerField;
    dsFuncionario: TDataSource;
    cdsContab_Comp_PessoasNome: TStringField;
    cdsTmpPessoas: TClientDataSet;
    dsTmpPessoas: TDataSource;
    cdsTmpPessoasID_PESSOA: TIntegerField;
    cdsTmpPessoasNOME: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure cdsContab_CompromissoAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  protected
    procedure GetMainDataSource(var DataSource: TDataSource); override;
    procedure BeforeSaveRecord; override;
  public
    { Public declarations }
  end;

//var
//  dmCompromissos: TdmCompromissos;

implementation

uses
  controlecontabil.dados, SqlTimSt;

{$R *.dfm}

procedure TdmCompromissos.BeforeSaveRecord;
var
  vNome: Variant;
begin
  inherited;
  // Apaga todos os contatos
  cdsContab_Comp_Pessoas.First;
  while not cdsContab_Comp_Pessoas.Eof do
  begin
    cdsContab_Comp_Pessoas.Delete;
    cdsContab_Comp_Pessoas.Next;
  end;

  // Adiciona todos os contatos
  cdsTmpPessoas.First;
  while not cdsTmpPessoas.Eof do
  begin
    cdsContab_Comp_Pessoas.Append;
    cdsContab_Comp_PessoasID_CONTAB_COMP_PESSOAS.AsInteger := GenTableID('CONTAB_COMP_PESSOAS');
    cdsContab_Comp_PessoasID_CONTAB_COMPROMISSOS.AsInteger := cdsContab_CompromissoID_CONTAB_COMPROMISSO.AsInteger;
    cdsContab_Comp_PessoasID_PESSOA.AsInteger := cdsTmpPessoasID_PESSOA.AsInteger;
    cdsContab_Comp_Pessoas.Post;

    cdsTmpPessoas.Next;
  end;
end;

procedure TdmCompromissos.cdsContab_CompromissoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  cdsContab_CompromissoQUANDO.AsSQLTimeStamp  := DateTimeToSQLTimeStamp(Now);
  cdsContab_CompromissoSTATUS.AsInteger       := 1;
  cdsContab_CompromissoVISIBILIDADE.AsInteger := 1;
end;

procedure TdmCompromissos.DataModuleCreate(Sender: TObject);
begin
  inherited;
  sdsFuncionario.Open;
  cdsTmpPessoas.CreateDataSet;
end;

procedure TdmCompromissos.DataModuleDestroy(Sender: TObject);
begin
  inherited;
  cdsTmpPessoas.Close;
  sdsFuncionario.Close;
end;

procedure TdmCompromissos.GetMainDataSource(var DataSource: TDataSource);
begin
  DataSource := dsContab_Compromisso;
end;

end.
