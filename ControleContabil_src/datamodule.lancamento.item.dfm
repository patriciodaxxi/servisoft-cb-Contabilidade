inherited dmLancamentoItem: TdmLancamentoItem
  Height = 279
  object sdsContab_Item_Lancamento: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 'SELECT * FROM CONTAB_ITEM_LANCAMENTO'#13#10'/*{MCONDITION}*/'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDados.soConexao
    Left = 72
    Top = 24
    object sdsContab_Item_LancamentoID_CONTAB_ITEM_LANCAMENTO: TIntegerField
      FieldName = 'ID_CONTAB_ITEM_LANCAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sdsContab_Item_LancamentoCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object sdsContab_Item_LancamentoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 65
    end
    object sdsContab_Item_LancamentoVALOR: TSingleField
      FieldName = 'VALOR'
    end
  end
  object dspContab_Item_Lancamento: TDataSetProvider
    DataSet = sdsContab_Item_Lancamento
    UpdateMode = upWhereKeyOnly
    Left = 72
    Top = 72
  end
  object cdsContab_Item_Lancamento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContab_Item_Lancamento'
    AfterInsert = cdsContab_Item_LancamentoAfterInsert
    Left = 72
    Top = 120
    object cdsContab_Item_LancamentoID_CONTAB_ITEM_LANCAMENTO: TIntegerField
      FieldName = 'ID_CONTAB_ITEM_LANCAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsContab_Item_LancamentoCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsContab_Item_LancamentoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 65
    end
    object cdsContab_Item_LancamentoVALOR: TSingleField
      FieldName = 'VALOR'
    end
  end
  object dsContab_Item_Lancamento: TDataSource
    DataSet = cdsContab_Item_Lancamento
    Left = 72
    Top = 176
  end
end
