inherited dmAgendaCorporativa: TdmAgendaCorporativa
  object sdsPesquisa: TSimpleDataSet
    Aggregates = <>
    Connection = dmDados.soConexao
    DataSet.CommandText = 
      'SELECT BP.RAZAO_SOCIAL'#13#10'     , BP.DOCUMENTO'#13#10'     , BPC.NOME'#13#10'  ' +
      '   , BPC.TELEFONE'#13#10'     , BPC.EMAIL'#13#10'  FROM BASE_PESSOA BP'#13#10'    ' +
      'LEFT OUTER JOIN BASE_PESSOA_CONTATO BPC ON BPC.ID_PESSOA = BP.ID' +
      '_PESSOA'#13#10'/*{MCONDITION}*/'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 240
    Top = 24
    object sdsPesquisaNOME_PESSOA: TStringField
      DisplayLabel = 'Nome da pessoa'
      FieldName = 'RAZAO_SOCIAL'
      Required = True
      Size = 65
    end
    object sdsPesquisaDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
    end
    object sdsPesquisaCONTATO: TStringField
      DisplayLabel = 'Contato'
      FieldName = 'NOME'
      Size = 50
    end
    object sdsPesquisaTELEFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'TELEFONE'
      Size = 30
    end
    object sdsPesquisaEMAIL: TStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 100
    end
  end
  object dsPesquisa: TDataSource
    DataSet = sdsPesquisa
    Left = 240
    Top = 72
  end
end
