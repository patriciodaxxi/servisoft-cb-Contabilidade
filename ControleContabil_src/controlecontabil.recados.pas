unit controlecontabil.recados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, biblioteca.form.base, JvValidators, JvComponentBase, JvEmbeddedForms,
  datamodule.recados, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBExtLookupComboBox, cxTextEdit, cxDBEdit, StdCtrls, cxMemo,
  cxCalendar, JvEnterTab;

type
  TfrmRecado = class(TfrmBase)
    lblDe: TLabel;
    dteDe: TcxDBTextEdit;
    cbPara: TcxDBExtLookupComboBox;
    ViewRepository: TcxGridViewRepository;
    gvrFuncionarios: TcxGridDBTableView;
    gvrFuncionariosCODIGO: TcxGridDBColumn;
    gvrFuncionariosRAZAO_SOCIAL: TcxGridDBColumn;
    lblPara: TLabel;
    edtPara: TcxTextEdit;
    lblAssunto: TLabel;
    dmeAssunto: TcxDBMemo;
    btnEnviar: TButton;
    btnCancelar: TButton;
    EnterAsTab: TJvEnterAsTab;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbParaPropertiesChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure cbParaExit(Sender: TObject);
  private
    { Private declarations }
    FDmRecados: TdmRecados;
    procedure DoCustomValidate(var IsValid: Boolean);
  public
    { Public declarations }
  end;

//var
//  frmRecado: TfrmRecado;

implementation

uses
  biblioteca.helper.validator;

{$R *.dfm}

procedure TfrmRecado.btnCancelarClick(Sender: TObject);
begin
  inherited;
  FDmRecados.CancelRecord;
end;

procedure TfrmRecado.btnEnviarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;
  FDmRecados.SaveRecord;
  ModalResult := mrOk;
end;

procedure TfrmRecado.cbParaExit(Sender: TObject);
begin
  inherited;
  cbParaPropertiesChange(cbPara);
end;

procedure TfrmRecado.cbParaPropertiesChange(Sender: TObject);
var
  Nome: string;
begin
  if not Assigned(FDmRecados) or not Assigned(cbPara.DataBinding.DataSource) then
    Exit;

  if cbPara.Properties.View.Visible then
    Nome := TcxGridDBTableView(cbPara.Properties.View).DataController.DataSet.FieldByName('RAZAO_SOCIAL').AsString
  else
    Nome := VarToStr(FDmRecados.sdsFuncionario.Lookup('ID_PESSOA', cbPara.DataBinding.Field.AsInteger, 'RAZAO_SOCIAL'));
  edtPara.Text := Nome;
end;

procedure TfrmRecado.DoCustomValidate(var IsValid: Boolean);
begin
  IsValid := Validador.Validar;
end;

procedure TfrmRecado.FormCreate(Sender: TObject);
begin
  inherited;
  FDmRecados := TdmRecados.Create(nil);
  FDmRecados.OnCustomValidate := DoCustomValidate;

  AdicionarValidacao('valDe'     , dteDe     , 'Informe o remetente.');
  AdicionarValidacao('valPara'   , cbPara    , 'Informe o destinatário.');
  AdicionarValidacao('valAssunto', dmeAssunto, 'Informe o assunto.');
end;

procedure TfrmRecado.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FDmRecados);
end;

procedure TfrmRecado.FormShow(Sender: TObject);
begin
  inherited;
  dmeAssunto.DataBinding.DataSource := FDmRecados.dsContab_Recado;
  cbPara.DataBinding.DataSource     := FDmRecados.dsContab_Recado;
  dteDe.DataBinding.DataSource      := FDmRecados.dsContab_Recado;

  gvrFuncionarios.DataController.DataSource := FDmRecados.dsFuncionario;

  FDmRecados.InsertRecord;
end;

initialization
  RegisterClass(TfrmRecado);

end.
