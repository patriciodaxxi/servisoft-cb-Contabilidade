inherited frmAgendaPessoal: TfrmAgendaPessoal
  Caption = 'Agenda Pessoal'
  PixelsPerInch = 96
  TextHeight = 13
  inherited GroupBar: TRzGroupBar
    AutoSize = True
    inherited grpAtividades: TRzGroup
      inherited pnlAtividades: TPanel
        ExplicitWidth = 866
        ExplicitHeight = 29
        inherited grdAtividades: TcxGrid
          ExplicitWidth = 858
          ExplicitHeight = 21
        end
      end
    end
  end
  inherited cxImageList: TcxImageList
    FormatVersion = 1
  end
end
