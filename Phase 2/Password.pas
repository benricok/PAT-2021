unit Password;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmPassword = class(TForm)
    pnlPasswordForm: TPanel;
    btnPassOK: TBitBtn;
    lblOldPass: TLabel;
    edtOldPass: TEdit;
    lblNewPass: TLabel;
    edtNewPass: TEdit;
    edtNewPassConfirm: TEdit;
    btnPassCancel: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPassword: TfrmPassword;

implementation

{$R *.dfm}

end.
