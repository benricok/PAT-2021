object frmHelp: TfrmHelp
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Help'
  ClientHeight = 493
  ClientWidth = 510
  Color = clBtnFace
  DefaultMonitor = dmPrimary
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlToolBar: TPanel
    Left = 0
    Top = 456
    Width = 510
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnOK: TBitBtn
      Left = 425
      Top = 8
      Width = 75
      Height = 25
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnOKClick
    end
  end
  object pnlHelp: TPanel
    Left = 0
    Top = 0
    Width = 510
    Height = 449
    TabOrder = 1
    object lblHelpHeading: TLabel
      Left = 208
      Top = 24
      Width = 82
      Height = 22
      Caption = 'README'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object memHelp: TMemo
      Left = 8
      Top = 52
      Width = 492
      Height = 381
      Lines.Strings = (
        '# Delphi PAT grade 10'
        '1. By Benrico Krog'
        '2. Uses the vigenere algorithm for encryption and decryption'
        '3. Topic: Encryption and Decryption.'
        ''
        '## How to use the tool'
        '1. Open the endecryptToool.exe application.'
        '2. The Help button will show you this message.'
        
          '3. There are two modes to for processing the message. Encrypting' +
          ' and Decrypting.'
        ''
        '## Encryption'
        
          '1. Paste your message in the box below the label "Input" or clic' +
          'k the button "Import from file" to '
        'load a file.'
        '2. Switch to the second tab labeled "key" by clicking on it.'
        
          '3. A key will be generated automatically each time you open the ' +
          'application. You can select '
        
          'what character my be used by the genarator and click the button ' +
          'called "Genarate" to make a '
        'new key.'
        
          '4. Switch back to the first tab and click on the button labeled ' +
          '"Encrypt".'
        
          '5. The encrypted message will appear in the second box underneat' +
          'h the label "Output".'
        
          '6. A Prompt will also be displayed with the key to decrypt the m' +
          'essage.'
        
          '6. If you'#39'd like to save it directly to a text file, you can cli' +
          'ck on the button labled "Export to file" '
        'and provide the path to the file in the dialog.'
        ''
        '## Decryption'
        
          '1. Paste your encrypted message in the box below the label "Inpu' +
          't" or click the button "Import '
        'from file" to load a file.'
        '2. Switch to the second tab labeled "key" by clicking on it.'
        
          '3. A key will be generated automatically each time you open the ' +
          'application. Enter the key '
        'provided with the encrypted message into the editbox.'
        
          '4. Switch back to the first tab and click on the button labeled ' +
          '"Decrypt".'
        
          '5. The decrypted message will appear in the second box underneat' +
          'h the label "Output".'
        
          '6. If you'#39'd like to save it directly to a text file, you can cli' +
          'ck on the button labled "Export to file" '
        'and provide the path to the file in the dialog.'
        '')
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
end
