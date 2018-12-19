unit datamodule.agenda.corporativa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, datamodule.agenda.base, FMTBcd, DB, DBClient, Provider, SqlExpr,
  SimpleDS;

type
  TdmAgendaCorporativa = class(TdmAgendaBase)
    sdsPesquisa: TSimpleDataSet;
    dsPesquisa: TDataSource;
    sdsPesquisaNOME_PESSOA: TStringField;
    sdsPesquisaDOCUMENTO: TStringField;
    sdsPesquisaCONTATO: TStringField;
    sdsPesquisaTELEFONE: TStringField;
    sdsPesquisaEMAIL: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    FPesquisaOriginal: string;
  protected
    function FiltroCompromisso: string; override;
    function FiltroRecados: string; override;
  public
    { Public declarations }
    procedure ConsultarPessoa(AFiltro: string);
  end;

//var
//  dmAgendaCorporativa: TdmAgendaCorporativa;

implementation

uses
  controlecontabil.dados;

{$R *.dfm}

{ TdmAgendaCorporativa }

procedure TdmAgendaCorporativa.ConsultarPessoa(AFiltro: string);
var
  sFilter: String;
begin
  sFilter := '';
  if AFiltro <> '' then
  begin
    if Pos('WHERE', FPesquisaOriginal) > 0 then
      sFilter := Format(' AND %s', [AFiltro])
    else
      sFilter := Format(' WHERE %s ', [AFiltro]);
  end;

  sFilter := StringReplace(sFilter, 'RAZAO_SOCIAL', 'UPPER(RAZAO_SOCIAL)', [rfReplaceAll]);
  sFilter := StringReplace(sFilter, 'DOCUMENTO'   , 'UPPER(DOCUMENTO)'   , [rfReplaceAll]);
  sFilter := StringReplace(sFilter, 'NOME'        , 'UPPER(NOME)'        , [rfReplaceAll]);
  sFilter := AnsiUpperCase(sFilter);

  sdsPesquisa.Close;
  sdsPesquisa.DataSet.CommandText := StringReplace(FPesquisaOriginal, '/*{MCONDITION}*/', sFilter, [rfReplaceAll]);
  sdsPesquisa.Open;
end;

procedure TdmAgendaCorporativa.DataModuleCreate(Sender: TObject);
begin
  inherited;
  FPesquisaOriginal := sdsPesquisa.DataSet.CommandText;
end;

function TdmAgendaCorporativa.FiltroCompromisso: string;
begin
  Result := 'WHERE CM.STATUS <> 2';
end;

function TdmAgendaCorporativa.FiltroRecados: string;
begin
  Result := '';
end;

end.
