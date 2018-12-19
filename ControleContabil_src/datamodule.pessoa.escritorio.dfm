inherited dmCadEscritorio: TdmCadEscritorio
  Height = 390
  Width = 513
  inherited sdsBase_Pessoa: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'SELECT P.* '#13#10'  FROM BASE_PESSOA P'#13#10'    INNER JOIN CONTAB_ESCRITO' +
      'RIO C'#13#10'      ON C.ID_PESSOA = P.ID_PESSOA'#13#10'/*{MCONDITION}*/'
    MaxBlobSize = 1
  end
  inherited cdsBase_Pessoa: TClientDataSet
    object cdsBase_PessoasdsContab_Escritorio: TDataSetField
      FieldName = 'sdsContab_Escritorio'
    end
  end
  object sdsContab_Escritorio: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'SELECT * '#13#10'  FROM CONTAB_ESCRITORIO'#13#10'WHERE ID_PESSOA = :ID_PESSO' +
      'A'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dsLigacao
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PESSOA'
        ParamType = ptInput
      end>
    SQLConnection = dmDados.soConexao
    Left = 400
    Top = 24
    object sdsContab_EscritorioID_ESCRITORIO: TIntegerField
      FieldName = 'ID_ESCRITORIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsContab_EscritorioID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      Required = True
    end
    object sdsContab_EscritorioLOGOTIPO: TBlobField
      FieldName = 'LOGOTIPO'
      Size = 1
    end
  end
  object cdsContab_Escritorio: TClientDataSet
    Aggregates = <>
    DataSetField = cdsBase_PessoasdsContab_Escritorio
    Params = <>
    AfterInsert = cdsContab_EscritorioAfterInsert
    Left = 400
    Top = 72
    object cdsContab_EscritorioID_ESCRITORIO: TIntegerField
      FieldName = 'ID_ESCRITORIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsContab_EscritorioID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      Required = True
    end
    object cdsContab_EscritorioLOGOTIPO: TBlobField
      FieldName = 'LOGOTIPO'
      Size = 1
    end
  end
  object dsContab_Escritorio: TDataSource
    DataSet = cdsContab_Escritorio
    Left = 400
    Top = 120
  end
end
