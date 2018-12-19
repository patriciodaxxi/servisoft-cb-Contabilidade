unit datamodule.lancamento.item;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, biblioteca.datamodule.cadastro, FMTBcd, DB, SqlExpr, Provider,
  DBClient;

type
  TdmLancamentoItem = class(TdmCadBase)
    sdsContab_Item_Lancamento: TSQLDataSet;
    sdsContab_Item_LancamentoID_CONTAB_ITEM_LANCAMENTO: TIntegerField;
    sdsContab_Item_LancamentoCODIGO: TIntegerField;
    sdsContab_Item_LancamentoDESCRICAO: TStringField;
    dspContab_Item_Lancamento: TDataSetProvider;
    cdsContab_Item_Lancamento: TClientDataSet;
    cdsContab_Item_LancamentoID_CONTAB_ITEM_LANCAMENTO: TIntegerField;
    cdsContab_Item_LancamentoCODIGO: TIntegerField;
    cdsContab_Item_LancamentoDESCRICAO: TStringField;
    dsContab_Item_Lancamento: TDataSource;
    sdsContab_Item_LancamentoVALOR: TSingleField;
    cdsContab_Item_LancamentoVALOR: TSingleField;
    procedure cdsContab_Item_LancamentoAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  protected
    procedure GetMainDataSource(var DataSource: TDataSource); override;
  public
    { Public declarations }
  end;

var
  dmLancamentoItem: TdmLancamentoItem;

implementation

uses
  controlecontabil.dados;

{$R *.dfm}

{ TdmLancamentoItem }

procedure TdmLancamentoItem.cdsContab_Item_LancamentoAfterInsert(
  DataSet: TDataSet);
const
  cProximoCodigo = 'SELECT COALESCE(MAX(CODIGO), 0) + 1 NOVO_CODIGO FROM (%s)';
var
  oCds: TClientDataSet;
begin
  inherited;
  oCds := NewClientDataSet( Format(cProximoCodigo, [Self.MainOriginalCommandText]) );
  try
    cdsContab_Item_LancamentoCODIGO.AsInteger := oCds.FieldByName('NOVO_CODIGO').AsInteger;
  finally
    FreeAndNil(oCds);
  end;
end;

procedure TdmLancamentoItem.GetMainDataSource(var DataSource: TDataSource);
begin
  inherited;
  DataSource := dsContab_Item_Lancamento;
end;

end.
