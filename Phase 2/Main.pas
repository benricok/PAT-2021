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
    Procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure FormActivate(Sender: TObject);
    Procedure btnDBnavUPClick(Sender: TObject);
    Procedure btnDBnavDOWNClick(Sender: TObject);
    Procedure btnAddUserClick(Sender: TObject);
    Function validateUser(var sReason : string) : boolean;
    Procedure addUser(sUsername, sPriv, sHashedPass : string);
    Procedure genUsername(var sUsername : string);
    Procedure FormCreate(Sender: TObject);
    Procedure tbcMainChange(Sender: TObject);
    Function checkChar(var sReason : string; sInput, sMessage : string) : boolean;
    Procedure resetNewUser;
    Procedure loadEvents;
    procedure btnUserDelClick(Sender: TObject);
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
  sTFname : string;
begin
  sTFname := 'event.log';
  util.initFile(sTFname, tFile);
  redEvent.Clear;
  redEvent.lines.LoadFromFile(sTFname);
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
  resetNewUser;
end;

Procedure TfrmMain.btnAddUserClick(Sender: TObject);
Var
  sReason, sUsername, sHashedPass, sPriv : string;
begin
  // Pass referance to local varable for error responce
  if validateUser(sReason) then begin
    genUsername(sUsername);
    util.getPriv(sPriv);
    if util.newPassword(sHashedPass, newPass) then
      addUser(sUsername, sPriv, sHashedPass);
  end else
    util.error('Invaild User information:'+ #13 + sReason);
end;

Procedure TfrmMain.FormActivate(Sender: TObject);
begin
  // Reset form and DB
  tbcMain.TabIndex := 0;
  dbGridUsers.datasource := dsrTbl;
  tblUsers.First;

  // Get privilege form login form and configure user interface acordingly
  sPriv := Login.frmLogin.getPriv;
  if sPriv = 'user' then begin
    tbcMain.Pages[1].tabVisible := false;
    tbcMain.Pages[3].tabVisible := false;
    tbcMain.Pages[4].tabVisible := false;
  end else if sPriv = 'HR' then begin
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
  edtFullName.MaxLength := 40;
  edtSurname.MaxLength := 40;
  edtEmail.MaxLength := 40;
end;

procedure TfrmMain.tbcMainChange(Sender: TObject);
begin
  // Focus helper for user on tab change
  case tbcMain.ActivePageIndex of
    0: ;
    1: ;
    2: ;
    3: ;
    4: loadEvents;
    5: Login.frmLogin.logout; // Log user out on tab logout click
  end;
end;

Function TfrmMain.validateUser(var sReason : string) : boolean;
begin
  result := true;
  sReason := '';
  { | Check if rpgGender, edtFullname, edtSurname and edtEmail are Null
    | Check if edtFullname and edtSurname contain ivalid values
    | Return false if invalid characters are found
    | Set referanced varable (sReason) to applicable error message
    }
  if (edtEmail.Text = '') OR (edtFullname.Text = '') OR (edtSurname.Text = '') OR (rpgGender.ItemIndex = -1) then begin
    result := false;
    sReason := sReason + 'Some fields are empty'#13;
  end;
  if (checkChar(sReason, edtFullname.Text, 'Your fullname')) OR (checkChar(sReason, edtSurname.Text, 'Your surname')) then
    result := false
end;

function TfrmMain.checkChar(var sReason : string; sInput, sMessage : string): boolean;
Var
  i : integer;
  scInvalid : set of char;
begin
               {!  to , ;  . to @ ;  [ to ' ;  {  to  " }
  scInvalid := [#33..#44, #46..#64, #91..#96, #123..#126];
  result := false;
  for i := 1 to length(sInput) do
    if sInput[i] IN scInvalid then begin
      sReason := sReason + sMessage + ' contains invalid characters, reference help for valid characters'#13;
      result := true;
      break;
    end;
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
      Util.error('You cannot delete the admin user')
    else
    tblUsers.Delete;
  end;

end;

end.
