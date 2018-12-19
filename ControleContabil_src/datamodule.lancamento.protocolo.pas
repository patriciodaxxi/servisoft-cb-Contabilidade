unit datamodule.lancamento.protocolo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, biblioteca.datamodule.cadastro, FMTBcd, DB, DBClient, Provider,
  SqlExpr, SimpleDS;

type
  TdmLancamentoProtocolo = class(TdmCadBase)
    sdsContab_Protocolo: TSQLDataSet;
    dspContab_Protocolo: TDataSetProvider;
    cdsContab_Protocolo: TClientDataSet;
    dsContab_Protocolo: TDataSource;
    dsLigacao: TDataSource;
    sdsContab_Protocolo_Itens: TSQLDataSet;
    sdsContab_ProtocoloID_CONTAB_PROTOCOLO: TIntegerField;
    sdsContab_ProtocoloID_CLIENTE: TIntegerField;
    sdsContab_ProtocoloCLIENTE: TStringField;
    sdsContab_ProtocoloID_ENTREGADOR: TIntegerField;
    sdsContab_ProtocoloENTREGADOR: TStringField;
    sdsContab_ProtocoloTIPO_PROTOCOLO: TStringField;
    sdsContab_ProtocoloDESTINATARIO: TStringField;
    sdsContab_ProtocoloOBSERVACOES: TMemoField;
    cdsContab_ProtocoloID_CONTAB_PROTOCOLO: TIntegerField;
    cdsContab_ProtocoloID_CLIENTE: TIntegerField;
    cdsContab_ProtocoloCLIENTE: TStringField;
    cdsContab_ProtocoloID_ENTREGADOR: TIntegerField;
    cdsContab_ProtocoloENTREGADOR: TStringField;
    cdsContab_ProtocoloTIPO_PROTOCOLO: TStringField;
    cdsContab_ProtocoloDESTINATARIO: TStringField;
    cdsContab_ProtocoloOBSERVACOES: TMemoField;
    sdsContab_Protocolo_ItensID_CONTAB_PROTOCOLO_ITENS: TIntegerField;
    sdsContab_Protocolo_ItensID_PROTOCOLO: TIntegerField;
    sdsContab_Protocolo_ItensID_ITEM_LANCAMENTO: TIntegerField;
    sdsContab_Protocolo_ItensOBSERVACAO: TMemoField;
    cdsContab_Protocolo_Itens: TClientDataSet;
    cdsContab_ProtocolosdsContab_Protocolo_Itens: TDataSetField;
    cdsContab_Protocolo_ItensID_CONTAB_PROTOCOLO_ITENS: TIntegerField;
    cdsContab_Protocolo_ItensID_PROTOCOLO: TIntegerField;
    cdsContab_Protocolo_ItensID_ITEM_LANCAMENTO: TIntegerField;
    cdsContab_Protocolo_ItensOBSERVACAO: TMemoField;
    dsContab_Protocolo_Itens: TDataSource;
    sdsContab_ProtocoloDATA: TSQLTimeStampField;
    cdsContab_ProtocoloDATA: TSQLTimeStampField;
    cdsTipo: TClientDataSet;
    dsTipo: TDataSource;
    cdsTipoID_TIPO: TStringField;
    cdsTipoDESCRICAO: TStringField;
    sdsItensLancamento: TSimpleDataSet;
    sdsItensLancamentoID_CONTAB_ITEM_LANCAMENTO: TIntegerField;
    sdsItensLancamentoCODIGO: TIntegerField;
    sdsItensLancamentoDESCRICAO: TStringField;
    dsItensLancamento: TDataSource;
    cdsContab_Protocolo_ItensDescricaoItemLancamento: TStringField;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsContab_ProtocoloAfterInsert(DataSet: TDataSet);
    procedure cdsContab_Protocolo_ItensAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  protected
    procedure GetMainDataSource(var DataSource: TDataSource); override;
  public
    { Public declarations }
  end;

var
  dmLancamentoProtocolo: TdmLancamentoProtocolo;

implementation

uses
  controlecontabil.dados, SqlTimSt;

{$R *.dfm}

{ TdmLancamentoProtocolo }

procedure TdmLancamentoProtocolo.cdsContab_Protocolo_ItensAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  cdsContab_Protocolo_ItensID_CONTAB_PROTOCOLO_ITENS.AsInteger := GenTableID('CONTAB_PROTOCOLO_ITENS');
  cdsContab_Protocolo_ItensID_PROTOCOLO.AsInteger := cdsContab_ProtocoloID_CONTAB_PROTOCOLO.AsInteger;
end;

procedure TdmLancamentoProtocolo.cdsContab_ProtocoloAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  cdsContab_ProtocoloDATA.AsSQLTimeStamp := DateTimeToSQLTimeStamp(Now);
  cdsContab_ProtocoloTIPO_PROTOCOLO.AsString := 'E';
end;

procedure TdmLancamentoProtocolo.DataModuleCreate(Sender: TObject);

  procedure AdicionarTipo(AId, ADescricao: string);
  begin
    cdsTipo.Append;
    cdsTipoID_TIPO.AsString   := AId;
    cdsTipoDESCRICAO.AsString := ADescricao;
    cdsTipo.Post;
  end;

begin
  inherited;
  cdsTipo.CreateDataSet;
  AdicionarTipo('E', 'Entrada');
  AdicionarTipo('S', 'Saída');

  sdsItensLancamento.Open;
end;

procedure TdmLancamentoProtocolo.DataModuleDestroy(Sender: TObject);
begin
  inherited;
  cdsContab_Protocolo.Close;
  cdsTipo.Close;
  sdsItensLancamento.Close;
end;

procedure TdmLancamentoProtocolo.GetMainDataSource(var DataSource: TDataSource);
begin
  inherited;
  DataSource := dsContab_Protocolo;
end;

end.
