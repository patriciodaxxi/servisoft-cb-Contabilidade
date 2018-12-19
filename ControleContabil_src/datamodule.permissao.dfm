inherited dmPermissao: TdmPermissao
  OnDestroy = DataModuleDestroy
  Height = 353
  object sdsBase_Permissao: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 'SELECT * FROM BASE_PERMISSAO'#13#10' /*{MCONDITION}*/'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDados.soConexao
    Left = 48
    Top = 24
    object sdsBase_PermissaoID_BASE_PERMISSAO: TIntegerField
      FieldName = 'ID_BASE_PERMISSAO'
      Required = True
    end
    object sdsBase_PermissaoID_GRUPO_USUARIO: TIntegerField
      FieldName = 'ID_GRUPO_USUARIO'
      Required = True
    end
    object sdsBase_PermissaoID_PROGRAMA: TIntegerField
      FieldName = 'ID_PROGRAMA'
      Required = True
    end
    object sdsBase_PermissaoPERMITE_EXECUTAR: TIntegerField
      FieldName = 'PERMITE_EXECUTAR'
    end
    object sdsBase_PermissaoPERMITE_INCLUIR: TIntegerField
      FieldName = 'PERMITE_INCLUIR'
    end
    object sdsBase_PermissaoPERMITE_EDITAR: TIntegerField
      FieldName = 'PERMITE_EDITAR'
    end
    object sdsBase_PermissaoPERMITE_EXCLUIR: TIntegerField
      FieldName = 'PERMITE_EXCLUIR'
    end
  end
  object dspBase_Permissao: TDataSetProvider
    DataSet = sdsBase_Permissao
    Left = 48
    Top = 80
  end
  object cdsBase_Permissao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBase_Permissao'
    AfterOpen = cdsBase_PermissaoAfterOpen
    AfterClose = cdsBase_PermissaoAfterClose
    Left = 48
    Top = 136
    object cdsBase_PermissaoID_BASE_PERMISSAO: TIntegerField
      FieldName = 'ID_BASE_PERMISSAO'
      Required = True
    end
    object cdsBase_PermissaoID_GRUPO_USUARIO: TIntegerField
      FieldName = 'ID_GRUPO_USUARIO'
      Required = True
    end
    object cdsBase_PermissaoID_PROGRAMA: TIntegerField
      FieldName = 'ID_PROGRAMA'
      Required = True
    end
    object cdsBase_PermissaoPERMITE_EXECUTAR: TIntegerField
      FieldName = 'PERMITE_EXECUTAR'
    end
    object cdsBase_PermissaoPERMITE_INCLUIR: TIntegerField
      FieldName = 'PERMITE_INCLUIR'
    end
    object cdsBase_PermissaoPERMITE_EDITAR: TIntegerField
      FieldName = 'PERMITE_EDITAR'
    end
    object cdsBase_PermissaoPERMITE_EXCLUIR: TIntegerField
      FieldName = 'PERMITE_EXCLUIR'
    end
    object cdsBase_PermissaoNome_Programa: TStringField
      FieldKind = fkLookup
      FieldName = 'Nome_Programa'
      LookupDataSet = sdsProgramas
      LookupKeyFields = 'ID_BASE_PROGRAMA'
      LookupResultField = 'NOME'
      KeyFields = 'ID_PROGRAMA'
      ReadOnly = True
      Size = 65
      Lookup = True
    end
  end
  object dsBase_Permissao: TDataSource
    DataSet = cdsBase_Permissao
    Left = 48
    Top = 192
  end
  object sdsProgramas: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 'SELECT ID_BASE_PROGRAMA'#13#10'          , NOME'#13#10' FROM BASE_PROGRAMA'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 312
    Top = 16
    object sdsProgramasID_BASE_PROGRAMA: TIntegerField
      FieldName = 'ID_BASE_PROGRAMA'
      Required = True
    end
    object sdsProgramasNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 65
    end
  end
  object dsProgramas: TDataSource
    DataSet = sdsProgramas
    Left = 312
    Top = 72
  end
  object sdsGruposUsuarios: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 'SELECT * FROM BASE_GRUPO_USUARIO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 312
    Top = 128
    object sdsGruposUsuariosID_BASE_GRUPO_USUARIO: TIntegerField
      FieldName = 'ID_BASE_GRUPO_USUARIO'
      Required = True
    end
    object sdsGruposUsuariosNOME: TStringField
      FieldName = 'NOME'
      Size = 65
    end
  end
  object sdsBase_Permissao_Adicional: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'SELECT * FROM BASE_PERMISSAO_ADICIONAL ORDER BY ID_BASE_PERMISSA' +
      'O'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDados.soConexao
    Left = 184
    Top = 24
    object sdsBase_Permissao_AdicionalID_BASE_PERMISSAO_ADICIONAL: TIntegerField
      FieldName = 'ID_BASE_PERMISSAO_ADICIONAL'
      Required = True
    end
    object sdsBase_Permissao_AdicionalID_BASE_PERMISSAO: TIntegerField
      FieldName = 'ID_BASE_PERMISSAO'
      Required = True
    end
    object sdsBase_Permissao_AdicionalIDENTIFICADOR: TStringField
      FieldName = 'IDENTIFICADOR'
      Required = True
      Size = 30
    end
    object sdsBase_Permissao_AdicionalPERMISSAO: TIntegerField
      FieldName = 'PERMISSAO'
      Required = True
    end
    object sdsBase_Permissao_AdicionalDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 70
    end
  end
  object dspBase_Permissao_Adicional: TDataSetProvider
    DataSet = sdsBase_Permissao_Adicional
    Left = 184
    Top = 80
  end
  object cdsBase_Permissao_Adicional: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBase_Permissao_Adicional'
    Left = 184
    Top = 136
    object cdsBase_Permissao_AdicionalID_BASE_PERMISSAO_ADICIONAL: TIntegerField
      FieldName = 'ID_BASE_PERMISSAO_ADICIONAL'
      Required = True
    end
    object cdsBase_Permissao_AdicionalID_BASE_PERMISSAO: TIntegerField
      FieldName = 'ID_BASE_PERMISSAO'
      Required = True
    end
    object cdsBase_Permissao_AdicionalIDENTIFICADOR: TStringField
      FieldName = 'IDENTIFICADOR'
      ReadOnly = True
      Size = 30
    end
    object cdsBase_Permissao_AdicionalPERMISSAO: TIntegerField
      FieldName = 'PERMISSAO'
      Required = True
    end
    object cdsBase_Permissao_AdicionalDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 70
    end
  end
  object dsBase_Permissao_Adicional: TDataSource
    DataSet = cdsBase_Permissao_Adicional
    Left = 184
    Top = 192
  end
end
