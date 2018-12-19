inherited dmIndicadores: TdmIndicadores
  OnDestroy = DataModuleDestroy
  Height = 286
  object sdsContab_Recado: TSQLDataSet
    SchemaName = 'sysdba'
    BeforeOpen = sdsContab_RecadoBeforeOpen
    CommandText = 
      'SELECT R.*'#13#10'           , P. RAZAO_SOCIAL'#13#10'  FROM CONTAB_RECADO R' +
      #13#10'    INNER JOIN BASE_PESSOA P ON P.ID_PESSOA = R.PARA'#13#10'WHERE P.' +
      'ID_PESSOA = :ID_PESSOA'#13#10'     AND R.EXIBIR_ALERTA = 1'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID_PESSOA'
        ParamType = ptInput
      end>
    SQLConnection = dmDados.soConexao
    Left = 48
    Top = 16
    object sdsContab_RecadoID_CONTAB_RECADO: TIntegerField
      FieldName = 'ID_CONTAB_RECADO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsContab_RecadoDE: TStringField
      FieldName = 'DE'
      Required = True
      Size = 100
    end
    object sdsContab_RecadoPARA: TIntegerField
      FieldName = 'PARA'
      Required = True
    end
    object sdsContab_RecadoASSUNTO: TMemoField
      FieldName = 'ASSUNTO'
      Required = True
      BlobType = ftMemo
      Size = 1
    end
    object sdsContab_RecadoDATA_ENVIO: TSQLTimeStampField
      FieldName = 'DATA_ENVIO'
      Required = True
    end
    object sdsContab_RecadoSTATUS: TIntegerField
      FieldName = 'STATUS'
      Required = True
    end
    object sdsContab_RecadoEXIBIR_ALERTA: TIntegerField
      FieldName = 'EXIBIR_ALERTA'
      Required = True
    end
    object sdsContab_RecadoRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      ProviderFlags = []
      Required = True
      Size = 65
    end
  end
  object dspContab_Recado: TDataSetProvider
    DataSet = sdsContab_Recado
    Left = 48
    Top = 64
  end
  object cdsContab_Recado: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContab_Recado'
    BeforeOpen = cdsContab_RecadoBeforeOpen
    Left = 48
    Top = 112
    object cdsContab_RecadoID_CONTAB_RECADO: TIntegerField
      FieldName = 'ID_CONTAB_RECADO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsContab_RecadoDE: TStringField
      FieldName = 'DE'
      Required = True
      Size = 100
    end
    object cdsContab_RecadoPARA: TIntegerField
      FieldName = 'PARA'
      Required = True
    end
    object cdsContab_RecadoASSUNTO: TMemoField
      FieldName = 'ASSUNTO'
      Required = True
      BlobType = ftMemo
      Size = 1
    end
    object cdsContab_RecadoDATA_ENVIO: TSQLTimeStampField
      FieldName = 'DATA_ENVIO'
      Required = True
    end
    object cdsContab_RecadoSTATUS: TIntegerField
      FieldName = 'STATUS'
      Required = True
    end
    object cdsContab_RecadoEXIBIR_ALERTA: TIntegerField
      FieldName = 'EXIBIR_ALERTA'
      Required = True
    end
    object cdsContab_RecadoRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      ProviderFlags = []
      Size = 65
    end
  end
  object dsContab_Recado: TDataSource
    DataSet = cdsContab_Recado
    Left = 48
    Top = 160
  end
  object sdsIndicadores: TSimpleDataSet
    Aggregates = <>
    Connection = dmDados.soConexao
    DataSet.CommandText = 
      'SELECT ( SELECT COUNT(PARA) AS TOTAL FROM CONTAB_RECADO WHERE ST' +
      'ATUS = 1) AS MAX_RECADOS'#13#10'           , ( SELECT COUNT(PARA) AS T' +
      'OTAL FROM CONTAB_RECADO WHERE PARA = :ID_PESSOA AND STATUS = 1 )' +
      ' AS TOT_RECADOS'#13#10'           , ( SELECT COUNT(*) FROM CONTAB_CLIE' +
      'NTE_ACESSO AC WHERE AC.VALIDADE IS NOT NULL ) AS MAX_VALIDADE'#13#10' ' +
      '          , ( SELECT COUNT(*) FROM CONTAB_CLIENTE_ACESSO AC INNE' +
      'R JOIN CONTAB_CLIENTE CL ON CL.ID_CONTAB_CLIENTE = AC.ID_CONTAB_' +
      'CLIENTE'#13#10'                WHERE AC.VALIDADE <= (CURRENT_DATE+30) ' +
      ') AS TOT_VALIDADE'#13#10'           , ( 30 ) AS DIAS_VALIDADE'#13#10'       ' +
      '    , ( SELECT COUNT(*) FROM CONTAB_COMPROMISSO WHERE STATUS = 1' +
      ' ) AS MAX_COMPROMISSO'#13#10'           , ( SELECT COUNT(*) FROM CONTA' +
      'B_COMPROMISSO CM INNER JOIN CONTAB_COMP_PESSOAS CP ON CP.ID_CONT' +
      'AB_COMPROMISSOS = CM.ID_CONTAB_COMPROMISSO'#13#10'               WHERE' +
      ' CP.ID_PESSOA = :ID_PESSOA AND CM.STATUS = 1 ) AS TOT_COMPROMISS' +
      'O'#13#10'FROM RDB$DATABASE'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftUnknown
        Name = 'ID_PESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ID_PESSOA'
        ParamType = ptInput
      end>
    Params = <>
    BeforeOpen = sdsIndicadoresBeforeOpen
    AfterOpen = sdsIndicadoresAfterOpen
    AfterClose = sdsIndicadoresAfterClose
    Left = 152
    Top = 16
    object sdsIndicadoresMAX_RECADOS: TIntegerField
      FieldName = 'MAX_RECADOS'
    end
    object sdsIndicadoresTOT_RECADOS: TIntegerField
      FieldName = 'TOT_RECADOS'
    end
    object sdsIndicadoresMAX_VALIDADE: TIntegerField
      FieldName = 'MAX_VALIDADE'
    end
    object sdsIndicadoresTOT_VALIDADE: TIntegerField
      FieldName = 'TOT_VALIDADE'
    end
    object sdsIndicadoresDIAS_VALIDADE: TIntegerField
      FieldName = 'DIAS_VALIDADE'
      Required = True
    end
    object sdsIndicadoresMAX_COMPROMISSO: TIntegerField
      FieldName = 'MAX_COMPROMISSO'
    end
    object sdsIndicadoresTOT_COMPROMISSO: TIntegerField
      FieldName = 'TOT_COMPROMISSO'
    end
  end
  object sdsAcessos: TSimpleDataSet
    Aggregates = <>
    Connection = dmDados.soConexao
    DataSet.CommandText = 
      'SELECT PE.CODIGO'#13#10'     , PE.RAZAO_SOCIAL'#13#10'     , AC.VALIDADE'#13#10'  ' +
      '   , TA.DESCRICAO AS ACESSO_TIPO'#13#10'     , AC.DESCRICAO AS ACESSO_' +
      'DESCRICAO'#13#10'  FROM CONTAB_CLIENTE_ACESSO AC'#13#10'   INNER JOIN CONTAB' +
      '_CLIENTE CL ON CL.ID_CONTAB_CLIENTE = AC.ID_CONTAB_CLIENTE'#13#10'   I' +
      'NNER JOIN BASE_PESSOA PE ON PE.ID_PESSOA = CL.ID_PESSOA'#13#10'   INNE' +
      'R JOIN CONTAB_TIPO_ACESSO TA ON TA.OID_CONTAB_TIPO_ACESSO = AC.T' +
      'IPO_ACESSO'#13#10' WHERE AC.VALIDADE <= (CURRENT_DATE+30)'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 240
    Top = 16
    object sdsAcessosCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
    end
    object sdsAcessosRAZAO_SOCIAL: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      DisplayWidth = 30
      FieldName = 'RAZAO_SOCIAL'
      Required = True
      Size = 65
    end
    object sdsAcessosVALIDADE: TDateField
      DisplayLabel = 'Validade'
      FieldName = 'VALIDADE'
    end
    object sdsAcessosACESSO_TIPO: TStringField
      DisplayLabel = 'Acesso Tipo'
      DisplayWidth = 20
      FieldName = 'ACESSO_TIPO'
      Required = True
      Size = 50
    end
    object sdsAcessosACESSO_DESCRICAO: TStringField
      DisplayLabel = 'Acesso Descri'#231#227'o'
      DisplayWidth = 20
      FieldName = 'ACESSO_DESCRICAO'
      Size = 50
    end
  end
  object dsAcessos: TDataSource
    DataSet = sdsAcessos
    Left = 240
    Top = 64
  end
end
