unit controlecontabil.compromissos;

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
  cxGridTableView, cxGridDBTableView, cxGrid, StdCtrls,
  datamodule.compromissos, cxContainer, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxDBEdit, cxTextEdit, cxMemo, JvEnterTab, cxDBExtLookupComboBox, cxCheckBox;

type
  TfrmCompromissos = class(TfrmBase)
    lblQuem: TLabel;
    grdQuemDBTableView1: TcxGridDBTableView;
    grdQuemLevel1: TcxGridLevel;
    grdQuem: TcxGrid;
    grdQuemDBTableView1ID_PESSOA: TcxGridDBColumn;
    grdQuemDBTableView1Nome: TcxGridDBColumn;
    lblOQue: TLabel;
    dmeOQue: TcxDBMemo;
    lblOnde: TLabel;
    dmeOnde: TcxDBMemo;
    lblQuando: TLabel;
    dteQuando: TcxDBDateEdit;
    btnSalvar: TButton;
    btnCancelar: TButton;
    EnterAsTab: TJvEnterAsTab;
    ViewRepository: TcxGridViewRepository;
    gvrFuncionarios: TcxGridDBTableView;
    gvrFuncionariosCODIGO: TcxGridDBColumn;
    gvrFuncionariosRAZAO_SOCIAL: TcxGridDBColumn;
    cbxPublico: TcxDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure grdQuemDBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure EnterAsTabHandleEnter(Sender: TObject; AControl: TWinControl;
      var Handled: Boolean);
  private
    { Private declarations }
    FDmCompromissos: TdmCompromissos;
    procedure DoCustomValidate(var IsValid: Boolean);
  public
    { Public declarations }
  end;

var
  frmCompromissos: TfrmCompromissos;

implementation

uses
  biblioteca.helper.validator;

{$R *.dfm}

procedure TfrmCompromissos.btnCancelarClick(Sender: TObject);
begin
  inherited;
  FDmCompromissos.CancelRecord;
end;

procedure TfrmCompromissos.btnSalvarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;
  FDmCompromissos.SaveRecord;
  ModalResult := mrOk;
end;

procedure TfrmCompromissos.DoCustomValidate(var IsValid: Boolean);
begin
  IsValid := Validador.Validar;
end;

procedure TfrmCompromissos.EnterAsTabHandleEnter(Sender: TObject;
  AControl: TWinControl; var Handled: Boolean);
begin
  inherited;
  Handled := AControl.ClassNameIs('TcxGridSite');
end;

procedure TfrmCompromissos.FormCreate(Sender: TObject);
begin
  inherited;
  FDmCompromissos := TdmCompromissos.Create(nil);

  dmeOQue.DataBinding.DataSource    := FDmCompromissos.dsContab_Compromisso;
  dmeOnde.DataBinding.DataSource    := FDmCompromissos.dsContab_Compromisso;
  dteQuando.DataBinding.DataSource  := FDmCompromissos.dsContab_Compromisso;
  cbxPublico.DataBinding.DataSource := FDmCompromissos.dsContab_Compromisso;
  grdQuemDBTableView1.DataController.DataSource := FDmCompromissos.dsTmpPessoas;

  FDmCompromissos.OnCustomValidate := DoCustomValidate;

  AdicionarValidacao('valOque'  , dmeOQue  , 'Informe o assunto');
  AdicionarValidacao('valQuando', dteQuando, 'Informe a data/hora do compromisso.');
  AdicionarValidacao('valOnde'  , dmeOnde  , 'Informe o local.');
end;

procedure TfrmCompromissos.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FDmCompromissos);
end;

procedure TfrmCompromissos.FormShow(Sender: TObject);
begin
  inherited;
  grdQuemDBTableView1.DataController.DataSource := FDmCompromissos.dsTmpPessoas;
  dmeOnde.DataBinding.DataSource   := FDmCompromissos.dsContab_Compromisso;
  dteQuando.DataBinding.DataSource := FDmCompromissos.dsContab_Compromisso;
  dmeOQue.DataBinding.DataSource   := FDmCompromissos.dsContab_Compromisso;

  gvrFuncionarios.DataController.DataSource := FDmCompromissos.dsFuncionario;

  FDmCompromissos.InsertRecord;
end;

procedure TfrmCompromissos.grdQuemDBTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Ord(Key) = VK_RETURN) and (grdQuemDBTableView1Nome.Focused) then
  begin
    if (FDmCompromissos.cdsTmpPessoas.State in dsEditModes) then
      FDmCompromissos.cdsTmpPessoas.Post;
  end;
end;

initialization
  RegisterClass(TfrmCompromissos);

end.
