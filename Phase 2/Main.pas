unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Grids, DBGrids, StdCtrls,
  ExtCtrls, Vcl.DBCtrls, Vcl.Buttons, DB, Math;

type
  TfrmMain = class(TForm)
    tbcMain: TPageControl;
    tabReport: TTabSheet;
    tabUserManagement: TTabSheet;
    tabViewReports: TTabSheet;
    tabLogout: TTabSheet;
    dbGridUsers: TDBGrid;
    edtFullname: TEdit;
    edtSurname: TEdit;
    pnlNewUser: TPanel;
    btnDBnavUP: TBitBtn;
    btnDBnavDOWN: TBitBtn;
    rpgGender: TRadioGroup;
    btnAddUser: TBitBtn;
    lblNewUser: TLabel;
    edtEmail: TEdit;
    tabLogs: TTabSheet;
    tabDash: TTabSheet;
    lblUserDash: TLabel;
    redEvent: TRichEdit;
    btnUserDel: TBitBtn;
    BitBtn1: TBitBtn;
    btnEnabled: TBitBtn;
    btnClearLog: TBitBtn;
    lblUsernameUser: TLabel;
    pnlMyInfoUser: TPanel;
    lblFullnameUser: TLabel;
    lblSurnameUser: TLabel;
    lblCellUser: TLabel;
    lblEmailuser: TLabel;
    lblHeadMyInfoUser: TLabel;
    edtFullnameDashUser: TEdit;
    edtSurnameDashUser: TEdit;
    edtCellDashUser: TEdit;
    edtEmailDashUser: TEdit;
    btnUserUpdate: TBitBtn;
    btnChangePasswordUser: TBitBtn;
    rpgGenderDashUser: TRadioGroup;
    lblUsernameDashUser: TLabel;
    edtCellphone: TEdit;
    lblHeadEnabled: TLabel;
    lblEnabled: TLabel;
    pnlGridControls: TPanel;
    memReportBody: TMemo;
    edtReportTitle: TEdit;
    lblHeadReport: TLabel;
    btnSubmitReport: TBitBtn;
    cbxSelectUserReport: TComboBox;
    edtUsersInReport: TEdit;
    lblHeadReportUsers: TLabel;
    btnAddUSerToReport: TBitBtn;
    btnReportUsersClear: TBitBtn;
    btnReportClearAll: TBitBtn;
    btnSortAlphaAZ: TButton;
    lblHeadSort: TLabel;
    btnSortAlphaZA: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure FormActivate(Sender: TObject);
    Procedure btnDBnavUPClick(Sender: TObject);
    Procedure btnDBnavDOWNClick(Sender: TObject);
    Procedure btnAddUserClick(Sender: TObject);
    Procedure addUser(sUsername, sPriv, sHashedPass : string);
    Procedure genUsername(var sUsername : string);
    Procedure FormCreate(Sender: TObject);
    Procedure tbcMainChange(Sender: TObject);
    Procedure resetNewUser;
    Procedure loadEvents;
    procedure btnUserDelClick(Sender: TObject);
    procedure btnClearLogClick(Sender: TObject);
    Procedure loadUserDash;
    procedure btnUserUpdateClick(Sender: TObject);
    procedure btnEnabledClick(Sender: TObject);
    procedure updateEnabledLbl;
    procedure BitBtn1Click(Sender: TObject);
    procedure dbGridUsersColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    Procedure loadReport;
    procedure btnAddUSerToReportClick(Sender: TObject);
    procedure btnReportUsersClearClick(Sender: TObject);
    procedure btnSubmitReportClick(Sender: TObject);
    procedure loadUsers;
    procedure btnReportClearAllClick(Sender: TObject);
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses Login, DBUsers_u, util_u, Password, Help;

procedure TfrmMain.genUsername(var sUsername: string);
begin
  { | Generate new username and set it to the passed referance varable:
    | First character of the user's Fullname
    | Add surname without spaces
    | Add a Random number between 1000 and 9999
    }
  Randomize;
  sUsername := LowerCase(edtFullname.Text[1] + util.noSpace(edtSurname.Text)) + IntToStr(RandomRange(1000, 10000));
end;

procedure TfrmMain.loadEvents;
Var
  tFile : Textfile;
  sLine, sDateTime, sType : string;
  iPos, iLen, iTotChar : integer;
  cType : char;
begin
  util.initFile('event.log', tFile);
  Reset(tFile);
  iTotChar := 1;
  while NOT(EOF(tFile)) do begin
    Readln(tFile, sLine);
    iLen := length(sLine)+2;
    iPos := Pos(';', sLine);
    sDateTime := Copy(sLine, 1, iPos-1);
    Delete(sLine, 1, iPos);
    ctype := sLine[3];
    iPos := Pos(';', sLine);
    sType := Copy(sLine, 1, iPos-1);
    Delete(sLine, 1, iPos);

    with redEvent do begin
      case cType of
        'E': begin
          selStart := iTotChar+1;
          selLength := iLen;
          selAttributes.Color := clGray;
          selText := sDateTime + ' ';
          selAttributes.Color := clRed;
          selText := sType + ' ';
          SelAttributes.Color := clWindowText;
          selText := sLine + #13#10;
          iTotChar := iTotChar + iLen;
        end;
        'I': begin
          selStart := iTotChar+1;
          selLength := iLen;
          selAttributes.Color := clGray;
          selText := sDateTime + ' ';
          selAttributes.Color := clBlue;
          selText := sType + ' ';
          SelAttributes.Color := clWindowText;
          selText := sLine + #13#10;
          iTotChar := iTotChar + iLen;
        end;
        'W': begin
          selStart := iTotChar+1;
          selLength := iLen;
          selAttributes.Color := clGray;
          selText := sDateTime + ' ';
          selAttributes.Color := clWebDarkOrange;
          selText := sType + ' ';
          SelAttributes.Color := clWindowText;
          selText := sLine + #13#10;
          iTotChar := iTotChar + iLen;
        end;
      end;
    end;
  end;
  CloseFile(tFile);
  //redEvent.lines.LoadFromFile(sTFname);
end;

procedure TfrmMain.loadReport;
begin
  memReportBody.Clear;
  edtReportTitle.Clear;

  loadUsers;
end;

procedure TfrmMain.loadUserDash;
begin
  with frmLogin.getUser do begin
    lblUsernameDashUser.Caption := username;
    edtFullnameDashUser.Text := fullname;
    edtSurnameDashUser.Text := surname;
    edtEmailDashUser.Text := email;
    edtCellDashUser.Text := cellphone;
    case gender of
      'M': rpgGenderDashUser.ItemIndex := 0;
      'F': rpgGenderDashUser.ItemIndex := 1;
      'N': rpgGenderDashUser.ItemIndex := -1;
    end;
  end;
end;

procedure TfrmMain.loadUsers;
Var
  arrUsers : array of TUser;
  i : integer;
begin
  cbxSelectUserReport.Items.Clear;
  edtUsersInReport.Clear;

  SetLength(arrUsers, tblUsers.RecordCount);
  util.importUsers(arrUsers);
  for i := 0 to length(arrUsers)-1 do
      cbxSelectUserReport.Items.Append(arrUsers[i].fullname + ' ' + arrUsers[i].surname);
end;

procedure TfrmMain.btnUserUpdateClick(Sender: TObject);
Var
  newUser : TUser;
  sReason : string;
begin
  if util.validateUserNames(sReason, edtFullnameDashUser.Text, edtSurnameDashUser.Text) AND
     util.cellValid(sReason, edtCellDashUser.Text) then
  with newUser do begin
    username := frmLogin.getUser.username;
    fullname := edtFullnameDashUser.Text;
    surname := edtSurnameDashUSer.Text;
    email := edtEmailDashUser.Text;
    cellphone := edtCellDashUSer.Text;
    privilege := frmlogin.getUser.privilege;
    enabled := frmLogin.getUser.enabled;
      tblUsers.Open;
      tblUsers.Locate('Username', username, [loCaseInsensitive]);
      tblUserInfo.RecNo := tblUsers.RecNo;
      tblUsers.Edit;
      tblUserinfo.Edit;
        util.writeUser(newUser);
      tblUsers.Post;
      tblUserInfo.Post;
    util.logevent('User ' + username + ' was updated', TEventType.info);
    frmLogin.logout; // For security reasons we log out to refresh information
  end else
    util.error(sReason, false);
end;


procedure TfrmMain.dbGridUsersColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  tblUsers.RecNo := tblUserInfo.RecNo;
end;

procedure TfrmMain.resetNewUser;
begin
  edtFullname.Clear;
  edtSurname.Clear;
  edtEmail.Clear;
  edtCellphone.Clear;
  rpgGender.ItemIndex := -1;
  tbcMain.ActivePageIndex := 3;
end;

procedure TfrmMain.addUser(sUsername, sPriv, sHashedPass : string);
Var
  newUser : util_u.TUser;
begin
  with newUser do begin
    username := sUsername;
    privilege := sPriv;
    fullname := edtFullname.Text;
    surname := edtSurname.Text;
    gender := rpgGender.Items[rpgGender.ItemIndex][1];
    email := edtEmail.Text;
    cellphone := edtCellphone.Text;
    enabled := true;
  end;
  tblUsers.Open;
  tblUserInfo.Open;
  tblUsers.Last;
  tblUserInfo.Last;
  tblUserInfo.Insert;
  tblUsers.Insert;
    util.writeUser(newUser);
    tblUsers['HashedPASS'] := sHashedPass;
  tblUsers.Post;
  tblUserInfo.Post;
  Util.logevent('New user ' + sUsername + ' added.', TEventType.info); // Log event as info type (2)
  resetNewUser;
end;

procedure TfrmMain.BitBtn1Click(Sender: TObject);
begin
  frmHelp.show;
end;

Procedure TfrmMain.btnAddUserClick(Sender: TObject);
Var
  sReason, sUsername, sHashedPass, sPriv : string;
begin
  // Pass referance to local varable for error responce
  if (util.validateUserNames(sReason, edtFullname.Text, edtSurname.Text)) AND
     (util.cellValid(sReason, edtCellphone.Text)) AND (util.checkGender(sReason, rpgGender.ItemIndex)) then begin
    genUsername(sUsername);
    util.getPriv(sPriv);
    if util.newPassword(sHashedPass, newPass) then
      addUser(sUsername, sPriv, sHashedPass);
  end else
    util.error('Invaild User information:'+ #13 + sReason, false);
end;

procedure TfrmMain.btnAddUSerToReportClick(Sender: TObject);
Var
  sSpacer, sUser, sEdit : string;
begin
  sSpacer := ', ';
  sEdit := edtUsersInReport.Text;
  sUser := cbxSelectUserReport.Items[cbxSelectUserReport.ItemIndex];
  if cbxSelectUserReport.ItemIndex <> -1 then
    if Copy(sUser, 1, 7) <> '<added>' then begin
      if sEdit = '' then
        sSpacer := '';
      edtUsersInReport.Text := sEdit + sSpacer + sUser;
      cbxSelectUserReport.Items[cbxSelectUserReport.ItemIndex] := '<added> ' + sUser;
    end else
      util.error('You already added this user, please select a diffrent one', false)
  else
    util.error('Please select a user', false);

  cbxSelectUserReport.ItemIndex := -1;
  cbxSelectUserReport.SetFocus;
end;

procedure TfrmMain.btnClearLogClick(Sender: TObject);
Var
  tFile : TextFile;
begin
  if MessageDlg('Are you sure you want to clear the event log?', mtConfirmation, [mbYes,mbCancel], 2) = 6 then begin
    DeleteFile('event.log');
    Util.initFile('event.log', tFile);
    Util.logevent('Event log was cleared', TEventType.warning);
    CloseFile(tFile);
    redEvent.Clear;
  end;
end;

Procedure TfrmMain.FormActivate(Sender: TObject);
begin
  // Reset form and DB
  tbcMain.TabIndex := 0;
  dbGridUsers.datasource := dsrTbl;
  tblUsers.First;

  // Get privilege form login form and configure user interface acordingly
  if frmLogin.getUser.privilege = 'user' then with tbcMain do begin
    tbcMain.Pages[0].tabVisible := true; // Dashboard
    tbcMain.Pages[1].tabVisible := true; // Report
    tbcMain.Pages[2].tabVisible := false; // View Report
    tbcMain.Pages[3].tabVisible := false; // User management
    tbcMain.Pages[4].tabVisible := false; // Event logger
    loadUserDash;
  end else if frmLogin.getUser.privilege = 'HR' then with tbcMain do begin
    tbcMain.Pages[0].tabVisible := true; // Dashboard
    tbcMain.Pages[1].tabVisible := true; // Report
    tbcMain.Pages[2].tabVisible := true; // View Report
    tbcMain.Pages[3].tabVisible := false; // User management
    tbcMain.Pages[4].tabVisible := false; // Event logger
    loadUserDash;
  end else if frmLogin.getUser.privilege = 'admin' then with tbcMain do begin
    tbcMain.Pages[0].tabVisible := true; // Dashboard
    tbcMain.Pages[1].tabVisible := true; // Report
    tbcMain.Pages[2].tabVisible := true; // View Report
    tbcMain.Pages[3].tabVisible := true; // User management
    tbcMain.Pages[4].tabVisible := true; // Event logger
    loadUserDash;
  end;
end;

Procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Application.Terminate;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  // Set max input length for edt boxes (equal to DB field limit)
  edtFullName.MaxLength := 25;
  edtSurname.MaxLength := 25;
  edtEmail.MaxLength := 30;
  edtCellDashUser.MaxLength := 11;
  edtCellphone.MaxLength := 11;
  edtFullnameDashUser.MaxLength := 25;
  edtSurnameDashUSer.MaxLength := 25;
  edtEmailDashUSer.MaxLength := 30;
end;

procedure TfrmMain.tbcMainChange(Sender: TObject);
begin
  // Focus helper for user on tab change
  case tbcMain.ActivePageIndex of
    0: loadUserDash;
    1: loadReport;
    2: ;
    3: updateEnabledLbl;
    4: loadEvents;
    5: Login.frmLogin.logout; // Log user out on tab logout click
  end;
end;

procedure TfrmMain.updateEnabledLbl;
begin
 if tblUsers['Enabled'] = True then
    lblEnabled.Caption := 'Enabled'
  else
    lblEnabled.Caption := 'Disabled';
end;

// TODO check email and gender
Procedure TfrmMain.btnDBnavDOWNClick(Sender: TObject);
begin
  tblUserInfo.Next;
  tblUsers.RecNo := tblUserInfo.RecNo;
  updateEnabledLbl;
end;

Procedure TfrmMain.btnDBnavUPClick(Sender: TObject);
begin
  tblUserInfo.Prior;
  tblUsers.RecNo := tblUserInfo.RecNo;
  updateEnabledLbl;
end;

procedure TfrmMain.btnEnabledClick(Sender: TObject);
begin
  if NOT(tblUsers['Username'] = 'admin') then
    if NOT(tblUsers['Username'] = frmLogin.getUser.username) then begin
    tblUsers.Open;
    tblUsers.Edit;
    if tblUsers['Enabled'] = True then
      tblUsers['Enabled'] := False
    else
      tblUsers['Enabled'] := True;
    tblUsers.Post;
    updateEnabledLbl;
    end else
      util.error('You cannot disable your own user', false)
  else
    util.error('You cannot disable the admin user', false);
end;

procedure TfrmMain.btnReportClearAllClick(Sender: TObject);
begin
  loadReport;
end;

procedure TfrmMain.btnReportUsersClearClick(Sender: TObject);
begin
  loadUsers;
end;

procedure TfrmMain.btnSubmitReportClick(Sender: TObject);
Var
  tFile : TextFile;
  i : integer;
begin
  if MessageDlg('Are you sure you want to delete the user?', mtConfirmation, [mbYes,mbCancel], 2) <> 6 then
    exit;

  util.initFile('Reports.txt', tFile);
  Append(tFile);
    Writeln(tFile, '*-*-*-*');
    Writeln(tFile, edtReportTitle.Text);
    Writeln(tFile, edtUsersInReport.Text);
    for i := 0 to memReportBody.Lines.Count do
      Writeln(tFile, memReportBody.Lines[i]{.ValueFromIndex[i]} );
  CloseFile(tFile);

  MessageDlg('Your report have been successfully submited.', mtInformation, [mbOK], 2);
  util.logevent('User ' + frmlogin.getUser.username + ' created a report', TEventType.info);

  loadReport;
end;

procedure TfrmMain.btnUserDelClick(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to delete the user?', mtConfirmation, [mbYes,mbCancel], 2) <> 6 then
    exit;
  // Check if admin user is selected and throw error
  if tblUserInfo['Username'] = 'admin' then
    Util.error('You cannot delete the admin user', false)
  else if tblUserInfo['Username'] = frmLogin.getUser.username then
    Util.error('You cannot delete your own user', false)
  else begin
    tblUsers.RecNo := tblUserInfo.RecNo;
    tblUserInfo.Delete;
    tblUsers.Delete;
  end;

end;

end.
