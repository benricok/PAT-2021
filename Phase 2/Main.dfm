object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 448
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object tbcMain: TPageControl
    Left = 0
    Top = 0
    Width = 806
    Height = 449
    ActivePage = tabUserManagement
    TabOrder = 0
    OnChange = tbcMainChange
    object tabUserDash: TTabSheet
      Caption = 'Dashboard'
      ImageIndex = 6
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object lblUserDash: TLabel
        Left = 16
        Top = 16
        Width = 91
        Height = 23
        Caption = 'Dashboard'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object pnlMyInfoUser: TPanel
        Left = 16
        Top = 45
        Width = 289
        Height = 340
        TabOrder = 0
        object lblUsernameUser: TLabel
          Left = 14
          Top = 60
          Width = 62
          Height = 14
          Caption = 'Username: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblFullnameUser: TLabel
          Left = 14
          Top = 88
          Width = 55
          Height = 14
          Caption = 'Fullname: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblSurnameUser: TLabel
          Left = 14
          Top = 116
          Width = 56
          Height = 14
          Caption = 'Surname: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblCellUser: TLabel
          Left = 14
          Top = 141
          Width = 61
          Height = 14
          Caption = 'Cellphone: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblEmailuser: TLabel
          Left = 14
          Top = 168
          Width = 35
          Height = 14
          Caption = 'Email: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblHeadMyInfoUser: TLabel
          Left = 14
          Top = 25
          Width = 102
          Height = 18
          Caption = 'My information:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblUsernameDashUser: TLabel
          Left = 96
          Top = 60
          Width = 4
          Height = 16
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtFullnameDashUser: TEdit
          Left = 96
          Top = 85
          Width = 169
          Height = 21
          Hint = 'Enter your Fullname'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object edtSurnameDashUser: TEdit
          Left = 96
          Top = 112
          Width = 169
          Height = 21
          Hint = 'Enter your surname'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
        object edtCellDashUser: TEdit
          Left = 96
          Top = 139
          Width = 169
          Height = 21
          Hint = 'Enter your cellphone (numerical values after +27)'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
        end
        object edtEmailDashUser: TEdit
          Left = 96
          Top = 166
          Width = 169
          Height = 21
          Hint = 'Enter your email'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
        end
        object btnUserUpdate: TBitBtn
          Left = 167
          Top = 257
          Width = 75
          Height = 25
          Hint = 'Update your personal information'
          Caption = '&Update'
          Kind = bkOK
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = btnUserUpdateClick
        end
        object btnChangePasswordUser: TBitBtn
          Left = 144
          Top = 226
          Width = 121
          Height = 25
          Hint = 'Change your password'
          Caption = '&Change password'
          Glyph.Data = {
            E6040000424DE604000000000000360000002800000014000000140000000100
            180000000000B0040000D6190000D61900000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFBFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC27E15EBD6B5FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFCF9846C98D32C4811CEEDBBFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFE5C99EC98B2EC88B2EE2C08EFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFD09C4CCA8E34C98B2EE3C293FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9CF
            A9C88B2DC98B2EE3C293FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBB274C98D31
            C98B2EE3C293FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7AB67C98D32C98B2EE3
            C293FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E1C8C8892AC98B2EE3C293FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFD6A862CA8E33C98B2EE5C699FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFDFBF8CF9846CB9036CA8F34D4A258FCFAF7FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F3E6D2C4811CCA8F36CC923ACC923ACA8E34C4811CF3E6D3FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC58422CB
            9038CB9139C98D32C98D32CB9139CB9037C68522FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7CDA5C8892ACB9139C788
            29DCB478DBB477C78829CB9139C8892AE8CEA6FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDB77EC98C30C98C30DFBC86FFFFFF
            FFFFFFDFBB86C98C30C98C30DDB77EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFE1BF8DC98B2EC98B2EE5C89DFFFFFFFFFFFFE5
            C89CC98B2EC98B2EE1C08DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFF6ECDCC5831FCB9139C88A2CE9D1ADE9D1ADC88A2CCB91
            39C5831FF6ECDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFD9AE6DC78727CB9138C88A2DC88A2DCB9138C78727D9AE6D
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFDFBB85C4821EC78828C78828C4821EDFBB85FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFF3E5D1F3E5D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF}
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
        end
        object rpgGenderDashUser: TRadioGroup
          Left = 16
          Top = 209
          Width = 122
          Height = 81
          Caption = 'Gender'
          Items.Strings = (
            'Male'
            'Female')
          TabOrder = 6
        end
      end
      object Panel1: TPanel
        Left = 326
        Top = 288
        Width = 459
        Height = 97
        Caption = 'Panel1'
        TabOrder = 1
      end
    end
    object tabDash: TTabSheet
      Caption = 'Dashboard'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object lblHRDash: TLabel
        Left = 384
        Top = 208
        Width = 41
        Height = 13
        Caption = 'HR Dash'
      end
    end
    object tabChat: TTabSheet
      Caption = 'Chat'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Button1: TButton
        Left = 360
        Top = 200
        Width = 75
        Height = 25
        Caption = 'Button1'
        TabOrder = 0
      end
    end
    object tabUserManagement: TTabSheet
      Caption = 'User Management'
      ImageIndex = 2
      object lblHeadEnabled: TLabel
        Left = 431
        Top = 228
        Width = 72
        Height = 13
        Caption = 'Selected user: '
      end
      object lblEnabled: TLabel
        Left = 509
        Top = 228
        Width = 3
        Height = 13
      end
      object dbGridUsers: TDBGrid
        Left = 16
        Top = 16
        Width = 769
        Height = 201
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object pnlNewUser: TPanel
        Left = 32
        Top = 254
        Width = 369
        Height = 155
        TabOrder = 1
        object lblNewUser: TLabel
          Left = 8
          Top = 0
          Width = 60
          Height = 16
          Caption = 'New User:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edtFullname: TEdit
          Left = 8
          Top = 22
          Width = 201
          Height = 21
          Hint = 'Enter the user'#39's Fullname'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TextHint = 'Fullname'
        end
        object edtSurname: TEdit
          Left = 8
          Top = 49
          Width = 201
          Height = 21
          Hint = 'Enter the user'#39's Surname'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          TextHint = 'Surname'
        end
        object rpgGender: TRadioGroup
          Left = 231
          Top = 16
          Width = 122
          Height = 81
          Caption = 'Gender'
          Items.Strings = (
            'Male'
            'Female')
          TabOrder = 4
        end
        object btnAddUser: TBitBtn
          Left = 271
          Top = 119
          Width = 81
          Height = 25
          Caption = '&Add User'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnClick = btnAddUserClick
        end
        object edtEmail: TEdit
          Left = 8
          Top = 76
          Width = 201
          Height = 21
          Hint = 'Enter the user'#39's email'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          TextHint = 'Email'
        end
        object edtCellphone: TEdit
          Left = 8
          Top = 103
          Width = 201
          Height = 21
          Hint = 'Add the user'#39's cellphone number (numerical values after +27)'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          TextHint = 'Cellphone number'
        end
      end
      object btnDBnavUP: TBitBtn
        Left = 16
        Top = 223
        Width = 77
        Height = 25
        Caption = '&UP'
        Glyph.Data = {
          BA030000424DBA030000000000003600000028000000140000000F0000000100
          18000000000084030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFE08F49E2904AE2904AE2904AE2904AE2
          904AE2904AE2904AE2904AE2904AE2904AE2904AE2904AE2904AE2904AFFFFFF
          FEFEFDFFFFFFFFFFFFFFFFFFFFFFFFE2904AE18F4AE2904AE2904AE2904AE290
          4AE28F4AE28F49E2904AE2904AE2904AE1904AE2904AFFFFFFFFFEFEFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFE2904AE28F49E28F49E29049E2904AE29049
          E2904AE28F49E28F49E28F49E2904AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFE2904AE18C44E1904AE29049E2904AE2904AE2
          9049E18E46E2904AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFCF6F2E18E48E19049E2904AE28F49E28F49E2904AE08B
          44FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFCF8F4E2904AE29049E2904AE2904AE18E48FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFE2904AE2904AE2904AFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFE2904AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        TabOrder = 2
        OnClick = btnDBnavUPClick
      end
      object btnDBnavDOWN: TBitBtn
        Left = 99
        Top = 223
        Width = 77
        Height = 25
        Caption = '&DOWN'
        Glyph.Data = {
          BA030000424DBA030000000000003600000028000000140000000F0000000100
          18000000000084030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFE2904AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFE2904AE2904AE2904AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE18E
          48E2904AE2904AE29049E2904AFCF8F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE08B44E2904AE28F49
          E28F49E2904AE19049E18E48FCF6F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2904AE18E46E29049E2904AE2904AE2
          9049E1904AE18C44E2904AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFE2904AE28F49E28F49E28F49E2904AE29049E2904AE290
          49E28F49E28F49E2904AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF
          FFFFE2904AE1904AE2904AE2904AE2904AE28F49E28F4AE2904AE2904AE2904A
          E2904AE18F4AE2904AFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDFFFFFFE2904AE290
          4AE2904AE2904AE2904AE2904AE2904AE2904AE2904AE2904AE2904AE2904AE2
          904AE2904AE08F49FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        TabOrder = 3
        OnClick = btnDBnavDOWNClick
      end
      object btnUserDel: TBitBtn
        Left = 201
        Top = 223
        Width = 109
        Height = 25
        Caption = '&Delete User'
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 4
        OnClick = btnUserDelClick
      end
      object btnEnabled: TBitBtn
        Left = 316
        Top = 223
        Width = 109
        Height = 25
        Caption = '&Enable/Disable'
        Kind = bkIgnore
        NumGlyphs = 2
        TabOrder = 5
        OnClick = btnEnabledClick
      end
    end
    object tabLogs: TTabSheet
      Caption = 'Event Logger'
      ImageIndex = 5
      object redEvent: TRichEdit
        Left = 3
        Top = 0
        Width = 782
        Height = 385
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
        Zoom = 100
      end
      object btnClearLog: TBitBtn
        Left = 3
        Top = 393
        Width = 75
        Height = 25
        Caption = '&Clear log'
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 1
        OnClick = btnClearLogClick
      end
    end
    object tabLogout: TTabSheet
      Caption = 'Logout'
      ImageIndex = 4
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
  end
  object BitBtn1: TBitBtn
    Left = 714
    Top = 415
    Width = 75
    Height = 25
    Kind = bkHelp
    NumGlyphs = 2
    TabOrder = 1
  end
end
