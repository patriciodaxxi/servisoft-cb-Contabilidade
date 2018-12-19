unit datamodule.agenda.pessoal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, datamodule.agenda.base, FMTBcd, SimpleDS, DB, DBClient, Provider,
  SqlExpr;

type
  TdmAgendaPessoal = class(TdmAgendaBase)
  private
    { Private declarations }
  protected
    function FiltroCompromisso: string; override;
    function FiltroRecados: string; override;
  public
    { Public declarations }
  end;

var
  dmAgendaPessoal: TdmAgendaPessoal;

implementation

uses
  controlecontabil.dados;

{$R *.dfm}

{ TdmAgendaPessoal }

function TdmAgendaPessoal.FiltroCompromisso: string;
begin
  Result := 'WHERE CM.STATUS <> 2 ' + sLineBreak +
            '  AND EXISTS ( SELECT * FROM CONTAB_COMP_PESSOAS CP ' + sLineBreak +
            '                WHERE CP.ID_CONTAB_COMPROMISSOS = CM.ID_CONTAB_COMPROMISSO ' + sLineBreak +
            '                  AND CP.ID_PESSOA = ' + IntToStr(dmDados.CodigoUsuario) + ' ) ';
end;

function TdmAgendaPessoal.FiltroRecados: string;
begin
  Result := 'AND RE.PARA = ' + IntToStr(dmDados.CodigoUsuario);
end;

end.
