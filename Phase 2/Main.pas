unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Algorithms_u, Grids, DBGrids, StdCtrls,
  ExtCtrls, ComCtrls, Data.DB, Vcl.DBCtrls;

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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses Login, DBUsers_u;

procedure TfrmMain.FormActivate(Sender: TObject);
begin
  tbcMain.TabIndex := 0;
end;



procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Application.Terminate;
end;

end.
