unit util_u;

interface

uses SysUtils, System.Hash, Classes, Password, Vcl.Forms, Vcl.Dialogs, System.Variants;

type
  Tsc = set of char;
  TUser = record
    username : string[20];
    fullname : string[25];
    surname : string[25];
    gender : char;
    email : string[30];
    privilege : string[5];
    enabled : boolean;
    cellPhone : string[11];
  end;
  TUtil = class(TComponent)
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
    Function cellValid(var sReason : string; const cellNr : string) : boolean;
    Function checkChar(var sReason : string; sInput, sMessage : string; scInvalid : Tsc): boolean;
    Function validateUserNames(var sReason : string; sFullname, sSurname : string) : boolean;
    Procedure writeUser(const user : TUser);
    Procedure readUser(var user : TUser);
    function checkGender(var sReason : string; iIndex : integer): boolean;
    Var
      const
        scInvalidNames : Tsc = [#33..#44, #46..#64, #91..#96, #123..#126];
                               {!  to , ;  . to @ ;  [ to ' ;  {  to  " }
  end;

Var
  Util : TUtil;

implementation

Uses DBUsers_u;

function TUtil.checkGender(var sReason : string; iIndex : integer): boolean;
begin
  // Check if gender is selected
  result := true;
  if iIndex = -1 then
    result := false;
  sReason := sReason + 'No gender were selected';
end;

Procedure TUtil.readUser(var user : TUser);
Var
  sGender : string;
begin
  with user do begin
    tblUserInfo.recNo := tblUsers.RecNo;
    username := tblUsers['Username'];
    privilege := tblUsers['Privilege'];
    enabled := tblUsers['Enabled'];
    if NOT(tblUserInfo['Fullname'] = '') then
      fullname := tblUserInfo['Fullname']
    else
      fullname := 'N/A';
    if NOT(tblUserInfo['Surname'] = '') then
      Surname := tblUserInfo['Surname']
    else
      Surname := 'N/A';
    if NOT(tblUserInfo['Cellphone'] = '') then
      Cellphone := tblUserInfo['Cellphone']
    else
      Cellphone := 'N/A';
    if NOT(tblUserInfo['Gender'] = '') then begin
      sGender := tblUserInfo['Gender'];
      gender := sGender[1]; // Why doesn't activeUser.gender := tblUserInfo['Gender'][1]; work???
    end else
      gender := 'N';
    if NOT(tblUserInfo['Email'] = '') then
      email := tblUserInfo['Email']
    else
      email := 'N/A';
  end;
end;

Procedure TUtil.writeUser(const user : Tuser);
begin
  with user do begin
    tblUsers['Username'] := username;
    tblUserInfo['Username'] := username;
    tblUsers['Privilege'] := privilege;
    if NOT(fullname = 'N/A') then
      tblUserInfo['Fullname'] := fullname
    else
      tblUserInfo['Fullname'] := Null;
    if NOT(surname = 'N/A') then
      tblUserInfo['Surname'] := surname
    else
      tblUserInfo['Surname'] := Null;
    if NOT(cellPhone = 'N/A') then
      tblUserInfo['CellPhone'] := cellPhone
    else
      tblUserInfo['CellPhone'] := Null;
    if NOT(tblUserInfo['Gender'] = 'N') then
      tblUserInfo['Gender'] := gender
    else
      tblUserInfo['Gender'] := Null;
    if NOT(tblUserInfo['Email'] = 'N/A') then
      tblUserInfo['Email'] := email
    else
      tblUserInfo['Email'] := Null;
    tblUsers['Enabled'] := enabled;
  end;
end;

function TUtil.cellValid(var sReason : string; const cellNr: string): boolean;
begin
  // Validate cell number
  if cellNr = 'N/A' then
    result := true
  else
    result := checkchar(sReason, cellNr, 'Your cellphone number may only contain numerical values' + #13, ['0'..'9']);
end;

Function TUtil.checkChar(var sReason : string; sInput, sMessage : string; scInvalid : Tsc): boolean;
Var
  i : integer;
begin
  //             {!  to , ;  . to @ ;  [ to ' ;  {  to  " }
  //scInvalid := [#33..#44, #46..#64, #91..#96, #123..#126];
  result := false;
  for i := 1 to length(sInput) do
    if sInput[i] IN scInvalid then begin
      sReason := sReason + sMessage;
      result := true;
      break;
    end;
end;

Function TUtil.validateUserNames(var sReason : string; sFullname, sSurname : string) : boolean;
var
  sError : string;
begin
  result := true;
  sReason := '';
  sError := ' contains invalid characters, reference help for valid characters'#13;
  if (sFullname = '') OR (sSurname = '') then begin
    result := false;
    sReason := sReason + 'Some fields are empty'#13;
  end;
  if (util.checkChar(sReason, sFullname, 'Your fullname' + sError, util.scInvalidNames)) OR
     (util.checkChar(sReason, sSurname, 'Your surname' + sError, util.scInvalidNames)) then
    result := false
end;

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
