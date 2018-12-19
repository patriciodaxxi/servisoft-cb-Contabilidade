unit datamodule.indicadores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, biblioteca.datamodule.cadastro, DB, DBClient, SimpleDS, FMTBcd,
  Provider, SqlExpr, JvComponentBase, JvDesktopAlert;

type
  TdmIndicadores = class(TdmCadBase)
    sdsContab_Recado: TSQLDataSet;
    sdsContab_RecadoID_CONTAB_RECADO: TIntegerField;
    sdsContab_RecadoDE: TStringField;
    sdsContab_RecadoPARA: TIntegerField;
    sdsContab_RecadoASSUNTO: TMemoField;
    sdsContab_RecadoDATA_ENVIO: TSQLTimeStampField;
    sdsContab_RecadoSTATUS: TIntegerField;
    sdsContab_RecadoEXIBIR_ALERTA: TIntegerField;
    sdsContab_RecadoRAZAO_SOCIAL: TStringField;
    dspContab_Recado: TDataSetProvider;
    cdsContab_Recado: TClientDataSet;
    cdsContab_RecadoID_CONTAB_RECADO: TIntegerField;
    cdsContab_RecadoDE: TStringField;
    cdsContab_RecadoPARA: TIntegerField;
    cdsContab_RecadoASSUNTO: TMemoField;
    cdsContab_RecadoDATA_ENVIO: TSQLTimeStampField;
    cdsContab_RecadoSTATUS: TIntegerField;
    cdsContab_RecadoEXIBIR_ALERTA: TIntegerField;
    cdsContab_RecadoRAZAO_SOCIAL: TStringField;
    dsContab_Recado: TDataSource;
    sdsIndicadores: TSimpleDataSet;
    sdsIndicadoresMAX_RECADOS: TIntegerField;
    sdsIndicadoresTOT_RECADOS: TIntegerField;
    sdsIndicadoresMAX_VALIDADE: TIntegerField;
    sdsIndicadoresTOT_VALIDADE: TIntegerField;
    sdsIndicadoresDIAS_VALIDADE: TIntegerField;
    sdsIndicadoresMAX_COMPROMISSO: TIntegerField;
    sdsIndicadoresTOT_COMPROMISSO: TIntegerField;
    sdsAcessos: TSimpleDataSet;
    sdsAcessosCODIGO: TIntegerField;
    sdsAcessosRAZAO_SOCIAL: TStringField;
    sdsAcessosACESSO_TIPO: TStringField;
    sdsAcessosACESSO_DESCRICAO: TStringField;
    dsAcessos: TDataSource;
    sdsAcessosVALIDADE: TDateField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure cdsContab_RecadoBeforeOpen(DataSet: TDataSet);
    procedure sdsContab_RecadoBeforeOpen(DataSet: TDataSet);
    procedure sdsIndicadoresBeforeOpen(DataSet: TDataSet);
    procedure sdsIndicadoresAfterOpen(DataSet: TDataSet);
    procedure sdsIndicadoresAfterClose(DataSet: TDataSet);
  private
    { Private declarations }
  protected
    procedure GetMainDataSource(var DataSource: TDataSource); override;
  public
    { Public declarations }
    procedure VerificaRecados;
  end;

//var
//  dmIndicadores: TdmIndicadores;

implementation

uses
  controlecontabil.dados;

{$R *.dfm}

procedure TdmIndicadores.cdsContab_RecadoBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  sdsContab_Recado.ParamByName('ID_PESSOA').AsInteger := dmDados.CodigoUsuario;
end;

procedure TdmIndicadores.DataModuleCreate(Sender: TObject);
begin
  inherited;
  sdsIndicadores.Open;
end;

procedure TdmIndicadores.DataModuleDestroy(Sender: TObject);
begin
  inherited;
  sdsIndicadores.Close;
end;

procedure TdmIndicadores.GetMainDataSource(var DataSource: TDataSource);
begin
  DataSource := dsContab_Recado;
end;

procedure TdmIndicadores.sdsContab_RecadoBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  sdsIndicadores.DataSet.ParamByName('ID_PESSOA').AsInteger := dmDados.CodigoUsuario;
end;

procedure TdmIndicadores.sdsIndicadoresAfterClose(DataSet: TDataSet);
begin
  inherited;
  sdsAcessos.Close;
end;

procedure TdmIndicadores.sdsIndicadoresAfterOpen(DataSet: TDataSet);
begin
  inherited;
  sdsAcessos.Open;
end;

procedure TdmIndicadores.sdsIndicadoresBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  sdsIndicadores.DataSet.ParamByName('ID_PESSOA').AsInteger := dmDados.CodigoUsuario;
end;

procedure TdmIndicadores.VerificaRecados;
const
  Imagem  = 'comments.png';
  Duracao = 0;
var
  DA: TJvDesktopAlert;
begin
  cdsContab_Recado.Refresh;
  cdsContab_Recado.First;
  while not cdsContab_Recado.Eof do
  begin
    DA := TJvDesktopAlert.Create(nil);
    try
      DA.HeaderText := 'de: ' + cdsContab_RecadoDE.AsString;
      DA.MessageText  := cdsContab_RecadoASSUNTO.AsString;
      DA.AutoFree := True;
      if FileExists(Imagem) then
        DA.Image.LoadFromFile(Imagem);
      DA.StyleHandler.DisplayDuration  := Duracao;
      DA.Execute;
    finally
      // DA.Free;
    end;

    cdsContab_Recado.Edit;
    cdsContab_RecadoEXIBIR_ALERTA.AsInteger := 0;
    cdsContab_Recado.Post;

    cdsContab_Recado.Next;
  end;

  try
    cdsContab_Recado.ApplyUpdates(0);
  except
  end;
end;

end.
