unit DBUsers_u;

interface

uses ADODB, Math, SysUtils, Classes, Windows, DB;

type
  TDBUsers = class(TComponent)
  private
    var
      SQL: String;
  published
    Procedure connectDB;
  end;

var
  DBUsers : TDBUsers;
  conDB: TADOConnection;
  tblMusic: TADOtable;
  qry: TADOQuery;
  dsrTbl: TDataSource;
  dsrSQL: TDataSource;

implementation

Procedure TDBUsers.connectDB;
begin
  conDB := TADOConnection.Create(Self);

  conDB.ConnectionString :=
    'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=.\Users.MDB;' +
    'Mode=ReadWrite;Persist Security Info=False';

  conDB.LoginPrompt := false;
  conDB.Connected := true;

  tblMusic := TADOtable.Create(Self);
  tblMusic.Connection := conDB;

  tblMusic.TableName := 'Users';
  tblMusic.Active := true;

  qry := TADOQuery.Create(Self);
  qry.Connection := conDB;

  dsrTbl := TDataSource.Create(Self);
  dsrTbl.DataSet := tblMusic;

  dsrSQL := TDataSource.Create(Self);
  dsrSQL.DataSet := qry;

end;
end.
