object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 449
  ClientWidth = 774
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
    ActivePage = tabReport
    TabOrder = 0
    OnChange = tbcMainChange
    object tabDash: TTabSheet
      Caption = 'Dashboard'
      ImageIndex = 6
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
        Color = cl3DLight
        ParentBackground = False
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
        Left = 328
        Top = 45
        Width = 421
        Height = 340
        Caption = 'Panel1'
        Color = cl3DLight
        ParentBackground = False
        TabOrder = 1
      end
    end
    object tabReport: TTabSheet
      Caption = 'Report'
      object lblHeadReport: TLabel
        Left = 24
        Top = 24
        Width = 56
        Height = 23
        Caption = 'Report'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblHeadReportUsers: TLabel
        Left = 24
        Top = 257
        Width = 91
        Height = 14
        Caption = 'Users involved:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtReportTitle: TEdit
        Left = 16
        Top = 61
        Width = 733
        Height = 21
        TabOrder = 0
        TextHint = 'Report title'
      end
      object memReportBody: TMemo
        Left = 16
        Top = 91
        Width = 733
        Height = 153
        Lines.Strings = (
          '')
        TabOrder = 1
      end
      object btnSubmitReport: TBitBtn
        Left = 16
        Top = 391
        Width = 75
        Height = 25
        Caption = '&Report'
        Kind = bkOK
        NumGlyphs = 2
        TabOrder = 2
      end
      object cbxSelectUserReport: TComboBox
        Left = 16
        Top = 304
        Width = 145
        Height = 21
        TabOrder = 3
        Text = 'Select user'
      end
      object edtUsersInReport: TEdit
        Left = 16
        Top = 277
        Width = 733
        Height = 21
        ParentShowHint = False
        ReadOnly = True
        ShowHint = False
        TabOrder = 4
        TextHint = 'Add feature'
      end
      object btnAddUSerToReport: TBitBtn
        Left = 167
        Top = 304
        Width = 75
        Height = 21
        Caption = '&Add User'
        Glyph.Data = {
          06030000424D060300000000000036000000280000000F0000000F0000000100
          180000000000D002000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFE7A46BE18B44E28F4AE18B44E7A46BFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7A46BE18B44E2
          8F4AE18B44E7A46BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFE7A46BE18B44E28F4AE18B44E7A46BFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7A46BE18B44E2
          8F4AE18B44E7A46BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFE7A66FE18B44E28F4AE18B44E7A66FFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000E7A46BE7A46BE7A46BE7A46BE8A670E2924FE18E48E2
          8F4AE18E48E2924FE8A670E7A46BE7A46BE7A46BE7A46B000000E18B44E18B44
          E18B44E18B44E18B44E18E48E28F4AE28F4AE28F4AE18E48E18B44E18B44E18B
          44E18B44E18B44000000E28F4AE28F4AE28F4AE28F4AE28F4AE28F4AE28F4AE2
          8F4AE28F4AE28F4AE28F4AE28F4AE28F4AE28F4AE28F4A000000E18B44E18B44
          E18B44E18B44E18B44E18E48E28F4AE28F4AE28F4AE18E48E18B44E18B44E18B
          44E18B44E18B44000000E7A46BE7A46BE7A46BE7A46BE8A670E2924FE18E48E2
          8F4AE18E48E2924FE8A670E7A46BE7A46BE7A46BE7A46B000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFE7A66FE18B44E28F4AE18B44E7A66FFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7A46BE18B44E2
          8F4AE18B44E7A46BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFE7A46BE18B44E28F4AE18B44E7A46BFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7A46BE18B44E2
          8F4AE18B44E7A46BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFE7A46BE18B44E28F4AE18B44E7A46BFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000}
        TabOrder = 5
        OnClick = btnAddUSerToReportClick
      end
    end
    object tabViewReports: TTabSheet
      Caption = 'View Reports'
      ImageIndex = 3
    end
    object tabUserManagement: TTabSheet
      Caption = 'User Management'
      ImageIndex = 2
      object dbGridUsers: TDBGrid
        Left = 16
        Top = 16
        Width = 733
        Height = 217
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnColumnMoved = dbGridUsersColumnMoved
      end
      object pnlNewUser: TPanel
        Left = 16
        Top = 246
        Width = 369
        Height = 139
        Color = cl3DLight
        ParentBackground = False
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
          Left = 247
          Top = 103
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
      object pnlGridControls: TPanel
        Left = 400
        Top = 246
        Width = 349
        Height = 139
        Color = cl3DLight
        ParentBackground = False
        TabOrder = 2
        object lblEnabled: TLabel
          Left = 253
          Top = 47
          Width = 3
          Height = 13
        end
        object lblHeadEnabled: TLabel
          Left = 253
          Top = 15
          Width = 72
          Height = 13
          Caption = 'Selected user: '
        end
        object btnDBnavDOWN: TBitBtn
          Left = 8
          Top = 42
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
          TabOrder = 0
          OnClick = btnDBnavDOWNClick
        end
        object btnDBnavUP: TBitBtn
          Left = 8
          Top = 11
          Width = 77
          Height = 25
          Caption = '      &UP'
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
          TabOrder = 1
          OnClick = btnDBnavUPClick
        end
        object btnEnabled: TBitBtn
          Left = 113
          Top = 42
          Width = 109
          Height = 25
          Caption = '&Enable/Disable'
          Kind = bkIgnore
          NumGlyphs = 2
          TabOrder = 2
          OnClick = btnEnabledClick
        end
        object btnUserDel: TBitBtn
          Left = 113
          Top = 11
          Width = 109
          Height = 25
          Caption = '&Delete User'
          Kind = bkCancel
          NumGlyphs = 2
          TabOrder = 3
          OnClick = btnUserDelClick
        end
      end
    end
    object tabLogs: TTabSheet
      Caption = 'Event Logger'
      ImageIndex = 5
      object redEvent: TRichEdit
        Left = 16
        Top = 16
        Width = 733
        Height = 369
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
        Left = 16
        Top = 391
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
    end
  end
  object BitBtn1: TBitBtn
    Left = 678
    Top = 415
    Width = 75
    Height = 25
    Kind = bkHelp
    NumGlyphs = 2
    TabOrder = 1
    OnClick = BitBtn1Click
  end
end
