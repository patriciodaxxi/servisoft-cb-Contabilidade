unit controlecontabil.agenda.corporativa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, controlecontabil.agenda.base, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxMemo, cxCalendar, ImgList,
  JvValidators, JvComponentBase, JvEmbeddedForms, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, ExtCtrls, RzGroupBar, datamodule.agenda.base, JvThreadTimer, Menus,
  cxFilterControl, StdCtrls, cxDBFilterControl;

type
  TfrmAgendaCorporativa = class(TfrmAgendaBase)
    grpConsulta: TRzGroup;
    pnlPesquisar: TPanel;
    grdPesquisaDBTableView1: TcxGridDBTableView;
    grdPesquisaLevel1: TcxGridLevel;
    grdPesquisa: TcxGrid;
    pnlFiltro: TPanel;
    pnlFiltroBarra: TPanel;
    btnPesquisar: TButton;
    btnLimpar: TButton;
    grdPesquisaDBTableView1NOME_PESSOA: TcxGridDBColumn;
    grdPesquisaDBTableView1DOCUMENTO: TcxGridDBColumn;
    grdPesquisaDBTableView1CONTATO: TcxGridDBColumn;
    grdPesquisaDBTableView1TELEFONE: TcxGridDBColumn;
    grdPesquisaDBTableView1EMAIL: TcxGridDBColumn;
    fcFiltro: TcxDBFilterControl;
    grdRecadosDBTableView1PARA: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
  private
    { Private declarations }
  protected
    function CreateAgenda: TdmAgendaBase; override;
  public
    { Public declarations }
  end;

//var
//  frmAgendaCorporativa: TfrmAgendaCorporativa;

implementation

uses
  datamodule.agenda.corporativa;

{$R *.dfm}

{ TfrmAgendaCorporativa }

procedure TfrmAgendaCorporativa.btnLimparClick(Sender: TObject);
begin
  inherited;
  fcFiltro.Clear;
  TdmAgendaCorporativa(DmAgenda).sdsPesquisa.Close;
  grpConsulta.Repaint;
end;

procedure TfrmAgendaCorporativa.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  TdmAgendaCorporativa(DmAgenda).ConsultarPessoa(fcFiltro.FilterText);
  grpConsulta.Repaint;
end;

function TfrmAgendaCorporativa.CreateAgenda: TdmAgendaBase;
begin
  Result := TdmAgendaCorporativa.Create(Self);
end;

procedure TfrmAgendaCorporativa.FormShow(Sender: TObject);
begin
  inherited;
  grdCompromissosDBTableView1.PopupMenu := nil;
  grdRecadosDBTableView1.PopupMenu := nil;
  grdPesquisaDBTableView1.DataController.DataSource := TdmAgendaCorporativa(DmAgenda).dsPesquisa;
end;

initialization
  RegisterClass(TfrmAgendaCorporativa);

end.
