object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  Cursor = crIBeam
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSizeToolWin
  Caption = 'Login'
  ClientHeight = 192
  ClientWidth = 199
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlLogin: TPanel
    Left = 0
    Top = 0
    Width = 201
    Height = 193
    TabOrder = 0
    object lblUser: TLabel
      Left = 24
      Top = 25
      Width = 26
      Height = 13
      Caption = 'User:'
    end
    object lblPass: TLabel
      Left = 24
      Top = 71
      Width = 50
      Height = 13
      Caption = 'Password:'
    end
    object btnLogin: TBitBtn
      Left = 56
      Top = 136
      Width = 75
      Height = 25
      Caption = '&Login'
      Kind = bkIgnore
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnLoginClick
    end
    object edtUser: TEdit
      Left = 24
      Top = 44
      Width = 145
      Height = 21
      Cursor = crIBeam
      TabOrder = 1
      Text = 'admin'
      TextHint = 'Enter your username'
    end
    object edtPass: TEdit
      Left = 24
      Top = 90
      Width = 145
      Height = 21
      Cursor = crIBeam
      HelpType = htKeyword
      PasswordChar = '*'
      TabOrder = 2
      Text = 'admin'
      TextHint = 'Enter your password'
    end
  end
end
