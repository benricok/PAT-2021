unit Algorithms_u;

interface

uses SysUtils, System.Hash;

Function hash(sString : string) : string;
Function noSpace(sString : string) : string;
Procedure newPassword(var sHashedPass : string);
procedure getPriv(var sPriv: string);

implementation

uses Password;

Function hash(sString : string) : string;
begin
// Hash password
  result := THashMD5.GetHashString(sString);
end;

// Remove spaces in string
Function noSpace(sString : string) : string;
Var
  i : integer;
begin
  result := '';
  for i := 1 to length(sString) do
    if sString[i] = ' ' then
      result := result + sString[i];
end;

Procedure newPassword(var sHashedPass : string);
begin
  //
end;

procedure getPriv(var sPriv: string);
begin
  //
end;
end.
