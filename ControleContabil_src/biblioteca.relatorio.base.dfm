inherited frmRelBase: TfrmRelBase
  Caption = 'Relat'#243'rio'
  ClientHeight = 456
  ClientWidth = 775
  ExplicitWidth = 791
  ExplicitHeight = 494
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport: TRLReport [0]
    Left = 8
    Top = 8
    Width = 794
    Height = 1123
    DataSource = dmDados.dsEscritorio
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object Cabecalho: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 99
      BandType = btHeader
      Borders.Sides = sdAll
      object lbTitulo: TRLLabel
        Left = 232
        Top = 40
        Width = 80
        Height = 19
        Caption = '[ TITULO ]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbEmissao: TRLLabel
        Left = 536
        Top = 40
        Width = 59
        Height = 16
        Alignment = taRightJustify
        Anchors = [fkTop, fkRight]
        Caption = 'Emiss'#227'o:'
      end
      object lbData: TRLSystemInfo
        Left = 601
        Top = 40
        Width = 41
        Height = 16
        Anchors = [fkTop, fkRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbTitEmissor: TRLLabel
        Left = 539
        Top = 62
        Width = 56
        Height = 16
        Alignment = taRightJustify
        Anchors = [fkTop, fkRight]
        Caption = 'Emissor:'
      end
      object imgLogotipo: TRLImage
        Left = 4
        Top = 4
        Width = 197
        Height = 91
        Center = True
        Scaled = True
        BeforePrint = imgLogotipoBeforePrint
      end
      object lbEmissor: TRLLabel
        Left = 601
        Top = 62
        Width = 111
        Height = 16
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BeforePrint = lbEmissorBeforePrint
      end
    end
    object Rodape: TRLBand
      Left = 38
      Top = 177
      Width = 718
      Height = 52
      BandType = btFooter
      Borders.Sides = sdAll
      object lbEscritorio: TRLDBText
        Left = 4
        Top = 6
        Width = 88
        Height = 14
        DataField = 'RAZAO_SOCIAL'
        DataSource = dmDados.dsEscritorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbDocumento: TRLDBText
        Left = 35
        Top = 31
        Width = 67
        Height = 14
        DataField = 'DOCUMENTO'
        DataSource = dmDados.dsEscritorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lbEndereco: TRLDBText
        Left = 4
        Top = 18
        Width = 261
        Height = 14
        AutoSize = False
        DataField = 'ENDERECO'
        DataSource = dmDados.dsEscritorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lbTitDocumento: TRLLabel
        Left = 4
        Top = 31
        Width = 32
        Height = 14
        Caption = 'CNPJ-'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lbCidade: TRLDBText
        Left = 288
        Top = 18
        Width = 95
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'CIDADE'
        DataSource = dmDados.dsEscritorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lbEstado: TRLDBText
        Left = 394
        Top = 18
        Width = 16
        Height = 14
        DataField = 'UF'
        DataSource = dmDados.dsEscritorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lbSepCid: TRLLabel
        Left = 382
        Top = 18
        Width = 13
        Height = 14
        Caption = ' - '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lbTitCep: TRLLabel
        Left = 472
        Top = 18
        Width = 26
        Height = 14
        Caption = 'CEP-'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lbCep: TRLDBText
        Left = 497
        Top = 18
        Width = 22
        Height = 14
        DataField = 'CEP'
        DataSource = dmDados.dsEscritorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lbTitFone: TRLLabel
        Left = 601
        Top = 18
        Width = 33
        Height = 14
        Caption = 'Fone: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lbFone: TRLDBText
        Left = 633
        Top = 18
        Width = 79
        Height = 14
        AutoSize = False
        DataField = 'TELEFONE'
        DataSource = dmDados.dsEscritorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lbTitEmail: TRLLabel
        Left = 263
        Top = 31
        Width = 37
        Height = 14
        Caption = 'e-mail: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lbEmail: TRLDBText
        Left = 299
        Top = 31
        Width = 199
        Height = 14
        AutoSize = False
        DataField = 'EMAIL'
        DataSource = dmDados.dsEscritorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lbSite: TRLDBText
        Left = 512
        Top = 31
        Width = 200
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'SITE'
        DataSource = dmDados.dsEscritorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsUnderline]
        ParentFont = False
      end
    end
  end
  inherited FormLink: TJvEmbeddedFormLink
    Top = 352
  end
  inherited Validador: TJvValidators
    Left = 104
    Top = 352
  end
  object RLPDFFilter: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport (Open Source) v3.71B \251 Copyright '#169' 1999-2009 For' +
      'tes Inform'#225'tica'
    FileName = 'relatorio.pdf'
    DisplayName = 'Documento PDF'
    Left = 160
    Top = 352
  end
end
