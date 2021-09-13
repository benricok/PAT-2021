unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, DB, ADODB, Algorithms_u;

type
  TfrmLogin = class(TForm)
    pnlLogin: TPanel;
    btnLogin: TBitBtn;
    edtUser: TEdit;
    edtPass: TEdit;
    lblUser: TLabel;
    lblPass: TLabel;
    procedure btnLoginClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    var
      bAuth : boolean;
      sPrivilege : string;
      conDB: TADOConnection;
      tblMusic: TADOtable;
      qry: TADOQuery;
      dsrTbl: TDataSource;
      dsrSQL: TDataSource;
      SQL: String;
  published
    Procedure logout;
    Function isAuthenticated : boolean;
    Function getPriv : string;
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

{ TfrmLogin }

uses DBUsers_u;

// Class getter
procedure TfrmLogin.btnLoginClick(Sender: TObject);
Var
  bCorrect : boolean;
  sHashed : string;
begin
  bCorrect := true;

  if NOT((edtPass.Text = '') OR (edtUser.Text = '')) then begin
    tblUsers.open;
    tblUsers.First;
    if tblUsers.Locate('Username', edtUser.Text, [loCaseInsensitive]) then begin
      sHashed := hash(edtPass.Text);
      if tblUsers['HashedPASS'] = sHashed then
        bAuth := true;
        sPrivilege := tblUsers[''];
      else
        bCorrect := false;
    end else
      bCorrect := false;

  end else
    MessageDlg('Please enter your credentials before submitting', mtError, [mbOK], 0);
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  DBUsers.connectDB;
end;

function TfrmLogin.getPriv: string;
begin
  result := sPrivilege;
end;

function TfrmLogin.isAuthenticated : boolean;
begin
  result := bAuth;
end;

// Class setter
procedure TfrmLogin.logout;
begin
  bAuth := false;
end;
end.
