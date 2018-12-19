inherited dmCadFuncionario: TdmCadFuncionario
  Width = 584
  inherited sdsBase_Pessoa: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'SELECT P.*, F.LOGIN, F.ATIVO '#13#10'  FROM BASE_PESSOA P'#13#10'    INNER J' +
      'OIN CONTAB_FUNCIONARIO F'#13#10'      ON F.ID_PESSOA = P.ID_PESSOA'#13#10'/*' +
      '{MCONDITION}*/'
    object sdsBase_PessoaLOGIN: TStringField
      FieldName = 'LOGIN'
      ProviderFlags = []
    end
    object sdsBase_PessoaATIVO: TIntegerField
      FieldName = 'ATIVO'
      ProviderFlags = []
    end
  end
  inherited cdsBase_Pessoa: TClientDataSet
    object cdsBase_PessoasdsContab_Funcionario: TDataSetField
      FieldName = 'sdsContab_Funcionario'
    end
    object cdsBase_PessoaLOGIN: TStringField
      FieldName = 'LOGIN'
      ProviderFlags = []
    end
    object cdsBase_PessoaATIVO: TIntegerField
      FieldName = 'ATIVO'
      ProviderFlags = []
    end
  end
  object sdsContab_Funcionario: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 'SELECT * FROM CONTAB_FUNCIONARIO'#13#10'WHERE ID_PESSOA = :ID_PESSOA'
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
    Left = 408
    Top = 72
    object sdsContab_FuncionarioID_CONTAB_FUNCIONARIO: TIntegerField
      FieldName = 'ID_CONTAB_FUNCIONARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsContab_FuncionarioID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      Required = True
    end
    object sdsContab_FuncionarioLOGIN: TStringField
      FieldName = 'LOGIN'
      Required = True
    end
    object sdsContab_FuncionarioSENHA: TStringField
      FieldName = 'SENHA'
      Required = True
    end
    object sdsContab_FuncionarioATIVO: TIntegerField
      FieldName = 'ATIVO'
      Required = True
    end
    object sdsContab_FuncionarioID_BASE_GRUPO_USUARIO: TIntegerField
      FieldName = 'ID_BASE_GRUPO_USUARIO'
      Required = True
    end
  end
  object cdsContab_Funcionario: TClientDataSet
    Aggregates = <>
    DataSetField = cdsBase_PessoasdsContab_Funcionario
    Params = <>
    AfterInsert = cdsContab_FuncionarioAfterInsert
    Left = 408
    Top = 120
    object cdsContab_FuncionarioID_CONTAB_FUNCIONARIO: TIntegerField
      FieldName = 'ID_CONTAB_FUNCIONARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsContab_FuncionarioID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      Required = True
    end
    object cdsContab_FuncionarioLOGIN: TStringField
      FieldName = 'LOGIN'
      Required = True
    end
    object cdsContab_FuncionarioSENHA: TStringField
      FieldName = 'SENHA'
      Required = True
      OnSetText = cdsContab_FuncionarioSENHASetText
    end
    object cdsContab_FuncionarioATIVO: TIntegerField
      FieldName = 'ATIVO'
      Required = True
    end
    object cdsContab_FuncionarioID_BASE_GRUPO_USUARIO: TIntegerField
      FieldName = 'ID_BASE_GRUPO_USUARIO'
      Required = True
    end
  end
  object dsContab_Funcionario: TDataSource
    DataSet = cdsContab_Funcionario
    Left = 408
    Top = 168
  end
  object Enconder64: TIdEncoderMIME
    FillChar = '='
    Left = 408
    Top = 24
  end
  object sdsGrupoUsuario: TSimpleDataSet
    Aggregates = <>
    Connection = dmDados.soConexao
    DataSet.CommandText = 'select * from BASE_GRUPO_USUARIO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 520
    Top = 24
    object sdsGrupoUsuarioID_BASE_GRUPO_USUARIO: TIntegerField
      FieldName = 'ID_BASE_GRUPO_USUARIO'
      Required = True
    end
    object sdsGrupoUsuarioNOME: TStringField
      FieldName = 'NOME'
      Size = 65
    end
  end
  object dsGrupoUsuario: TDataSource
    DataSet = sdsGrupoUsuario
    Left = 520
    Top = 72
  end
end
