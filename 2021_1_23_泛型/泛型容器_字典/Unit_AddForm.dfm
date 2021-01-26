object AddForm: TAddForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #27880#20876#23398#29983#20449#24687
  ClientHeight = 165
  ClientWidth = 288
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblName: TLabel
    Left = 56
    Top = 32
    Width = 36
    Height = 13
    Caption = #22995#21517#65306
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object lblAge: TLabel
    Left = 56
    Top = 72
    Width = 36
    Height = 13
    Caption = #24180#40836#65306
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtName: TEdit
    Left = 114
    Top = 29
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtAge: TEdit
    Left = 114
    Top = 69
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object BtnSave: TButton
    Left = 56
    Top = 120
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 2
    OnClick = BtnSaveClick
  end
  object BtnCancel: TButton
    Left = 160
    Top = 120
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 3
    OnClick = BtnCancelClick
  end
end
