unit datamodule.pessoa.base;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, biblioteca.datamodule.cadastro, controlecontabil.dados, FMTBcd, DB,
  SqlExpr, Provider, DBClient;

type
  TdmPessoaBase = class(TdmCadBase)
    sdsBase_Pessoa: TSQLDataSet;
    dspBase_Pessoa: TDataSetProvider;
    cdsBase_Pessoa: TClientDataSet;
    dsBase_Pessoa: TDataSource;
    cdsTipo_Pessoa: TClientDataSet;
    cdsTipo_PessoaTIPO: TStringField;
    cdsTipo_PessoaDESCRICAO: TStringField;
    dsTipo_Pessoa: TDataSource;
    sdsBase_PessoaID_PESSOA: TIntegerField;
    sdsBase_PessoaCODIGO: TIntegerField;
    sdsBase_PessoaRAZAO_SOCIAL: TStringField;
    sdsBase_PessoaNOME_FANTASIA: TStringField;
    sdsBase_PessoaTIPO_PESSOA: TStringField;
    sdsBase_PessoaDOCUMENTO: TStringField;
    sdsBase_PessoaENDERECO: TStringField;
    sdsBase_PessoaNUMERO: TStringField;
    sdsBase_PessoaCOMPLEMENTO: TStringField;
    sdsBase_PessoaCIDADE: TStringField;
    sdsBase_PessoaUF: TStringField;
    sdsBase_PessoaCEP: TStringField;
    cdsBase_PessoaID_PESSOA: TIntegerField;
    cdsBase_PessoaCODIGO: TIntegerField;
    cdsBase_PessoaRAZAO_SOCIAL: TStringField;
    cdsBase_PessoaNOME_FANTASIA: TStringField;
    cdsBase_PessoaTIPO_PESSOA: TStringField;
    cdsBase_PessoaDOCUMENTO: TStringField;
    cdsBase_PessoaENDERECO: TStringField;
    cdsBase_PessoaNUMERO: TStringField;
    cdsBase_PessoaCOMPLEMENTO: TStringField;
    cdsBase_PessoaCIDADE: TStringField;
    cdsBase_PessoaUF: TStringField;
    cdsBase_PessoaCEP: TStringField;
    sdsBase_PessoaSITE: TStringField;
    cdsBase_PessoaSITE: TStringField;
    dsLigacao: TDataSource;
    sdsBase_Pessoa_Contato: TSQLDataSet;
    cdsBase_PessoasdsBase_Pessoa_Contato: TDataSetField;
    sdsBase_Pessoa_ContatoID_BASE_PESSOA_CONTATO: TIntegerField;
    sdsBase_Pessoa_ContatoID_PESSOA: TIntegerField;
    sdsBase_Pessoa_ContatoTIPO: TStringField;
    sdsBase_Pessoa_ContatoNOME: TStringField;
    sdsBase_Pessoa_ContatoTELEFONE: TStringField;
    sdsBase_Pessoa_ContatoEMAIL: TStringField;
    cdsBase_Pessoa_Contato: TClientDataSet;
    cdsBase_Pessoa_ContatoID_BASE_PESSOA_CONTATO: TIntegerField;
    cdsBase_Pessoa_ContatoID_PESSOA: TIntegerField;
    cdsBase_Pessoa_ContatoTIPO: TStringField;
    cdsBase_Pessoa_ContatoNOME: TStringField;
    cdsBase_Pessoa_ContatoTELEFONE: TStringField;
    cdsBase_Pessoa_ContatoEMAIL: TStringField;
    dsBase_Pessoa_Contato: TDataSource;
    cdsTipo_Contato: TClientDataSet;
    dsTipo_Contato: TDataSource;
    cdsTipo_ContatoTIPO: TStringField;
    cdsTipo_ContatoDESCRICAO: TStringField;
    sdsBase_PessoaCATEGORIA_CADASTRO: TStringField;
    cdsBase_PessoaCATEGORIA_CADASTRO: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure cdsBase_Pessoa_ContatoAfterInsert(DataSet: TDataSet);
  protected
    procedure AfterInsertRecord; override;
    procedure GetMainDataSource(var DataSource: TDataSource); override;
    function CategoriaCadastro: string; virtual; abstract;
  public
    { Public declarations }
  end;

//var
//  dmPessoaBase: TdmPessoaBase;

implementation

uses
  recerror;

{$R *.dfm}

procedure TdmPessoaBase.AfterInsertRecord;
const
  cProximoCodigo = 'SELECT COALESCE(MAX(CODIGO), 0) + 1 NOVO_CODIGO FROM (%s)';
var
  oCds: TClientDataSet;
begin
  inherited;
  oCds := NewClientDataSet( Format(cProximoCodigo, [Self.MainOriginalCommandText]) );
  try
    cdsBase_PessoaCODIGO.AsInteger := oCds.FieldByName('NOVO_CODIGO').AsInteger;
  finally
    FreeAndNil(oCds);
  end;

  cdsBase_PessoaCATEGORIA_CADASTRO.AsString := CategoriaCadastro;
end;

procedure TdmPessoaBase.cdsBase_Pessoa_ContatoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  cdsBase_Pessoa_ContatoID_BASE_PESSOA_CONTATO.AsInteger := GenTableID('BASE_PESSOA_CONTATO');
  cdsBase_Pessoa_ContatoID_PESSOA.AsInteger              := cdsBase_PessoaID_PESSOA.AsInteger;
  cdsBase_Pessoa_ContatoTIPO.AsString                    := 'P';
end;

procedure TdmPessoaBase.DataModuleCreate(Sender: TObject);

  procedure InserirTipoPessoa(ATipo, ADescricao: string);
  begin
    cdsTipo_Pessoa.Append;
    cdsTipo_PessoaTIPO.AsString := ATipo;
    cdsTipo_PessoaDESCRICAO.AsString := ADescricao;
    cdsTipo_Pessoa.Post;
  end;

  procedure InserirTipoContato(ATipo, ADescricao: string);
  begin
    cdsTipo_Contato.Append;
    cdsTipo_ContatoTIPO.AsString := ATipo;
    cdsTipo_ContatoDESCRICAO.AsString := ADescricao;
    cdsTipo_Contato.Post;
  end;

begin
  inherited;
  cdsTipo_Pessoa.CreateDataSet;
  InserirTipoPessoa('F', 'Física');
  InserirTipoPessoa('J', 'Jurídica');

  cdsTipo_Contato.CreateDataSet;
  InserirTipoContato('P', 'Principal');
  InserirTipoContato('S', 'Secundário');
end;

procedure TdmPessoaBase.DataModuleDestroy(Sender: TObject);
begin
  inherited;
  cdsTipo_Contato.Close;
  cdsTipo_Pessoa.Close;
  cdsBase_Pessoa.Close;
end;

procedure TdmPessoaBase.GetMainDataSource(var DataSource: TDataSource);
begin
  DataSource := dsBase_Pessoa;
end;

end.
