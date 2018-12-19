unit controlecontabil.agenda.base;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, biblioteca.form.base, JvValidators, JvComponentBase, JvEmbeddedForms,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ExtCtrls, RzGroupBar, ImgList,
  cxMemo, cxCalendar, datamodule.agenda.base, JvThreadTimer, Menus,
  cxGridCustomPopupMenu, cxGridPopupMenu, JvExExtCtrls, JvExtComponent,
  JvCaptionPanel;

type
  TfrmAgendaBase = class(TfrmBase)
    GroupBar: TRzGroupBar;
    grdRecados: TcxGrid;
    grdRecadosDBTableView1: TcxGridDBTableView;
    grdRecadosLevel1: TcxGridLevel;
    grpCompromissos: TRzGroup;
    pnlCompromissos: TPanel;
    grdCompromissos: TcxGrid;
    grdCompromissosDBTableView1: TcxGridDBTableView;
    grdCompromissosLevel1: TcxGridLevel;
    grpAtividades: TRzGroup;
    pnlAtividades: TPanel;
    grdAtividades: TcxGrid;
    grdAtividadesDBTableView1: TcxGridDBTableView;
    grdAtividadesLevel1: TcxGridLevel;
    cxImageList: TcxImageList;
    grdCompromissosDBTableView1QUEM: TcxGridDBColumn;
    grdCompromissosDBTableView1ASSUNTO: TcxGridDBColumn;
    grdCompromissosDBTableView1QUANDO: TcxGridDBColumn;
    grdCompromissosDBTableView1LOCAL: TcxGridDBColumn;
    grdCompromissosDBTableView1STATUS: TcxGridDBColumn;
    thtAtualizacao: TJvThreadTimer;
    grdRecadosDBTableView1DE: TcxGridDBColumn;
    grdRecadosDBTableView1DATA: TcxGridDBColumn;
    grdRecadosDBTableView1ASSUNTO: TcxGridDBColumn;
    grdRecadosDBTableView1STATUS: TcxGridDBColumn;
    pmRecados: TPopupMenu;
    Pendente1: TMenuItem;
    Concludo1: TMenuItem;
    grpRecados: TRzGroup;
    pnlRecados: TPanel;
    pmCompromissos: TPopupMenu;
    Pendente2: TMenuItem;
    Concludo2: TMenuItem;
    ransferir1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure thtAtualizacaoTimer(Sender: TObject);
    procedure Pendente1Click(Sender: TObject);
    procedure Concludo1Click(Sender: TObject);
    procedure Concludo2Click(Sender: TObject);
    procedure ransferir1Click(Sender: TObject);
    procedure Pendente2Click(Sender: TObject);
  private
    { Private declarations }
    FDmAgenda: TdmAgendaBase;
    procedure AtualizarDados;
  protected
    function CreateAgenda: TdmAgendaBase; virtual; abstract;
  public
    { Public declarations }
    property DmAgenda: TdmAgendaBase read FDmAgenda;
  end;

var
  frmAgendaBase: TfrmAgendaBase;

implementation

uses
  controlecontabil.agenda.transferir, SqlTimSt;

{$R *.dfm}

procedure TfrmAgendaBase.AtualizarDados;
begin
  FDmAgenda.sdsRecados.Refresh;
  grpRecados.Caption := Format('Recados ( %d )', [FDmAgenda.sdsRecados.RecordCount]);

  FDmAgenda.cdsCompromissos.Refresh;
  grpCompromissos.Caption := Format('Compromissos ( %d )', [FDmAgenda.cdsCompromissos.RecordCount]);

  grdRecados.Repaint;
  grdCompromissos.Repaint;
  grdAtividades.Repaint;
end;

procedure TfrmAgendaBase.Concludo1Click(Sender: TObject);
begin
  inherited;
  FDmAgenda.RecadoConcluido;
  grdRecados.Repaint;
end;

procedure TfrmAgendaBase.Concludo2Click(Sender: TObject);
begin
  inherited;
  FDmAgenda.CompromissoConcluido;
  grdCompromissos.Repaint;
end;

procedure TfrmAgendaBase.FormCreate(Sender: TObject);
begin
  inherited;
  FDmAgenda := CreateAgenda;
  grdRecadosDBTableView1.DataController.DataSource := FDmAgenda.dsRecados;
  grdCompromissosDBTableView1.DataController.DataSource := FDmAgenda.dsCompromissos;
end;

procedure TfrmAgendaBase.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FDmAgenda);
end;

procedure TfrmAgendaBase.FormShow(Sender: TObject);
begin
  inherited;
  AtualizarDados;
  thtAtualizacao.Enabled := True;

  GroupBar.ScrollPosition := 0;
  grdRecados.Repaint;
  grdCompromissos.Repaint;
  grdAtividades.Repaint;
end;

procedure TfrmAgendaBase.Pendente1Click(Sender: TObject);
begin
  inherited;
  grdRecados.Repaint;
end;

procedure TfrmAgendaBase.Pendente2Click(Sender: TObject);
begin
  inherited;
  grdCompromissos.Repaint;
end;

procedure TfrmAgendaBase.ransferir1Click(Sender: TObject);
var
  Frm: TfrmTransferirCompromisso;
begin
  inherited;
  Frm := TfrmTransferirCompromisso.Create(nil);
  try
    Frm.DmAgenda := FDmAgenda;
    Frm.dteQuando.Date := SQLTimeStampToDateTime(FDmAgenda.cdsCompromissosQUANDO.AsSQLTimeStamp);
    Frm.ShowModal;
  finally
    FreeAndNil(Frm);
  end;
  grdCompromissos.Repaint;
end;

procedure TfrmAgendaBase.thtAtualizacaoTimer(Sender: TObject);
begin
  thtAtualizacao.Thread.Synchronize(thtAtualizacao.Thread, AtualizarDados);
end;

end.
