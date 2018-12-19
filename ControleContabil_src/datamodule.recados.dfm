inherited dmRecados: TdmRecados
  OnDestroy = DataModuleDestroy
  object sdsContab_Recado: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 'SELECT * FROM CONTAB_RECADO WHERE 1=0'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = 1
    Params = <>
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
      Size = 100
    end
    object sdsContab_RecadoPARA: TIntegerField
      FieldName = 'PARA'
    end
    object sdsContab_RecadoASSUNTO: TMemoField
      FieldName = 'ASSUNTO'
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
  end
  object dspContab_Recado: TDataSetProvider
    DataSet = sdsContab_Recado
    UpdateMode = upWhereKeyOnly
    Left = 48
    Top = 64
  end
  object cdsContab_Recado: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContab_Recado'
    AfterInsert = cdsContab_RecadoAfterInsert
    Left = 48
    Top = 112
    object cdsContab_RecadoID_CONTAB_RECADO: TIntegerField
      FieldName = 'ID_CONTAB_RECADO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsContab_RecadoDE: TStringField
      FieldName = 'DE'
      Size = 100
    end
    object cdsContab_RecadoPARA: TIntegerField
      FieldName = 'PARA'
    end
    object cdsContab_RecadoASSUNTO: TMemoField
      FieldName = 'ASSUNTO'
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
  end
  object dsContab_Recado: TDataSource
    DataSet = cdsContab_Recado
    Left = 48
    Top = 160
  end
  object sdsFuncionario: TSimpleDataSet
    Aggregates = <>
    Connection = dmDados.soConexao
    DataSet.CommandText = 
      'SELECT P.CODIGO, P.RAZAO_SOCIAL, F.* '#13#10'FROM CONTAB_FUNCIONARIO F' +
      #13#10'  INNER JOIN BASE_PESSOA P ON P.ID_PESSOA = F.ID_PESSOA'#13#10'WHERE' +
      ' F.ATIVO = 1'#13#10'ORDER BY P.RAZAO_SOCIAL'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 160
    Top = 16
    object sdsFuncionarioCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object sdsFuncionarioRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Required = True
      Size = 65
    end
    object sdsFuncionarioID_CONTAB_FUNCIONARIO: TIntegerField
      FieldName = 'ID_CONTAB_FUNCIONARIO'
      Required = True
    end
    object sdsFuncionarioID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      Required = True
    end
    object sdsFuncionarioLOGIN: TStringField
      FieldName = 'LOGIN'
      Required = True
    end
    object sdsFuncionarioSENHA: TStringField
      FieldName = 'SENHA'
      Required = True
    end
    object sdsFuncionarioATIVO: TIntegerField
      FieldName = 'ATIVO'
      Required = True
    end
  end
  object dsFuncionario: TDataSource
    DataSet = sdsFuncionario
    Left = 160
    Top = 64
  end
end
