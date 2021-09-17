unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Algorithms_u, Grids, DBGrids, StdCtrls,
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
    edtName: TEdit;
    edtSurname: TEdit;
    BitBtn1: TBitBtn;
    pnlNewUser: TPanel;
    btnDBnavUP: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    btnDBnavDOWN: TBitBtn;
    rpgGender: TRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure btnDBnavUPClick(Sender: TObject);
    procedure btnDBnavDOWNClick(Sender: TObject);
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

procedure TfrmMain.btnDBnavDOWNClick(Sender: TObject);
begin
  tblUsers.Next;
end;

procedure TfrmMain.btnDBnavUPClick(Sender: TObject);
begin
  tblUsers.Prior;
end;

procedure TfrmMain.FormActivate(Sender: TObject);
begin
  tbcMain.TabIndex := 0;
  dbGridUsers.datasource := dsrTbl;
end;



procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Application.Terminate;
end;

end.
