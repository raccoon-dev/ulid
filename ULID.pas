unit ULID;

interface

uses
  DateUtils,
  SysUtils;

{
  ULID: Universally Unique Lexicographically Sortable Identifier

  String Representation: ttttttttttrrrrrrrrrrrrrrrr
  where t is Timestamp
        r is Randomness

  For more information see: https://github.com/martinusso/ulid/blob/master/README.md
}

type TULID = class
  strict private
    const
      ENCODED_RANDOM_LENGTH = 16;
      ENCODED_TIME_LENGTH = 10;
      ENCODING: array[0..31] of string = ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                                          'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K',
                                          'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'V', 'W', 'X',
                                          'Y', 'Z'); // Crockford's Base32
  private
    var
      FLastTime: Int64;
  protected
    function EncodeRandom: string;
    function InternalCreateULID: string;
    function InternalEncodeTime(Time: Int64): string;
    function UNIXTimeInMilliseconds: Int64;
  public
    class function NewULID: string;
    class function EncodeTime(Time: Int64): string;
end;


implementation

var
  FULID: TULID;

class function TULID.NewULID: string;
begin
  Result := FULID.InternalCreateULID;
end;

class function TULID.EncodeTime(Time: Int64): string;
begin
  Result := FULID.InternalEncodeTime(Time);
end;

function TULID.UNIXTimeInMilliseconds: Int64;
begin
  Result := DateUtils.MilliSecondsBetween(Now, UnixDateDelta);
  if (FULID.FLastTime > 0) and (Result = FLastTime) then
  begin
    Inc(RandSeed);
  end;
  FLastTime := Result;
end;

function TULID.InternalCreateULID: string;
begin
  Result := EncodeTime(UNIXTimeInMilliseconds) + EncodeRandom;
end;

function TULID.EncodeRandom: string;
var
  I: Word;
  Rand: Integer;
begin
  Result := '';
  for I := ENCODED_RANDOM_LENGTH downto 1 do
  begin
    Rand := Trunc(Length(TULID.ENCODING) * Random);
    Result := ENCODING[Rand] + Result;
  end;
end;

function TULID.InternalEncodeTime(Time: Int64): string;
var
  I: Word;
  M: Integer;
begin
  Result := '';
  for I := ENCODED_TIME_LENGTH downto 1 do
  begin
    M := (Time mod Length(TULID.ENCODING));
    Result := ENCODING[M] + Result;
    Time := Trunc((Time - M) / Length(TULID.ENCODING));
  end;
end;

initialization
  FULID := TULID.Create;
  FULID.FLastTime := 0;
  Randomize();

finalization
  FreeAndNil(FULID);

end.
