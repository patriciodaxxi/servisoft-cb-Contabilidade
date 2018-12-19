unit biblioteca.relatorio.base;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, biblioteca.form.base, JvValidators, JvComponentBase, JvEmbeddedForms,
  RLFilters, RLPDFFilter, RLReport, RLParser;

type
  TfrmRelBase = class(TfrmBase)
    RLReport: TRLReport;
    RLPDFFilter: TRLPDFFilter;
    Cabecalho: TRLBand;
    Rodape: TRLBand;
    lbTitulo: TRLLabel;
    lbEmissao: TRLLabel;
    lbData: TRLSystemInfo;
    lbTitEmissor: TRLLabel;
    lbEscritorio: TRLDBText;
    lbDocumento: TRLDBText;
    lbEndereco: TRLDBText;
    lbTitDocumento: TRLLabel;
    lbCidade: TRLDBText;
    lbEstado: TRLDBText;
    lbSepCid: TRLLabel;
    lbTitCep: TRLLabel;
    lbCep: TRLDBText;
    lbTitFone: TRLLabel;
    lbFone: TRLDBText;
    lbTitEmail: TRLLabel;
    lbEmail: TRLDBText;
    lbSite: TRLDBText;
    imgLogotipo: TRLImage;
    lbEmissor: TRLLabel;
    procedure imgLogotipoBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure lbEmissorBeforePrint(Sender: TObject; var Text: string;
      var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelBase: TfrmRelBase;

implementation

uses
  controlecontabil.dados, jpeg, RLConsts, DB;

{$R *.dfm}

procedure TfrmRelBase.imgLogotipoBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  JpegImage: TJPEGImage;
  BlobStream: TStream;
begin
  if (not dmDados.sdsEscritorioLOGOTIPO.IsNull) then
  begin
    BlobStream := dmDados.sdsEscritorio.CreateBlobStream(dmDados.sdsEscritorioLOGOTIPO, bmRead);
    JpegImage := TJPEGImage.Create;
    try
      JpegImage.LoadFromStream(BlobStream);
      imgLogotipo.Picture.Assign(JpegImage);
    finally
      JpegImage.Free;
      BlobStream.Free;
    end;
  end;
end;

procedure TfrmRelBase.lbEmissorBeforePrint(Sender: TObject; var Text: string;
  var PrintIt: Boolean);
var
  i: Integer;
begin
  i := Pos(' ', dmDados.NomeUsuario);
  if (i > 0) then
    Text := Trim(Copy(dmDados.NomeUsuario, 1, i))
  else
    Text := Trim(dmDados.NomeUsuario);
end;

initialization
  SetVersion(0, 71, 'B');

end.
