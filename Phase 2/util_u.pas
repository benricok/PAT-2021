unit util_u;

interface

uses SysUtils, System.Hash, Classes, Password, Vcl.Forms, Vcl.Dialogs;

type TUtil = class(TComponent)
  Function hash(sString : string) : string;
  Function noSpace(sString : string) : string;
  Function newPassword(var sHashedPass : string; frmConfig : Password.Tstate) : boolean;
  procedure getPriv(var sPriv: string);
  Procedure error(sError : string);
end;

Var
  Util : TUtil;

implementation

Function TUtil.hash(sString : string) : string;
begin
// Hash password
  result := THashMD5.GetHashString(sString);
end;

// Remove spaces in string
Function TUtil.noSpace(sString : string) : string;
Var
  i : integer;
begin
  result := '';
  for i := 1 to length(sString) do
    if NOT(sString[i] = ' ') then
      result := result + sString[i];
end;

Function TUtil.newPassword(var sHashedPass : string; frmConfig : Password.Tstate) : boolean;
Var
  bChanged : boolean;
begin
  bChanged := false;
  result := true;

  // Create dynamic form
  frmPassword := TfrmPassword.Create(nil);
  with frmPassword do begin
    setState(frmConfig);
    Show;

    while NOT((bChanged = true) OR (getState = canceled)) do begin
      // Wait for user to trigger cancel or ok button event to update state
      while NOT(getstate IN [done,canceled]) do begin
        Application.ProcessMessages;
        sleep(10);
      end;
      if getState = canceled then
        break;
      if frmConfig = changePass then begin
        if checkChangePass then begin
          sHashedPass := hash(edtNewPass.Text);
          bChanged := true;
        end else
          setState(frmConfig);
      end;
      if frmConfig = newPass then
        if checkNewPass then begin
          sHashedPass := hash(edtNewPass.Text);
          bChanged := true;
        end else
          setState(frmConfig);
    end;

    if getstate = canceled then
      result := false;

    // free form object after use
    free;
  end;
end;

procedure TUtil.error(sError: string);
begin
  MessageDlg(sError, mtError, [mbOK], 0);
end;

procedure TUtil.getPriv(var sPriv: string);
begin
  if MessageDlg('Is this user part of the HR department?', mtConfirmation, [mbNo,mbYes], 7) = 7 then
    sPriv := 'user'
  else
    sPriv := 'HR';
end;
end.
