inherited frmIndicadores: TfrmIndicadores
  Align = alClient
  BorderWidth = 15
  Caption = 'frmIndicadores'
  ClientHeight = 311
  ClientWidth = 544
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 590
  ExplicitHeight = 379
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox [0]
    Left = 0
    Top = 0
    Width = 537
    Height = 297
    Caption = ' Indicadores '
    TabOrder = 0
    DesignSize = (
      537
      297)
    object Label1: TLabel
      Left = 64
      Top = 32
      Width = 67
      Height = 13
      Caption = 'Tarefas totais'
    end
    object Label2: TLabel
      Left = 43
      Top = 69
      Width = 88
      Height = 13
      Caption = 'Tarefas em atraso'
    end
    object Label3: TLabel
      Left = 40
      Top = 107
      Width = 91
      Height = 13
      Caption = 'Tarefas pendentes'
    end
    object Label4: TLabel
      Left = 63
      Top = 145
      Width = 68
      Height = 13
      Caption = 'Novas tarefas'
    end
    object Label5: TLabel
      Left = 90
      Top = 183
      Width = 41
      Height = 13
      Caption = 'Recados'
    end
    object Label6: TLabel
      Left = 94
      Top = 221
      Width = 37
      Height = 13
      Caption = 'Agenda'
    end
    object Label7: TLabel
      Left = 42
      Top = 259
      Width = 89
      Height = 13
      BiDiMode = bdRightToLeft
      Caption = 'Acessos vencendo'
      ParentBiDiMode = False
    end
    object cxProgressBar1: TcxProgressBar
      Left = 137
      Top = 28
      Anchors = [akLeft, akTop, akRight]
      Properties.AnimationSpeed = 2
      Properties.BarStyle = cxbsAnimation
      Properties.BeginColor = 54056
      Properties.PeakValue = 100.000000000000000000
      Properties.ShowTextStyle = cxtsText
      Properties.SolidTextColor = True
      Properties.Text = '0 Tarefa(s) - 0 %'
      Style.TextColor = clBlack
      StyleDisabled.TextColor = clBtnShadow
      StyleFocused.TextColor = clBlack
      StyleHot.TextColor = clBlack
      TabOrder = 0
      Width = 376
    end
    object cxProgressBar2: TcxProgressBar
      Left = 137
      Top = 65
      Anchors = [akLeft, akTop, akRight]
      Properties.AnimationSpeed = 2
      Properties.BarStyle = cxbsAnimation
      Properties.BeginColor = clRed
      Properties.Max = 200.000000000000000000
      Properties.PeakValue = 100.000000000000000000
      Properties.ShowTextStyle = cxtsText
      Properties.Text = '0 Tarefa(s) - 0 %'
      Style.TextColor = clBlack
      StyleDisabled.TextColor = clBtnShadow
      StyleFocused.TextColor = clBlack
      StyleHot.TextColor = clBlack
      TabOrder = 1
      Width = 376
    end
    object cxProgressBar3: TcxProgressBar
      Left = 137
      Top = 103
      Anchors = [akLeft, akTop, akRight]
      Properties.AnimationSpeed = 2
      Properties.BarStyle = cxbsAnimation
      Properties.BeginColor = clYellow
      Properties.Max = 200.000000000000000000
      Properties.PeakValue = 140.000000000000000000
      Properties.ShowTextStyle = cxtsText
      Properties.SolidTextColor = True
      Properties.Text = '0 Tarefa(s) - 0 %'
      Style.TextColor = clBlack
      StyleDisabled.TextColor = clBtnShadow
      StyleFocused.TextColor = clBlack
      StyleHot.TextColor = clBlack
      TabOrder = 2
      Width = 376
    end
    object cxProgressBar4: TcxProgressBar
      Left = 137
      Top = 141
      Anchors = [akLeft, akTop, akRight]
      Properties.AnimationSpeed = 2
      Properties.BarStyle = cxbsAnimation
      Properties.BeginColor = clLime
      Properties.Max = 200.000000000000000000
      Properties.PeakValue = 140.000000000000000000
      Properties.ShowTextStyle = cxtsText
      Properties.SolidTextColor = True
      Properties.Text = '0 Tarefa(s) - 0 %'
      Style.TextColor = clBlack
      StyleDisabled.TextColor = clBtnShadow
      StyleFocused.TextColor = clBlack
      StyleHot.TextColor = clBlack
      TabOrder = 3
      Width = 376
    end
    object pbRecados: TcxProgressBar
      Left = 137
      Top = 179
      Anchors = [akLeft, akTop, akRight]
      Position = 10.000000000000000000
      Properties.AnimationSpeed = 2
      Properties.BarStyle = cxbsAnimation
      Properties.BeginColor = clBlue
      Properties.Max = 18.000000000000000000
      Properties.OverloadValue = 18.000000000000000000
      Properties.PeakValue = 15.000000000000000000
      Properties.ShowTextStyle = cxtsText
      Properties.Text = '15 Recados'
      Style.Shadow = False
      Style.TextColor = clBlack
      Style.TextStyle = []
      Style.TransparentBorder = True
      StyleDisabled.TextColor = clBtnShadow
      StyleFocused.TextColor = clBlack
      StyleHot.TextColor = clBlack
      TabOrder = 4
      OnMouseDown = pbCompromissosMouseDown
      Width = 376
    end
    object pbCompromissos: TcxProgressBar
      Left = 137
      Top = 217
      Anchors = [akLeft, akTop, akRight]
      Position = 10.000000000000000000
      Properties.AnimationSpeed = 2
      Properties.BarStyle = cxbsAnimation
      Properties.BeginColor = clBlue
      Properties.Max = 18.000000000000000000
      Properties.OverloadValue = 18.000000000000000000
      Properties.PeakValue = 18.000000000000000000
      Properties.ShowTextStyle = cxtsText
      Properties.Text = '3 Compromissos'
      Style.TextColor = clBlack
      StyleDisabled.TextColor = clBtnShadow
      StyleFocused.TextColor = clBlack
      StyleHot.TextColor = clBlack
      TabOrder = 5
      OnMouseDown = pbCompromissosMouseDown
      Width = 376
    end
    object pbValidade: TcxProgressBar
      Left = 137
      Top = 255
      Anchors = [akLeft, akTop, akRight]
      Position = 60.000000000000000000
      Properties.AnimationSpeed = 2
      Properties.BarStyle = cxbsAnimation
      Properties.BeginColor = clRed
      Properties.Max = 200.000000000000000000
      Properties.PeakValue = 100.000000000000000000
      Properties.ShowTextStyle = cxtsText
      Properties.Text = '10 Certificados vencendo em at'#233' 15 dias'
      Style.TextColor = clBlack
      StyleDisabled.TextColor = clBtnShadow
      StyleFocused.TextColor = clBlack
      StyleHot.TextColor = clBlack
      TabOrder = 6
      OnMouseDown = pbValidadeMouseDown
      Width = 376
    end
  end
  object thtAtualizacao: TJvThreadTimer
    Interval = 15000
    OnTimer = thtAtualizacaoTimer
    Left = 48
    Top = 128
  end
end
