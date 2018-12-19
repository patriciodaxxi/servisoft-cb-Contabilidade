unit controlecontabil.dados;

interface

uses
  SysUtils, Classes, WideStrings, DBXFirebird, DB, SqlExpr, ImgList, Controls,
  JvValidators, JvComponentBase, JvErrorIndicator, cxLocalization, Dialogs,
  JvBaseDlg, JvLoginForm, DBClient, SimpleDS, IdBaseComponent, IdCoder,
  IdCoder3to4, IdCoderMIME;

type
  TdmDados = class(TDataModule)
    soConexao: TSQLConnection;
    Ativos32x32: TImageList;
    Inativos32x32: TImageList;
    Ativos16x16: TImageList;
    Inativos16x16: TImageList;
    ErrorImage: TImageList;
    cxLocalizer: TcxLocalizer;
    LoginDialog: TJvLoginDialog;
    sdsUsuarios: TSimpleDataSet;
    sdsUsuariosRAZAO_SOCIAL: TStringField;
    sdsUsuariosLOGIN: TStringField;
    sdsUsuariosSENHA: TStringField;
    Encode64: TIdEncoderMIME;
    sdsUsuariosID_PESSOA: TIntegerField;
    sdsEscritorio: TSimpleDataSet;
    sdsEscritorioRAZAO_SOCIAL: TStringField;
    sdsEscritorioID_PESSOA: TIntegerField;
    dsEscritorio: TDataSource;
    dsUsuario: TDataSource;
    sdsEscritorioDOCUMENTO: TStringField;
    sdsEscritorioENDERECO: TStringField;
    sdsEscritorioCEP: TStringField;
    sdsEscritorioCIDADE: TStringField;
    sdsEscritorioUF: TStringField;
    sdsEscritorioSITE: TStringField;
    sdsEscritorioLOGOTIPO: TBlobField;
    sdsEscritorioTELEFONE: TStringField;
    sdsEscritorioEMAIL: TStringField;
    sdsPermissoes: TSimpleDataSet;
    sdsUsuariosID_BASE_GRUPO_USUARIO: TIntegerField;
    sdsPermissoesCLASSE: TStringField;
    sdsPermissoesPERMITE_EXECUTAR: TIntegerField;
    sdsPermissoesPERMITE_INCLUIR: TIntegerField;
    sdsPermissoesPERMITE_EDITAR: TIntegerField;
    sdsPermissoesPERMITE_EXCLUIR: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure LoginDialogCheckUser(Sender: TObject; const UserName,
      Password: string; var AllowLogin: Boolean);
    procedure soConexaoBeforeConnect(Sender: TObject);
  private
    { Private declarations }
    FCodigoUsuario: Integer;
    FNomeUsuario: string;
    FLoginUsuario: string;
    FIdGrupoUsuario: Integer;
    function GetCodigoEscritorio: Integer;
    function GetNomeEscritorio: string;
    function VerificarAcao(AIdentificador, AAcao: string; AVerificarPermissoes: Boolean): Boolean;
  public
    { Public declarations }
    procedure Logar;
    procedure VerificarPermissoes;

    function PermiteExecutar(AIdentificador: string; AVerificarPermissoes: Boolean): Boolean;
    function PermiteIncluir(AIdentificador: string; AVerificarPermissoes: Boolean): Boolean;
    function PermiteEditar(AIdentificador: string; AVerificarPermissoes: Boolean): Boolean;
    function PermiteExcluir(AIdentificador: string; AVerificarPermissoes: Boolean): Boolean;

    property NomeUsuario: string read FNomeUsuario;
    property LoginUsuario: string read FLoginUsuario;
    property CodigoUsuario: Integer read FCodigoUsuario;
    property NomeEscritorio: string read GetNomeEscritorio;
    property CodigoEscritorio: Integer read GetCodigoEscritorio;
  end;

var
  dmDados: TdmDados;

implementation

uses
  Forms, controlecontabil.indicadores, Variants, IniFiles;

{$R *.dfm}

const
  Banco = 'BD_ESCRITORIO.FDB';
  Linguagem = 'PtBR.ini';

procedure TdmDados.DataModuleCreate(Sender: TObject);
begin
  cxLocalizer.LoadFromFile(ExtractFilePath(Application.ExeName) + Linguagem);
  cxLocalizer.Locale := 1046;
  cxLocalizer.Active := True;

  LoginDialog.Caption := 'Controle Contábil';
  LoginDialog.AppTitleLabelCaption := dmDados.NomeEscritorio;
end;

function TdmDados.GetCodigoEscritorio: Integer;
begin
  if not sdsEscritorio.Active then
    sdsEscritorio.Open;

  if sdsEscritorio.IsEmpty then
    Result := -1
  else
    Result := sdsEscritorioID_PESSOA.AsInteger;
end;

function TdmDados.GetNomeEscritorio: string;
begin
  if not sdsEscritorio.Active then
    sdsEscritorio.Open;

  if sdsEscritorio.IsEmpty then
    Result := EmptyStr
  else
    Result := sdsEscritorioRAZAO_SOCIAL.AsString;
end;

procedure TdmDados.Logar;
begin
  if not LoginDialog.Login then
    LoginDialog.TerminateApplication;
end;

procedure TdmDados.LoginDialogCheckUser(Sender: TObject; const UserName,
  Password: string; var AllowLogin: Boolean);
begin
  sdsUsuarios.Close;
  sdsUsuarios.DataSet.ParamByName('LOGIN').AsString := UserName;
  sdsUsuarios.Open;
  try
    FCodigoUsuario := 0;
    FNomeUsuario   := EmptyStr;
    FLoginUsuario  := UserName;

    AllowLogin := not sdsUsuarios.IsEmpty;
    if AllowLogin then
      AllowLogin := SameText(Encode64.Encode(Password), sdsUsuariosSENHA.AsString);

    if AllowLogin then
    begin
      FCodigoUsuario  := sdsUsuariosID_PESSOA.AsInteger;
      FNomeUsuario    := sdsUsuariosRAZAO_SOCIAL.AsString;
      FIdGrupoUsuario := sdsUsuariosID_BASE_GRUPO_USUARIO.AsInteger;
      if Assigned(frmIndicadores) then
        frmIndicadores.AtualizarIndicadores;
      VerificarPermissoes;
    end
    else
      raise Exception.Create('Usuário e/ou senha inválidos.');
  finally
    sdsUsuarios.Close;
  end;
end;

function TdmDados.PermiteEditar(AIdentificador: string;
  AVerificarPermissoes: Boolean): Boolean;
begin
  Result := VerificarAcao(AIdentificador, 'PERMITE_EDITAR', AVerificarPermissoes);
end;

function TdmDados.PermiteExcluir(AIdentificador: string;
  AVerificarPermissoes: Boolean): Boolean;
begin
  Result := VerificarAcao(AIdentificador, 'PERMITE_EXCLUIR', AVerificarPermissoes);
end;

function TdmDados.PermiteExecutar(AIdentificador: string;
  AVerificarPermissoes: Boolean): Boolean;
begin
  Result := VerificarAcao(AIdentificador, 'PERMITE_EXECUTAR', AVerificarPermissoes);
end;

function TdmDados.PermiteIncluir(AIdentificador: string;
  AVerificarPermissoes: Boolean): Boolean;
begin
  Result := VerificarAcao(AIdentificador, 'PERMITE_INCLUIR', AVerificarPermissoes);
end;

procedure TdmDados.soConexaoBeforeConnect(Sender: TObject);
var
  Arquivo: string;
  Ini: TIniFile;
begin
  Arquivo := ExtractFilePath(Application.ExeName) + Banco;
  if FileExists(ExtractFilePath(Application.ExeName) + 'config.ini') then
  begin
    Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'config.ini');
    try
      Arquivo := Ini.ReadString('banco', 'nome', Arquivo);
    finally
      FreeAndNil(Ini);
    end;
  end;
  soConexao.Params.Values['database'] := Arquivo;
end;

function TdmDados.VerificarAcao(AIdentificador, AAcao: string;
  AVerificarPermissoes: Boolean): Boolean;
var
  vPermite: Variant;
begin
  if AVerificarPermissoes then
    VerificarPermissoes;

  NullStrictConvert := False;
  try
    vPermite := sdsPermissoes.Lookup('CLASSE', AIdentificador, AAcao);
    if VarIsNull(vPermite) then
      Result := False
    else
      Result := vPermite;
  finally
    NullStrictConvert := True;
  end;
end;

procedure TdmDados.VerificarPermissoes;
begin
  sdsPermissoes.Close;
  sdsPermissoes.DataSet.ParamByName('ID_GRUPO_USUARIO').AsInteger := FIdGrupoUsuario;
  sdsPermissoes.Open;
end;

end.
