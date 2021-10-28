unit util_u;

interface

uses SysUtils, Classes, Password, Vcl.Forms, Vcl.Dialogs, System.Variants;

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
  TEventType = (error, info, warning);
  TUtil = class(TComponent)
    Function noSpace(sString : string) : string;
    Function newPassword(var sHashedPass : string; frmConfig : Password.Tstate) : boolean;
    procedure getPriv(var sPriv: string);
    procedure error(sError: string; log : boolean);
    Procedure initFile(const sFileName : string; var tFile : Textfile);
    Procedure logevent(sEvent : string; EventType: TEventType);
    Procedure deleteFile(const sFileName : string);
    Function cellValid(var sReason : string; const cellNr : string) : boolean;
    Function checkChar(var sReason : string; sInput, sMessage : string; scInvalid : Tsc): boolean;
    Function validateUserNames(var sReason : string; sFullname, sSurname : string) : boolean;
    Procedure writeUser(const user : TUser);
    Procedure readUser(var user : TUser);
    Procedure warn(sWarn : string; log : boolean);
    function checkGender(var sReason : string; iIndex : integer): boolean;
    Procedure importUsers(var arrUsers : array of TUser);
    Var
      const
        scInvalidNames : Tsc = [#33..#44, #46..#64, #91..#96, #123..#126];
                               {!  to , ;  . to @ ;  [ to ' ;  {  to  " }
  end;

Var
  Util : TUtil;

implementation

Uses DBUsers_u, Algorithms_u;


// -----------------------------------------------------------------------------
//
//  Copyright (C) 2021  Benrico Krog
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU Affero General Public License as published
//  by the Free Software Foundation version 3 of the License.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Affero General Public License for more details.
//
//  You should have received a copy of the GNU Affero General Public License
//  along with this program.  If not, see <https://www.gnu.org/licenses/>
//
// -----------------------------------------------------------------------------

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

Procedure TUtil.importUsers(var arrUsers : array of TUser);
Var
  i : integer;
  tempUser : Tuser;
begin
  // import users
  tblUsers.Open;
  tblUserInfo.Open;
  tblUsers.First;
  tblUserInfo.First;
    for i := 1 to tblUsers.RecordCount do begin
      readUser(tempUser);
      arrUsers[i-1] := tempUser;
      tblUsers.Next;
      tblUserInfo.Next;
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

// Assign file and check if it exist, else create it
procedure TUtil.initFile(const sFileName: string; var tFile : Textfile);
begin
  AssignFile(tFile, sFileName);
  if NOT(FileExists(sFileName)) then
    Rewrite(tFile);
end;

//Event logger
procedure TUtil.logevent(sEvent: string; EventType: TEventType);
Var
  tFile : TextFile;
begin
  initFile('event.log', tFile);
  Append(tFile);
  case EventType of
    {error} TEventType.error: Writeln(tfile, DateToStr(Now) + ' ' + TimeToStr(Now) + ';[ Error ];' + sEvent);
    {info} TEventType.info: Writeln(tfile, DateToStr(Now) + ' ' + TimeToStr(Now) + ';[ Info ];' + sEvent);
    {warning} TEventType.warning: Writeln(tfile, DateToStr(Now) + ' ' + TimeToStr(Now) + ';[ Warning ];' + sEvent);
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
    frmPassword.setState(frmConfig);
    Show;

    while NOT((bChanged = true) OR (frmPassword.getState = canceled)) do begin
      // Wait for user to trigger 'Cancel' or 'Ok' button event to update state
      while NOT(frmPassword.getstate IN [done,canceled]) do begin
        Application.ProcessMessages;
        sleep(10);
      end;
      // If Cancel is pressed
      if frmPassword.getState = canceled then
        break;

      // Check new password entered and update referanced varable sHashedPassword
      if frmConfig = changePass then begin
        if checkChangePass then begin
          sHashedPass := Crypt.ELFhash(edtNewPass.Text);
          bChanged := true;
        end else
          frmPassword.setState(frmConfig);
      end else if frmConfig = newPass then
        if checkNewPass then begin
          sHashedPass := Crypt.ELFhash(edtNewPass.Text);
          bChanged := true;
        end else
          frmPassword.setState(frmConfig);
    end;

    if frmPassword.getstate = canceled then
      result := false;

    // free form object after use
    free;
  end;
end;

procedure TUtil.error(sError: string; log : boolean);
begin
  MessageDlg(sError, mtError, [mbOK], 0);
  if log then
    logevent(sError, TEventType.error); // Log event in event logger
end;

Procedure TUtil.warn(sWarn : string; log : boolean);
begin
  MessageDlg(sWarn, mtWarning, [mbOK], 0);
  if log then
    logevent(sWarn, TEventType.warning); // Log event in event logger
end;

procedure TUtil.getPriv(var sPriv: string);
begin
  if MessageDlg('Is this user part of the HR department?', mtConfirmation, [mbNo,mbYes], 7) = 7 then
    sPriv := 'user'
  else
    sPriv := 'HR';
end;
end.
