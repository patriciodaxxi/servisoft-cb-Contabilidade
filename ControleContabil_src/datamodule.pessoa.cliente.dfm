inherited dmCadCliente: TdmCadCliente
  Height = 376
  Width = 787
  inherited sdsBase_Pessoa: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'SELECT P.* '#13#10'  FROM BASE_PESSOA P'#13#10'    INNER JOIN CONTAB_CLIENTE' +
      ' C'#13#10'      ON C.ID_PESSOA = P.ID_PESSOA'#13#10'/*{MCONDITION}*/'
  end
  inherited cdsBase_Pessoa: TClientDataSet
    object cdsBase_PessoasdsContab_Cliente: TDataSetField
      FieldName = 'sdsContab_Cliente'
    end
  end
  object sdsContab_Cliente: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 'SELECT * FROM CONTAB_CLIENTE WHERE ID_PESSOA = :ID_PESSOA'
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
    Left = 392
    Top = 72
    object sdsContab_ClienteID_CONTAB_CLIENTE: TIntegerField
      FieldName = 'ID_CONTAB_CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sdsContab_ClienteID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
    end
    object sdsContab_ClienteSTATUS: TIntegerField
      FieldName = 'STATUS'
    end
    object sdsContab_ClienteDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
    end
    object sdsContab_ClienteDATA_INATIVIDADE: TDateField
      FieldName = 'DATA_INATIVIDADE'
    end
    object sdsContab_ClienteDIA_PAGAMENTO: TIntegerField
      FieldName = 'DIA_PAGAMENTO'
    end
    object sdsContab_ClienteVALOR_HONORARIO: TFloatField
      FieldName = 'VALOR_HONORARIO'
    end
    object sdsContab_ClienteCNAE_CODIGO: TStringField
      FieldName = 'CNAE_CODIGO'
      Size = 10
    end
    object sdsContab_ClienteCNAE_DESCRICAO: TStringField
      FieldName = 'CNAE_DESCRICAO'
      Size = 100
    end
    object sdsContab_ClienteNAT_JUR_CODIGO: TStringField
      FieldName = 'NAT_JUR_CODIGO'
      Size = 10
    end
    object sdsContab_ClienteNAT_JUR_DESCRICAO: TStringField
      FieldName = 'NAT_JUR_DESCRICAO'
      Size = 100
    end
    object sdsContab_ClienteINSCRICAO_ESTADUAL: TStringField
      FieldName = 'INSCRICAO_ESTADUAL'
    end
    object sdsContab_ClienteINSCRICAO_MUNICIPAL: TStringField
      FieldName = 'INSCRICAO_MUNICIPAL'
    end
    object sdsContab_ClienteCONSTITUICAO: TStringField
      FieldName = 'CONSTITUICAO'
      Size = 100
    end
    object sdsContab_ClienteCONSTITUICAO_DATA: TDateField
      FieldName = 'CONSTITUICAO_DATA'
    end
    object sdsContab_ClienteNIRE: TStringField
      FieldName = 'NIRE'
      Size = 100
    end
    object sdsContab_ClienteNIRE_DATA: TDateField
      FieldName = 'NIRE_DATA'
    end
    object sdsContab_ClienteULT_ALTERACAO: TStringField
      FieldName = 'ULT_ALTERACAO'
      Size = 100
    end
    object sdsContab_ClienteULT_ALTERACAO_DATA: TDateField
      FieldName = 'ULT_ALTERACAO_DATA'
    end
    object sdsContab_ClienteCAPITAL_SOCIAL: TFloatField
      FieldName = 'CAPITAL_SOCIAL'
    end
    object sdsContab_ClienteSOCIO_RESPONSAVEL_NOME: TStringField
      FieldName = 'SOCIO_RESPONSAVEL_NOME'
      Size = 65
    end
    object sdsContab_ClienteSOCIO_RESPONSAVEL_CPF: TStringField
      FieldName = 'SOCIO_RESPONSAVEL_CPF'
    end
    object sdsContab_ClienteSOCIO_RESPONSAVEL_PARTIC: TIntegerField
      FieldName = 'SOCIO_RESPONSAVEL_PARTIC'
    end
    object sdsContab_ClienteSOCIO_RESPONSAVEL_NASC: TDateField
      FieldName = 'SOCIO_RESPONSAVEL_NASC'
    end
    object sdsContab_ClienteSOCIO_RESPONSAVEL_RG: TStringField
      FieldName = 'SOCIO_RESPONSAVEL_RG'
    end
    object sdsContab_ClienteSOCIO_RESPONSAVEL_EXPED: TStringField
      FieldName = 'SOCIO_RESPONSAVEL_EXPED'
    end
    object sdsContab_ClienteSOCIO_RESPONSAVEL_TITULO: TStringField
      FieldName = 'SOCIO_RESPONSAVEL_TITULO'
      Size = 10
    end
    object sdsContab_ClienteSOCIO_RESPONSAVEL_ZONA: TStringField
      FieldName = 'SOCIO_RESPONSAVEL_ZONA'
      Size = 10
    end
    object sdsContab_ClienteSOCIO_RESPONSAVEL_SECAO: TStringField
      FieldName = 'SOCIO_RESPONSAVEL_SECAO'
      Size = 10
    end
    object sdsContab_ClienteSOCIO_RESPONSAVEL_IR_ATUAL: TStringField
      FieldName = 'SOCIO_RESPONSAVEL_IR_ATUAL'
      Size = 40
    end
    object sdsContab_ClienteSOCIO_RESPONSAVEL_IR_ANTERIOR: TStringField
      FieldName = 'SOCIO_RESPONSAVEL_IR_ANTERIOR'
      Size = 40
    end
    object sdsContab_ClienteSOCIO_1_NOME: TStringField
      FieldName = 'SOCIO_1_NOME'
      Size = 65
    end
    object sdsContab_ClienteSOCIO_1_CPF: TStringField
      FieldName = 'SOCIO_1_CPF'
    end
    object sdsContab_ClienteSOCIO_1_PARTIC: TIntegerField
      FieldName = 'SOCIO_1_PARTIC'
    end
    object sdsContab_ClienteSOCIO_2_NOME: TStringField
      FieldName = 'SOCIO_2_NOME'
      Size = 65
    end
    object sdsContab_ClienteSOCIO_2_CPF: TStringField
      FieldName = 'SOCIO_2_CPF'
    end
    object sdsContab_ClienteSOCIO_2_PARTIC: TIntegerField
      FieldName = 'SOCIO_2_PARTIC'
    end
    object sdsContab_ClienteSOCIO_3_NOME: TStringField
      FieldName = 'SOCIO_3_NOME'
      Size = 65
    end
    object sdsContab_ClienteSOCIO_3_CPF: TStringField
      FieldName = 'SOCIO_3_CPF'
    end
    object sdsContab_ClienteSOCIO_3_PARTIC: TIntegerField
      FieldName = 'SOCIO_3_PARTIC'
    end
    object sdsContab_ClienteENQUADRAMENTO_FISCAL: TIntegerField
      FieldName = 'ENQUADRAMENTO_FISCAL'
    end
    object sdsContab_ClienteTRIBUTACAO: TIntegerField
      FieldName = 'TRIBUTACAO'
    end
    object sdsContab_ClientePARCELAMENTO_FEDERAL: TMemoField
      FieldName = 'PARCELAMENTO_FEDERAL'
      BlobType = ftMemo
      Size = 1
    end
    object sdsContab_ClientePARCELAMENTO_ESTADUAL: TMemoField
      FieldName = 'PARCELAMENTO_ESTADUAL'
      BlobType = ftMemo
      Size = 1
    end
    object sdsContab_ClientePARCELAMENTO_MUNICIPAL: TMemoField
      FieldName = 'PARCELAMENTO_MUNICIPAL'
      BlobType = ftMemo
      Size = 1
    end
    object sdsContab_ClientePARCELAMENTO_PREVIDENCIARIO: TMemoField
      FieldName = 'PARCELAMENTO_PREVIDENCIARIO'
      BlobType = ftMemo
      Size = 1
    end
    object sdsContab_ClientePARCELAMENTO_FGTS: TMemoField
      FieldName = 'PARCELAMENTO_FGTS'
      BlobType = ftMemo
      Size = 1
    end
    object sdsContab_ClientePARCELAMENTO_OUTROS: TMemoField
      FieldName = 'PARCELAMENTO_OUTROS'
      BlobType = ftMemo
      Size = 1
    end
    object sdsContab_ClienteANOTACOES: TMemoField
      FieldName = 'ANOTACOES'
      BlobType = ftMemo
      Size = 1
    end
    object sdsContab_ClienteSIGILOSA_ANOTACAO: TMemoField
      FieldName = 'SIGILOSA_ANOTACAO'
      BlobType = ftMemo
      Size = 1
    end
    object sdsContab_ClienteSIGILOSA_DATA_HORA: TSQLTimeStampField
      FieldName = 'SIGILOSA_DATA_HORA'
    end
    object sdsContab_ClienteSIGILOSA_MOSTAR_MENSAGEM: TIntegerField
      FieldName = 'SIGILOSA_MOSTAR_MENSAGEM'
    end
  end
  object cdsContab_Cliente: TClientDataSet
    Aggregates = <>
    DataSetField = cdsBase_PessoasdsContab_Cliente
    Params = <>
    AfterInsert = cdsContab_ClienteAfterInsert
    Left = 392
    Top = 120
    object cdsContab_ClienteID_CONTAB_CLIENTE: TIntegerField
      FieldName = 'ID_CONTAB_CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsContab_ClienteID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
    end
    object cdsContab_ClienteSTATUS: TIntegerField
      FieldName = 'STATUS'
    end
    object cdsContab_ClienteDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
    end
    object cdsContab_ClienteDATA_INATIVIDADE: TDateField
      FieldName = 'DATA_INATIVIDADE'
    end
    object cdsContab_ClienteDIA_PAGAMENTO: TIntegerField
      FieldName = 'DIA_PAGAMENTO'
    end
    object cdsContab_ClienteVALOR_HONORARIO: TFloatField
      FieldName = 'VALOR_HONORARIO'
    end
    object cdsContab_ClienteCNAE_CODIGO: TStringField
      FieldName = 'CNAE_CODIGO'
      Size = 10
    end
    object cdsContab_ClienteCNAE_DESCRICAO: TStringField
      FieldName = 'CNAE_DESCRICAO'
      Size = 100
    end
    object cdsContab_ClienteNAT_JUR_CODIGO: TStringField
      FieldName = 'NAT_JUR_CODIGO'
      Size = 10
    end
    object cdsContab_ClienteNAT_JUR_DESCRICAO: TStringField
      FieldName = 'NAT_JUR_DESCRICAO'
      Size = 100
    end
    object cdsContab_ClienteINSCRICAO_ESTADUAL: TStringField
      FieldName = 'INSCRICAO_ESTADUAL'
    end
    object cdsContab_ClienteINSCRICAO_MUNICIPAL: TStringField
      FieldName = 'INSCRICAO_MUNICIPAL'
    end
    object cdsContab_ClienteCONSTITUICAO: TStringField
      FieldName = 'CONSTITUICAO'
      Size = 100
    end
    object cdsContab_ClienteCONSTITUICAO_DATA: TDateField
      FieldName = 'CONSTITUICAO_DATA'
    end
    object cdsContab_ClienteNIRE: TStringField
      FieldName = 'NIRE'
      Size = 100
    end
    object cdsContab_ClienteNIRE_DATA: TDateField
      FieldName = 'NIRE_DATA'
    end
    object cdsContab_ClienteULT_ALTERACAO: TStringField
      FieldName = 'ULT_ALTERACAO'
      Size = 100
    end
    object cdsContab_ClienteULT_ALTERACAO_DATA: TDateField
      FieldName = 'ULT_ALTERACAO_DATA'
    end
    object cdsContab_ClienteCAPITAL_SOCIAL: TFloatField
      FieldName = 'CAPITAL_SOCIAL'
    end
    object cdsContab_ClienteSOCIO_RESPONSAVEL_NOME: TStringField
      FieldName = 'SOCIO_RESPONSAVEL_NOME'
      Size = 65
    end
    object cdsContab_ClienteSOCIO_RESPONSAVEL_CPF: TStringField
      FieldName = 'SOCIO_RESPONSAVEL_CPF'
    end
    object cdsContab_ClienteSOCIO_RESPONSAVEL_PARTIC: TIntegerField
      FieldName = 'SOCIO_RESPONSAVEL_PARTIC'
    end
    object cdsContab_ClienteSOCIO_RESPONSAVEL_NASC: TDateField
      FieldName = 'SOCIO_RESPONSAVEL_NASC'
    end
    object cdsContab_ClienteSOCIO_RESPONSAVEL_RG: TStringField
      FieldName = 'SOCIO_RESPONSAVEL_RG'
    end
    object cdsContab_ClienteSOCIO_RESPONSAVEL_EXPED: TStringField
      FieldName = 'SOCIO_RESPONSAVEL_EXPED'
    end
    object cdsContab_ClienteSOCIO_RESPONSAVEL_TITULO: TStringField
      FieldName = 'SOCIO_RESPONSAVEL_TITULO'
      Size = 10
    end
    object cdsContab_ClienteSOCIO_RESPONSAVEL_ZONA: TStringField
      FieldName = 'SOCIO_RESPONSAVEL_ZONA'
      Size = 10
    end
    object cdsContab_ClienteSOCIO_RESPONSAVEL_SECAO: TStringField
      FieldName = 'SOCIO_RESPONSAVEL_SECAO'
      Size = 10
    end
    object cdsContab_ClienteSOCIO_RESPONSAVEL_IR_ATUAL: TStringField
      FieldName = 'SOCIO_RESPONSAVEL_IR_ATUAL'
      Size = 40
    end
    object cdsContab_ClienteSOCIO_RESPONSAVEL_IR_ANTERIOR: TStringField
      FieldName = 'SOCIO_RESPONSAVEL_IR_ANTERIOR'
      Size = 40
    end
    object cdsContab_ClienteSOCIO_1_NOME: TStringField
      FieldName = 'SOCIO_1_NOME'
      Size = 65
    end
    object cdsContab_ClienteSOCIO_1_CPF: TStringField
      FieldName = 'SOCIO_1_CPF'
    end
    object cdsContab_ClienteSOCIO_1_PARTIC: TIntegerField
      FieldName = 'SOCIO_1_PARTIC'
    end
    object cdsContab_ClienteSOCIO_2_NOME: TStringField
      FieldName = 'SOCIO_2_NOME'
      Size = 65
    end
    object cdsContab_ClienteSOCIO_2_CPF: TStringField
      FieldName = 'SOCIO_2_CPF'
    end
    object cdsContab_ClienteSOCIO_2_PARTIC: TIntegerField
      FieldName = 'SOCIO_2_PARTIC'
    end
    object cdsContab_ClienteSOCIO_3_NOME: TStringField
      FieldName = 'SOCIO_3_NOME'
      Size = 65
    end
    object cdsContab_ClienteSOCIO_3_CPF: TStringField
      FieldName = 'SOCIO_3_CPF'
    end
    object cdsContab_ClienteSOCIO_3_PARTIC: TIntegerField
      FieldName = 'SOCIO_3_PARTIC'
    end
    object cdsContab_ClienteENQUADRAMENTO_FISCAL: TIntegerField
      FieldName = 'ENQUADRAMENTO_FISCAL'
    end
    object cdsContab_ClienteTRIBUTACAO: TIntegerField
      FieldName = 'TRIBUTACAO'
    end
    object cdsContab_ClientePARCELAMENTO_FEDERAL: TMemoField
      FieldName = 'PARCELAMENTO_FEDERAL'
      BlobType = ftMemo
      Size = 1
    end
    object cdsContab_ClientePARCELAMENTO_ESTADUAL: TMemoField
      FieldName = 'PARCELAMENTO_ESTADUAL'
      BlobType = ftMemo
      Size = 1
    end
    object cdsContab_ClientePARCELAMENTO_MUNICIPAL: TMemoField
      FieldName = 'PARCELAMENTO_MUNICIPAL'
      BlobType = ftMemo
      Size = 1
    end
    object cdsContab_ClientePARCELAMENTO_PREVIDENCIARIO: TMemoField
      FieldName = 'PARCELAMENTO_PREVIDENCIARIO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsContab_ClientePARCELAMENTO_FGTS: TMemoField
      FieldName = 'PARCELAMENTO_FGTS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsContab_ClientePARCELAMENTO_OUTROS: TMemoField
      FieldName = 'PARCELAMENTO_OUTROS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsContab_ClienteANOTACOES: TMemoField
      FieldName = 'ANOTACOES'
      BlobType = ftMemo
      Size = 1
    end
    object cdsContab_ClientesdsContab_Cliente_Acesso: TDataSetField
      FieldName = 'sdsContab_Cliente_Acesso'
    end
    object cdsContab_ClientesdsContab_Cliente_Reajuste: TDataSetField
      FieldName = 'sdsContab_Cliente_Reajuste'
    end
    object cdsContab_ClienteSIGILOSA_ANOTACAO: TMemoField
      FieldName = 'SIGILOSA_ANOTACAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsContab_ClienteSIGILOSA_DATA_HORA: TSQLTimeStampField
      FieldName = 'SIGILOSA_DATA_HORA'
    end
    object cdsContab_ClienteSIGILOSA_MOSTAR_MENSAGEM: TIntegerField
      FieldName = 'SIGILOSA_MOSTAR_MENSAGEM'
    end
  end
  object dsContab_Cliente: TDataSource
    DataSet = cdsContab_Cliente
    Left = 392
    Top = 168
  end
  object dsLigacaoCliente: TDataSource
    DataSet = sdsContab_Cliente
    Left = 392
    Top = 24
  end
  object cdsStatus: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 264
    object cdsStatusCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsStatusDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
  end
  object dsStatus: TDataSource
    DataSet = cdsStatus
    Left = 40
    Top = 312
  end
  object sdsEnqFiscal: TSimpleDataSet
    Aggregates = <>
    Connection = dmDados.soConexao
    DataSet.CommandText = 'SELECT * FROM CONTAB_ENQUAD_FISCAL ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 112
    Top = 264
    object sdsEnqFiscalOID_ENQUAD_FISCAL: TIntegerField
      FieldName = 'OID_ENQUAD_FISCAL'
      Required = True
    end
    object sdsEnqFiscalDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 30
    end
  end
  object dsEnqFiscal: TDataSource
    DataSet = sdsEnqFiscal
    Left = 112
    Top = 312
  end
  object sdsTributacao: TSimpleDataSet
    Aggregates = <>
    Connection = dmDados.soConexao
    DataSet.CommandText = 'SELECT * FROM CONTAB_TRIBUTACAO ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 192
    Top = 264
    object sdsTributacaoOID_CONTAB_TRIBUTACAO: TIntegerField
      FieldName = 'OID_CONTAB_TRIBUTACAO'
      Required = True
    end
    object sdsTributacaoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 30
    end
  end
  object dsTributacao: TDataSource
    DataSet = sdsTributacao
    Left = 192
    Top = 312
  end
  object sdsContab_Cliente_Acesso: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'SELECT * FROM CONTAB_CLIENTE_ACESSO A'#13#10'WHERE A.ID_CONTAB_CLIENTE' +
      ' = :ID_CONTAB_CLIENTE'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dsLigacaoCliente
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_CONTAB_CLIENTE'
        ParamType = ptInput
      end>
    SQLConnection = dmDados.soConexao
    Left = 520
    Top = 72
    object sdsContab_Cliente_AcessoID_CONTAB_CLIENTE_ACESSO: TIntegerField
      FieldName = 'ID_CONTAB_CLIENTE_ACESSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsContab_Cliente_AcessoID_CONTAB_CLIENTE: TIntegerField
      FieldName = 'ID_CONTAB_CLIENTE'
      Required = True
    end
    object sdsContab_Cliente_AcessoTIPO_ACESSO: TIntegerField
      FieldName = 'TIPO_ACESSO'
    end
    object sdsContab_Cliente_AcessoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object sdsContab_Cliente_AcessoLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 50
    end
    object sdsContab_Cliente_AcessoSENHA: TStringField
      FieldName = 'SENHA'
      Size = 50
    end
    object sdsContab_Cliente_AcessoPUK: TStringField
      FieldName = 'PUK'
      Size = 50
    end
    object sdsContab_Cliente_AcessoVALIDADE: TDateField
      FieldName = 'VALIDADE'
    end
    object sdsContab_Cliente_AcessoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object cdsContab_Cliente_Acesso: TClientDataSet
    Aggregates = <>
    DataSetField = cdsContab_ClientesdsContab_Cliente_Acesso
    Params = <>
    AfterInsert = cdsContab_Cliente_AcessoAfterInsert
    Left = 520
    Top = 120
    object cdsContab_Cliente_AcessoID_CONTAB_CLIENTE_ACESSO: TIntegerField
      FieldName = 'ID_CONTAB_CLIENTE_ACESSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsContab_Cliente_AcessoID_CONTAB_CLIENTE: TIntegerField
      FieldName = 'ID_CONTAB_CLIENTE'
      Required = True
    end
    object cdsContab_Cliente_AcessoTIPO_ACESSO: TIntegerField
      FieldName = 'TIPO_ACESSO'
    end
    object cdsContab_Cliente_AcessoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsContab_Cliente_AcessoLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 50
    end
    object cdsContab_Cliente_AcessoSENHA: TStringField
      FieldName = 'SENHA'
      Size = 50
    end
    object cdsContab_Cliente_AcessoPUK: TStringField
      FieldName = 'PUK'
      Size = 50
    end
    object cdsContab_Cliente_AcessoVALIDADE: TDateField
      FieldName = 'VALIDADE'
    end
    object cdsContab_Cliente_AcessoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dsContab_Cliente_Acesso: TDataSource
    DataSet = cdsContab_Cliente_Acesso
    Left = 520
    Top = 168
  end
  object sdsTipoAcesso: TSimpleDataSet
    Aggregates = <>
    Connection = dmDados.soConexao
    DataSet.CommandText = 'SELECT * FROM CONTAB_TIPO_ACESSO ORDER BY DESCRICAO'
    DataSet.MaxBlobSize = 1
    DataSet.Params = <>
    Params = <>
    Left = 272
    Top = 264
    object sdsTipoAcessoOID_CONTAB_TIPO_ACESSO: TIntegerField
      FieldName = 'OID_CONTAB_TIPO_ACESSO'
      Required = True
    end
    object sdsTipoAcessoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 50
    end
    object sdsTipoAcessoLINK: TMemoField
      FieldName = 'LINK'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dsTipoAcesso: TDataSource
    DataSet = sdsTipoAcesso
    Left = 272
    Top = 312
  end
  object sdsContab_Cliente_Reajuste: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'SELECT * FROM CONTAB_CLIENTE_REAJUSTE'#13#10'WHERE ID_CONTAB_CLIENTE =' +
      ' :ID_CONTAB_CLIENTE'#13#10'ORDER BY ID_CONTAB_CLIENTE_REAJUSTE DESC'
    DbxCommandType = 'Dbx.SQL'
    DataSource = dsLigacaoCliente
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_CONTAB_CLIENTE'
        ParamType = ptInput
      end>
    SQLConnection = dmDados.soConexao
    Left = 672
    Top = 72
    object sdsContab_Cliente_ReajusteID_CONTAB_CLIENTE_REAJUSTE: TIntegerField
      FieldName = 'ID_CONTAB_CLIENTE_REAJUSTE'
      Required = True
    end
    object sdsContab_Cliente_ReajusteID_CONTAB_CLIENTE: TIntegerField
      FieldName = 'ID_CONTAB_CLIENTE'
      Required = True
    end
    object sdsContab_Cliente_ReajusteDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object sdsContab_Cliente_ReajusteVALOR_HONORARIO: TFloatField
      FieldName = 'VALOR_HONORARIO'
      Required = True
    end
  end
  object cdsContab_Cliente_Reajuste: TClientDataSet
    Aggregates = <>
    DataSetField = cdsContab_ClientesdsContab_Cliente_Reajuste
    Params = <>
    Left = 672
    Top = 120
    object cdsContab_Cliente_ReajusteID_CONTAB_CLIENTE_REAJUSTE: TIntegerField
      FieldName = 'ID_CONTAB_CLIENTE_REAJUSTE'
      Required = True
    end
    object f: TIntegerField
      FieldName = 'ID_CONTAB_CLIENTE'
      Required = True
    end
    object cdsContab_Cliente_ReajusteDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object cdsContab_Cliente_ReajusteVALOR_HONORARIO: TFloatField
      FieldName = 'VALOR_HONORARIO'
      Required = True
    end
  end
  object dsContab_Cliente_Reajuste: TDataSource
    DataSet = cdsContab_Cliente_Reajuste
    Left = 672
    Top = 168
  end
end
