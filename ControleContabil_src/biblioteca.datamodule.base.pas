unit biblioteca.datamodule.base;

interface

uses
  SysUtils, Classes, Contnrs, SqlExpr, Provider, DB, DBClient, JvValidators;

type
  TdmBaseCustomValidate = procedure (var IsValid: Boolean) of object;

  TdmBase = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    FOnCustomValidate: TdmBaseCustomValidate;
    procedure ConfigureComponents;
    procedure DoUpdateError(Sender: TObject; DataSet: TCustomClientDataSet;
      E: EUpdateError; UpdateKind: TUpdateKind; var Response: TResolverResponse);
    procedure DoAfterInsert(DataSet: TDataSet);
    procedure DoBeforePost(DataSet: TDataSet);
    procedure DoBeforeOpen(DataSet: TDataSet);
    procedure DoPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure ExecProcDataSet(DataSet: TDataSet; ProcName: String);
  protected
    function DBXConnection: TSQLConnection;
    function GetTableNameDB(DataSet: TDataSet): WideString;
    function GetFieldNameID(DataSet: TDataSet): String;
    function GenTableID(TableName: String): Integer;
    function NewClientDataSet(SQLCommandText: String): TClientDataSet;
    function ValidateRequired: Boolean; virtual;
  public
    property OnCustomValidate: TdmBaseCustomValidate read FOnCustomValidate write FOnCustomValidate;
  end;

  TFieldValidator = class(TJvBaseValidator)
  protected
    procedure Validate; override;
  end;

implementation

{$R *.dfm}

uses
  controlecontabil.dados, DBXCommon, cxEdit, cxDBEdit, cxGrid,
  cxGridDBTableView, SimpleDS;

type
  _TDataSetProvider = class(TDataSetProvider);
  _TcxCustomEdit = class(TcxCustomEdit);

{ TFieldValidator }

procedure TFieldValidator.Validate;
begin
  Valid := True;
  if (ControlToValidate is TcxCustomEdit) then
  begin
    if (_TcxCustomEdit(ControlToValidate).FDataBinding is TcxDBEditDataBinding) then
    begin
      Valid := not TcxDBEditDataBinding(_TcxCustomEdit(ControlToValidate).FDataBinding).Field.IsNull;
    end;
  end
  else if (ControlToValidate is TcxGrid) then
  begin
    Valid:= not TcxGridDBTableView(TcxGrid(ControlToValidate).Views[0]).DataController.DataSet.IsEmpty;
  end;
end;

{ TdmBase }

procedure TdmBase.DataModuleCreate(Sender: TObject);
begin
  ConfigureComponents;
end;

function TdmBase.DBXConnection: TSQLConnection;
begin
  Result := dmDados.soConexao;
end;

procedure TdmBase.ConfigureComponents;
var
  I: Integer;
begin
  for I := 0 to (ComponentCount-1) do
  begin
    if (Components[I] is TCustomSQLDataSet) then
    begin
      TCustomSQLDataSet(Components[I]).SQLConnection := DBXConnection;
      TCustomSQLDataSet(Components[I]).BeforeOpen    := DoBeforeOpen;
    end;

    if (Components[I] is TSimpleDataSet) then
    begin
      TSimpleDataSet(Components[I]).Connection := DBXConnection;
      TSimpleDataSet(Components[I]).BeforeOpen := DoBeforeOpen;
    end;

    if (Components[I] is TDataSetProvider) then
        TDataSetProvider(Components[I]).OnUpdateError := DoUpdateError;

    if (Components[I] is TClientDataSet) then
    begin
      TClientDataSet(Components[I]).OnPostError := DoPostError;
      TClientDataSet(Components[I]).AfterInsert := DoAfterInsert;
      TClientDataSet(Components[I]).BeforePost  := DoBeforePost;
      TClientDataSet(Components[I]).BeforeOpen  := DoBeforeOpen;
    end;
  end;
end;

procedure TdmBase.DoAfterInsert(DataSet: TDataSet);
var
  sTableName, sFieldNameID: String;
begin
  sTableName := GetTableNameDB(DataSet);
  sFieldNameID := GetFieldNameID(DataSet);
  if (sTableName <> '') and (sFieldNameID <> '') then
    if Assigned(DataSet.Fields.FindField(sFieldNameID)) then
      DataSet.FieldByName(sFieldNameID).AsInteger := GenTableID(sTableName);

  ExecProcDataSet(DataSet, 'AfterInsert');
end;

procedure TdmBase.DoPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
//  DBUtils.DoPostError(DataSet, E, Action);
end;

procedure TdmBase.DoUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
//  DBUtils.DoUpdateError(Sender, DataSet, E, UpdateKind, Response);
end;

procedure TdmBase.ExecProcDataSet(DataSet: TDataSet; ProcName: String);
var
  pProc: TMethod;
  pExecProc: TDataSetNotifyEvent;
begin
  pProc.Data := Pointer(DataSet.Owner);
  pProc.Code := DataSet.Owner.MethodAddress(DataSet.Name + ProcName);
  if Assigned(pProc.Code) then
  begin
    pExecProc := TDataSetNotifyEvent(pProc);
    pExecProc(DataSet);
  end;
end;

function TdmBase.GenTableID(TableName: String): Integer;
const
  cPossuiGerador = 'SELECT * FROM RDB$GENERATORS GEN WHERE GEN.RDB$GENERATOR_NAME = %s';
  cExecutaGerador = 'SELECT GEN_ID(%s, 1) AS VALOR FROM RDB$DATABASE';
var
  sGerador: String;
  oCds: TClientDataSet;
begin
  Result := 0;

  sGerador := 'GEN_' + UpperCase(TableName) + '_ID';

  oCds := NewClientDataSet(Format(cPossuiGerador, [QuotedStr( sGerador )]));
  try
    if oCds.IsEmpty then
      raise Exception.CreateFmt('Gerador %s não encontrado.', [sGerador]);

    FreeAndNil(oCds);
    oCds := NewClientDataSet(Format(cExecutaGerador, [sGerador]));
    Result := oCds.FieldByName('VALOR').AsInteger;
  finally
    FreeAndNil(oCds);
  end;
end;

function TdmBase.GetFieldNameID(DataSet: TDataSet): String;
var
  I: Integer;
begin
  Result := '';
  for I := 0 to (DataSet.FieldCount-1) do
  begin
    if pfInKey in DataSet.Fields[I].ProviderFlags then
    begin
      if Result <> '' then
        Result := ',';
      Result := Result + DataSet.Fields[I].FieldName;
    end;
  end;
  if Pos(',', Result) <> 0 then
    Result := '';
end;

function TdmBase.GetTableNameDB(DataSet: TDataSet): WideString;
var
  oOwner: TComponent;
  oProvider: TDataSetProvider;
begin
  Result := '';
  if (DataSet is TClientDataSet) then
  begin
    oOwner := DataSet.Owner;
    oProvider := TDataSetProvider(oOwner.FindComponent( TClientDataSet(DataSet).ProviderName ));
    if Assigned(oProvider) then
      _TDataSetProvider(oProvider).DoGetTableName(DataSet, Result);
  end;
end;

function TdmBase.NewClientDataSet(SQLCommandText: String): TClientDataSet;
var
  oSDS: TSQLDataSet;
  oDSP: TDataSetProvider;
  oCDS: TClientDataSet;
begin
  oCDS := TClientDataSet.Create(nil);
  oDSP := TDataSetProvider.Create(oCDS);
  oSDS := TSqlDataSet.Create(oCDS);

  oSDS.SQLConnection := DBXConnection;
  oSDS.GetMetadata := False;

  oDSP.DataSet := oSDS;
  oDSP.OnUpdateError := DoUpdateError;

  oCDS.SetProvider(oDSP);
  oCDS.OnPostError := DoPostError;

  oCDS.Close;
  oSDS.CommandText := SQLCommandText;
  oCDS.Open;

  Result := oCDS;
end;

function TdmBase.ValidateRequired: Boolean;
var
  bIsValid: Boolean;
begin
  bIsValid := True;
  if Assigned(FOnCustomValidate) then
    FOnCustomValidate(bIsValid);

  Result := bIsValid;
end;

procedure TdmBase.DoBeforeOpen(DataSet: TDataSet);
var
  Cds: TClientDataSet;
  Dsp: TDataSetProvider;
  Sds: TCustomSQLDataSet;
  Smd: TSimpleDataSet;
begin
  if (DataSet is TClientDataSet) then
  begin
    Dsp := TDataSetProvider(FindComponent(TClientDataSet(DataSet).ProviderName));
    if Assigned(Dsp) then
    begin
      Sds := TCustomSQLDataSet(Dsp.DataSet);
      if Assigned(Sds) then
        Sds.SQLConnection := DBXConnection;
    end;
  end
  else if (DataSet is TCustomSQLDataSet) then
  begin
    Sds := TCustomSQLDataSet(DataSet);
    Sds.SQLConnection := DBXConnection;
  end
  else if (DataSet is TSimpleDataSet) then
  begin
    Smd := TSimpleDataSet(DataSet);
    Smd.Connection := DBXConnection;
  end;
  ExecProcDataSet(DataSet, 'BeforeOpen');
end;

procedure TdmBase.DoBeforePost(DataSet: TDataSet);
begin
  ExecProcDataSet(DataSet, 'BeforePost');
end;

end.
