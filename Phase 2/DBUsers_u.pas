unit DBUsers_u;

interface

uses ADODB, SysUtils, Classes, DB;

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
  tblUsers: TADOtable;
  tblUserInfo : TADOtable;
  dsrTbl: TDataSource;

implementation

// Connect to database
Procedure TDBUsers.connectDB;
begin
  conDB := TADOConnection.Create(Self);

  conDB.ConnectionString :=
    'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=.\Users.MDB;' +
    'Mode=ReadWrite;Persist Security Info=False';

  conDB.LoginPrompt := false;
  conDB.Connected := true;

  //Create tblUsers object and assign it to the Users tabel in the DB
  tblUsers := TADOtable.Create(Self);
  tblUsers.Connection := conDB;

  tblUsers.TableName := 'Users';
  tblUsers.Active := true;

  //tblUsersinfo
  tblUserInfo := TADOtable.Create(Self);
  tblUserInfo.Connection := conDB;

  tblUserInfo.TableName := 'UserInfo';
  tblUserInfo.Active := true;

  // Create datasource object
  dsrTbl := TDataSource.Create(Self);
  dsrTbl.DataSet := tblUserInfo;
end;
end.
