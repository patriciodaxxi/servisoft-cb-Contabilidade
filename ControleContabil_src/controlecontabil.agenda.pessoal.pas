unit controlecontabil.agenda.pessoal;

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
  cxDataStorage, cxEdit, DB, cxDBData, cxMemo, cxCalendar, JvThreadTimer,
  ImgList, JvValidators, JvComponentBase, JvEmbeddedForms, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, ExtCtrls, RzGroupBar, datamodule.agenda.base, Menus,
  JvExExtCtrls, JvExtComponent, JvCaptionPanel;

type
  TfrmAgendaPessoal = class(TfrmAgendaBase)
  private
    { Private declarations }
  protected
    function CreateAgenda: TdmAgendaBase; override;
  public
    { Public declarations }
  end;

//var
//  frmAgendaPessoal: TfrmAgendaPessoal;

implementation

uses
  datamodule.agenda.pessoal;

{$R *.dfm}

{ TfrmAgendaPessoal }

function TfrmAgendaPessoal.CreateAgenda: TdmAgendaBase;
begin
  Result := TdmAgendaPessoal.Create(Self);
end;

initialization
  RegisterClass(TfrmAgendaPessoal);

end.
