unit controlecontabil.indicadores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvComponentBase, JvEmbeddedForms, RzPrgres, StdCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxProgressBar, biblioteca.form.base, JvValidators,
  JvErrorIndicator, datamodule.indicadores, JvThreadTimer;

type
  TfrmIndicadores = class(TfrmBase)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    cxProgressBar1: TcxProgressBar;
    cxProgressBar2: TcxProgressBar;
    cxProgressBar3: TcxProgressBar;
    cxProgressBar4: TcxProgressBar;
    pbRecados: TcxProgressBar;
    pbCompromissos: TcxProgressBar;
    pbValidade: TcxProgressBar;
    thtAtualizacao: TJvThreadTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure thtAtualizacaoTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pbValidadeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pbCompromissosMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    FDmIndicadores: TdmIndicadores;
  public
    { Public declarations }
    procedure AtualizarIndicadores;
    procedure VerificaRecados;
  end;

var
  frmIndicadores: TfrmIndicadores;

implementation

uses
  controlecontabil.indicadores.consultar, controlecontabil.principal;

{$R *.dfm}

procedure TfrmIndicadores.AtualizarIndicadores;
begin
  FDmIndicadores.sdsIndicadores.Close;
  FDmIndicadores.sdsIndicadores.Open;

  // ** Recados
  pbRecados.Properties.Max  := FDmIndicadores.sdsIndicadoresMAX_RECADOS.AsInteger;
  pbRecados.Position        := FDmIndicadores.sdsIndicadoresTOT_RECADOS.AsInteger;
  pbRecados.Properties.Text := Format('%d Recado(s)', [FDmIndicadores.sdsIndicadoresTOT_RECADOS.AsInteger]);

  // ** Compromissos
  pbCompromissos.Properties.Max  := FDmIndicadores.sdsIndicadoresMAX_COMPROMISSO.AsInteger;
  pbCompromissos.Position        := FDmIndicadores.sdsIndicadoresTOT_COMPROMISSO.AsInteger;
  pbCompromissos.Properties.Text := Format('%d Compromisso(s)', [FDmIndicadores.sdsIndicadoresTOT_COMPROMISSO.AsInteger]);

  // ** Validades
  pbValidade.Properties.Max  := FDmIndicadores.sdsIndicadoresMAX_VALIDADE.AsInteger;
  pbValidade.Position        := FDmIndicadores.sdsIndicadoresTOT_VALIDADE.AsInteger;
  pbValidade.Properties.Text := Format('%d Acesso(s) vencendo em até %d dias', [FDmIndicadores.sdsIndicadoresTOT_VALIDADE.AsInteger,
                                                                                FDmIndicadores.sdsIndicadoresDIAS_VALIDADE.AsInteger]);
end;

procedure TfrmIndicadores.FormCreate(Sender: TObject);
begin
  inherited;
  FDmIndicadores := TdmIndicadores.Create(nil);
  AtualizarIndicadores;
end;

procedure TfrmIndicadores.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FDmIndicadores);
end;

procedure TfrmIndicadores.FormShow(Sender: TObject);
begin
  inherited;
  thtAtualizacao.Enabled := True;
end;

procedure TfrmIndicadores.pbCompromissosMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if (Button = mbLeft) then
    frmPrincipal.bbtMinhaAgenda.Click;
end;

procedure TfrmIndicadores.pbValidadeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if (Button = mbLeft) then
    TfrmConsultarIndicadores.Consultar(FDmIndicadores.dsAcessos);
end;

procedure TfrmIndicadores.thtAtualizacaoTimer(Sender: TObject);
begin
  thtAtualizacao.Thread.Synchronize(thtAtualizacao.Thread, AtualizarIndicadores);
  thtAtualizacao.Thread.Synchronize(thtAtualizacao.Thread, VerificaRecados);
end;

procedure TfrmIndicadores.VerificaRecados;
begin
  FDmIndicadores.VerificaRecados;
end;

end.
