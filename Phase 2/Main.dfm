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
  PixelsPerInch = 96
  TextHeight = 13
  object tbcMain: TPageControl
    Left = -5
    Top = 0
    Width = 806
    Height = 449
    ActivePage = tabDash
    TabOrder = 0
    object tabDash: TTabSheet
      Caption = 'Dashboard'
      ExplicitWidth = 802
    end
    object tabChat: TTabSheet
      Caption = 'Chat'
      ImageIndex = 3
      ExplicitWidth = 797
    end
    object tabHelp: TTabSheet
      Caption = 'Help'
      ImageIndex = 1
      ExplicitWidth = 797
    end
    object tabUserManagement: TTabSheet
      Caption = 'User Management'
      ImageIndex = 2
      ExplicitWidth = 797
    end
    object tabLogout: TTabSheet
      Caption = 'Logout'
      ImageIndex = 4
      ExplicitWidth = 797
    end
  end
end
