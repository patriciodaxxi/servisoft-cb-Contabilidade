program controlecontabil;

uses
  Forms,
  Windows,
  Consts,
  JvResources,
  controlecontabil.dados in 'controlecontabil.dados.pas' {dmDados: TDataModule},
  controlecontabil.principal in 'controlecontabil.principal.pas' {frmPrincipal},
  controlecontabil.indicadores in 'controlecontabil.indicadores.pas' {frmIndicadores},
  biblioteca.form.base in 'biblioteca.form.base.pas' {frmBase},
  biblioteca.datamodule.base in 'biblioteca.datamodule.base.pas' {dmBase: TDataModule},
  biblioteca.datamodule.cadastro in 'biblioteca.datamodule.cadastro.pas' {dmCadBase: TDataModule},
  biblioteca.form.cadastro in 'biblioteca.form.cadastro.pas' {frmCadBase},
  cadastro.pessoa.base in 'cadastro.pessoa.base.pas' {fmPessoaBase},
  datamodule.pessoa.base in 'datamodule.pessoa.base.pas' {dmPessoaBase: TDataModule},
  cadastro.pessoa.escritorio in 'cadastro.pessoa.escritorio.pas' {frmCadEscritorio},
  datamodule.pessoa.escritorio in 'datamodule.pessoa.escritorio.pas' {dmCadEscritorio: TDataModule},
  biblioteca.helper.validator in 'biblioteca.helper.validator.pas',
  biblioteca.helper.validator.tela in 'biblioteca.helper.validator.tela.pas' {frmHelperValidatorTela},
  datamodule.pessoa.funcionario in 'datamodule.pessoa.funcionario.pas' {dmCadFuncionario: TDataModule},
  cadastro.pessoa.funcionario in 'cadastro.pessoa.funcionario.pas' {frmCadFuncionario},
  datamodule.pessoa.cliente in 'datamodule.pessoa.cliente.pas' {dmCadCliente: TDataModule},
  cadastro.pessoa.cliente in 'cadastro.pessoa.cliente.pas' {frmCadCliente},
  datamodule.recados in 'datamodule.recados.pas' {dmRecados: TDataModule},
  controlecontabil.recados in 'controlecontabil.recados.pas' {frmRecado},
  datamodule.indicadores in 'datamodule.indicadores.pas' {dmIndicadores: TDataModule},
  controlecontabil.compromissos in 'controlecontabil.compromissos.pas' {frmCompromissos},
  datamodule.compromissos in 'datamodule.compromissos.pas' {dmCompromissos: TDataModule},
  controlecontabil.agenda.base in 'controlecontabil.agenda.base.pas' {frmAgendaBase},
  datamodule.agenda.base in 'datamodule.agenda.base.pas' {dmAgendaBase: TDataModule},
  datamodule.agenda.corporativa in 'datamodule.agenda.corporativa.pas' {dmAgendaCorporativa: TDataModule},
  controlecontabil.agenda.corporativa in 'controlecontabil.agenda.corporativa.pas' {frmAgendaCorporativa},
  datamodule.agenda.pessoal in 'datamodule.agenda.pessoal.pas' {dmAgendaPessoal: TDataModule},
  controlecontabil.agenda.pessoal in 'controlecontabil.agenda.pessoal.pas' {frmAgendaPessoal},
  controlecontabil.agenda.transferir in 'controlecontabil.agenda.transferir.pas' {frmTransferirCompromisso},
  cadastro.lancamento.protocolo in 'cadastro.lancamento.protocolo.pas' {frmLancamentoProtocolo},
  cadastro.permissao in 'cadastro.permissao.pas' {frmCadPermissoes},
  datamodule.permissao in 'datamodule.permissao.pas' {dmPermissao: TDataModule},
  datamodule.lancamento.item in 'datamodule.lancamento.item.pas' {dmLancamentoItem: TDataModule},
  cadastro.lancamento.item in 'cadastro.lancamento.item.pas' {frmLancamentoItem},
  datamodule.lancamento.protocolo in 'datamodule.lancamento.protocolo.pas' {dmLancamentoProtocolo: TDataModule},
  biblioteca.relatorio.base in 'biblioteca.relatorio.base.pas' {frmRelBase},
  relatorio.protocolo in 'relatorio.protocolo.pas' {frmRelProtocolo},
  cadastro.lancamento.buscapessoa in 'cadastro.lancamento.buscapessoa.pas' {frmBuscaPessoa},
  controlecontabil.indicadores.consultar in 'controlecontabil.indicadores.consultar.pas' {frmConsultarIndicadores};

{$R *.res}

procedure SetResourceString(xOldResourceString: PResStringRec; xValueChanged: PChar);
var
  POldProtect: DWORD;
begin
  VirtualProtect(xOldResourceString, SizeOf(xOldResourceString^), PAGE_EXECUTE_READWRITE, @POldProtect);
  xOldResourceString^.Identifier := Integer(xValueChanged);
  VirtualProtect(xOldResourceString, SizeOf(xOldResourceString^), POldProtect, @POldProtect);
end;

begin
  SetResourceString(@RsRegistrationCaption, 'Registro');
  SetResourceString(@RsHintLabel, 'Digite seu usuário e senha para entrar na aplicação');
  SetResourceString(@RsUserNameLabel, '&Usuário:');
  SetResourceString(@RsPasswordLabel, '&Senha:');
  SetResourceString(@RsUnlockCaption, 'Desbloquear a aplicação');
  SetResourceString(@RsUnlockHint, 'Digite sua senha para desbloquear a aplicação');

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Controle Contábil';
  Application.CreateForm(TdmDados, dmDados);
  dmDados.Logar;

  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmIndicadores, frmIndicadores);
  Application.Run;
end.
