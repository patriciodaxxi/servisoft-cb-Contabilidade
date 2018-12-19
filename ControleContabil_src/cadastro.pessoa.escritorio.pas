unit cadastro.pessoa.escritorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cadastro.pessoa.base, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxContainer, ActnList, JvValidators,
  JvErrorIndicator, JvComponentBase, JvEmbeddedForms, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit,
  cxDBEdit, StdCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, RzTabs, ExtCtrls,
  datamodule.pessoa.escritorio, biblioteca.datamodule.cadastro, cxImage,
  cxButtonEdit, ExtDlgs, cxGridCardView, cxGridDBCardView, cxFilterControl,
  cxDBFilterControl, JvPageList, JvExControls, ComCtrls, JvExComCtrls,
  JvPageListTreeView;

type
  TfrmCadEscritorio = class(TfmPessoaBase)
    lblLogotipo: TLabel;
    dimgLogotipo: TcxDBImage;
    btnIncluirImagem: TButton;
    btnExcluirImagem: TButton;
    OpenPictureDialog: TOpenPictureDialog;
    actIncImagem: TAction;
    actExcImagem: TAction;
    Bevel1: TBevel;
    procedure FormDestroy(Sender: TObject);
    procedure actExcImagemExecute(Sender: TObject);
    procedure actIncImagemExecute(Sender: TObject);
    procedure aclCadastroUpdate(Action: TBasicAction; var Handled: Boolean);
  private
    { Private declarations }
    FDmCadEscritorio: TdmCadEscritorio;
  protected
    function GetMainDataModule: TdmCadBase; override;
    procedure ConfigureComponents; override;
  public
    { Public declarations }
  end;

//var
//  frmCadEscritorio: TfrmCadEscritorio;

implementation

{$R *.dfm}

{ TfrmCadEscritorio }

procedure TfrmCadEscritorio.aclCadastroUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  inherited;
  actIncImagem.Enabled := (MainDataModule.State  in [sInsert, sEdit]);
  actExcImagem.Enabled := (MainDataModule.State  in [sInsert, sEdit]) and
                          not dimgLogotipo.DataBinding.Field.IsNull;
end;

procedure TfrmCadEscritorio.actExcImagemExecute(Sender: TObject);
begin
  inherited;
  FDmCadEscritorio.RemoverLogotipo;
end;

procedure TfrmCadEscritorio.actIncImagemExecute(Sender: TObject);
begin
  inherited;
  if OpenPictureDialog.Execute then
    FDmCadEscritorio.CarregarLogotipo(OpenPictureDialog.FileName);
end;

procedure TfrmCadEscritorio.ConfigureComponents;
begin
  inherited;
  dimgLogotipo.DataBinding.DataSource := FDmCadEscritorio.dsContab_Escritorio;
end;

procedure TfrmCadEscritorio.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FDmCadEscritorio);
end;

function TfrmCadEscritorio.GetMainDataModule: TdmCadBase;
begin
  if not Assigned(FDmCadEscritorio) then
    FDmCadEscritorio := TdmCadEscritorio.Create(Self);

  Result := FDmCadEscritorio;
end;

initialization
  RegisterClass(TfrmCadEscritorio);

end.
