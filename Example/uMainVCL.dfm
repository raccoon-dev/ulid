object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'frmMain'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 232
    ExplicitTop = 56
    ExplicitWidth = 185
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 47
      Height = 41
      Align = alLeft
      Caption = 'Generate'
      Layout = tlCenter
      ExplicitHeight = 15
    end
    object Label2: TLabel
      AlignWithMargins = True
      Left = 139
      Top = 3
      Width = 30
      Height = 35
      Margins.Left = 5
      Align = alLeft
      Caption = 'ULIDs'
      Layout = tlCenter
      ExplicitLeft = 129
      ExplicitTop = 0
      ExplicitHeight = 15
    end
    object ButtonGenerateULIDs: TSpeedButton
      Left = 504
      Top = 0
      Width = 120
      Height = 41
      Align = alRight
      Caption = 'Generate ULIDs'
      OnClick = ButtonGenerateULIDsClick
    end
    object ButtonGenerateGUIDs: TSpeedButton
      Left = 384
      Top = 0
      Width = 120
      Height = 41
      Align = alRight
      Caption = 'Generate GUIDs'
      OnClick = ButtonGenerateGUIDsClick
      ExplicitLeft = 328
    end
    object EditNo: TEdit
      AlignWithMargins = True
      Left = 52
      Top = 8
      Width = 82
      Height = 25
      Margins.Left = 5
      Margins.Top = 8
      Margins.Right = 0
      Margins.Bottom = 8
      Align = alLeft
      Alignment = taCenter
      NumbersOnly = True
      TabOrder = 0
      Text = '1000'
      ExplicitLeft = 47
      ExplicitTop = 0
      ExplicitHeight = 23
    end
    object CheckBoxPrint: TCheckBox
      AlignWithMargins = True
      Left = 187
      Top = 5
      Width = 142
      Height = 31
      Margins.Left = 15
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      Caption = 'Print on memo'
      TabOrder = 1
    end
  end
  object MemoOut: TMemo
    Left = 0
    Top = 41
    Width = 624
    Height = 400
    Align = alClient
    Lines.Strings = (
      'MemoOut')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
end
