unit biblioteca.form.cadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ImgList, ExtCtrls, DB, StdCtrls, Contnrs, RzTabs, Menus,
  biblioteca.form.base, JvValidators, JvErrorIndicator, JvComponentBase,
  JvEmbeddedForms, biblioteca.datamodule.cadastro, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxFilterControl, cxDBFilterControl, cxTextEdit, ComCtrls,
  JvExComCtrls, JvPageListTreeView, JvExControls, JvPageList, JvEnterTab;

type
  TfrmCadBase = class(TfrmBase)
    aclCadastro: TActionList;
    actConsultar: TAction;
    actProximo: TAction;
    actAnterior: TAction;
    actPrimeiro: TAction;
    actUltimo: TAction;
    actIncluir: TAction;
    actEditar: TAction;
    actExcluir: TAction;
    actCancelar: TAction;
    actSalvar: TAction;
    pnlCadBase: TPanel;
    actVisualizar: TAction;
    pcCadastro: TRzPageControl;
    tsConsulta: TRzTabSheet;
    pnlConsulta: TPanel;
    dgConsulta: TcxGrid;
    dgConsultaDBTableView1: TcxGridDBTableView;
    dgConsultaLevel1: TcxGridLevel;
    pnlFiltro: TPanel;
    fcFiltro: TcxDBFilterControl;
    btnAplicarConsulta: TButton;
    btnLimparConsulta: TButton;
    btnFecharConsulta: TButton;
    tsCadastro: TRzTabSheet;
    pnl: TPanel;
    bvSepCadastro: TBevel;
    stvCadastro: TJvSettingsTreeView;
    pglCadastro: TJvPageList;
    pgPrincipal: TJvStandardPage;
    pnlCadastro: TPanel;
    pnlBarraInferior: TPanel;
    btnSalvar: TButton;
    btnCancelar: TButton;
    EnterAsTab: TJvEnterAsTab;
    procedure actIncluirExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure actProximoExecute(Sender: TObject);
    procedure actAnteriorExecute(Sender: TObject);
    procedure actPrimeiroExecute(Sender: TObject);
    procedure actUltimoExecute(Sender: TObject);
    procedure aclCadastroUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure actVisualizarExecute(Sender: TObject);
    procedure pcCadastroTabClick(Sender: TObject);
    procedure pcCadastroChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tvConsultaDblClick(Sender: TObject);
    procedure actConsultarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLimparConsultaClick(Sender: TObject);
    procedure btnAplicarConsultaClick(Sender: TObject);
    procedure btnFecharConsultaClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    FGridList: TComponentList;
    FPermiteIncluir: Boolean;
    FPermiteEditar: Boolean;
    FPermiteExcluir: Boolean;
    procedure DoCustomValidate(var IsValid: Boolean);
  protected
    function GetMainDataModule: TdmCadBase; virtual; abstract;
    procedure AdicionarFiltro(ATitulo: string; ACampo: TField);
//    procedure CreateToolBarButtons; override;
    procedure ConfigureComponents; virtual;
    procedure ConfigureGridViews; virtual;
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    function ShowModal: Integer; override;
    property MainDataModule: TdmCadBase read GetMainDataModule;
  end;

var
  frmCadBase: TfrmCadBase;

implementation

uses
  biblioteca.helper.validator, controlecontabil.dados;

{$R *.dfm}

//procedure TfmCadBase.CreateToolBarButtons;
//begin
//  inherited;
//
//  DBStateStatusPlugin.SetDataSource(MainDataModule.ActiveDataSource);
//
//  ToolBarPlugin.AddAction(actConsultar);
//  ToolBarPlugin.AddSeparator;
//  ToolBarPlugin.AddAction(actPrimeiro);
//  ToolBarPlugin.AddAction(actAnterior);
//  ToolBarPlugin.AddAction(actProximo);
//  ToolBarPlugin.AddAction(actUltimo);
//  ToolBarPlugin.AddSeparator;
//  ToolBarPlugin.AddAction(actIncluir);
//  ToolBarPlugin.AddAction(actEditar);
//  ToolBarPlugin.AddAction(actExcluir);
//  ToolBarPlugin.AddSeparator;
//  ToolBarPlugin.AddAction(actSalvar);
//  ToolBarPlugin.AddAction(actCancelar);
//end;

procedure TfrmCadBase.actIncluirExecute(Sender: TObject);
begin
  inherited;
  pcCadastro.ActivePage := tsCadastro;
  dgConsulta.BeginUpdate;
  try
    MainDataModule.InsertRecord;
    aclCadastro.UpdateAction(actIncluir)
  finally
    dgConsulta.EndUpdate;
  end;
end;

procedure TfrmCadBase.actEditarExecute(Sender: TObject);
begin
  inherited;
  pcCadastro.ActivePage := tsCadastro;
  MainDataModule.EditRecord;
  aclCadastro.UpdateAction(actEditar)
end;

procedure TfrmCadBase.actExcluirExecute(Sender: TObject);

  function ConfirmDeleteBox: Boolean;
  begin
    Result := (Application.MessageBox('Você confirma exclusão do registro ?', 'Confirmação',
      MB_DEFBUTTON2 + mb_YesNo + MB_ICONQUESTION) = mrYes);
  end;

begin
  inherited;
  pcCadastro.ActivePage := tsCadastro;
  if ConfirmDeleteBox then
    MainDataModule.DeleteRecord;
  aclCadastro.UpdateAction(actExcluir)
end;

procedure TfrmCadBase.actCancelarExecute(Sender: TObject);
begin
  inherited;
  MainDataModule.CancelRecord;
  aclCadastro.UpdateAction(actCancelar)
end;

procedure TfrmCadBase.actSalvarExecute(Sender: TObject);
begin
  inherited;
  MainDataModule.SaveRecord;
  aclCadastro.UpdateAction(actSalvar)
end;

procedure TfrmCadBase.ConfigureComponents;
begin
  dgConsultaDBTableView1.DataController.DataSource := MainDataModule.MainDataSource;
  fcFiltro.DataSet := MainDataModule.MainTable;

  stvCadastro.Visible   := pglCadastro.PageCount > 1;
  bvSepCadastro.Visible := pglCadastro.PageCount > 1;
end;

procedure TfrmCadBase.actProximoExecute(Sender: TObject);
begin
  inherited;
  MainDataModule.NextRecord;
  aclCadastro.UpdateAction(actProximo)
end;


procedure TfrmCadBase.actAnteriorExecute(Sender: TObject);
begin
  inherited;
  MainDataModule.PriorRecord;
  aclCadastro.UpdateAction(actAnterior)
end;

procedure TfrmCadBase.actPrimeiroExecute(Sender: TObject);
begin
  inherited;
  MainDataModule.FirstRecord;
  aclCadastro.UpdateAction(actPrimeiro)
end;

procedure TfrmCadBase.actUltimoExecute(Sender: TObject);
begin
  inherited;
  MainDataModule.LastRecord;
  aclCadastro.UpdateAction(actUltimo)
end;

procedure TfrmCadBase.aclCadastroUpdate(Action: TBasicAction; var Handled: Boolean);
begin
  inherited;
  if MainDataModule.State  in [sInsert, sEdit] then
  begin
    actConsultar.Enabled := False;
    actIncluir.Enabled := False;
    actEditar.Enabled := False;
    actExcluir.Enabled := False;
    actProximo.Enabled := False;
    actAnterior.Enabled := False;
    actPrimeiro.Enabled := False;
    actUltimo.Enabled := False;
    actSalvar.Enabled := True;
    actCancelar.Enabled := True;
  end
  else
    if MainDataModule.State  = sNone then
    begin
      actConsultar.Enabled := fcFiltro.Items.Count > 0; //MainDataModule.ExistePesquisa;
      actIncluir.Enabled := FPermiteIncluir;
      actEditar.Enabled := (not MainDataModule.ActiveTable.IsEmpty) and FPermiteEditar;
      actExcluir.Enabled := (not MainDataModule.ActiveTable.IsEmpty) and FPermiteExcluir;
      actProximo.Enabled := (not MainDataModule.ActiveTable.IsEmpty) and (not MainDataModule.ActiveTable.Eof);
      actAnterior.Enabled := (not MainDataModule.ActiveTable.IsEmpty) and (not MainDataModule.ActiveTable.Bof);
      actPrimeiro.Enabled := (not MainDataModule.ActiveTable.IsEmpty)and (not MainDataModule.ActiveTable.Bof);
      actUltimo.Enabled := (not MainDataModule.ActiveTable.IsEmpty) and (not MainDataModule.ActiveTable.Eof);
      actSalvar.Enabled := False;
      actCancelar.Enabled := False;
    end;
end;

procedure TfrmCadBase.actVisualizarExecute(Sender: TObject);
begin
  inherited;
  aclCadastro.UpdateAction(actVisualizar)
end;

type
  TcxDBFilterControl_ = class(TcxDBFilterControl);

procedure TfrmCadBase.AdicionarFiltro(ATitulo: string; ACampo: TField);
var
  Item: TcxFilterItem;
begin
  Item := (fcFiltro.Items.Add as TcxFilterItem);
  Item.Caption   := ATitulo;
  Item.FieldName := ACampo.FieldName;
  Item.PropertiesClass := TcxDBFilterControl_(fcFiltro).GetPropertiesClassFromFieldType(ACampo.DataType);
end;

procedure TfrmCadBase.btnAplicarConsultaClick(Sender: TObject);
begin
  inherited;
  MainDataModule.ExecuteQuery(fcFiltro.FilterText);
end;

procedure TfrmCadBase.btnFecharConsultaClick(Sender: TObject);
begin
  inherited;
  pnlFiltro.Visible := False;
  btnLimparConsulta.Click;
end;

procedure TfrmCadBase.btnLimparConsultaClick(Sender: TObject);
begin
  inherited;
  fcFiltro.Clear;
end;

procedure TfrmCadBase.btnSalvarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;
  actSalvar.Execute;
  ModalResult := mrOK;
end;

procedure TfrmCadBase.pcCadastroTabClick(Sender: TObject);
begin
  inherited;
  SelectNext(pcCadastro, True, True);
end;

function TfrmCadBase.ShowModal: Integer;
begin
  pnlBarraInferior.Visible := True;
  Result := inherited ShowModal;
end;

procedure TfrmCadBase.pcCadastroChange(Sender: TObject);
begin
  inherited;
//  if not Showing then
//    Exit;

  SelectNext(pcCadastro, True, True);
  aclCadastro.UpdateAction(actVisualizar);
end;

procedure TfrmCadBase.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if not Assigned(FGridList) then
    FGridList := TComponentList.Create(False);
  if (AComponent is TcxGrid) then
    case Operation of
      opInsert: FGridList.Add(AComponent);
      opRemove: FGridList.Remove(AComponent);
    end;
end;

procedure TfrmCadBase.FormCreate(Sender: TObject);
begin
  inherited;
  MainDataModule.OnCustomValidate := DoCustomValidate;
end;

procedure TfrmCadBase.FormShow(Sender: TObject);
begin
  inherited;
  ConfigureComponents;
  ConfigureGridViews;

  FPermiteIncluir := dmDados.PermiteIncluir(Self.UnitName + '.' + Self.ClassName, False);
  FPermiteEditar  := dmDados.PermiteEditar(Self.UnitName + '.' + Self.ClassName, False);
  FPermiteExcluir := dmDados.PermiteExcluir(Self.UnitName + '.' + Self.ClassName, False);

  if pnlBarraInferior.Visible then
  begin
    actIncluir.Execute;
    tsConsulta.TabVisible := False;
    tsCadastro.TabVisible := False;
  end;
end;

procedure TfrmCadBase.ConfigureGridViews;
var
  I: Integer;
  oGrid: TcxGrid;
begin
  for I := 0 to FGridList.Count - 1 do
  begin
    oGrid := TcxGrid(FGridList[I]);

    with TcxGridDBTableView(oGrid.Views[0]) do
    begin
      OptionsBehavior.ImmediateEditor           := True;
      OptionsBehavior.GoToNextCellOnEnter       := True;
      OptionsBehavior.FocusCellOnCycle          := True;
      OptionsBehavior.FocusCellOnTab            := True;
      OptionsBehavior.FocusFirstCellOnNewRecord := True;

      OptionsData.Appending            := False;
      OptionsData.CancelOnExit         := True;
      OptionsData.Deleting             := True;
      OptionsData.DeletingConfirmation := True;
      OptionsData.Editing              := False;
      OptionsData.Inserting            := True;

      OptionsView.Indicator  := True;
      OptionsView.ScrollBars := ssBoth;
      OptionsView.GroupByBox := False;
      OptionsView.NoDataToDisplayInfoText := '<Nenhum registro para exibir>';
    end;

//    for J := 0 to oGrid.Levels.Count - 1 do
//    begin
//      oGridView := oGrid.Levels[J].GridView;
//      if (oGridView is TcxGridDBTableView) then
//        with TcxGridDBTableView(oGridView) do
//        begin
//          DataController.DataModeController.GridMode := True;
//          DataController.DataModeController.SmartRefresh := True;
//          NavigatorButtons.ConfirmDelete := False;
//          OptionsBehavior.ImmediateEditor := False;
//          OptionsBehavior.GoToNextCellOnEnter := True;
//          OptionsBehavior.FocusCellOnCycle := True;
//          OptionsData.CancelOnExit := False;
//          OptionsData.Deleting := False;
//          OptionsData.DeletingConfirmation := False;
//          OptionsData.Inserting := False;
//          OptionsSelection.InvertSelect := False;
//          OptionsView.ScrollBars := ssHorizontal;
//          OptionsView.GroupByBox := False;
//          OptionsView.Indicator := True;
//        end;
//    end;
  end;
end;

procedure TfrmCadBase.DoCustomValidate(var IsValid: Boolean);
begin
  IsValid := Validador.Validar;
end;

procedure TfrmCadBase.tvConsultaDblClick(Sender: TObject);
begin
  inherited;
  pcCadastro.ActivePage := tsCadastro;
  SelectNext(pcCadastro, True, True);
end;

procedure TfrmCadBase.actConsultarExecute(Sender: TObject);
begin
  inherited;
  pcCadastro.ActivePage := tsConsulta;
  pnlFiltro.Visible := True;
//  MainDataModule.ExecutePesquisa;
end;

end.
