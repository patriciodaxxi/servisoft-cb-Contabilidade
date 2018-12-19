inherited frmRelProtocolo: TfrmRelProtocolo
  Caption = 'frmRelProtocolo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited RLReport: TRLReport
    DataSource = dsDados
    inherited Cabecalho: TRLBand
      inherited lbTitulo: TRLLabel
        Left = 209
        Width = 308
        Height = 16
        Caption = 'P R O T O C O L O     D E     D O C U M E N T O S'
        Font.Height = -13
        ExplicitLeft = 209
        ExplicitWidth = 308
        ExplicitHeight = 16
      end
      object lbTitNumero: TRLLabel [2]
        Left = 542
        Top = 18
        Width = 53
        Height = 16
        Alignment = taRightJustify
        Caption = 'N'#250'mero:'
      end
      object lbNumero: TRLLabel [3]
        Left = 601
        Top = 18
        Width = 66
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    inherited Rodape: TRLBand
      Top = 292
      ExplicitTop = 292
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 137
      Width = 718
      Height = 155
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = False
      Borders.DrawRight = True
      Borders.DrawBottom = True
      DataFields = 'ID_CONTAB_PROTOCOLO'
      IntegralHeight = True
      object RLBand1: TRLBand
        Left = 1
        Top = 0
        Width = 716
        Height = 35
        AutoSize = True
        BandType = btColumnHeader
        object RLDBText1: TRLDBText
          Left = 3
          Top = 5
          Width = 43
          Height = 14
          DataField = 'CLIENTE'
          DataSource = dsDados
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText3: TRLDBText
          Left = 9
          Top = 21
          Width = 255
          Height = 14
          AutoSize = False
          DataField = 'DESTINATARIO'
          DataSource = dsDados
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBMemo1: TRLDBMemo
          Left = 270
          Top = 21
          Width = 441
          Height = 14
          Behavior = [beSiteExpander]
          DataField = 'OBSERVACOES'
          DataSource = dsDados
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
      object RLBand2: TRLBand
        Left = 1
        Top = 50
        Width = 716
        Height = 79
        BandType = btColumnFooter
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object RLLabel2: TRLLabel
          Left = 3
          Top = 38
          Width = 238
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = True
          Borders.DrawRight = False
          Borders.DrawBottom = False
          Caption = 'Entregue'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel3: TRLLabel
          Left = 247
          Top = 38
          Width = 238
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = True
          Borders.DrawRight = False
          Borders.DrawBottom = False
          Caption = 'Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel4: TRLLabel
          Left = 490
          Top = 38
          Width = 221
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = True
          Borders.DrawRight = False
          Borders.DrawBottom = False
          Caption = 'Local e data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object lbEntregador: TRLLabel
          Left = 9
          Top = 62
          Width = 64
          Height = 14
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Pitch = fpFixed
          Font.Style = []
          ParentFont = False
        end
      end
      object RLBand3: TRLBand
        Left = 1
        Top = 35
        Width = 716
        Height = 15
        AutoSize = True
        Completion = ctFullPage
        object RLDBMemo3: TRLDBMemo
          Left = 294
          Top = 1
          Width = 417
          Height = 14
          Behavior = [beSiteExpander]
          DataField = 'ITEM_OBSERVACOES'
          DataSource = dsDados
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          IntegralHeight = True
          ParentFont = False
        end
        object RLLabel5: TRLLabel
          Left = 223
          Top = 1
          Width = 72
          Height = 14
          Caption = 'Observa'#231#227'o.: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText4: TRLDBText
          Left = 3
          Top = 1
          Width = 214
          Height = 14
          AutoSize = False
          DataField = 'ITEM_DESCRICAO'
          DataSource = dsDados
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
    end
  end
  object sdsDados: TSimpleDataSet
    Active = True
    Aggregates = <>
    Connection = dmDados.soConexao
    DataSet.CommandText = 
      'SELECT PR.*'#13#10'     , IL.DESCRICAO AS ITEM_DESCRICAO'#13#10'     , PI.OB' +
      'SERVACAO AS ITEM_OBSERVACOES'#13#10'  FROM CONTAB_PROTOCOLO PR'#13#10'    IN' +
      'NER JOIN CONTAB_PROTOCOLO_ITENS PI ON PI.ID_PROTOCOLO = PR.ID_CO' +
      'NTAB_PROTOCOLO'#13#10'    INNER JOIN CONTAB_ITEM_LANCAMENTO IL ON IL.I' +
      'D_CONTAB_ITEM_LANCAMENTO = PI.ID_ITEM_LANCAMENTO'#13#10' WHERE PR.ID_C' +
      'ONTAB_PROTOCOLO = :ID_CONTAB_PROTOCOLO'
    DataSet.MaxBlobSize = 1
    DataSet.Params = <
      item
        DataType = ftInteger
        Name = 'ID_CONTAB_PROTOCOLO'
        ParamType = ptInput
        Value = 10
      end>
    Params = <>
    Left = 232
    Top = 352
    object sdsDadosID_CONTAB_PROTOCOLO: TIntegerField
      FieldName = 'ID_CONTAB_PROTOCOLO'
      Required = True
    end
    object sdsDadosID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object sdsDadosCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Required = True
      Size = 100
    end
    object sdsDadosDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
    object sdsDadosID_ENTREGADOR: TIntegerField
      FieldName = 'ID_ENTREGADOR'
    end
    object sdsDadosENTREGADOR: TStringField
      FieldName = 'ENTREGADOR'
      Required = True
      Size = 100
    end
    object sdsDadosTIPO_PROTOCOLO: TStringField
      FieldName = 'TIPO_PROTOCOLO'
      Required = True
      Size = 1
    end
    object sdsDadosDESTINATARIO: TStringField
      FieldName = 'DESTINATARIO'
      Size = 100
    end
    object sdsDadosOBSERVACOES: TMemoField
      FieldName = 'OBSERVACOES'
      BlobType = ftMemo
      Size = 1
    end
    object sdsDadosITEM_DESCRICAO: TStringField
      FieldName = 'ITEM_DESCRICAO'
      Required = True
      Size = 65
    end
    object sdsDadosITEM_OBSERVACOES: TMemoField
      FieldName = 'ITEM_OBSERVACOES'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dsDados: TDataSource
    DataSet = sdsDados
    Left = 232
    Top = 400
  end
end
