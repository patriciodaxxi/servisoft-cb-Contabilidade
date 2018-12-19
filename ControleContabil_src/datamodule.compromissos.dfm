inherited dmCompromissos: TdmCompromissos
  OnDestroy = DataModuleDestroy
  object sdsContab_Compromisso: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 'SELECT * FROM CONTAB_COMPROMISSO WHERE 1=0'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = dmDados.soConexao
    Left = 64
    Top = 16
    object sdsContab_CompromissoID_CONTAB_COMPROMISSO: TIntegerField
      FieldName = 'ID_CONTAB_COMPROMISSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsContab_CompromissoASSUNTO: TMemoField
      FieldName = 'ASSUNTO'
      Required = True
      BlobType = ftMemo
      Size = 1
    end
    object sdsContab_CompromissoLOCAL: TMemoField
      FieldName = 'LOCAL'
      Required = True
      BlobType = ftMemo
      Size = 1
    end
    object sdsContab_CompromissoQUANDO: TSQLTimeStampField
      FieldName = 'QUANDO'
      Required = True
    end
    object sdsContab_CompromissoSTATUS: TIntegerField
      FieldName = 'STATUS'
      Required = True
    end
    object sdsContab_CompromissoVISIBILIDADE: TIntegerField
      FieldName = 'VISIBILIDADE'
      Required = True
    end
  end
  object dspContab_Compromisso: TDataSetProvider
    DataSet = sdsContab_Compromisso
    Options = [poCascadeDeletes, poCascadeUpdates, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 64
    Top = 64
  end
  object cdsContab_Compromisso: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContab_Compromisso'
    AfterInsert = cdsContab_CompromissoAfterInsert
    Left = 64
    Top = 112
    object cdsContab_CompromissoID_CONTAB_COMPROMISSO: TIntegerField
      FieldName = 'ID_CONTAB_COMPROMISSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsContab_CompromissoASSUNTO: TMemoField
      FieldName = 'ASSUNTO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsContab_CompromissoLOCAL: TMemoField
      FieldName = 'LOCAL'
      BlobType = ftMemo
      Size = 1
    end
    object cdsContab_CompromissoQUANDO: TSQLTimeStampField
      FieldName = 'QUANDO'
    end
    object cdsContab_CompromissoSTATUS: TIntegerField
      FieldName = 'STATUS'
    end
    object cdsContab_CompromissoVISIBILIDADE: TIntegerField
      FieldName = 'VISIBILIDADE'
    end
    object cdsContab_CompromissosdsContab_Comp_Pessoas: TDataSetField
      FieldName = 'sdsContab_Comp_Pessoas'
    end
  end
  object dsContab_Compromisso: TDataSource
    DataSet = cdsContab_Compromisso
    Left = 64
    Top = 160
  end
  object sdsContab_Comp_Pessoas: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'SELECT * FROM CONTAB_COMP_PESSOAS'#13#10'WHERE ID_CONTAB_COMPROMISSOS ' +
      '= :ID_CONTAB_COMPROMISSOS'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dsLigacao
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_CONTAB_COMPROMISSOS'
        ParamType = ptInput
      end>
    SQLConnection = dmDados.soConexao
    Left = 208
    Top = 64
    object sdsContab_Comp_PessoasID_CONTAB_COMP_PESSOAS: TIntegerField
      FieldName = 'ID_CONTAB_COMP_PESSOAS'
      Required = True
    end
    object sdsContab_Comp_PessoasID_CONTAB_COMPROMISSOS: TIntegerField
      FieldName = 'ID_CONTAB_COMPROMISSOS'
      Required = True
    end
    object sdsContab_Comp_PessoasID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      Required = True
    end
  end
  object dsLigacao: TDataSource
    DataSet = sdsContab_Compromisso
    Left = 208
    Top = 16
  end
  object cdsContab_Comp_Pessoas: TClientDataSet
    Active = True
    Aggregates = <>
    DataSetField = cdsContab_CompromissosdsContab_Comp_Pessoas
    Params = <>
    Left = 208
    Top = 112
    object cdsContab_Comp_PessoasID_CONTAB_COMP_PESSOAS: TIntegerField
      FieldName = 'ID_CONTAB_COMP_PESSOAS'
    end
    object cdsContab_Comp_PessoasID_CONTAB_COMPROMISSOS: TIntegerField
      FieldName = 'ID_CONTAB_COMPROMISSOS'
    end
    object cdsContab_Comp_PessoasID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
    end
    object cdsContab_Comp_PessoasNome: TStringField
      FieldKind = fkLookup
      FieldName = 'Nome'
      LookupDataSet = sdsFuncionario
      LookupKeyFields = 'ID_PESSOA'
      LookupResultField = 'RAZAO_SOCIAL'
      KeyFields = 'ID_PESSOA'
      ReadOnly = True
      Size = 65
      Lookup = True
    end
  end
  object dsContab_Comp_Pessoas: TDataSource
    DataSet = cdsContab_Comp_Pessoas
    Left = 208
    Top = 160
  end
  object sdsFuncionario: TSimpleDataSet
    Active = True
    Aggregates = <>
    Connection = dmDados.soConexao
    DataSet.CommandText = 
      'SELECT P.CODIGO, P.RAZAO_SOCIAL, F.* '#13#10'FROM CONTAB_FUNCIONARIO F' +
      #13#10'  INNER JOIN BASE_PESSOA P ON P.ID_PESSOA = F.ID_PESSOA'#13#10'WHERE' +
      ' F.ATIVO = 1'#13#10'ORDER BY P.RAZAO_SOCIAL'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 336
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
    Left = 336
    Top = 64
  end
  object cdsTmpPessoas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 336
    Top = 120
    object cdsTmpPessoasID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
    end
    object cdsTmpPessoasNOME: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME'
      LookupDataSet = sdsFuncionario
      LookupKeyFields = 'ID_PESSOA'
      LookupResultField = 'RAZAO_SOCIAL'
      KeyFields = 'ID_PESSOA'
      Lookup = True
    end
  end
  object dsTmpPessoas: TDataSource
    DataSet = cdsTmpPessoas
    Left = 336
    Top = 168
  end
end
