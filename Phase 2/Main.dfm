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
    ActivePage = tabLogout
    TabOrder = 0
    object tabDash: TTabSheet
      Caption = 'Dashboard'
    end
    object tabChat: TTabSheet
      Caption = 'Chat'
      ImageIndex = 3
    end
    object tabHelp: TTabSheet
      Caption = 'Help'
      ImageIndex = 1
    end
    object tabUserManagement: TTabSheet
      Caption = 'User Management'
      ImageIndex = 2
    end
    object tabLogout: TTabSheet
      Caption = 'Logout'
      ImageIndex = 4
    end
  end
end
