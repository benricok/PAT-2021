unit DBUsers_u;

interface

uses ADODB, Math, SysUtils, Classes, Windows, DB;

{uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ADODB, DB, Math, Jpeg, StdCtrls, Grids, DBGrids, ComCtrls, ExtCtrls;
}
type
  TDBUsers = class(TComponent)
  private
    var
      conDB: TADOConnection;
      tblMusic: TADOtable;
      qry: TADOQuery;
      dsrTbl: TDataSource;
      dsrSQL: TDataSource;
      SQL: String;
  published
    Procedure connectDB;
  end;

var
  DBUsers : TDBUsers;

implementation

Procedure TDBUsers.connectDB;
begin
  conDB := TADOConnection.Create(Self);
  // replace DB name
  conDB.ConnectionString :=
    'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=Users.mdb;' +
    'Mode=ReadWrite;Persist Security Info=False';

  conDB.LoginPrompt := false;
  conDB.Connected := true;

  tblMusic := TADOtable.Create(Self);
  tblMusic.Connection := conDB;
  // replace TABLE Name
  tblMusic.TableName := 'Users';
  tblMusic.Active := true;

  qry := TADOQuery.Create(Self);
  qry.Connection := conDB;

  dsrTbl := TDataSource.Create(Self);
  dsrTbl.DataSet := tblMusic;

  //dbgTable.DataSource := dsrTbl;

  dsrSQL := TDataSource.Create(Self);
  dsrSQL.DataSet := qry;

end;
end.
