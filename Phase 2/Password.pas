unit Password;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  Tstate = (canceled, changePass, newPass, done);
  TfrmPassword = class(TForm)
    pnlPasswordForm: TPanel;
    btnPassOK: TBitBtn;
    lblOldPass: TLabel;
    edtOldPass: TEdit;
    lblNewPass: TLabel;
    edtNewPass: TEdit;
    edtNewPassConfirm: TEdit;
    btnPassCancel: TBitBtn;
    procedure btnPassCancelClick(Sender: TObject);
    procedure btnPassOKClick(Sender: TObject);
  private
    state : Tstate;
  published
    Function getState : Tstate;
    Procedure setState(frmConfig : Tstate);
    Function checkChangePass : boolean;
    Function checkNewPass : boolean;
  end;

var
  frmPassword: TfrmPassword;

implementation

{$R *.dfm}

{ TfrmPassword }

uses util_u;

procedure TfrmPassword.btnPassCancelClick(Sender: TObject);
begin
  state := canceled;
end;

// Set form state to done
procedure TfrmPassword.btnPassOKClick(Sender: TObject);
begin
  state := done;
end;

// Check if fields are Null and if newly entered passwords match
function TfrmPassword.checkChangePass: boolean;
begin
  result := false;
  if NOT((edtNewPass.Text = '') OR (edtNewPassConfirm.Text = '') OR (edtOldPass.Text = '')) then
    if (edtNewPass.Text = edtNewPassConfirm.Text) then
      result := true
    else
      util.error('Newly entered passwords do not match');
end;

// Check if fields are Null and if newly entered passwords match
function TfrmPassword.checkNewPass: boolean;
begin
  result := false;
  if NOT((edtNewPass.Text = '') OR (edtNewPassConfirm.Text = '') ) then
    if (edtNewPass.Text = edtNewPassConfirm.Text) then
      result := true
    else
      util.error('Newly entered passwords do not match');
end;

// Form state getter
function TfrmPassword.getState: Tstate;
begin
  result := state;
end;

// Form state setter
procedure TfrmPassword.setState(frmConfig: Tstate);
begin
  state := frmConfig;
end;

end.
