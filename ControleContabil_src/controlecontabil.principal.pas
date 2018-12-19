unit controlecontabil.principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsdxBarPainter, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxBar, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxRibbonSkins, cxClasses, dxRibbon,
  dxSkinsdxStatusBarPainter, dxStatusBar, dxRibbonBackstageView, dxRibbonForm,
  StdCtrls, JvExControls, JvEmbeddedForms, ComCtrls, TabNotBk, ExtCtrls,
  dxBarApplicationMenu, JvValidators, JvErrorIndicator, JvComponentBase,
  JvEnterTab, JvPageList, ActnList, biblioteca.form.base, JvThreadTimer;

type
  TfrmPrincipal = class(TdxRibbonForm)
    barOpcoes: TdxBarManager;
    stbAplicacao: TdxStatusBar;
    barCadastro: TdxBar;
    dxRibbon: TdxRibbon;
    rbvMenu: TdxRibbonBackstageView;
    rbtMenuPrincipal: TdxRibbonTab;
    bbtContatos: TdxBarLargeButton;
    bbtRecados: TdxBarLargeButton;
    barAgenda: TdxBar;
    bbtCompromisos: TdxBarLargeButton;
    bbtMinhaAgenda: TdxBarLargeButton;
    bbtAgendaCorporativa: TdxBarLargeButton;
    bbtPermissoes: TdxBarLargeButton;
    bbtUsuarios: TdxBarLargeButton;
    apmMenu: TdxBarApplicationMenu;
    bbtSair: TdxBarButton;
    bbtTrocarUsuario: TdxBarButton;
    dxRibbonBackstageViewTabSheet1: TdxRibbonBackstageViewTabSheet;
    PaintBox1: TPaintBox;
    Label1: TLabel;
    pbSeparator2: TPaintBox;
    Label2: TLabel;
    edtSenhaAtual: TEdit;
    Label3: TLabel;
    edtNovaSenha: TEdit;
    Label4: TLabel;
    edtRepitaSenha: TEdit;
    btAlterarSenha: TButton;
    Validador: TJvValidators;
    SenhaAtualBranco: TJvRequiredFieldValidator;
    NovaSenhaBranco: TJvRequiredFieldValidator;
    RepitaSenhaBranco: TJvRequiredFieldValidator;
    ComparaSenhaNova: TJvControlsCompareValidator;
    EnterAsTab: TJvEnterAsTab;
    ComparaSenhaAtual: TJvCustomValidator;
    bbtEscritorioContabil: TdxBarLargeButton;
    PaintBox2: TPaintBox;
    barRegistro: TdxBar;
    bbtPesquisar: TdxBarLargeButton;
    bbtPrimeiro: TdxBarLargeButton;
    bbtAnterior: TdxBarLargeButton;
    bbtProximo: TdxBarLargeButton;
    bbtUltimo: TdxBarLargeButton;
    bbtInserir: TdxBarLargeButton;
    bbtEditar: TdxBarLargeButton;
    bbtExcluir: TdxBarLargeButton;
    barOperacao: TdxBar;
    bbtSalvar: TdxBarLargeButton;
    bbtCancelar: TdxBarLargeButton;
    pglTelas: TJvPageList;
    pgIndicadores: TJvStandardPage;
    bbtFechar: TdxBarLargeButton;
    barTela: TdxBar;
    aclOpcoes: TActionList;
    actPrimeiro: TAction;
    actAnterior: TAction;
    actProximo: TAction;
    actUltimo: TAction;
    actInserir: TAction;
    actEditar: TAction;
    actExcluir: TAction;
    actSalvar: TAction;
    actCancelar: TAction;
    actFechar: TAction;
    actPesquisar: TAction;
    fpForm: TJvEmbeddedFormPanel;
    barOperacoesAgenda: TdxBar;
    bbtProtocolos: TdxBarLargeButton;
    barLancamentos: TdxBar;
    barOperacoesPermissao: TdxBar;
    bbtItemLancamento: TdxBarLargeButton;
    procedure bbtSairClick(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure pbSeparator2Paint(Sender: TObject);
    procedure rbvMenuPopup(Sender: TObject);
    procedure btAlterarSenhaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtSenhaAtualKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btAlterarSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComparaSenhaAtualValidate(Sender: TObject;
      ValueToValidate: Variant; var Valid: Boolean);
    procedure dxRibbonTabChanged(Sender: TdxCustomRibbon);
    procedure bbtEscritorioContabilClick(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure aclOpcoesUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure actInserirExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actPesquisarExecute(Sender: TObject);
    procedure actPrimeiroExecute(Sender: TObject);
    procedure actAnteriorExecute(Sender: TObject);
    procedure actProximoExecute(Sender: TObject);
    procedure actUltimoExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure bbtUsuariosClick(Sender: TObject);
    procedure bbtContatosClick(Sender: TObject);
    procedure bbtRecadosClick(Sender: TObject);
    procedure bbtCompromisosClick(Sender: TObject);
    procedure bbtAgendaCorporativaClick(Sender: TObject);
    procedure bbtMinhaAgendaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtTrocarUsuarioClick(Sender: TObject);
    procedure bbtPermissoesClick(Sender: TObject);
    procedure bbtItemLancamentoClick(Sender: TObject);
    procedure bbtProtocolosClick(Sender: TObject);
  private
    { Private declarations }
    procedure FecharTelas;
    procedure VerificarPermissoes;
  protected
    function FormAtivo: TfrmBase;
    procedure AbrirTela(AItem: TdxBarItem; AFormClass: string);
  public
    { Public declarations }
    procedure AbrirTelaModal(AFormClass: string);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  controlecontabil.dados, controlecontabil.indicadores, dxGDIPlusAPI, Rtti,
  biblioteca.form.cadastro, biblioteca.datamodule.cadastro,
  biblioteca.helper.validator, controlecontabil.agenda.base,
  cadastro.permissao;

{$R *.dfm}

procedure TfrmPrincipal.AbrirTela(AItem: TdxBarItem; AFormClass: string);
var
  Tab: TdxRibbonTab;
  Grp: TdxRibbonTabGroup;
  Tela: string;
  PageList: IPageList;
  EmbeddedForm: TJvEmbeddedFormPanel;
  Context : TRttiContext;
  RInstance: TRttiInstanceType;
  FormValue: TValue;
begin
  if not dmDados.PermiteExecutar(AFormClass, True) then
    raise Exception.Create('Você não tem permissão para executar esta tela, verifique com seu gerente.');

  if (AItem.Tag > 0) then
  begin
    dxRibbon.Tabs[AItem.Tag].Active := True;
    Exit;
  end;

  Context := TRttiContext.Create;
  try
    RInstance := Context.FindType(AFormClass) as TRttiInstanceType;
    if not Assigned(RInstance) then
      raise Exception.CreateFmt('Classe "%s" não encontrada.', [AFormClass]);

    FormValue := RInstance.GetMethod('Create').Invoke(RInstance.MetaClassType, [EmbeddedForm]);

    Tab := dxRibbon.Tabs.Add;
    Tab.Caption := AItem.Caption;

    if (FormValue.AsObject is TfrmCadBase) then
    begin
      Grp := Tab.Groups.Add;
      Grp.ToolBar := barRegistro;
      Grp := Tab.Groups.Add;
      Grp.ToolBar := barOperacao;
    end else if (FormValue.AsObject is TfrmAgendaBase) then
    begin
      Grp := Tab.Groups.Add;
      Grp.ToolBar := barOperacoesAgenda;
    end else if (FormValue.AsObject is TfrmCadPermissoes) then
    begin
      Grp := Tab.Groups.Add;
      Grp.ToolBar := barOperacoesPermissao;
    end;
    Grp := Tab.Groups.Add;
    Grp.ToolBar := barTela;

    if (FormValue.AsObject is TfrmCadBase) then
    begin
      barRegistro.Visible := True;
      barOperacao.Visible := True;
    end else if (FormValue.AsObject is TfrmAgendaBase) then
    begin
      barOperacoesAgenda.Visible := True;
    end else if (FormValue.AsObject is TfrmCadPermissoes) then
    begin
      barOperacoesPermissao.Visible := True;
    end;
    barTela.Visible     := True;

    if (FormValue.AsObject is TfrmCadBase) then
    begin
      barRegistro.Tag := barRegistro.Tag + 1;
      barOperacao.Tag := barOperacao.Tag + 1;
    end else if (FormValue.AsObject is TfrmAgendaBase) then
    begin
      barOperacoesAgenda.Tag := barOperacoesAgenda.Tag + 1;
    end else if (FormValue.AsObject is TfrmCadPermissoes) then
    begin
      barOperacoesPermissao.Tag := barOperacoesPermissao.Tag + 1;
    end;
    barTela.Tag     := barTela.Tag + 1;

    Tab.Active := True;

    Tela := Copy(AItem.Name, 4);
    PageList := pglTelas;
    PageList.AddPage(Tab.Caption);
    pglTelas.ActivePageIndex := pglTelas.PageCount - 1;
    pglTelas.ActivePage.Name := 'pg' + Tela;

    EmbeddedForm := TJvEmbeddedFormPanel.Create(pglTelas.ActivePage);
    EmbeddedForm.Parent := pglTelas.Pages[pglTelas.ActivePageIndex];
    EmbeddedForm.Align := alClient;

    EmbeddedForm.FormLink := (FormValue.AsObject as TfrmBase).FormLink;
  finally
    Context.Free;
  end;

  AItem.Tag := Tab.Index;
  Tab.Tag := Integer(AItem);
end;

procedure TfrmPrincipal.AbrirTelaModal(AFormClass: string);
var
  Context : TRttiContext;
  RInstance: TRttiInstanceType;
  FormValue: TValue;
begin
  if not dmDados.PermiteExecutar(AFormClass, True) then
    raise Exception.Create('Você não tem permissão para executar esta tela, verifique com seu gerente.');

  Context := TRttiContext.Create;
  try
    RInstance := Context.FindType(AFormClass) as TRttiInstanceType;
    if not Assigned(RInstance) then
      raise Exception.CreateFmt('Classe "%s" não encontrada.', [AFormClass]);

    FormValue := RInstance.GetMethod('Create').Invoke(RInstance.MetaClassType, [nil]);
    RInstance.GetMethod('ShowModal').Invoke(FormValue, []);
  finally
    Context.Free;
  end;

end;

procedure TfrmPrincipal.aclOpcoesUpdate(Action: TBasicAction;
  var Handled: Boolean);
var
  oCadAtivo: TfrmCadBase;
begin
  if (FormAtivo is TfrmCadBase) then
  begin
    oCadAtivo := TfrmCadBase(FormAtivo);

    oCadAtivo.aclCadastroUpdate(Action, Handled);

    stbAplicacao.Panels[1].Text := 'Status: ' + Desc_State[oCadAtivo.MainDataModule.State];

    actPesquisar.Enabled := oCadAtivo.actConsultar.Enabled;
    actInserir.Enabled   := oCadAtivo.actIncluir.Enabled;
    actEditar.Enabled    := oCadAtivo.actEditar.Enabled;
    actExcluir.Enabled   := oCadAtivo.actExcluir.Enabled;
    actProximo.Enabled   := oCadAtivo.actProximo.Enabled;
    actAnterior.Enabled  := oCadAtivo.actAnterior.Enabled;
    actPrimeiro.Enabled  := oCadAtivo.actPrimeiro.Enabled;
    actUltimo.Enabled    := oCadAtivo.actUltimo.Enabled;
    actSalvar.Enabled    := oCadAtivo.actSalvar.Enabled;
    actCancelar.Enabled  := oCadAtivo.actCancelar.Enabled;
  end
  else if (FormAtivo is TfrmCadPermissoes) then
  begin
    actSalvar.Enabled   := TfrmCadPermissoes(FormAtivo).PossuiAlteracoes;
    actCancelar.Enabled := TfrmCadPermissoes(FormAtivo).PossuiAlteracoes;
  end
  else
    stbAplicacao.Panels[1].Text := '';
end;

procedure TfrmPrincipal.actAnteriorExecute(Sender: TObject);
begin
  TfrmCadBase(FormAtivo).actAnterior.Execute;
end;

procedure TfrmPrincipal.actCancelarExecute(Sender: TObject);
begin
  if (FormAtivo is TfrmCadBase) then
    TfrmCadBase(FormAtivo).actCancelar.Execute
  else if (FormAtivo is TfrmCadPermissoes) then
    TfrmCadPermissoes(FormAtivo).Cancelar;
end;

procedure TfrmPrincipal.actEditarExecute(Sender: TObject);
begin
  TfrmCadBase(FormAtivo).actEditar.Execute;
end;

procedure TfrmPrincipal.actExcluirExecute(Sender: TObject);
begin
  TfrmCadBase(FormAtivo).actExcluir.Execute;
end;

procedure TfrmPrincipal.actFecharExecute(Sender: TObject);
var
  oCadForm: TfrmBase;
  EmbeddedForm: TJvEmbeddedFormPanel;
  PageList: IPageList;
  Tab: TdxRibbonTab;
  I: Integer;
  Item: TdxBarItem;
begin
  LockWindowUpdate(Self.Handle);
  try
    if (pglTelas.ActivePage.ControlCount > 0) then
    begin
      EmbeddedForm := pglTelas.ActivePage.Controls[0] as TJvEmbeddedFormPanel;
      oCadForm := EmbeddedForm.LinkedForm as TfrmBase;
      FreeAndNil(oCadForm);
      FreeAndNil(EmbeddedForm);
    end;

    Tab := dxRibbon.Tabs[pglTelas.ActivePageIndex];
    for I := 0 to Tab.Groups.Count - 1 do
    begin
      Tab.Groups[I].ToolBar.Tag := Tab.Groups[I].ToolBar.Tag - 1;
      if (Tab.Groups[I].ToolBar.Tag <= 0) then
      begin
        Tab.Groups[I].ToolBar.Visible := False;
        Tab.Groups[I].ToolBar.Tag     := 0;
      end;
    end;

    Item := TdxBarItem(Tab.Tag);
    if Assigned(Item) then
      Item.Tag := 0;

    PageList := pglTelas;

    I := pglTelas.ActivePageIndex;
    dxRibbon.Tabs.Delete(I);
    PageList.DeletePage(I);

    dxRibbon.Tabs[0].Active := True;
    pglTelas.ActivePageIndex := 0;
  finally
    LockWindowUpdate(0);
  end;
end;

procedure TfrmPrincipal.actInserirExecute(Sender: TObject);
begin
  TfrmCadBase(FormAtivo).actIncluir.Execute;
end;

procedure TfrmPrincipal.actPesquisarExecute(Sender: TObject);
begin
  TfrmCadBase(FormAtivo).actConsultar.Execute;
end;

procedure TfrmPrincipal.actPrimeiroExecute(Sender: TObject);
begin
  TfrmCadBase(FormAtivo).actPrimeiro.Execute;
end;

procedure TfrmPrincipal.actProximoExecute(Sender: TObject);
begin
  TfrmCadBase(FormAtivo).actProximo.Execute;
end;

procedure TfrmPrincipal.actSalvarExecute(Sender: TObject);
begin
  if (FormAtivo is TfrmCadBase) then
    TfrmCadBase(FormAtivo).actSalvar.Execute
  else if (FormAtivo is TfrmCadPermissoes) then
    TfrmCadPermissoes(FormAtivo).Salvar;
end;

procedure TfrmPrincipal.actUltimoExecute(Sender: TObject);
begin
  TfrmCadBase(FormAtivo).actUltimo.Execute;
end;

procedure TfrmPrincipal.bbtAgendaCorporativaClick(Sender: TObject);
begin
  AbrirTela(Sender as TdxBarItem, 'controlecontabil.agenda.corporativa.TfrmAgendaCorporativa');
end;

procedure TfrmPrincipal.bbtCompromisosClick(Sender: TObject);
begin
  AbrirTelaModal('controlecontabil.compromissos.TfrmCompromissos');
end;

procedure TfrmPrincipal.bbtContatosClick(Sender: TObject);
begin
  AbrirTela(Sender as TdxBarItem, 'cadastro.pessoa.cliente.TfrmCadCliente');
end;

procedure TfrmPrincipal.bbtEscritorioContabilClick(Sender: TObject);
begin
  AbrirTela(Sender as TdxBarItem, 'cadastro.pessoa.escritorio.TfrmCadEscritorio');
end;

procedure TfrmPrincipal.bbtItemLancamentoClick(Sender: TObject);
begin
  AbrirTela(Sender as TdxBarItem, 'cadastro.lancamento.item.TfrmLancamentoItem');
end;

procedure TfrmPrincipal.bbtMinhaAgendaClick(Sender: TObject);
begin
  AbrirTela(Sender as TdxBarItem, 'controlecontabil.agenda.pessoal.TfrmAgendaPessoal');
end;

procedure TfrmPrincipal.bbtPermissoesClick(Sender: TObject);
begin
  AbrirTela(Sender as TdxBarItem, 'cadastro.permissao.TfrmCadPermissoes');
end;

procedure TfrmPrincipal.bbtProtocolosClick(Sender: TObject);
begin
  AbrirTelaModal('cadastro.lancamento.protocolo.TfrmLancamentoProtocolo');
end;

procedure TfrmPrincipal.bbtRecadosClick(Sender: TObject);
begin
  AbrirTelaModal('controlecontabil.recados.TfrmRecado');
end;

procedure TfrmPrincipal.bbtSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.bbtTrocarUsuarioClick(Sender: TObject);
begin
  Self.FecharTelas;
  if dmDados.LoginDialog.Login then
  begin
    stbAplicacao.Panels[0].Text := Format('Usuário: %s', [dmDados.NomeUsuario]);
    VerificarPermissoes;
  end
  else
    dmDados.LoginDialog.TerminateApplication;
end;

procedure TfrmPrincipal.bbtUsuariosClick(Sender: TObject);
begin
  AbrirTela(Sender as TdxBarItem, 'cadastro.pessoa.funcionario.TfrmCadFuncionario');
end;

procedure TfrmPrincipal.btAlterarSenhaClick(Sender: TObject);
var
  AppMenu: IdxRibbonApplicationMenu;
begin
  // Verificação da senha
  if not Validador.Validar('Fase1') then
    Exit;
  if not Validador.Validar('Fase2') then
    Exit;

  // Fechar o menu popup.
  AppMenu := dxRibbon.ApplicationButton.Menu as IdxRibbonApplicationMenu;
  AppMenu.ClosePopup;
end;

procedure TfrmPrincipal.btAlterarSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN: btAlterarSenha.Click;
    VK_TAB: Self.Perform(CM_DIALOGKEY, VK_TAB, 0);
  end;
end;

procedure TfrmPrincipal.FecharTelas;
var
  oCadForm: TfrmBase;
  EmbeddedForm: TJvEmbeddedFormPanel;
  PageList: IPageList;
  Tab: TdxRibbonTab;
  I, J: Integer;
  Item: TdxBarItem;
begin
  LockWindowUpdate(Self.Handle);
  try
    for J := pglTelas.PageCount - 1 downto 1 do
    begin
      if (pglTelas.Pages[J].ControlCount > 0) then
      begin
        EmbeddedForm := pglTelas.Pages[J].Controls[0] as TJvEmbeddedFormPanel;
        oCadForm := EmbeddedForm.LinkedForm as TfrmBase;
        FreeAndNil(oCadForm);
        FreeAndNil(EmbeddedForm);
      end;

      Tab := dxRibbon.Tabs[J];
      for I := 0 to Tab.Groups.Count - 1 do
      begin
        Tab.Groups[I].ToolBar.Tag := Tab.Groups[I].ToolBar.Tag - 1;
        if (Tab.Groups[I].ToolBar.Tag <= 0) then
        begin
          Tab.Groups[I].ToolBar.Visible := False;
          Tab.Groups[I].ToolBar.Tag     := 0;
        end;
      end;

      Item := TdxBarItem(Tab.Tag);
      if Assigned(Item) then
        Item.Tag := 0;

      PageList := pglTelas;

      dxRibbon.Tabs.Delete(J);
      PageList.DeletePage(J);
    end;

    dxRibbon.Tabs[0].Active := True;
    pglTelas.ActivePageIndex := 0;
  finally
    LockWindowUpdate(0);
  end;
end;

function TfrmPrincipal.FormAtivo: TfrmBase;
var
  EmbeddedForm: TJvEmbeddedFormPanel;
begin
  EmbeddedForm := pglTelas.ActivePage.Controls[0] as TJvEmbeddedFormPanel;
  Result := EmbeddedForm.LinkedForm as TfrmBase;
end;

procedure TfrmPrincipal.ComparaSenhaAtualValidate(Sender: TObject;
  ValueToValidate: Variant; var Valid: Boolean);
begin
  Valid := AnsiSameText(ValueToValidate, 'casa');
end;

procedure TfrmPrincipal.dxRibbonTabChanged(Sender: TdxCustomRibbon);
begin
  if Assigned(pglTelas) then
    pglTelas.ActivePageIndex := dxRibbon.ActiveTab.Index;
end;

procedure TfrmPrincipal.edtSenhaAtualKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key in [VK_RETURN, VK_TAB]) then
    Self.Perform(CM_DIALOGKEY, VK_TAB, 0);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  ComparaSenhaNova.CompareToProperty := 'Text';
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  stbAplicacao.Panels[0].Text := Format('Usuário: %s', [dmDados.NomeUsuario]);
  dxRibbon.DocumentName := dmDados.NomeEscritorio;

  VerificarPermissoes;
end;

procedure TfrmPrincipal.PaintBox1Paint(Sender: TObject);
begin
  with Sender as TPaintBox do
  begin
    dxGpFillRect(Canvas.Handle, ClientRect, clWhite, 200);
    ExcludeClipRect(Canvas.Handle, 1, 1, Width - 1, Height - 1);
    dxGpFillRect(Canvas.Handle, ClientRect, clWhite);
  end;
end;

procedure TfrmPrincipal.pbSeparator2Paint(Sender: TObject);
begin
  with Sender as TPaintBox do
    dxRibbon.ColorScheme.DrawMenuSeparatorHorz(Canvas.Handle, ClientRect);
end;

procedure TfrmPrincipal.rbvMenuPopup(Sender: TObject);
begin
  edtSenhaAtual.Clear;
  edtNovaSenha.Clear;
  edtRepitaSenha.Clear;
end;

procedure TfrmPrincipal.VerificarPermissoes;

  function PermiteExecutar(AClasse: string): TdxBarItemVisible;
  begin
    if dmDados.PermiteExecutar(AClasse, False) then
      Result := ivAlways
    else
      Result := ivNever;
  end;

begin
  // Atualiza as permissões
  dmDados.VerificarPermissoes;

  bbtUsuarios.Visible           := PermiteExecutar('cadastro.pessoa.funcionario.TfrmCadFuncionario');
  bbtPermissoes.Visible         := PermiteExecutar('cadastro.permissao.TfrmCadPermissoes');
  bbtEscritorioContabil.Visible := PermiteExecutar('cadastro.pessoa.escritorio.TfrmCadEscritorio');
  bbtContatos.Visible           := PermiteExecutar('cadastro.pessoa.cliente.TfrmCadCliente');
  bbtRecados.Visible            := PermiteExecutar('controlecontabil.recados.TfrmRecado');
  barCadastro.Visible           := (bbtUsuarios.Visible = ivAlways) or
                                   (bbtPermissoes.Visible = ivAlways) or
                                   (bbtEscritorioContabil.Visible = ivAlways) or
                                   (bbtContatos.Visible = ivAlways) or
                                   (bbtRecados.Visible = ivAlways);

  bbtCompromisos.Visible       := PermiteExecutar('controlecontabil.compromissos.TfrmCompromissos');
  bbtMinhaAgenda.Visible       := PermiteExecutar('controlecontabil.agenda.pessoal.TfrmAgendaPessoal');
  bbtAgendaCorporativa.Visible := PermiteExecutar('controlecontabil.agenda.corporativa.TfrmAgendaCorporativa');
  barAgenda.Visible            := (bbtCompromisos.Visible = ivAlways) or
                                  (bbtMinhaAgenda.Visible = ivAlways) or
                                  (bbtAgendaCorporativa.Visible = ivAlways);

  bbtItemLancamento.Visible := PermiteExecutar('cadastro.lancamento.item.TfrmLancamentoItem');
  bbtProtocolos.Visible     := PermiteExecutar('cadastro.lancamento.protocolo.TfrmLancamentoProtocolo');
  barLancamentos.Visible    := (bbtItemLancamento.Visible = ivAlways) or
                               (bbtProtocolos.Visible = ivAlways);

end;

end.
