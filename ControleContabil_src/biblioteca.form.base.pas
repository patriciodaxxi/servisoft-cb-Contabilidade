unit biblioteca.form.base;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvComponentBase, JvEmbeddedForms, JvValidators, JvErrorIndicator;

type
  TfrmBase = class(TForm)
    FormLink: TJvEmbeddedFormLink;
    Validador: TJvValidators;
  private
    { Private declarations }
  protected
    procedure AdicionarValidacao(AName: string; AControl: TControl; AMensagem: string);
  public
    { Public declarations }
  end;

var
  frmBase: TfrmBase;

implementation

uses
  controlecontabil.dados, biblioteca.datamodule.base;

{$R *.dfm}

{ TfrmBase }

procedure TfrmBase.AdicionarValidacao(AName: string; AControl: TControl;
  AMensagem: string);
var
  val: TFieldValidator;
begin
  inherited;
  val := TFieldValidator.Create(Validador);
  val.Name := AName;
  val.ControlToValidate := AControl;
  val.ErrorControl := AControl;
  val.ErrorMessage := AMensagem;

  validador.Insert(val);
end;

end.
