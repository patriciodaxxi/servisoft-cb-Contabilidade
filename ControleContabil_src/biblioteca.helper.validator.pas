unit biblioteca.helper.validator;

interface

uses
  Windows, Classes, SysUtils, JvValidators;

type
  TValidatorHelper = class helper for TJvValidators
  public
    function Validar: boolean; overload;
    function Validar(AGrupo: string): boolean; overload;
  end;

implementation

uses
  biblioteca.helper.validator.tela;

{ TValidatorHelper }

function TValidatorHelper.Validar(AGrupo: string): boolean;
var
  Summary: TJvValidationSummary;
begin
  Summary := TJvValidationSummary.Create(nil);
  try
    Self.ValidationSummary := Summary;
    Result := Self.Validate(AGrupo);

    if not Result then
      TfrmHelperValidatorTela.ExibirErros(Summary.Summaries);

  finally
    FreeAndNil(Summary);
  end;
end;

function TValidatorHelper.Validar: boolean;
var
  Summary: TJvValidationSummary;
begin
  Summary := TJvValidationSummary.Create(nil);
  try
    Self.ValidationSummary := Summary;
    Result := Self.Validate;

    if not Result then
      TfrmHelperValidatorTela.ExibirErros(Summary.Summaries);

  finally
    FreeAndNil(Summary);
  end;
end;

end.
