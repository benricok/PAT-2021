
// -----------------------------------------------------------------------------
//
//  Copyright (C) 2021  Benrico Krog
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU Affero General Public License as published
//  by the Free Software Foundation version 3 of the License.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Affero General Public License for more details.
//
//  You should have received a copy of the GNU Affero General Public License
//  along with this program.  If not, see <https://www.gnu.org/licenses/>
//
// -----------------------------------------------------------------------------

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
