object MainForm: TMainForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #20420#32599#26031#26041#22359
  ClientHeight = 485
  ClientWidth = 578
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object img1: TImage
    Left = 0
    Top = 0
    Width = 578
    Height = 369
    Align = alCustom
  end
  object ListView1: TListView
    Left = 0
    Top = 350
    Width = 578
    Height = 135
    Columns = <
      item
        AutoSize = True
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    OwnerDraw = True
    ReadOnly = True
    ParentFont = False
    ShowColumnHeaders = False
    TabOrder = 0
    ViewStyle = vsReport
  end
  object Timer: TTimer
    Interval = 300
    OnTimer = TimerTimer
    Left = 256
    Top = 352
  end
end
