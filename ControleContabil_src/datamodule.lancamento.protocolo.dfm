inherited dmLancamentoProtocolo: TdmLancamentoProtocolo
  OnDestroy = DataModuleDestroy
  Width = 556
  object sdsContab_Protocolo: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 'SELECT * FROM CONTAB_PROTOCOLO WHERE 1=0'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = dmDados.soConexao
    Left = 56
    Top = 16
    object sdsContab_ProtocoloID_CONTAB_PROTOCOLO: TIntegerField
      FieldName = 'ID_CONTAB_PROTOCOLO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsContab_ProtocoloID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object sdsContab_ProtocoloCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 100
    end
    object sdsContab_ProtocoloID_ENTREGADOR: TIntegerField
      FieldName = 'ID_ENTREGADOR'
    end
    object sdsContab_ProtocoloDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
    object sdsContab_ProtocoloENTREGADOR: TStringField
      FieldName = 'ENTREGADOR'
      Size = 100
    end
    object sdsContab_ProtocoloTIPO_PROTOCOLO: TStringField
      FieldName = 'TIPO_PROTOCOLO'
      Size = 1
    end
    object sdsContab_ProtocoloDESTINATARIO: TStringField
      FieldName = 'DESTINATARIO'
      Size = 100
    end
    object sdsContab_ProtocoloOBSERVACOES: TMemoField
      FieldName = 'OBSERVACOES'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dspContab_Protocolo: TDataSetProvider
    DataSet = sdsContab_Protocolo
    Options = [poCascadeDeletes, poCascadeUpdates, poUseQuoteChar]
    UpdateMode = upWhereChanged
    Left = 56
    Top = 64
  end
  object cdsContab_Protocolo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContab_Protocolo'
    AfterInsert = cdsContab_ProtocoloAfterInsert
    Left = 56
    Top = 112
    object cdsContab_ProtocoloID_CONTAB_PROTOCOLO: TIntegerField
      FieldName = 'ID_CONTAB_PROTOCOLO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsContab_ProtocoloID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object cdsContab_ProtocoloCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 100
    end
    object cdsContab_ProtocoloID_ENTREGADOR: TIntegerField
      FieldName = 'ID_ENTREGADOR'
    end
    object cdsContab_ProtocoloDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
    object cdsContab_ProtocoloENTREGADOR: TStringField
      FieldName = 'ENTREGADOR'
      Size = 100
    end
    object cdsContab_ProtocoloTIPO_PROTOCOLO: TStringField
      FieldName = 'TIPO_PROTOCOLO'
      Size = 1
    end
    object cdsContab_ProtocoloDESTINATARIO: TStringField
      FieldName = 'DESTINATARIO'
      Size = 100
    end
    object cdsContab_ProtocoloOBSERVACOES: TMemoField
      FieldName = 'OBSERVACOES'
      BlobType = ftMemo
      Size = 1
    end
    object cdsContab_ProtocolosdsContab_Protocolo_Itens: TDataSetField
      FieldName = 'sdsContab_Protocolo_Itens'
    end
  end
  object dsContab_Protocolo: TDataSource
    DataSet = cdsContab_Protocolo
    Left = 56
    Top = 160
  end
  object dsLigacao: TDataSource
    DataSet = sdsContab_Protocolo
    Left = 192
    Top = 16
  end
  object sdsContab_Protocolo_Itens: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'SELECT * FROM CONTAB_PROTOCOLO_ITENS'#13#10'WHERE ID_PROTOCOLO = :ID_P' +
      'ROTOCOLO'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dsLigacao
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PROTOCOLO'
        ParamType = ptInput
      end>
    SQLConnection = dmDados.soConexao
    Left = 192
    Top = 64
    object sdsContab_Protocolo_ItensID_CONTAB_PROTOCOLO_ITENS: TIntegerField
      FieldName = 'ID_CONTAB_PROTOCOLO_ITENS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsContab_Protocolo_ItensID_PROTOCOLO: TIntegerField
      FieldName = 'ID_PROTOCOLO'
    end
    object sdsContab_Protocolo_ItensID_ITEM_LANCAMENTO: TIntegerField
      FieldName = 'ID_ITEM_LANCAMENTO'
    end
    object sdsContab_Protocolo_ItensOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
  end
  object cdsContab_Protocolo_Itens: TClientDataSet
    Aggregates = <>
    DataSetField = cdsContab_ProtocolosdsContab_Protocolo_Itens
    Params = <>
    AfterInsert = cdsContab_Protocolo_ItensAfterInsert
    Left = 192
    Top = 112
    object cdsContab_Protocolo_ItensID_CONTAB_PROTOCOLO_ITENS: TIntegerField
      FieldName = 'ID_CONTAB_PROTOCOLO_ITENS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsContab_Protocolo_ItensID_PROTOCOLO: TIntegerField
      FieldName = 'ID_PROTOCOLO'
    end
    object cdsContab_Protocolo_ItensID_ITEM_LANCAMENTO: TIntegerField
      FieldName = 'ID_ITEM_LANCAMENTO'
    end
    object cdsContab_Protocolo_ItensOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsContab_Protocolo_ItensDescricaoItemLancamento: TStringField
      FieldKind = fkLookup
      FieldName = 'DescricaoItemLancamento'
      LookupDataSet = sdsItensLancamento
      LookupKeyFields = 'ID_CONTAB_ITEM_LANCAMENTO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'ID_ITEM_LANCAMENTO'
      Size = 65
      Lookup = True
    end
  end
  object dsContab_Protocolo_Itens: TDataSource
    DataSet = cdsContab_Protocolo_Itens
    Left = 192
    Top = 160
  end
  object cdsTipo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 320
    Top = 16
    object cdsTipoID_TIPO: TStringField
      FieldName = 'ID_TIPO'
      Size = 1
    end
    object cdsTipoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
  end
  object dsTipo: TDataSource
    DataSet = cdsTipo
    Left = 320
    Top = 64
  end
  object sdsItensLancamento: TSimpleDataSet
    Aggregates = <>
    Connection = dmDados.soConexao
    DataSet.CommandText = 'SELECT * FROM CONTAB_ITEM_LANCAMENTO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 320
    Top = 112
    object sdsItensLancamentoID_CONTAB_ITEM_LANCAMENTO: TIntegerField
      FieldName = 'ID_CONTAB_ITEM_LANCAMENTO'
      Required = True
    end
    object sdsItensLancamentoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sdsItensLancamentoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 65
    end
  end
  object dsItensLancamento: TDataSource
    DataSet = sdsItensLancamento
    Left = 320
    Top = 160
  end
end
