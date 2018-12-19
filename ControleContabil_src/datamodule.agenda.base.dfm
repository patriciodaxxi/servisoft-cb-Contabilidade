inherited dmAgendaBase: TdmAgendaBase
  OnDestroy = DataModuleDestroy
  object sdsCompromissos: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'SELECT ID_CONTAB_COMPROMISSO'#13#10'     , ( SELECT PO_LISTA_PESSOAS F' +
      'ROM LISTA_PESSOAS_COMPROMISSO(CM.ID_CONTAB_COMPROMISSO) ) AS QUE' +
      'M'#13#10'     , CM.ASSUNTO'#13#10'     , CM.QUANDO'#13#10'     , CM.LOCAL'#13#10'     , ' +
      'CASE CM.STATUS'#13#10'         WHEN 1 THEN '#39'Pendente'#39#13#10'         WHEN 2' +
      ' THEN '#39'Fechado'#39#13#10'         WHEN 3 THEN '#39'Transferido'#39#13#10'       END ' +
      'AS STATUS'#13#10'  FROM CONTAB_COMPROMISSO CM'#13#10'/*{MCONDITION}*/'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = dmDados.soConexao
    Left = 56
    Top = 24
    object sdsCompromissosQUEM: TStringField
      FieldName = 'QUEM'
      Size = 4000
    end
    object sdsCompromissosASSUNTO: TMemoField
      FieldName = 'ASSUNTO'
      Required = True
      BlobType = ftMemo
      Size = 1
    end
    object sdsCompromissosQUANDO: TSQLTimeStampField
      FieldName = 'QUANDO'
      Required = True
    end
    object sdsCompromissosLOCAL: TMemoField
      FieldName = 'LOCAL'
      Required = True
      BlobType = ftMemo
      Size = 1
    end
    object sdsCompromissosSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 11
    end
    object sdsCompromissosID_CONTAB_COMPROMISSO: TIntegerField
      FieldName = 'ID_CONTAB_COMPROMISSO'
      Required = True
    end
  end
  object dspCompromissos: TDataSetProvider
    DataSet = sdsCompromissos
    Left = 56
    Top = 72
  end
  object cdsCompromissos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCompromissos'
    BeforeOpen = cdsCompromissosBeforeOpen
    Left = 56
    Top = 120
    object cdsCompromissosQUEM: TStringField
      FieldName = 'QUEM'
      Size = 4000
    end
    object cdsCompromissosASSUNTO: TMemoField
      FieldName = 'ASSUNTO'
      Required = True
      BlobType = ftMemo
      Size = 1
    end
    object cdsCompromissosQUANDO: TSQLTimeStampField
      FieldName = 'QUANDO'
      Required = True
    end
    object cdsCompromissosLOCAL: TMemoField
      FieldName = 'LOCAL'
      Required = True
      BlobType = ftMemo
      Size = 1
    end
    object cdsCompromissosSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 11
    end
    object cdsCompromissosID_CONTAB_COMPROMISSO: TIntegerField
      FieldName = 'ID_CONTAB_COMPROMISSO'
      Required = True
    end
  end
  object dsCompromissos: TDataSource
    DataSet = cdsCompromissos
    Left = 56
    Top = 168
  end
  object sdsRecados: TSimpleDataSet
    Aggregates = <>
    Connection = dmDados.soConexao
    DataSet.CommandText = 
      'SELECT RE.ID_CONTAB_RECADO'#13#10'     , RE.DE'#13#10'     , PE.RAZAO_SOCIAL' +
      ' AS PARA'#13#10'     , RE.DATA_ENVIO AS DATA'#13#10'     , RE.ASSUNTO'#13#10'     ' +
      ', CASE RE.STATUS'#13#10'         WHEN 1 THEN '#39'Pendente'#39#13#10'         WHEN' +
      ' 2 THEN '#39'Conclu'#237'do'#39#13#10'       END AS STATUS'#13#10'  FROM CONTAB_RECADO ' +
      'RE'#13#10'    INNER JOIN BASE_PESSOA PE ON PE.ID_PESSOA = RE.PARA'#13#10' WH' +
      'ERE RE.STATUS = 1 /*{MCONDITION}*/'
    DataSet.MaxBlobSize = 1
    DataSet.Params = <>
    Params = <>
    BeforeOpen = sdsRecadosBeforeOpen
    Left = 144
    Top = 24
    object sdsRecadosDE: TStringField
      FieldName = 'DE'
      Required = True
      Size = 100
    end
    object sdsRecadosPARA: TStringField
      FieldName = 'PARA'
      Required = True
      Size = 65
    end
    object sdsRecadosDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object sdsRecadosASSUNTO: TMemoField
      FieldName = 'ASSUNTO'
      Required = True
      BlobType = ftMemo
      Size = 1
    end
    object sdsRecadosSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 9
    end
    object sdsRecadosID_CONTAB_RECADO: TIntegerField
      FieldName = 'ID_CONTAB_RECADO'
      Required = True
    end
  end
  object dsRecados: TDataSource
    DataSet = sdsRecados
    Left = 144
    Top = 72
  end
end
