object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 448
  ClientWidth = 796
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object tbcMain: TPageControl
    Left = -5
    Top = 0
    Width = 806
    Height = 449
    ActivePage = tabUserManagement
    TabOrder = 0
    object tabDash: TTabSheet
      Caption = 'Dashboard'
    end
    object tabChat: TTabSheet
      Caption = 'Chat'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    object tabHelp: TTabSheet
      Caption = 'Help'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    object tabUserManagement: TTabSheet
      Caption = 'User Management'
      ImageIndex = 2
    end
    object tabLogout: TTabSheet
      Caption = 'Logout'
      ImageIndex = 4
      OnEnter = tabLogoutEnter
    end
  end
end
