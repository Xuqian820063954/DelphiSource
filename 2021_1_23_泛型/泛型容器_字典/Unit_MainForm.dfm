object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = #27867#22411#23481#22120'_'#23383#20856
  ClientHeight = 361
  ClientWidth = 577
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object BtnAdd: TButton
    Left = 56
    Top = 24
    Width = 75
    Height = 25
    Caption = #28155#21152
    TabOrder = 0
    OnClick = BtnAddClick
  end
  object BtnDel: TButton
    Left = 184
    Top = 24
    Width = 75
    Height = 25
    Caption = #21024#38500
    TabOrder = 1
    OnClick = BtnDelClick
  end
  object BtnUpdate: TButton
    Left = 440
    Top = 24
    Width = 75
    Height = 25
    Caption = #20462#25913
    TabOrder = 2
  end
  object BtnFind: TButton
    Left = 312
    Top = 24
    Width = 75
    Height = 25
    Caption = #26597#25214
    TabOrder = 3
    OnClick = BtnFindClick
  end
  object mmo1: TMemo
    Left = 0
    Top = 71
    Width = 577
    Height = 290
    TabOrder = 4
  end
end
