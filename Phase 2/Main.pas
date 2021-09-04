unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls;

type
  TfrmMain = class(TForm)
    tbcMain: TPageControl;
    tabDash: TTabSheet;
    tabHelp: TTabSheet;
    tabUserManagement: TTabSheet;
    tabChat: TTabSheet;
    tabLogout: TTabSheet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

end.
