unit util_u;

interface

uses SysUtils, System.Hash, Classes, Password, Vcl.Forms, Vcl.Dialogs;

type TUtil = class(TComponent)
  Function hash(sString : string) : string;
  Function noSpace(sString : string) : string;
  Function newPassword(var sHashedPass : string; frmConfig : Password.Tstate) : boolean;
  procedure getPriv(var sPriv: string);
  procedure error(sError: string; log : boolean);
  Procedure initFile(const sFileName : string; var tFile : Textfile);
  Procedure logevent(sEvent : string; iType : integer);
  Function ELFHash(const sKey : string) : String;
  Function swapChar(s : string; c, b : integer) : string;
  Function rotateLeft(sIn : string; p : integer) : string;
  Procedure deleteFile(const sFileName : string);
end;

Var
  Util : TUtil;

implementation

procedure TUtil.deleteFile(const sFileName: string);
begin
  // First check if file exist, then procede with deleting the file
  if FileExists(sFileName) then
    DeleteFile(sFileName)
  else
    error(sFileName + ' does not exist', false);
end;

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
{ | Rotating a string p times left is effectively cutting
  | the first p characters and placing them at the end
  }
  result := sIn.Substring(p) + sIn.Substring(0, p);
end;

function TUtil.swapChar(s: string; c, b: integer): string;
Var
  iLen, f, r, i: integer;
  sP1, sP2, sTemp : string;
  cTemp : char;
begin
  iLen := s.Length;
  // If c is larger or equal to the length of the string is effectively the
  // remainder of c divided by the length of the string
  c := c mod iLen;

  if c = 0 then begin
    // No change will happen
    result := s;
    exit;
  end;

  f := Round(b / iLen);
  r := b mod iLen;

  // Rotate first c characters by (n % c) places f times
  sP1 := rotateLeft(s.Substring(0, c), ((iLen mod c) * f) mod c);
  // Rotate remaining character by (n * f) places
  sP2 := rotateLeft(s.Substring(c), ((c * f) mod (iLen -c)));

  // Concatenate the two parts and convert the resultant string
  // formed after f full iterations to a string array (for final swaps)
  sTemp := sP1 + sP2;

  // Remaining swaps
  for i := 1 to r do begin
    // Swap ith character with (i + c)th character
    cTemp := sTemp[i];
    sTemp[i] := sTemp[(i+c) mod iLen];
    sTemp[(i + c) mod iLen] := cTemp;
  end;
  // Return final string
  result := sTemp;
end;

Function TUtil.hash(sString : string) : string;
begin
  // Hash password
  result := THashMD5.GetHashString(sString);
end;

// Assign file and check if it exist, else create it
procedure TUtil.initFile(const sFileName: string; var tFile : Textfile);
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
  case iType of
    {error}1: Writeln(tfile, DateToStr(Now) + ' ' + TimeToStr(Now) + ';[ Error ];' + sEvent);
    {info} 2: Writeln(tfile, DateToStr(Now) + ' ' + TimeToStr(Now) + ';[ Info ];' + sEvent);
  end;
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
      // Wait for user to trigger 'Cancel' or 'Ok' button event to update state
      while NOT(getstate IN [done,canceled]) do begin
        Application.ProcessMessages;
        sleep(10);
      end;
      // If Cancel is pressed
      if getState = canceled then
        break;

      // Check new password entered and update referanced varable sHashedPassword
      if frmConfig = changePass then begin
        if checkChangePass then begin
          sHashedPass := ELFhash(edtNewPass.Text);
          bChanged := true;
        end else
          setState(frmConfig);
      end else if frmConfig = newPass then
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

procedure TUtil.error(sError: string; log : boolean);
begin
  MessageDlg(sError, mtError, [mbOK], 0);
  if log then
    logevent(sError, 1); // Log event in event logger
end;

procedure TUtil.getPriv(var sPriv: string);
begin
  if MessageDlg('Is this user part of the HR department?', mtConfirmation, [mbNo,mbYes], 7) = 7 then
    sPriv := 'user'
  else
    sPriv := 'HR';
end;
end.