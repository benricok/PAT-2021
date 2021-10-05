unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Grids, DBGrids, StdCtrls,
  ExtCtrls, Vcl.DBCtrls, Vcl.Buttons, DB, Math;

type
  TfrmMain = class(TForm)
    tbcMain: TPageControl;
    tabDash: TTabSheet;
    tabUserManagement: TTabSheet;
    tabChat: TTabSheet;
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
    tabUserDash: TTabSheet;
    lblHRDash: TLabel;
    lblUserDash: TLabel;
    Button1: TButton;
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
    edtUserDashUser: TEdit;
    edtFullnameDashUser: TEdit;
    edtSurnameDashUser: TEdit;
    edtCellDashUser: TEdit;
    edtEmailDashUser: TEdit;
    btnUserUpdate: TBitBtn;
    btnChangePasswordUser: TBitBtn;
    rpgGenderDashUser: TRadioGroup;
    Procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure FormActivate(Sender: TObject);
    Procedure btnDBnavUPClick(Sender: TObject);
    Procedure btnDBnavDOWNClick(Sender: TObject);
    Procedure btnAddUserClick(Sender: TObject);
    Function validateUserNames(var sReason : string; sFullname, sSurname : string) : boolean;
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
  private
    sPriv : string;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses Login, DBUsers_u, util_u, Password;

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
  iTotChar := 0;
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
      end;
    end;
  end;
  CloseFile(tFile);
  //redEvent.lines.LoadFromFile(sTFname);
end;

procedure TfrmMain.loadUserDash;
begin
  with frmLogin.getUser do begin
    edtUserDashUser.Text := username;
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

procedure TfrmMain.btnUserUpdateClick(Sender: TObject);
Var
  newUser : TUser;
  sReason : string;
begin
  if validateUserNames() AND util.cellValid(edtCellDashUser.Text) do
  with newUser do begin
    username := frmLogin.getUser.username;
    fullname := edtFullnameDashUser.Text;
    surname := edtSurnameDashUSer.Text;
    email := edtEmailDashUser.Text;
    cellphone := edtCellDashUSer.Text;

  end;
  loadUserDash;
end;

procedure TfrmMain.resetNewUser;
begin
  edtFullname.Clear;
  edtSurname.Clear;
  edtEmail.Clear;
  rpgGender.ItemIndex := -1;
  tbcMain.ActivePageIndex := 3;
end;

procedure TfrmMain.addUser(sUsername, sPriv, sHashedPass : string);
begin
  tblUsers.Open;
  tblUsers.Last;
  tblUsers.Insert;
    tblUsers['Username'] := sUsername;
    tblUsers['HashedPASS'] := sHashedPass;
    tblUsers['Privilege'] := sPriv;
    tblUsers['Fullname'] := edtFullName.Text;
    tblUsers['Surname'] := edtSurname.Text;
    tblUsers['Gender'] := rpgGender.Items[rpgGender.ItemIndex][1];
    tblUsers['Email'] := edtEmail.Text;
  tblUsers.Post;
  Util.logevent('New user ' + sUsername + ' added.', 2);
  resetNewUser;
end;

Procedure TfrmMain.btnAddUserClick(Sender: TObject);
Var
  sReason, sUsername, sHashedPass, sPriv : string;
begin
  // Pass referance to local varable for error responce
  if validateUserNames(sReason) then begin
    genUsername(sUsername);
    util.getPriv(sPriv);
    if util.newPassword(sHashedPass, newPass) then
      addUser(sUsername, sPriv, sHashedPass);
  end else
    util.error('Invaild User information:'+ #13 + sReason, false);
end;

procedure TfrmMain.btnClearLogClick(Sender: TObject);
Var
  tFile : TextFile;
begin
  if MessageDlg('Are you sure you want to clear the event log?', mtConfirmation, [mbYes,mbCancel], 2) = 6 then begin
    DeleteFile('event.log');
    Util.initFile('event.log', tFile);
    Util.logevent('Event log was cleared', 2);
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
  if frmLogin.getUser.privilege = 'user' then begin
    tbcMain.Pages[1].tabVisible := false;
    tbcMain.Pages[3].tabVisible := false;
    tbcMain.Pages[4].tabVisible := false;
  end else if frmLogin.getUser.privilege = 'HR' then begin
    tbcMain.Pages[0].tabVisible := false;
    tbcMain.Pages[4].tabVisible := false;
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
end;

procedure TfrmMain.tbcMainChange(Sender: TObject);
begin
  // Focus helper for user on tab change
  case tbcMain.ActivePageIndex of
    0: loadUserDash;
    1: ;
    2: ;
    3: ;
    4: loadEvents;
    5: Login.frmLogin.logout; // Log user out on tab logout click
  end;
end;

//TODO check email and gender

Function TfrmMain.validateUserNames(var sReason : string; sFullname, sSurname : string) : boolean;
var
  sError : string;
begin
  result := true;
  sReason := '';
  sError := ' contains invalid characters, reference help for valid characters'#13;
  { | Check if rpgGender, edtFullname, edtSurname and edtEmail are Null
    | Check if edtFullname and edtSurname contain ivalid values
    | Return false if invalid characters are found
    | Set referanced varable (sReason) to applicable error message
    }
  if (sFullname = '') OR (sSurname = '') then begin
    result := false;
    sReason := sReason + 'Some fields are empty'#13;
  end;
  if (util.checkChar(sReason, edtFullname.Text, 'Your fullname' + sError, util.scInvalidNames)) OR
     (util.checkChar(sReason, edtSurname.Text, 'Your surname' + sError, util.scInvalidNames)) then
    result := false
end;

Procedure TfrmMain.btnDBnavDOWNClick(Sender: TObject);
begin
  tblUsers.Next;
end;

Procedure TfrmMain.btnDBnavUPClick(Sender: TObject);
begin
  tblUsers.Prior;
end;

procedure TfrmMain.btnUserDelClick(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to delete the user?', mtConfirmation, [mbYes,mbCancel], 2) = 6 then begin
    // Check if admin user is selected and throw error
    if tblUsers['Username'] = 'admin' then
      Util.error('You cannot delete the admin user', false)
    else
    tblUsers.Delete;
  end;
end;



end.
