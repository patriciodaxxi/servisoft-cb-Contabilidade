unit controlecontabil.indicadores.consultar;

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
  cxDBData, ExtCtrls, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, StdCtrls,
  JvEnterTab;

type
  TfrmConsultarIndicadores = class(TfrmBase)
    grdConsultarDBTableView1: TcxGridDBTableView;
    grdConsultarLevel1: TcxGridLevel;
    grdConsultar: TcxGrid;
    Panel1: TPanel;
    btnOK: TButton;
    EnterAsTab: TJvEnterAsTab;
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure Consultar(AData: TDataSource);
  end;

implementation

uses
  datamodule.indicadores;

{$R *.dfm}

{ TfrmConsultarIndicadores }

class procedure TfrmConsultarIndicadores.Consultar(AData: TDataSource);
var
  Frm: TfrmConsultarIndicadores;
begin
  Frm := TfrmConsultarIndicadores.Create(nil);
  try
    Frm.grdConsultarDBTableView1.ClearItems;
    Frm.grdConsultarDBTableView1.DataController.DataSource := AData;
    Frm.grdConsultarDBTableView1.DataController.CreateAllItems(False);
    Frm.ShowModal;
  finally
    FreeAndNil(Frm);
  end;
end;

end.
