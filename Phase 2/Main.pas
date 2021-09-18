unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Grids, DBGrids, StdCtrls,
  ExtCtrls, Vcl.DBCtrls, Vcl.Buttons, DB;

type
  TfrmMain = class(TForm)
    tbcMain: TPageControl;
    tabDash: TTabSheet;
    tabHelp: TTabSheet;
    tabUserManagement: TTabSheet;
    tabChat: TTabSheet;
    tabLogout: TTabSheet;
    dbGridUsers: TDBGrid;
    dbNavUsers: TDBNavigator;
    edtFullname: TEdit;
    edtSurname: TEdit;
    pnlNewUser: TPanel;
    btnDBnavUP: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    btnDBnavDOWN: TBitBtn;
    rpgGender: TRadioGroup;
    btnAddUser: TBitBtn;
    lblNewUser: TLabel;
    edtEmail: TEdit;
    Procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure FormActivate(Sender: TObject);
    Procedure btnDBnavUPClick(Sender: TObject);
    Procedure btnDBnavDOWNClick(Sender: TObject);
    Procedure btnAddUserClick(Sender: TObject);
    Function validateUser(var sReason : string) : boolean;
    Procedure addUser;
    procedure FormCreate(Sender: TObject);
    procedure tbcMainChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses Login, DBUsers_u, Algorithms_u;

procedure TfrmMain.addUser;
begin
//
end;

Procedure TfrmMain.btnAddUserClick(Sender: TObject);
Var
  sReason : string;
begin
  // Pass referance to local varable for error responce
  if validateUser(sReason) then
    addUser
  else
    MessageDlg('Invaild User information:'+ #13 + sReason, mtError, [mbOK], 0);
end;

Procedure TfrmMain.btnDBnavDOWNClick(Sender: TObject);
begin
  tblUsers.Next;
end;

Procedure TfrmMain.btnDBnavUPClick(Sender: TObject);
begin
  tblUsers.Prior;
end;

Procedure TfrmMain.FormActivate(Sender: TObject);
begin
  // Reset form and DB
  tbcMain.TabIndex := 0;
  dbGridUsers.datasource := dsrTbl;
  tblUsers.First;

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
  case tbcMain.TabIndex of
    0: ;
    1: ;
    2: ;
    3: pnlNewUser.SetFocus;
    4: Login.frmLogin.logout; // Log user out on tab logout click
  end;
end;

Function TfrmMain.validateUser(var sReason : string) : boolean;
Var
  i, j : integer;
  scInvalid : set of char;
begin
  result := true;
               {!  to , ;  . to @ ;  [ to ' ;  {  to  " }
  scInvalid := [#33..#44, #46..#64, #91..#96, #123..#126];
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
  for i := 1 to length(edtFullname.Text) do
    if edtFullname.Text[i] IN scInvalid then begin
      sReason := sReason + 'Fullname contains invalid characters, referance help for valid characters'#13;
      result := false;
      break;
    end;
  for j := 1 to length(edtSurname.Text) do
    if edtSurname.Text[j] IN scInvalid then begin
      sReason := sReason + 'Surname contains invalid characters, referance help for valid characters'#13;
      result := false;
      break;
    end;
end;

end.
