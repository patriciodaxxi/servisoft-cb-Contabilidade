unit datamodule.pessoa.escritorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, datamodule.pessoa.base, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TdmCadEscritorio = class(TdmPessoaBase)
    sdsContab_Escritorio: TSQLDataSet;
    sdsContab_EscritorioID_ESCRITORIO: TIntegerField;
    sdsContab_EscritorioID_PESSOA: TIntegerField;
    sdsContab_EscritorioLOGOTIPO: TBlobField;
    cdsContab_Escritorio: TClientDataSet;
    dsContab_Escritorio: TDataSource;
    cdsContab_EscritorioID_ESCRITORIO: TIntegerField;
    cdsContab_EscritorioID_PESSOA: TIntegerField;
    cdsContab_EscritorioLOGOTIPO: TBlobField;
    cdsBase_PessoasdsContab_Escritorio: TDataSetField;
    procedure cdsContab_EscritorioAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  protected
    procedure BeforeInsertRecord; override;
    procedure BeforeSaveRecord; override;
    function CategoriaCadastro: string; override;
  public
    { Public declarations }
    procedure CarregarLogotipo(AArquivo: string);
    procedure RemoverLogotipo;
  end;

//var
//  dmCadEscritorio: TdmCadEscritorio;

implementation

uses
  controlecontabil.dados;

{$R *.dfm}

{ TdmCadEscritorio }

procedure TdmCadEscritorio.BeforeInsertRecord;
const
  cProximoCodigo = 'SELECT * FROM CONTAB_ESCRITORIO';
var
  oCds: TClientDataSet;
  JaCadastrado: boolean;
begin
  inherited;
  oCds := NewClientDataSet(cProximoCodigo);
  try
    JaCadastrado := not oCds.IsEmpty;
  finally
    FreeAndNil(oCds);
  end;

  if JaCadastrado then
    raise Exception.Create('Apenas um escritório contábil poderá ser cadastrado.');
end;

procedure TdmCadEscritorio.BeforeSaveRecord;
begin
  inherited;
  if cdsContab_Escritorio.IsEmpty then
  begin
    cdsContab_Escritorio.Append;
    cdsContab_Escritorio.Post;
  end;
end;

procedure TdmCadEscritorio.CarregarLogotipo(AArquivo: string);
begin
  if cdsContab_Escritorio.IsEmpty then
    cdsContab_Escritorio.Append;
  if not (cdsContab_Escritorio.State in dsEditModes) then
    cdsContab_Escritorio.Edit;
  cdsContab_EscritorioLOGOTIPO.LoadFromFile(AArquivo);
end;

function TdmCadEscritorio.CategoriaCadastro: string;
begin
  Result := 'Escritório Contábil';
end;

procedure TdmCadEscritorio.cdsContab_EscritorioAfterInsert(DataSet: TDataSet);
begin
  inherited;
  cdsContab_EscritorioID_ESCRITORIO.AsInteger := GenTableID('CONTAB_ESCRITORIO');
  cdsContab_EscritorioID_PESSOA.AsInteger     := cdsBase_PessoaID_PESSOA.AsInteger;
end;

procedure TdmCadEscritorio.RemoverLogotipo;
begin
  if not (cdsContab_Escritorio.State in dsEditModes) then
    cdsContab_Escritorio.Edit;
  cdsContab_EscritorioLOGOTIPO.Clear;
end;

end.
