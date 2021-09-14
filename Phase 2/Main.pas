unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Algorithms_u;

type
  TfrmMain = class(TForm)
    tbcMain: TPageControl;
    tabDash: TTabSheet;
    tabHelp: TTabSheet;
    tabUserManagement: TTabSheet;
    tabChat: TTabSheet;
    tabLogout: TTabSheet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tabLogoutEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses Login;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmMain.tabLogoutEnter(Sender: TObject);
begin
  Login.frmLogin.logout;
end;



end.
