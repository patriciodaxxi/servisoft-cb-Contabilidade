unit cadastro.lancamento.protocolo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, biblioteca.form.base, JvValidators, JvComponentBase, JvEmbeddedForms,
  datamodule.lancamento.protocolo, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit,
  cxDBEdit, StdCtrls, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxMemo, ExtCtrls, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, JvEnterTab, cxDBExtLookupComboBox, Menus;

type
  TfrmLancamentoProtocolo = class(TfrmBase)
    lblCliente: TLabel;
    dteCliente: TcxDBTextEdit;
    lblEntregador: TLabel;
    dteEntregador: TcxDBTextEdit;
    lblCompetencia: TLabel;
    dteCompetencia: TcxDBDateEdit;
    lblTipo: TLabel;
    dlcTipo: TcxDBLookupComboBox;
    lblDestinatario: TLabel;
    dteDestinatario: TcxDBTextEdit;
    lblObservacao: TLabel;
    dmeObservacao: TcxDBMemo;
    Bevel: TBevel;
    grdProtocoloItensDBTableView1: TcxGridDBTableView;
    grdProtocoloItensLevel1: TcxGridLevel;
    grdProtocoloItens: TcxGrid;
    bvProtItens: TBevel;
    btnConfirmar: TButton;
    btnCancelar: TButton;
    EnterAsTab: TJvEnterAsTab;
    grdProtocoloItensDBTableView1ID_ITEM_LANCAMENTO: TcxGridDBColumn;
    grdProtocoloItensDBTableView1OBSERVACAO: TcxGridDBColumn;
    grdProtocoloItensDBTableView1DescricaoItemLancamento: TcxGridDBColumn;
    JvCustomValidator1: TJvCustomValidator;
    lblCodigo: TLabel;
    dteCodigo: TcxDBTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure grdProtocoloItensDBTableView1EditKeyPress(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure dteClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dteClienteKeyPress(Sender: TObject; var Key: Char);
    procedure dteEntregadorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dteEntregadorKeyPress(Sender: TObject; var Key: Char);
    procedure grdProtocoloItensDBTableView1EditKeyDown(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FDmProtocolo: TdmLancamentoProtocolo;
    procedure DoCustomValidate(var IsValid: Boolean);
  public
    { Public declarations }
  end;

var
  frmLancamentoProtocolo: TfrmLancamentoProtocolo;

implementation

uses
  biblioteca.helper.validator, relatorio.protocolo,
  cadastro.lancamento.buscapessoa, controlecontabil.principal;

{$R *.dfm}

procedure TfrmLancamentoProtocolo.btnCancelarClick(Sender: TObject);
begin
  inherited;
  FDmProtocolo.CancelRecord;
end;

procedure TfrmLancamentoProtocolo.btnConfirmarClick(Sender: TObject);
var
  Frm: TfrmRelProtocolo;
begin
  inherited;
  ModalResult := mrNone;
  FDmProtocolo.SaveRecord;

  Frm := TfrmRelProtocolo.Create(nil);
  try
    Frm.Executar(FDmProtocolo.cdsContab_ProtocoloID_CONTAB_PROTOCOLO.AsInteger);
  finally
    FreeAndNil(Frm);
  end;

  ModalResult := mrOk;
end;

procedure TfrmLancamentoProtocolo.DoCustomValidate(var IsValid: Boolean);
begin
  IsValid := Validador.Validar;
end;

procedure TfrmLancamentoProtocolo.dteClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  Codigo: Integer;
  Nome: string;
begin
  inherited;
  if (Key = VK_F2) then
  begin
   if TfrmBuscaPessoa.BuscarClientes(Codigo, Nome) then
   begin
     FDmProtocolo.cdsContab_ProtocoloID_CLIENTE.AsInteger := Codigo;
     FDmProtocolo.cdsContab_ProtocoloCLIENTE.AsString := Nome;
     dteEntregador.SetFocus;
   end;
  end;
end;

procedure TfrmLancamentoProtocolo.dteClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key <> char(VK_RETURN)) and (not FDmProtocolo.cdsContab_ProtocoloID_CLIENTE.IsNull) then
    FDmProtocolo.cdsContab_ProtocoloID_CLIENTE.Clear;
end;

procedure TfrmLancamentoProtocolo.dteEntregadorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  Codigo: Integer;
  Nome: string;
begin
  inherited;
  if (Key = VK_F2) then
  begin
   if TfrmBuscaPessoa.BuscarFuncionarios(Codigo, Nome) then
   begin
     FDmProtocolo.cdsContab_ProtocoloID_ENTREGADOR.AsInteger := Codigo;
     FDmProtocolo.cdsContab_ProtocoloENTREGADOR.AsString := Nome;
     dteCompetencia.SetFocus;
   end;
  end;
end;

procedure TfrmLancamentoProtocolo.dteEntregadorKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key <> char(VK_RETURN)) and (not FDmProtocolo.cdsContab_ProtocoloID_CLIENTE.IsNull) then
    FDmProtocolo.cdsContab_ProtocoloID_ENTREGADOR.Clear;
end;

procedure TfrmLancamentoProtocolo.FormCreate(Sender: TObject);
begin
  inherited;
  FDmProtocolo := TdmLancamentoProtocolo.Create(nil);
  FDmProtocolo.OnCustomValidate := DoCustomValidate;
end;

procedure TfrmLancamentoProtocolo.FormShow(Sender: TObject);
begin
  inherited;
  dmeObservacao.DataBinding.DataSource := FDmProtocolo.dsContab_Protocolo;
  dteDestinatario.DataBinding.DataSource := FDmProtocolo.dsContab_Protocolo;
  dlcTipo.DataBinding.DataSource := FDmProtocolo.dsContab_Protocolo;
  dteCompetencia.DataBinding.DataSource := FDmProtocolo.dsContab_Protocolo;
  dteEntregador.DataBinding.DataSource := FDmProtocolo.dsContab_Protocolo;
  dteCliente.DataBinding.DataSource := FDmProtocolo.dsContab_Protocolo;
  grdProtocoloItensDBTableView1.DataController.DataSource := FDmProtocolo.dsContab_Protocolo_Itens;

  AdicionarValidacao('valClient', dteCliente, 'Cliente deve ser informado.');
  AdicionarValidacao('valEntregador', dteEntregador, 'Entregador deve ser informado.');
  AdicionarValidacao('valCompetencia', dteCompetencia, 'Competência deve ser informada.');
  AdicionarValidacao('valTipo', dlcTipo, 'Tipo deve ser informado.');
  AdicionarValidacao('valDestinatario', dteDestinatario, 'Destinatário deve ser informado.');
  AdicionarValidacao('valItensProtocolo', grdProtocoloItens, 'Informe algum item.');

  FDmProtocolo.InsertRecord;
end;

procedure TfrmLancamentoProtocolo.grdProtocoloItensDBTableView1EditKeyDown(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F2) then
  begin
    frmPrincipal.AbrirTelaModal('cadastro.lancamento.item.TfrmLancamentoItem');
    FDmProtocolo.sdsItensLancamento.Refresh;
  end;
end;

procedure TfrmLancamentoProtocolo.grdProtocoloItensDBTableView1EditKeyPress(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Char);

  function ShiftPressionado: Boolean;
  begin
    Result := GetKeyState(VK_SHIFT) and 128 > 0;
  end;

begin
  inherited;
  if (AItem = grdProtocoloItensDBTableView1OBSERVACAO) then
    if (Key = Char(VK_RETURN)) and ShiftPressionado then
      FDmProtocolo.cdsContab_Protocolo_Itens.Post;
end;

initialization
  RegisterClass(TfrmLancamentoProtocolo);

end.
