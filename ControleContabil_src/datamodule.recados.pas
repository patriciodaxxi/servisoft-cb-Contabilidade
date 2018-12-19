unit datamodule.recados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, biblioteca.datamodule.cadastro, FMTBcd, DB, SqlExpr, Provider,
  DBClient, SimpleDS, SqlTimSt;

type
  TdmRecados = class(TdmCadBase)
    sdsContab_Recado: TSQLDataSet;
    sdsContab_RecadoID_CONTAB_RECADO: TIntegerField;
    sdsContab_RecadoDE: TStringField;
    sdsContab_RecadoPARA: TIntegerField;
    sdsContab_RecadoASSUNTO: TMemoField;
    dspContab_Recado: TDataSetProvider;
    cdsContab_Recado: TClientDataSet;
    cdsContab_RecadoID_CONTAB_RECADO: TIntegerField;
    cdsContab_RecadoDE: TStringField;
    cdsContab_RecadoPARA: TIntegerField;
    cdsContab_RecadoASSUNTO: TMemoField;
    dsContab_Recado: TDataSource;
    sdsContab_RecadoDATA_ENVIO: TSQLTimeStampField;
    sdsContab_RecadoSTATUS: TIntegerField;
    cdsContab_RecadoDATA_ENVIO: TSQLTimeStampField;
    cdsContab_RecadoSTATUS: TIntegerField;
    sdsFuncionario: TSimpleDataSet;
    sdsFuncionarioRAZAO_SOCIAL: TStringField;
    sdsFuncionarioID_CONTAB_FUNCIONARIO: TIntegerField;
    sdsFuncionarioID_PESSOA: TIntegerField;
    sdsFuncionarioLOGIN: TStringField;
    sdsFuncionarioSENHA: TStringField;
    sdsFuncionarioATIVO: TIntegerField;
    dsFuncionario: TDataSource;
    sdsFuncionarioCODIGO: TIntegerField;
    sdsContab_RecadoEXIBIR_ALERTA: TIntegerField;
    cdsContab_RecadoEXIBIR_ALERTA: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure cdsContab_RecadoAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  protected
    procedure GetMainDataSource(var DataSource: TDataSource); override;
  public
    { Public declarations }
  end;

//var
//  dmRecados: TdmRecados;

implementation

uses
  controlecontabil.dados;

{$R *.dfm}

{ TdmRecados }

procedure TdmRecados.cdsContab_RecadoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  cdsContab_RecadoDATA_ENVIO.AsSQLTimeStamp := DateTimeToSQLTimeStamp(Now);
  cdsContab_RecadoSTATUS.AsInteger          := 1;
  cdsContab_RecadoEXIBIR_ALERTA.AsInteger   := 1;
end;

procedure TdmRecados.DataModuleCreate(Sender: TObject);
begin
  inherited;
  sdsFuncionario.Open;
end;

procedure TdmRecados.DataModuleDestroy(Sender: TObject);
begin
  inherited;
  sdsFuncionario.Close;
end;

procedure TdmRecados.GetMainDataSource(var DataSource: TDataSource);
begin
  DataSource := dsContab_Recado;
end;

end.
