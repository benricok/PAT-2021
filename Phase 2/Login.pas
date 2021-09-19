unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, DB, ADODB, Algorithms_u, Main;

type
  TfrmLogin = class(TForm)
    pnlLogin: TPanel;
    btnLogin: TBitBtn;
    edtUser: TEdit;
    edtPass: TEdit;
    lblUser: TLabel;
    lblPass: TLabel;
    Button1: TButton;
    procedure btnLoginClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    var
      bAuth : boolean;
      sPrivilege, sPreUser : string;
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

uses DBUsers_u, Password;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
begin
  if NOT((edtPass.Text = '') OR (edtUser.Text = '')) then begin
    tblUsers.open;
    tblUsers.First;
    if tblUsers.Locate('Username', edtUser.Text, [loCaseInsensitive]) then begin
      if tblUsers['HashedPASS'] = hash(edtPass.Text) then begin
        bAuth := true;
        sPreUser := tblUsers['USername'];
        sPrivilege := tblUsers['Privilege'];
        frmMain.Show;
        frmLogin.Hide;
      end else
        MessageDlg('Invalid password', mtError, [mbOK], 0);
    end else
      MessageDlg('Username does not exist', mtError, [mbOK], 0);
  end else
    MessageDlg('Please enter your credentials before submitting', mtError, [mbOK], 0);
end;

procedure TfrmLogin.Button1Click(Sender: TObject);
begin
  Password.frmPassword.Show;
end;

procedure TfrmLogin.FormActivate(Sender: TObject);
begin
  edtUser.SetFocus;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  DBUsers.connectDB;
end;

// Getter for sPrivilege
function TfrmLogin.getPriv: string;
begin
  result := sPrivilege;
end;

// Getter for bAuth
function TfrmLogin.isAuthenticated : boolean;
begin
  result := bAuth;
end;

// Log out user and reset Application
procedure TfrmLogin.logout;
begin
  bAuth := false;
  sPrivilege := '';
  frmLogin.Show;
  frmMain.Hide;
  edtUser.SetFocus;
end;
end.
