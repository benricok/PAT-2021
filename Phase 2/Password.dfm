object frmPassword: TfrmPassword
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Change Password'
  ClientHeight = 173
  ClientWidth = 229
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPasswordForm: TPanel
    Left = 0
    Top = 0
    Width = 233
    Height = 137
    TabOrder = 0
    object lblOldPass: TLabel
      Left = 8
      Top = 8
      Width = 117
      Height = 13
      Caption = 'Enter your old password'
    end
    object lblNewPass: TLabel
      Left = 8
      Top = 54
      Width = 151
      Height = 13
      Caption = 'Enter your new password twice'
    end
    object edtOldPass: TEdit
      Left = 8
      Top = 27
      Width = 217
      Height = 21
      TabOrder = 0
      TextHint = 'Old password'
    end
    object edtNewPass: TEdit
      Left = 8
      Top = 73
      Width = 217
      Height = 21
      TabOrder = 1
      TextHint = 'New password'
    end
    object edtNewPassConfirm: TEdit
      Left = 8
      Top = 100
      Width = 217
      Height = 21
      TabOrder = 2
      TextHint = 'Confirm new password'
    end
  end
  object btnPassOK: TBitBtn
    Left = 150
    Top = 143
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
    OnClick = btnPassOKClick
  end
  object btnPassCancel: TBitBtn
    Left = 69
    Top = 143
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 2
    OnClick = btnPassCancelClick
  end
end
