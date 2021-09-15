object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 448
  ClientWidth = 798
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
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
    end
    object tabHelp: TTabSheet
      Caption = 'Help'
      ImageIndex = 1
    end
    object tabUserManagement: TTabSheet
      Caption = 'User Management'
      ImageIndex = 2
      object dbGridUsers: TDBGrid
        Left = 16
        Top = 16
        Width = 769
        Height = 201
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object dbNavUsers: TDBNavigator
        Left = 16
        Top = 223
        Width = 240
        Height = 25
        TabOrder = 1
      end
    end
    object tabLogout: TTabSheet
      Caption = 'Logout'
      ImageIndex = 4
    end
  end
end
