unit Algorithms;

interface
  uses
    Windows, System.Classes, SysUtils, Math, Vcl.Dialogs;

  // Functions
  function  GenerateKey(iMin, iMax : integer; bUpChar, bLowChar, bNumbers, bSpecial : boolean) : String;
  function  Encrypt(sMessage, sKeyIn : string) : string;
  function  Decrypt(sEncryptedMsg, sKeyIn : string) : string;
 {function base64_encode(sIn : String) : String;
  function base64_decode(sIn : String) : String;}
  function encrypt_vigenere(sMsg, sKeyIn : String) : String;
  function decrypt_vigenere(sEncryptedMsg, sNewKey : String) : String;
  function extend_key(sMsg, sKeyIn : String) : String;

  Var
    sNewKey : String;

  const
    // Characters for vigenere algorithm
    sAvalibleChars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 ';

    {
    // Base64 algorithm lookup table
    base64_table : array [0..63] of char = (
        'A','B','C','D','E','F','G','H',
        'I','J','K','L','M','N','O','P',
        'Q','R','S','T','U','V','W','X',
        'Y','Z','a','b','c','d','e','f',
        'g','h','i','j','k','l','m','n',
        'o','p','q','r','s','t','u','v',
        'w','x','y','z','0','1','2','3',
        '4','5','6','7','8','9','+','/'
    );

    // Base64 acii lookup table
    T: array [0..255] of integer = (
    -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, 62, -1,
    -1, -1, 63, 52, 53, 54, 55, 56, 57,
    58, 59, 60, 61, -1, -1, -1, -1, -1,
    -1, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8,
    9, 10, 11, 12, 13, 14, 15, 16, 17,
    18, 19, 20, 21, 22, 23, 24, 25, -1,
    -1, -1, -1, -1, -1, 26, 27, 28, 29,
    30, 31, 32, 33, 34, 35, 36, 37, 38,
    39, 40, 41, 42, 43, 44, 45, 46, 47,
    48, 49, 50, 51, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1);
    }

implementation

//Generate a random selection of characters determind by the user's selection on lenth and what characters may be used
function GenerateKey(iMin, iMax : integer; bUpChar, bLowChar, bNumbers, bSpecial : boolean) : String;
Var
  iLengthKey, iLengthGenAvalible, i : integer;
  sGenKey, sGenAvalible : String;

Const
  sGenUpChar = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  sGenLowChar = 'abcdefghijklmnopqrstuvwxyz';
  sGenNumbers = '0123456789';
  sGenSpecialChar = '!@#$%^&*';

begin
  //Check if Min value is smaller than Max value
  if iMin >= iMax then
    MessageDlg('Please enter the minimum and maximum values in correctly',mtError, mbOKCancel, 0)
  else
    begin
      //Initilize for loop counter
      i := 1;

      //Radomise length of key
      Randomize;
      iLengthKey := RandomRange(iMin, iMax +1);

      //Append Selected characters to string avalible to the randomizer to select from and get length of it
      if bUpChar then
        sGenAvalible:= sGenAvalible + sGenUpChar;
      if bLowChar then
        sGenAvalible:= sGenAvalible + sGenLowChar;
      if bNumbers then
        sGenAvalible:= sGenAvalible + sGenNumbers;
      if bSpecial then
        sGenAvalible:= sGenAvalible + sGenSpecialChar;

      iLengthGenAvalible := length(sGenAvalible);

      //Check if user selected characters
      if iLengthGenAvalible = 0 then
        MessageDlg('Please select characters for the gererator to use',mtError, mbOKCancel, 0);

      //Generate Key
      for i := 1 to iLengthKey do
        begin
          sGenKey := sGenKey + sGenAvalible[Randomrange(1, iLengthGenAvalible+1)];
        end;

      //Return Key
      result := sGenKey;
    end;
end;

//Main encrypt function
function Encrypt(sMessage, sKeyIn : string) : string;
Var
  {sB64,} sVigenereMsg : String;
begin
  //sB64 := base64_encode(sMessage);
  sVigenereMsg := encrypt_Vigenere({sB64} sMessage, sKeyIn);
  result := sVigenereMsg;
end;

//Main decrypt function
function Decrypt(sEncryptedMsg, sKeyIn : string) : string;
Var
  sOut{, sB64_encoded, sB64_decoded} : String;
begin
  sNewKey := extend_key(sEncryptedMsg, sKeyIn);
  {sB64_encoded} sOut  := decrypt_vigenere(sEncryptedMsg, sNewKey);
  // sB64_decoded := base64_decode(sB64_encoded);
  result := sOut; {sB64_decoded}
end;


// Vingenere algorithm by phillipperemy writen in C++. Was translated by Benrico Krog into Pascal
// https://github.com/philipperemy/easy-encryption/blob/master/vigenere.h
function encrypt_vigenere(sMsg, sKeyIn : String) : String;
Var
  i, k : integer;
  sEncryptedMsg : String;

begin
  i := 1;
  k := 1;

  //Generate key with length = to message's length
  sNewKey := extend_key(sMsg, sKeyIn);

  //fil string with placeholder characters
  sEncryptedMsg := '';
  for k := 1 to sMsg.length do
    sEncryptedMsg := sEncryptedMsg + 'x';

  //Encryption
  for i := 1 to sMsg.length do
    begin
      if (upCase(sMsg[i]) IN ['A'..'Z', '0'..'9']) then
        sEncryptedMsg[i] := sAvalibleChars[((Pos(sMsg[i], sAvalibleChars) + Pos(sNewKey[i], sAvalibleChars)) MOD sAvalibleChars.Length)]
      else
        sEncryptedMsg[i] := sMsg[i];
    end;

  //return Encrypted message
  result := sEncryptedMsg;
end;

function decrypt_vigenere(sEncryptedMsg, sNewKey : String) : String;
Var
  i, k : integer;
  sDecryptedMsg : String;

begin
  i := 1;
  k := 1;

  //fil string with placeholder characters
  sDecryptedMsg := '';
  for k := 1 to sEncryptedMsg.length do
    sDecryptedMsg := sDecryptedMsg + 'x';

  //Decryption
  for i := 1 to sEncryptedMsg.length do
    begin
      if (upCase(sEncryptedMsg[i]) IN ['A'..'Z', '0'..'9']) then
        sDecryptedMsg[i] := sAvalibleChars[(((Pos(sEncryptedMsg[i], sAvalibleChars) - Pos(sNewKey[i], sAvalibleChars)) + sAvalibleChars.Length) MOD sAvalibleChars.Length)]
      else
        sDecryptedMsg[i] := sEncryptedMsg[i];
    end;

  //return Decrypted message
  result := sDecryptedMsg;
end;

//Generate new key
function extend_key(sMsg, sKeyIn : String) : String;
Var
  i, j, k : integer;
  sNewKeyGen : String;

begin
  i := 1;
  j := 1;
  k := 1;

  sNewKeyGen := '';
  for k := 1 to sMsg.length do
    sNewKeyGen := sNewKeyGen + 'x';

  //loop through already genarated key and exstend/shorten it acording to the length of the message
  for i := 1 to sMsg.length do
    begin
      if j = sKeyIn.Length then
         j := 1;

      sNewKeyGen[i] := sKeyIn[j];
      Inc(j);
    end;
  result := sNewKeyGen;
end;



//Base64 wasn't used due to lack of knowledge of specific math functions regarding vectors in Delphi avalible in C++

{
// https://github.com/philipperemy/easy-encryption/blob/master/b64.h
function base64_encode(sIn : String) : String;
Var
  sOut : String;
  k, iVal, iValB : integer;
  cTemp : char;

begin
    iVal := 0;
    iValB := -6;
    k := 0;

    sOut := '';

    for k := 0 to length(sIn) do
        begin
        cTemp := sIn[k];
        iVal := (iVal shl 8) + Ord(cTemp);
        iValB := iValB + 8;

        while iValB >= 0 do
            begin
            sOut := sOut + base64_table[(iVal shr iValb) and $3F];
            iValB := iValb - 6;
            end;
        end;

    if iValB > -6 then
          begin
            sOut := sOut + base64_table[((iVal shl 8) shr (iValB + 8)) and $3F]
        end;

    // Apply padding
    while length(sOut) mod 4 > 0 do
        begin
            sOut := sOut + '=';
        end;

    result := sOut;
end;

function base64_decode(sIn : String) : String;
Var
  sOut : String;
  iVal, iValB, jj : integer;
  c : char;

begin
  sOut := '';
  iVal := 0;
  iValB := -8;

  for jj := 0 to length(sIn) do
    begin
      c := sIn[jj];
      if c IN [] then
        break;
      iVal := (ival shl 6) + T[c];
      iValB := iValB + 6;
      if iValB >= 0 then
        begin
          sOut := sOut +  base64_table[char((iVal shr iValB) and $FF)];
          iValB := iValB -8;
        end;

    end;
end;
}

end.
