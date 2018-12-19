unit biblioteca.helper.validator.tela;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, JvExStdCtrls, JvTextListBox, dxGDIPlusClasses;

type
  TfrmHelperValidatorTela = class(TForm)
    lblMensagem: TLabel;
    imgErro: TImage;
    lbErros: TJvTextListBox;
    btnOK: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure ExibirErros(ALista: TStrings);
  end;

implementation

{$R *.dfm}

{ TfrmHelperValidatorTela }

class procedure TfrmHelperValidatorTela.ExibirErros(ALista: TStrings);
var
  Tela: TfrmHelperValidatorTela;
begin
  Tela := TfrmHelperValidatorTela.Create(nil);
  try
    Tela.lbErros.Items.AddStrings(ALista);
    Tela.ShowModal;
  finally
    FreeAndNil(Tela);
  end;
end;

end.
