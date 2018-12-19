unit datamodule.agenda.base;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, biblioteca.datamodule.cadastro, FMTBcd, DB, SqlExpr, DBClient,
  Provider, SimpleDS;

type
  TdmAgendaBase = class(TdmCadBase)
    sdsCompromissos: TSQLDataSet;
    sdsCompromissosQUEM: TStringField;
    sdsCompromissosASSUNTO: TMemoField;
    sdsCompromissosQUANDO: TSQLTimeStampField;
    sdsCompromissosLOCAL: TMemoField;
    sdsCompromissosSTATUS: TStringField;
    dspCompromissos: TDataSetProvider;
    cdsCompromissos: TClientDataSet;
    dsCompromissos: TDataSource;
    cdsCompromissosQUEM: TStringField;
    cdsCompromissosASSUNTO: TMemoField;
    cdsCompromissosQUANDO: TSQLTimeStampField;
    cdsCompromissosLOCAL: TMemoField;
    cdsCompromissosSTATUS: TStringField;
    sdsRecados: TSimpleDataSet;
    sdsRecadosDE: TStringField;
    sdsRecadosPARA: TStringField;
    sdsRecadosDATA: TSQLTimeStampField;
    sdsRecadosASSUNTO: TMemoField;
    dsRecados: TDataSource;
    sdsRecadosSTATUS: TStringField;
    sdsRecadosID_CONTAB_RECADO: TIntegerField;
    sdsCompromissosID_CONTAB_COMPROMISSO: TIntegerField;
    cdsCompromissosID_CONTAB_COMPROMISSO: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsCompromissosBeforeOpen(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
    procedure sdsRecadosBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  protected
    function FiltroCompromisso: string; virtual; abstract;
    function FiltroRecados: string; virtual; abstract;
    procedure GetMainDataSource(var DataSource: TDataSource); override;
  public
    { Public declarations }
    function ExistePesquisa: Boolean; override;
    procedure CompromissoConcluido;
    procedure RecadoConcluido;
    procedure TransferirCompromisso(ADate: TDateTime);
  end;

//var
//  dmAgendaBase: TdmAgendaBase;

implementation

uses
  controlecontabil.dados, SqlTimSt;

{$R *.dfm}

{ TdmAgendaBase }

procedure TdmAgendaBase.cdsCompromissosBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  sdsCompromissos.CommandText := StringReplace(sdsCompromissos.CommandText, '/*{MCONDITION}*/', FiltroCompromisso, [rfReplaceAll]);
end;

procedure TdmAgendaBase.CompromissoConcluido;
const
  C_SQL = 'UPDATE CONTAB_COMPROMISSO SET STATUS = 2 WHERE ID_CONTAB_COMPROMISSO = :ID_CONTAB_COMPROMISSO';
var
  Sds: TSQLDataSet;
begin
  Sds := TSQLDataSet.Create(nil);
  try
    Sds.SQLConnection := dmDados.soConexao;
    Sds.CommandText := C_SQL;
    Sds.ParamByName('ID_CONTAB_COMPROMISSO').AsInteger := cdsCompromissosID_CONTAB_COMPROMISSO.AsInteger;
    Sds.ExecSQL(False);
    cdsCompromissos.Refresh;
  finally
    FreeAndNil(Sds);
  end;
end;

procedure TdmAgendaBase.DataModuleCreate(Sender: TObject);
begin
  inherited;
  cdsCompromissos.Open;
  sdsRecados.Open;
end;

procedure TdmAgendaBase.DataModuleDestroy(Sender: TObject);
begin
  inherited;
  cdsCompromissos.Close;
end;

function TdmAgendaBase.ExistePesquisa: Boolean;
begin
  Result := True;
end;

procedure TdmAgendaBase.GetMainDataSource(var DataSource: TDataSource);
begin
  inherited;
  DataSource := dsCompromissos;
end;

procedure TdmAgendaBase.RecadoConcluido;
const
  C_SQL = 'UPDATE CONTAB_RECADO SET STATUS = 2 WHERE ID_CONTAB_RECADO = :ID_CONTAB_RECADO';
var
  Sds: TSQLDataSet;
begin
  Sds := TSQLDataSet.Create(nil);
  try
    Sds.SQLConnection := dmDados.soConexao;
    Sds.CommandText := C_SQL;
    Sds.ParamByName('ID_CONTAB_RECADO').AsInteger := sdsRecadosID_CONTAB_RECADO.AsInteger; 
    Sds.ExecSQL(False);
    sdsRecados.Refresh;
  finally
    FreeAndNil(Sds);
  end;
end;

procedure TdmAgendaBase.sdsRecadosBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  sdsRecados.DataSet.CommandText := StringReplace(sdsRecados.DataSet.CommandText, '/*{MCONDITION}*/', FiltroRecados, [rfReplaceAll]);
end;

procedure TdmAgendaBase.TransferirCompromisso(ADate: TDateTime);
const
  C_SQL = 'UPDATE CONTAB_COMPROMISSO SET STATUS = 3, QUANDO = :QUANDO WHERE ID_CONTAB_COMPROMISSO = :ID_CONTAB_COMPROMISSO';
var
  Sds: TSQLDataSet;
begin
  Sds := TSQLDataSet.Create(nil);
  try
    Sds.SQLConnection := dmDados.soConexao;
    Sds.CommandText := C_SQL;
    Sds.ParamByName('ID_CONTAB_COMPROMISSO').AsInteger := cdsCompromissosID_CONTAB_COMPROMISSO.AsInteger;
    Sds.ParamByName('QUANDO').AsSQLTimeStamp := DateTimeToSQLTimeStamp(ADate);
    Sds.ExecSQL(False);
    cdsCompromissos.Refresh;
  finally
    FreeAndNil(Sds);
  end;
end;

end.
