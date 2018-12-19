inherited dmPessoaBase: TdmPessoaBase
  OnDestroy = DataModuleDestroy
  object sdsBase_Pessoa: TSQLDataSet
    CommandText = 'SELECT * FROM BASE_PESSOA /*{MCONDITION}*/'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDados.soConexao
    Left = 48
    Top = 24
    object sdsBase_PessoaID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsBase_PessoaCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object sdsBase_PessoaRAZAO_SOCIAL: TStringField
      DisplayLabel = 'Raz'#227'o social'
      FieldName = 'RAZAO_SOCIAL'
      Size = 65
    end
    object sdsBase_PessoaNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Size = 40
    end
    object sdsBase_PessoaTIPO_PESSOA: TStringField
      FieldName = 'TIPO_PESSOA'
      Size = 1
    end
    object sdsBase_PessoaDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
    end
    object sdsBase_PessoaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object sdsBase_PessoaNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object sdsBase_PessoaCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object sdsBase_PessoaCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 40
    end
    object sdsBase_PessoaUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object sdsBase_PessoaCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object sdsBase_PessoaSITE: TStringField
      FieldName = 'SITE'
      Size = 200
    end
    object sdsBase_PessoaCATEGORIA_CADASTRO: TStringField
      FieldName = 'CATEGORIA_CADASTRO'
      Required = True
      Size = 65
    end
  end
  object dspBase_Pessoa: TDataSetProvider
    DataSet = sdsBase_Pessoa
    Options = [poCascadeDeletes, poCascadeUpdates, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 48
    Top = 72
  end
  object cdsBase_Pessoa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBase_Pessoa'
    Left = 48
    Top = 120
    object cdsBase_PessoaID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsBase_PessoaCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsBase_PessoaRAZAO_SOCIAL: TStringField
      DisplayLabel = 'Raz'#227'o social'
      FieldName = 'RAZAO_SOCIAL'
      Size = 65
    end
    object cdsBase_PessoaNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Size = 40
    end
    object cdsBase_PessoaTIPO_PESSOA: TStringField
      FieldName = 'TIPO_PESSOA'
      Size = 1
    end
    object cdsBase_PessoaDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
    end
    object cdsBase_PessoaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object cdsBase_PessoaNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object cdsBase_PessoaCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object cdsBase_PessoaCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 40
    end
    object cdsBase_PessoaUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cdsBase_PessoaCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object cdsBase_PessoaSITE: TStringField
      FieldName = 'SITE'
      Size = 200
    end
    object cdsBase_PessoasdsBase_Pessoa_Contato: TDataSetField
      FieldName = 'sdsBase_Pessoa_Contato'
    end
    object cdsBase_PessoaCATEGORIA_CADASTRO: TStringField
      FieldName = 'CATEGORIA_CADASTRO'
      Required = True
      Size = 65
    end
  end
  object dsBase_Pessoa: TDataSource
    DataSet = cdsBase_Pessoa
    Left = 48
    Top = 168
  end
  object cdsTipo_Pessoa: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 288
    Top = 24
    object cdsTipo_PessoaTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object cdsTipo_PessoaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 10
    end
  end
  object dsTipo_Pessoa: TDataSource
    DataSet = cdsTipo_Pessoa
    Left = 288
    Top = 72
  end
  object dsLigacao: TDataSource
    DataSet = sdsBase_Pessoa
    Left = 168
    Top = 24
  end
  object sdsBase_Pessoa_Contato: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 'SELECT * FROM BASE_PESSOA_CONTATO'#13#10'WHERE ID_PESSOA = :ID_PESSOA'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dsLigacao
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PESSOA'
        ParamType = ptInput
      end>
    SQLConnection = dmDados.soConexao
    Left = 168
    Top = 72
    object sdsBase_Pessoa_ContatoID_BASE_PESSOA_CONTATO: TIntegerField
      FieldName = 'ID_BASE_PESSOA_CONTATO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsBase_Pessoa_ContatoID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
    end
    object sdsBase_Pessoa_ContatoTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object sdsBase_Pessoa_ContatoNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object sdsBase_Pessoa_ContatoTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 30
    end
    object sdsBase_Pessoa_ContatoEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
  end
  object cdsBase_Pessoa_Contato: TClientDataSet
    Aggregates = <>
    DataSetField = cdsBase_PessoasdsBase_Pessoa_Contato
    Params = <>
    AfterInsert = cdsBase_Pessoa_ContatoAfterInsert
    Left = 168
    Top = 120
    object cdsBase_Pessoa_ContatoID_BASE_PESSOA_CONTATO: TIntegerField
      FieldName = 'ID_BASE_PESSOA_CONTATO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsBase_Pessoa_ContatoID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
    end
    object cdsBase_Pessoa_ContatoTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object cdsBase_Pessoa_ContatoNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object cdsBase_Pessoa_ContatoTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 30
    end
    object cdsBase_Pessoa_ContatoEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
  end
  object dsBase_Pessoa_Contato: TDataSource
    DataSet = cdsBase_Pessoa_Contato
    Left = 168
    Top = 168
  end
  object cdsTipo_Contato: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 288
    Top = 120
    object cdsTipo_ContatoTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object cdsTipo_ContatoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 10
    end
  end
  object dsTipo_Contato: TDataSource
    DataSet = cdsTipo_Contato
    Left = 288
    Top = 168
  end
end
