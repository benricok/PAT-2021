unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, DB, ADODB, Main;

type
  TfrmLogin = class(TForm)
    pnlLogin: TPanel;
    btnLogin: TBitBtn;
    edtUser: TEdit;
    edtPass: TEdit;
    lblUser: TLabel;
    lblPass: TLabel;
    btnShowPass: TBitBtn;
    procedure btnLoginClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnShowPassMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnShowPassMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
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

uses DBUsers_u, util_u, Password;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
begin
  if NOT((edtPass.Text = '') OR (edtUser.Text = '')) then begin
    tblUsers.open;
    tblUsers.First;
    if tblUsers.Locate('Username', edtUser.Text, [loCaseInsensitive]) then begin
      if tblUsers['HashedPASS'] = util.ELFhash(edtPass.Text) then begin
        bAuth := true;
        sPreUser := tblUsers['USername'];
        sPrivilege := tblUsers['Privilege'];
        frmMain.Show;
        frmLogin.Hide;
      end else
        util.error('Invalid password');
    end else
      util.error('Username does not exist');
  end else
    util.error('Please enter your credentials before submitting');

end;

procedure TfrmLogin.btnShowPassMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  edtPass.PasswordChar := #0;
end;

procedure TfrmLogin.btnShowPassMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  edtPass.PasswordChar := '*';
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
