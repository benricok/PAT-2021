unit Algorithms_u;

interface

uses SysUtils, System.Hash;

Function hash(sString : string) : string;

implementation

Function hash(sString : string) : string;
begin
// Hash password
  result := THashMD5.GetHashString(sString);
end;


end.
