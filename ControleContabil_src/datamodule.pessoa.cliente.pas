unit datamodule.pessoa.cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, datamodule.pessoa.base, FMTBcd, DB, DBClient, Provider, SqlExpr,
  SimpleDS;

type
  TdmCadCliente = class(TdmPessoaBase)
    sdsContab_Cliente: TSQLDataSet;
    cdsBase_PessoasdsContab_Cliente: TDataSetField;
    cdsContab_Cliente: TClientDataSet;
    sdsContab_ClienteID_CONTAB_CLIENTE: TIntegerField;
    sdsContab_ClienteID_PESSOA: TIntegerField;
    sdsContab_ClienteSTATUS: TIntegerField;
    sdsContab_ClienteDATA_CADASTRO: TDateField;
    sdsContab_ClienteDATA_INATIVIDADE: TDateField;
    sdsContab_ClienteDIA_PAGAMENTO: TIntegerField;
    sdsContab_ClienteVALOR_HONORARIO: TFloatField;
    sdsContab_ClienteCNAE_CODIGO: TStringField;
    sdsContab_ClienteCNAE_DESCRICAO: TStringField;
    sdsContab_ClienteNAT_JUR_CODIGO: TStringField;
    sdsContab_ClienteNAT_JUR_DESCRICAO: TStringField;
    sdsContab_ClienteINSCRICAO_ESTADUAL: TStringField;
    sdsContab_ClienteINSCRICAO_MUNICIPAL: TStringField;
    sdsContab_ClienteCONSTITUICAO: TStringField;
    sdsContab_ClienteCONSTITUICAO_DATA: TDateField;
    sdsContab_ClienteNIRE: TStringField;
    sdsContab_ClienteNIRE_DATA: TDateField;
    sdsContab_ClienteULT_ALTERACAO: TStringField;
    sdsContab_ClienteULT_ALTERACAO_DATA: TDateField;
    sdsContab_ClienteCAPITAL_SOCIAL: TFloatField;
    sdsContab_ClienteSOCIO_RESPONSAVEL_NOME: TStringField;
    sdsContab_ClienteSOCIO_RESPONSAVEL_CPF: TStringField;
    sdsContab_ClienteSOCIO_RESPONSAVEL_PARTIC: TIntegerField;
    sdsContab_ClienteSOCIO_RESPONSAVEL_NASC: TDateField;
    sdsContab_ClienteSOCIO_RESPONSAVEL_RG: TStringField;
    sdsContab_ClienteSOCIO_RESPONSAVEL_EXPED: TStringField;
    sdsContab_ClienteSOCIO_RESPONSAVEL_TITULO: TStringField;
    sdsContab_ClienteSOCIO_RESPONSAVEL_ZONA: TStringField;
    sdsContab_ClienteSOCIO_RESPONSAVEL_SECAO: TStringField;
    sdsContab_ClienteSOCIO_RESPONSAVEL_IR_ATUAL: TStringField;
    sdsContab_ClienteSOCIO_RESPONSAVEL_IR_ANTERIOR: TStringField;
    sdsContab_ClienteSOCIO_1_NOME: TStringField;
    sdsContab_ClienteSOCIO_1_CPF: TStringField;
    sdsContab_ClienteSOCIO_1_PARTIC: TIntegerField;
    sdsContab_ClienteSOCIO_2_NOME: TStringField;
    sdsContab_ClienteSOCIO_2_CPF: TStringField;
    sdsContab_ClienteSOCIO_2_PARTIC: TIntegerField;
    sdsContab_ClienteSOCIO_3_NOME: TStringField;
    sdsContab_ClienteSOCIO_3_CPF: TStringField;
    sdsContab_ClienteSOCIO_3_PARTIC: TIntegerField;
    sdsContab_ClienteENQUADRAMENTO_FISCAL: TIntegerField;
    sdsContab_ClienteTRIBUTACAO: TIntegerField;
    sdsContab_ClientePARCELAMENTO_FEDERAL: TMemoField;
    sdsContab_ClientePARCELAMENTO_ESTADUAL: TMemoField;
    sdsContab_ClientePARCELAMENTO_MUNICIPAL: TMemoField;
    sdsContab_ClientePARCELAMENTO_PREVIDENCIARIO: TMemoField;
    sdsContab_ClientePARCELAMENTO_FGTS: TMemoField;
    sdsContab_ClientePARCELAMENTO_OUTROS: TMemoField;
    sdsContab_ClienteANOTACOES: TMemoField;
    cdsContab_ClienteID_CONTAB_CLIENTE: TIntegerField;
    cdsContab_ClienteID_PESSOA: TIntegerField;
    cdsContab_ClienteSTATUS: TIntegerField;
    cdsContab_ClienteDATA_CADASTRO: TDateField;
    cdsContab_ClienteDATA_INATIVIDADE: TDateField;
    cdsContab_ClienteDIA_PAGAMENTO: TIntegerField;
    cdsContab_ClienteVALOR_HONORARIO: TFloatField;
    cdsContab_ClienteCNAE_CODIGO: TStringField;
    cdsContab_ClienteCNAE_DESCRICAO: TStringField;
    cdsContab_ClienteNAT_JUR_CODIGO: TStringField;
    cdsContab_ClienteNAT_JUR_DESCRICAO: TStringField;
    cdsContab_ClienteINSCRICAO_ESTADUAL: TStringField;
    cdsContab_ClienteINSCRICAO_MUNICIPAL: TStringField;
    cdsContab_ClienteCONSTITUICAO: TStringField;
    cdsContab_ClienteCONSTITUICAO_DATA: TDateField;
    cdsContab_ClienteNIRE: TStringField;
    cdsContab_ClienteNIRE_DATA: TDateField;
    cdsContab_ClienteULT_ALTERACAO: TStringField;
    cdsContab_ClienteULT_ALTERACAO_DATA: TDateField;
    cdsContab_ClienteCAPITAL_SOCIAL: TFloatField;
    cdsContab_ClienteSOCIO_RESPONSAVEL_NOME: TStringField;
    cdsContab_ClienteSOCIO_RESPONSAVEL_CPF: TStringField;
    cdsContab_ClienteSOCIO_RESPONSAVEL_PARTIC: TIntegerField;
    cdsContab_ClienteSOCIO_RESPONSAVEL_NASC: TDateField;
    cdsContab_ClienteSOCIO_RESPONSAVEL_RG: TStringField;
    cdsContab_ClienteSOCIO_RESPONSAVEL_EXPED: TStringField;
    cdsContab_ClienteSOCIO_RESPONSAVEL_TITULO: TStringField;
    cdsContab_ClienteSOCIO_RESPONSAVEL_ZONA: TStringField;
    cdsContab_ClienteSOCIO_RESPONSAVEL_SECAO: TStringField;
    cdsContab_ClienteSOCIO_RESPONSAVEL_IR_ATUAL: TStringField;
    cdsContab_ClienteSOCIO_RESPONSAVEL_IR_ANTERIOR: TStringField;
    cdsContab_ClienteSOCIO_1_NOME: TStringField;
    cdsContab_ClienteSOCIO_1_CPF: TStringField;
    cdsContab_ClienteSOCIO_1_PARTIC: TIntegerField;
    cdsContab_ClienteSOCIO_2_NOME: TStringField;
    cdsContab_ClienteSOCIO_2_CPF: TStringField;
    cdsContab_ClienteSOCIO_2_PARTIC: TIntegerField;
    cdsContab_ClienteSOCIO_3_NOME: TStringField;
    cdsContab_ClienteSOCIO_3_CPF: TStringField;
    cdsContab_ClienteSOCIO_3_PARTIC: TIntegerField;
    cdsContab_ClienteENQUADRAMENTO_FISCAL: TIntegerField;
    cdsContab_ClienteTRIBUTACAO: TIntegerField;
    cdsContab_ClientePARCELAMENTO_FEDERAL: TMemoField;
    cdsContab_ClientePARCELAMENTO_ESTADUAL: TMemoField;
    cdsContab_ClientePARCELAMENTO_MUNICIPAL: TMemoField;
    cdsContab_ClientePARCELAMENTO_PREVIDENCIARIO: TMemoField;
    cdsContab_ClientePARCELAMENTO_FGTS: TMemoField;
    cdsContab_ClientePARCELAMENTO_OUTROS: TMemoField;
    cdsContab_ClienteANOTACOES: TMemoField;
    dsContab_Cliente: TDataSource;
    dsLigacaoCliente: TDataSource;
    cdsStatus: TClientDataSet;
    cdsStatusCODIGO: TIntegerField;
    cdsStatusDESCRICAO: TStringField;
    dsStatus: TDataSource;
    sdsEnqFiscal: TSimpleDataSet;
    sdsEnqFiscalOID_ENQUAD_FISCAL: TIntegerField;
    sdsEnqFiscalDESCRICAO: TStringField;
    dsEnqFiscal: TDataSource;
    sdsTributacao: TSimpleDataSet;
    sdsTributacaoOID_CONTAB_TRIBUTACAO: TIntegerField;
    sdsTributacaoDESCRICAO: TStringField;
    dsTributacao: TDataSource;
    sdsContab_Cliente_Acesso: TSQLDataSet;
    cdsContab_ClientesdsContab_Cliente_Acesso: TDataSetField;
    cdsContab_Cliente_Acesso: TClientDataSet;
    dsContab_Cliente_Acesso: TDataSource;
    sdsContab_Cliente_AcessoID_CONTAB_CLIENTE_ACESSO: TIntegerField;
    sdsContab_Cliente_AcessoID_CONTAB_CLIENTE: TIntegerField;
    sdsContab_Cliente_AcessoTIPO_ACESSO: TIntegerField;
    sdsContab_Cliente_AcessoDESCRICAO: TStringField;
    sdsContab_Cliente_AcessoLOGIN: TStringField;
    sdsContab_Cliente_AcessoSENHA: TStringField;
    sdsContab_Cliente_AcessoPUK: TStringField;
    sdsContab_Cliente_AcessoVALIDADE: TDateField;
    sdsContab_Cliente_AcessoOBS: TMemoField;
    cdsContab_Cliente_AcessoID_CONTAB_CLIENTE_ACESSO: TIntegerField;
    cdsContab_Cliente_AcessoID_CONTAB_CLIENTE: TIntegerField;
    cdsContab_Cliente_AcessoTIPO_ACESSO: TIntegerField;
    cdsContab_Cliente_AcessoDESCRICAO: TStringField;
    cdsContab_Cliente_AcessoLOGIN: TStringField;
    cdsContab_Cliente_AcessoSENHA: TStringField;
    cdsContab_Cliente_AcessoPUK: TStringField;
    cdsContab_Cliente_AcessoVALIDADE: TDateField;
    cdsContab_Cliente_AcessoOBS: TMemoField;
    sdsTipoAcesso: TSimpleDataSet;
    sdsTipoAcessoOID_CONTAB_TIPO_ACESSO: TIntegerField;
    sdsTipoAcessoDESCRICAO: TStringField;
    sdsTipoAcessoLINK: TMemoField;
    dsTipoAcesso: TDataSource;
    sdsContab_Cliente_Reajuste: TSQLDataSet;
    cdsContab_ClientesdsContab_Cliente_Reajuste: TDataSetField;
    cdsContab_Cliente_Reajuste: TClientDataSet;
    sdsContab_Cliente_ReajusteID_CONTAB_CLIENTE_REAJUSTE: TIntegerField;
    sdsContab_Cliente_ReajusteID_CONTAB_CLIENTE: TIntegerField;
    cdsContab_Cliente_ReajusteID_CONTAB_CLIENTE_REAJUSTE: TIntegerField;
    f: TIntegerField;
    dsContab_Cliente_Reajuste: TDataSource;
    sdsContab_Cliente_ReajusteDATA: TSQLTimeStampField;
    sdsContab_Cliente_ReajusteVALOR_HONORARIO: TFloatField;
    cdsContab_Cliente_ReajusteDATA: TSQLTimeStampField;
    cdsContab_Cliente_ReajusteVALOR_HONORARIO: TFloatField;
    sdsContab_ClienteSIGILOSA_ANOTACAO: TMemoField;
    sdsContab_ClienteSIGILOSA_DATA_HORA: TSQLTimeStampField;
    cdsContab_ClienteSIGILOSA_ANOTACAO: TMemoField;
    sdsContab_ClienteSIGILOSA_MOSTAR_MENSAGEM: TIntegerField;
    cdsContab_ClienteSIGILOSA_DATA_HORA: TSQLTimeStampField;
    cdsContab_ClienteSIGILOSA_MOSTAR_MENSAGEM: TIntegerField;
    procedure cdsContab_ClienteAfterInsert(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure cdsContab_Cliente_AcessoAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  protected
    procedure BeforeSaveRecord; override;
    procedure AfterInsertRecord; override;
    procedure AfterSaveRecord; override;
    function CategoriaCadastro: string; override;
  public
    { Public declarations }
  end;

//var
//  dmCadCliente: TdmCadCliente;

implementation

uses
  controlecontabil.dados;

{$R *.dfm}

{ TdmCadCliente }

procedure TdmCadCliente.AfterInsertRecord;
begin
  inherited;
  if cdsContab_Cliente.IsEmpty then
  begin
    cdsContab_Cliente.Append;
    cdsContab_Cliente.Post;
  end;
end;

procedure TdmCadCliente.AfterSaveRecord;
begin
  inherited AfterSaveRecord;
  cdsBase_Pessoa.Refresh;
end;

procedure TdmCadCliente.BeforeSaveRecord;
begin
  inherited;
  if cdsContab_Cliente.IsEmpty then
  begin
    cdsContab_Cliente.Append;
    cdsContab_Cliente.Post;
  end;
end;

function TdmCadCliente.CategoriaCadastro: string;
begin
  Result := 'Contatos';
end;

procedure TdmCadCliente.cdsContab_ClienteAfterInsert(DataSet: TDataSet);
begin
  inherited;
  cdsContab_ClienteID_CONTAB_CLIENTE.AsInteger := GenTableID('CONTAB_CLIENTE');
  cdsContab_ClienteID_PESSOA.AsInteger         := cdsBase_PessoaID_PESSOA.AsInteger;
  cdsContab_ClienteSTATUS.AsInteger            := 1;
  cdsContab_ClienteDATA_CADASTRO.AsDateTime    := Now;
  cdsContab_ClienteDIA_PAGAMENTO.AsInteger     := 1;
end;

procedure TdmCadCliente.cdsContab_Cliente_AcessoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  cdsContab_Cliente_AcessoID_CONTAB_CLIENTE_ACESSO.AsInteger := GenTableID('CONTAB_CLIENTE_ACESSO');
  cdsContab_Cliente_AcessoID_CONTAB_CLIENTE.AsInteger        := cdsContab_ClienteID_CONTAB_CLIENTE.AsInteger;
  cdsContab_Cliente_AcessoTIPO_ACESSO.AsInteger              := 1;
end;

procedure TdmCadCliente.DataModuleCreate(Sender: TObject);

  procedure InserirStatus(ACodigo: Integer; ADescricao: string);
  begin
    cdsStatus.Append;
    cdsStatusCODIGO.AsInteger   := ACodigo;
    cdsStatusDESCRICAO.AsString := ADescricao;
    cdsStatus.Post;
  end;

begin
  inherited;
  cdsStatus.CreateDataSet;
  InserirStatus(1, 'Ativo');
  InserirStatus(2, 'Inativo');
  InserirStatus(3, 'Fornecedor');
  InserirStatus(4, 'Prospect');

  sdsEnqFiscal.Open;
  sdsTributacao.Open;
  sdsTipoAcesso.Open;
end;

procedure TdmCadCliente.DataModuleDestroy(Sender: TObject);
begin
  inherited;
  cdsStatus.Close;
  sdsEnqFiscal.Close;
  sdsTributacao.Close;
  sdsTipoAcesso.Close;
end;

end.
