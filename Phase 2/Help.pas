unit Help;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmHelp = class(TForm)
    pnlToolBar: TPanel;
    pnlHelp: TPanel;
    memHelp: TMemo;
    lblHelpHeading: TLabel;
    btnOK: TBitBtn;
    procedure btnOKClick(Sender: TObject);
  end;

var
  frmHelp: TfrmHelp;

implementation

{$R *.dfm}

procedure TfrmHelp.btnOKClick(Sender: TObject);
begin
  frmHelp.Hide;
end;

end.
