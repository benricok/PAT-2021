unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, DB, ADODB, Main, util_u;

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
      activeUser : util_u.TUser;
      bAuth : boolean;
      conDB: TADOConnection;
      tblMusic: TADOtable;
      qry: TADOQuery;
      dsrTbl: TDataSource;
      dsrSQL: TDataSource;
      SQL: String;
  published
    Procedure logout;
    Function getUser : TUser;
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

{ TfrmLogin }

uses DBUsers_u, Password, Algorithms_u;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
Var
  sGender : string;
begin
  if NOT((edtPass.Text = '') OR (edtUser.Text = '')) then begin
    tblUsers.open;
    tblUsers.First;
    if tblUsers.Locate('Username', edtUser.Text, [loCaseInsensitive]) then begin
      if tblUsers['Enabled'] = true then begin
        if tblUsers['HashedPASS'] = crypt.ELFhash(edtPass.Text) then begin
          util.readUser(activeUser);
          util.logevent('User ' + activeUser.username + ' logged in.', 2);
          frmMain.Show;
          frmLogin.Hide;
        end else
          util.error('Invalid password by user ' + edtUser.Text, true)
      end else
        util.error('User ' + edtUser.Text + ' is disabled', true);
    end else
      util.error(edtUser.Text + ' does not exist', true);
  end else
    util.error('Please enter your credentials before submitting', false);
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

// Getter for active user record
function TfrmLogin.getUser: util_u.TUser;
begin
  result := activeUser;
end;

// Log out user and reset Application
procedure TfrmLogin.logout;
begin
  frmLogin.Show;
  frmMain.Hide;
  edtUser.SetFocus;
  edtPass.Clear;
end;
end.
