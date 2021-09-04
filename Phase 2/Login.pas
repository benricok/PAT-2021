unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

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
  published
    Procedure logout;
    Function isAuthenticated : boolean;
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

{ TfrmLogin }

uses DBUsers_u;

// Class getter
procedure TfrmLogin.btnLoginClick(Sender: TObject);
begin
  if NOT((edtPass.Text = '') OR (edtUser.Text = '')) then begin

  end else
    MessageDlg('Please enter your credentials before submitting', mtError, [mbOK], 0);

end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  DBUsers.connectDB;
end;

function TfrmLogin.isAuthenticated : boolean;
begin
  if bAuth then
    result := true
  else
    result := false;
end;

// Class setter
procedure TfrmLogin.logout;
begin
  bAuth := false;
end;

end.
