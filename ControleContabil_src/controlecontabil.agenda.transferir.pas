unit controlecontabil.agenda.transferir;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, biblioteca.form.base, JvValidators, JvComponentBase, JvEmbeddedForms,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  StdCtrls, cxDBEdit, datamodule.agenda.base;

type
  TfrmTransferirCompromisso = class(TfrmBase)
    lblQuando: TLabel;
    dteQuando: TcxDateEdit;
    btnSalvar: TButton;
    btnCancelar: TButton;
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    FDmAgenda: TdmAgendaBase;
  public
    { Public declarations }
    property DmAgenda: TdmAgendaBase read FDmAgenda write FDmAgenda;
  end;

//var
//  frmTransferirCompromisso: TfrmTransferirCompromisso;

implementation

{$R *.dfm}

procedure TfrmTransferirCompromisso.btnSalvarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;
  FDmAgenda.TransferirCompromisso(dteQuando.Date);
  ModalResult := mrOk;
end;

end.
