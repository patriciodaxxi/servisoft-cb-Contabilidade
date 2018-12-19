unit relatorio.protocolo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, biblioteca.relatorio.base, RLFilters, RLPDFFilter, JvValidators,
  JvComponentBase, JvEmbeddedForms, RLReport, DB, DBClient, SimpleDS;

type
  TfrmRelProtocolo = class(TfrmRelBase)
    sdsDados: TSimpleDataSet;
    sdsDadosID_CONTAB_PROTOCOLO: TIntegerField;
    sdsDadosID_CLIENTE: TIntegerField;
    sdsDadosCLIENTE: TStringField;
    sdsDadosDATA: TSQLTimeStampField;
    sdsDadosID_ENTREGADOR: TIntegerField;
    sdsDadosENTREGADOR: TStringField;
    sdsDadosTIPO_PROTOCOLO: TStringField;
    sdsDadosDESTINATARIO: TStringField;
    sdsDadosOBSERVACOES: TMemoField;
    dsDados: TDataSource;
    RLGroup1: TRLGroup;
    sdsDadosITEM_DESCRICAO: TStringField;
    sdsDadosITEM_OBSERVACOES: TMemoField;
    RLBand1: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText3: TRLDBText;
    RLBand2: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLDBMemo1: TRLDBMemo;
    lbTitNumero: TRLLabel;
    lbNumero: TRLLabel;
    lbEntregador: TRLLabel;
    RLBand3: TRLBand;
    RLDBMemo3: TRLDBMemo;
    RLLabel5: TRLLabel;
    RLDBText4: TRLDBText;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Executar(AID_Protocolo: Integer);
  end;

var
  frmRelProtocolo: TfrmRelProtocolo;

implementation

uses
  controlecontabil.dados, jpeg;

{$R *.dfm}

{ TfrmRelProtocolo }

procedure TfrmRelProtocolo.Executar(AID_Protocolo: Integer);
begin
  sdsDados.Close;
  sdsDados.DataSet.ParamByName('ID_CONTAB_PROTOCOLO').AsInteger := AID_Protocolo;
  sdsDados.Open;

  lbNumero.Caption     := IntToStr(AID_Protocolo);
  lbEntregador.Caption := sdsDadosENTREGADOR.AsString;

  RLPDFFilter.DocumentInfo.Author := dmDados.NomeEscritorio;
  RLPDFFilter.DocumentInfo.Title  := 'Protocolo de documentos';
  RLPDFFilter.FileName            := 'protocolo_' + IntToStr(AID_Protocolo) + '.pdf';

  RLReport.PreviewModal;
end;

end.
