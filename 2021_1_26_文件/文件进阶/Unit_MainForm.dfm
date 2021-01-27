object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = #25991#20214#36827#38454
  ClientHeight = 310
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object BtnAddData: TButton
    Left = 232
    Top = 43
    Width = 75
    Height = 25
    Caption = #36861#21152#25968#25454
    TabOrder = 0
    OnClick = BtnAddDataClick
  end
  object GroupBox1: TGroupBox
    Left = 22
    Top = 24
    Width = 185
    Height = 89
    Caption = 'GroupBox1'
    TabOrder = 1
    object lblName: TLabel
      Left = 8
      Top = 25
      Width = 36
      Height = 13
      Caption = #22995#21517#65306
    end
    object lblAge: TLabel
      Left = 8
      Top = 56
      Width = 36
      Height = 13
      Caption = #24180#40836#65306
    end
    object edtName: TEdit
      Left = 50
      Top = 21
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object edtAge: TEdit
      Left = 50
      Top = 52
      Width = 121
      Height = 21
      NumbersOnly = True
      TabOrder = 1
    end
  end
  object Memo1: TMemo
    Left = 30
    Top = 112
    Width = 163
    Height = 137
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object BtnReadData: TButton
    Left = 232
    Top = 112
    Width = 75
    Height = 25
    Caption = #35835#20837#25968#25454
    TabOrder = 3
    OnClick = BtnReadDataClick
  end
end
