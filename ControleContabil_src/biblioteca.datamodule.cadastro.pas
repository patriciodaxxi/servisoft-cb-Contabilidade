unit biblioteca.datamodule.cadastro;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs, DB, DBClient, Provider,
  FMTBcd, SqlExpr, biblioteca.datamodule.base;

type
  TdmCadState = (sNone, sInsert, sEdit, sDelete);

const
  Desc_State: array [TdmCadState] of string = ('Visualizando', 'Inserindo', 'Editando', 'Excluindo');

type
  TdmCadBase = class(TdmBase)
    procedure DataModuleCreate(Sender: TObject);
  private
    FBookmark: TBytes;
    FMainOriginalCommandText: String;
    FMainTable: TClientDataSet;
    FMainProvider: TDataSetProvider;
    FMainSQLDataSet: TSQLDataSet;
    FState: TdmCadState;
    FMainDataSource: TDataSource;
    FActiveDataSource: TDataSource;
    FActiveTable: TClientDataSet;
    procedure SetAutoEdit(Value: Boolean);
  protected
    procedure EnabledAutoEdit;
    procedure DisabledAutoEdit;
  protected
    procedure BeforeInsertRecord; virtual;
    procedure AfterInsertRecord; virtual;
    procedure BeforeEditRecord; virtual;
    procedure AfterEditRecord; virtual;
    procedure BeforeDeleteRecord; virtual;
    procedure AfterDeleteRecord; virtual;
    procedure BeforeSaveRecord; virtual;
    procedure AfterSaveRecord; virtual;
    procedure BeforeCancelRecord; virtual;
    procedure AfterCancelRecord; virtual;
    procedure BeforeApplyUpdates; virtual;
    function ApplyUpdates(StartTransaction: Boolean): Boolean;
    procedure AfterApplyUpdates; virtual;
    procedure BeforeExecuteQuery(var Filter: String); virtual;
    procedure AfterExecuteQuery(var Filter: String); virtual;
    procedure GetMainDataSource(var DataSource: TDataSource); virtual; abstract;
    procedure ConfigureComponents; virtual;
    procedure DoGetTableName(Sender: TObject; DataSet: TDataSet; var TableName: WideString);
    procedure DoReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
  public
    procedure SetActiveDataSource(Value: TDataSource);
    procedure InsertRecord;
    procedure EditRecord;
    procedure DeleteRecord(StartTransaction: Boolean = False);
    procedure SaveRecord(StartTransaction: Boolean = False);
    procedure CancelRecord;
    procedure FirstRecord;
    procedure LastRecord;
    procedure NextRecord;
    procedure PriorRecord;
    procedure ExecuteQuery(Filter: String = ''); virtual;
    procedure ExecutePesquisa;
    function LocateRecord: Boolean;
    property MainDataSource: TDataSource read FMaindataSource;
    property MainTable: TClientDataSet read FMainTable;
    property MainProvider: TDataSetProvider read FMainProvider;
    property MainSQLDataSet: TSQLDataSet read FMainSQLDataSet;
    property MainOriginalCommandText: String read FMainOriginalCommandText;
    property ActiveDataSource: TDataSource read FActiveDataSource;
    property ActiveTable: TClientDataSet read FActiveTable;
    property State: TdmCadState read FState write FState;

    function ExistePesquisa: Boolean; virtual;
  end;

implementation

uses
  controlecontabil.dados, DBXCommon, Forms, Controls;

{$R *.dfm}

{ TdmCadBase }
procedure TdmCadBase.AfterApplyUpdates;
begin
end;

procedure TdmCadBase.AfterCancelRecord;
begin

end;

procedure TdmCadBase.AfterDeleteRecord;
begin

end;

procedure TdmCadBase.AfterEditRecord;
begin

end;


procedure TdmCadBase.AfterInsertRecord;
begin
end;

procedure TdmCadBase.AfterSaveRecord;
begin

end;

function TdmCadBase.ApplyUpdates(StartTransaction: Boolean): Boolean;
var
  oTransactionDesc: TDBXTransaction;
begin
  Result := False;

  if StartTransaction then
    oTransactionDesc := DBXConnection.BeginTransaction;

  try
    BeforeApplyUpdates;

    if FMainTable.ChangeCount > 0 then
      if FMainTable.ApplyUpdates(0) > 0 then
        Abort;

    Result := True;
    AfterApplyUpdates;

    if StartTransaction then
      DBXConnection.CommitFreeAndNil(oTransactionDesc);
  except
    if StartTransaction then
      DBXConnection.RollbackFreeAndNil(oTransactionDesc);
  end;
end;

procedure TdmCadBase.BeforeApplyUpdates;
begin

end;

procedure TdmCadBase.BeforeCancelRecord;
begin

end;

procedure TdmCadBase.BeforeDeleteRecord;
begin

end;

procedure TdmCadBase.BeforeEditRecord;
begin

end;


procedure TdmCadBase.BeforeInsertRecord;
begin

end;

procedure TdmCadBase.BeforeSaveRecord;
var
  SaveControl: TWinControl;
begin
  SaveControl := Screen.ActiveForm.ActiveControl;
  try
    Screen.ActiveForm.ActiveControl := nil;
    if not ValidateRequired then
      Abort;
  finally
    try
      Screen.ActiveForm.ActiveControl := SaveControl;
    except
    end;
  end;
end;

procedure TdmCadBase.CancelRecord;
begin
  BeforeCancelRecord;
  FMainTable.Cancel;
  FMainTable.CancelUpdates;
  if (FState = sDelete) then
  begin
    FActiveTable.Bookmark := FBookmark;
    FBookmark := nil;
  end;
  DisabledAutoEdit;
  AfterCancelRecord;
  FState := sNone;
end;

procedure TdmCadBase.DeleteRecord(StartTransaction: Boolean = False);
begin
  try
    FState := sDelete;
    FBookmark := FActiveTable.Bookmark;
    FActiveTable.DisableControls;
    try
      BeforeDeleteRecord;
      FActiveTable.Delete;
      ApplyUpdates(StartTransaction);
      AfterDeleteRecord;
    except
      CancelRecord;
      raise;
    end;
  finally
    FState := sNone;
    FActiveTable.EnableControls;
  end;
end;

procedure TdmCadBase.DisabledAutoEdit;
begin
  SetAutoEdit(False);
end;

procedure TdmCadBase.DoGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: WideString);
begin
  TableName := UpperCase(Copy(DataSet.Name, 4));
end;

procedure TdmCadBase.DoReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  raise Exception.Create(E.Message);
end;

procedure TdmCadBase.EditRecord;
begin
  FState := sEdit;
  EnabledAutoEdit;
  BeforeEditRecord;
  FActiveTable.Edit;
  AfterEditRecord;
end;

procedure TdmCadBase.EnabledAutoEdit;
begin
  SetAutoEdit(True);
end;

procedure TdmCadBase.ExecuteQuery(Filter: String);
var
  sFilter: String;
begin
  sFilter := '';
  if Filter <> '' then
  begin
    if Pos('WHERE', FMainOriginalCommandText) > 0 then
      sFilter := Format(' AND %s', [Filter])
    else
      sFilter := Format(' WHERE %s ', [Filter]);
  end;
  FMainTable.Close;
  BeforeExecuteQuery(sFilter);
  MainSQLDataSet.CommandText := StringReplace(FMainOriginalCommandText, '/*{MCONDITION}*/', sFilter, [rfReplaceAll]);
  FMainTable.Open;
  AfterExecuteQuery(sFilter);
end;

function TdmCadBase.LocateRecord: Boolean;
begin
  Result := (FMainTable.Active) and (not FMainTable.IsEmpty);
end;

procedure TdmCadBase.InsertRecord;
begin
  BeforeInsertRecord;
  FState := sInsert;
  EnabledAutoEdit;
  if not FActiveTable.Active then
    ExecuteQuery('1=0');
  FActiveTable.Insert;
  AfterInsertRecord;
end;

procedure TdmCadBase.SaveRecord(StartTransaction: Boolean = False);
begin
  BeforeSaveRecord;
  if FMainTable.State in [dsEdit, dsInsert] then
    FMainTable.Post;

  if ApplyUpdates(StartTransaction) then
  begin
    DisabledAutoEdit;
    AfterSaveRecord;
    FBookmark := nil;
    FState := sNone;
  end;
end;

procedure TdmCadBase.SetAutoEdit(Value: Boolean);
var
  I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
  begin
    if (Components[I] is TDataSource) then
      TDataSource(Components[I]).AutoEdit := Value;
  end;
end;


procedure TdmCadBase.AfterExecuteQuery(var Filter: String);
begin

end;

procedure TdmCadBase.BeforeExecuteQuery(var Filter: String);
begin

end;

procedure TdmCadBase.DataModuleCreate(Sender: TObject);
begin
  inherited;
  GetMainDataSource(FMainDataSource);
  FMainTable := TClientDataSet(FMainDataSource.DataSet);
  FMainProvider := TDataSetProvider(FindComponent(FMainTable.ProviderName));
  FMainSQLDataSet := TSQLDataSet(MainProvider.DataSet);
  FMainOriginalCommandText := UpperCase(FMainSQLDataSet.CommandText);
  SetActiveDataSource(FMainDataSource);
  FState := sNone;
  SetAutoEdit(False);
  if not ExistePesquisa then
    ExecuteQuery;
  ConfigureComponents;
end;

procedure TdmCadBase.ConfigureComponents;
begin
  if Assigned(FMainTable) then
    FMainTable.OnReconcileError := DoReconcileError;

  if Assigned(FMainProvider) then
    FMainProvider.OnGetTableName := DoGetTableName;
end;

procedure TdmCadBase.SetActiveDataSource(Value: TDataSource);
begin
  FActiveDataSource := Value;
  FActiveTable := TClientDataSet(FActiveDataSource.DataSet);
end;

procedure TdmCadBase.NextRecord;
begin
  FActiveTable.Next;
end;

procedure TdmCadBase.PriorRecord;
begin
  FActiveTable.Prior;
end;

procedure TdmCadBase.FirstRecord;
begin
  FActiveTable.First;
end;

procedure TdmCadBase.LastRecord;
begin
  FActiveTable.Last;
end;

procedure TdmCadBase.ExecutePesquisa;
//var
//  sSQL: String;
begin
//  if DBPesquisa.SearchExecute(DBUtils.GetTableNameDB(FMainTable), sSQL) then
//    ExecuteQuery(sSQL);
end;

function TdmCadBase.ExistePesquisa: Boolean;
begin
  Result := False;//DBPesquisa.IsExist(DBUtils.GetTableNameDB(FMainTable));
end;


end.
