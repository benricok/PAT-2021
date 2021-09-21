unit util_u;

interface

uses SysUtils, System.Hash, Classes, Password, Vcl.Forms, Vcl.Dialogs;

type TUtil = class(TComponent)
  Function hash(sString : string) : string;
  Function noSpace(sString : string) : string;
  Function newPassword(var sHashedPass : string; frmConfig : Password.Tstate) : boolean;
  procedure getPriv(var sPriv: string);
  Procedure error(sError : string);
  Procedure initFile(sFileName : string; var tFile : Textfile);
  Procedure logevent(sEvent : string; iType : integer);
  Function ELFHash(const sKey : string) : String;
  Function swapChar(s : string; c, b : integer) : string;
  Function rotateLeft(sIn : string; p : integer) : string;
end;

Var
  Util : TUtil;

implementation
function TUtil.ELFHash(const sKey : string) : String;
Var
  iG, iTableSize, iHash : Int64;
  i : integer;
  sTemp : string;
begin
  iTableSize := 9952135015176462643; // Very large 64 bit prime number
  iHash := 0;
  for i := 1 to length(sKey) do begin
    iHash := (iHash shl 4) + ord(sKey[i]);
    iG := iHash and $F0000000;
      if (iG<>0) then
        iHash := iHash xor (iG shr 24) xor iG;
  end;

  sTemp := IntToStr(iHash mod iTableSize);
  // Duplicate string to give the char swapper function exsta playing field.
  sTemp := sTemp + sTemp;
  result := swapChar(sTemp, 3, 20);
end;

function TUtil.rotateLeft(sIn: string; p: integer): string;
begin
  result := sIn.Substring(p) + sIn.Substring(0, p);
end;

function TUtil.swapChar(s: string; c, b: integer): string;
Var
  iLen, f, r, i: integer;
  sP1, sP2, sTemp : string;
  cTemp : char;
begin
  iLen := s.Length;
  c := c mod iLen;

  if c = 0 then begin
    result := s;
    exit;
  end;

  f := Round(b / iLen);
  r := b mod iLen;

  sP1 := rotateLeft(s.Substring(0, c), ((iLen mod c) * f) mod c);
  sP2 := rotateLeft(s.Substring(c), ((c * f) mod (iLen -c)));

  sTemp := sP1 + sP2;

  for i := 1 to r do begin
    cTemp := sTemp[i];
    sTemp[i] := sTemp[(i+c) mod iLen];
    sTemp[(i + c) mod iLen] := cTemp;
  end;

  result := sTemp;

end;

Function TUtil.hash(sString : string) : string;
begin
// Hash password
  result := THashMD5.GetHashString(sString);
end;

// Assign file and check if it exist, else create it
procedure TUtil.initFile(sFileName: string; var tFile : Textfile);
begin
  AssignFile(tFile, sFileName);
  if NOT(FileExists(sFileName)) then
    Rewrite(tFile);
end;

//Event logger
procedure TUtil.logevent(sEvent: string; iType: integer);
Var
  tFile : TextFile;
begin
  initFile('event.log', tFile);
  Append(tFile);
  Writeln(tfile, sEvent);
  CloseFile(tFile);
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
          sHashedPass := ELFhash(edtNewPass.Text);
          bChanged := true;
        end else
          setState(frmConfig);
      end;
      if frmConfig = newPass then
        if checkNewPass then begin
          sHashedPass := ELFhash(edtNewPass.Text);
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
