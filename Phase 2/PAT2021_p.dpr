program PAT2021_p;

uses
  Vcl.Forms,
  Login in 'Login.pas' {frmLogin},
  Main in 'Main.pas' {frmMain},
  DBUsers_u in 'DBUsers_u.pas',
  util_u in 'util_u.pas',
  Password in 'Password.pas' {frmPassword},
  Algorithms_u in 'Algorithms_u.pas',
  Vcl.Themes,
  Vcl.Styles,
  Help in 'Help.pas' {frmHelp};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmHelp, frmHelp);
  //Application.CreateForm(TfrmPassword, frmPassword);
  Application.Run;
end.
