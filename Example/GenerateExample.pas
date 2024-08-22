unit GenerateExample;

interface

uses
  System.Classes, System.SysUtils, System.Diagnostics, ULID;

type TGenerateExample = class
  private
    FStopWatch: TStopwatch;
  protected
    procedure StartTime;
    procedure StopTime(const IterationsNo: Cardinal; const Strings: TStrings);
    procedure InternalGenerateGUIDs(const IterationsNo: Cardinal; const Strings: TStrings; const Print: Boolean);
    procedure InternalGenerateULIDs(const IterationsNo: Cardinal; const Strings: TStrings; const Print: Boolean);
  public
    class procedure GenerateGUIDs(const IterationsNo: Cardinal; const Strings: TStrings; const Print: Boolean);
    class procedure GenerateULIDs(const IterationsNo: Cardinal; const Strings: TStrings; const Print: Boolean);
end;

implementation

{ TGenerateExample }

class procedure TGenerateExample.GenerateGUIDs(const IterationsNo: Cardinal;
  const Strings: TStrings; const Print: Boolean);
var
  example: TGenerateExample;
begin
  Assert(Assigned(Strings));

  example := Self.Create;
  Strings.BeginUpdate;
  try
    Strings.Clear;
    example.InternalGenerateGUIDs(IterationsNo, Strings, Print);
  finally
    Strings.EndUpdate;
    example.Free;
  end;
end;

class procedure TGenerateExample.GenerateULIDs(const IterationsNo: Cardinal;
  const Strings: TStrings; const Print: Boolean);
var
  example: TGenerateExample;
begin
  Assert(Assigned(Strings));

  example := Self.Create;
  Strings.BeginUpdate;
  try
    Strings.Clear;
    example.InternalGenerateULIDs(IterationsNo, Strings, Print);
  finally
    Strings.EndUpdate;
    example.Free;
  end;
end;

procedure TGenerateExample.InternalGenerateGUIDs(const IterationsNo: Cardinal;
  const Strings: TStrings; const Print: Boolean);
begin
  StartTime;
  for var i := 1 to IterationsNo do
  begin
    if Print then
    begin
      Strings.Append(TGUID.NewGuid.ToString);
    end else
    begin
      TGUID.NewGuid.ToString;
    end;
  end;
  StopTime(IterationsNo, Strings);
end;

procedure TGenerateExample.InternalGenerateULIDs(const IterationsNo: Cardinal;
  const Strings: TStrings; const Print: Boolean);
begin
  StartTime;
  for var i := 1 to IterationsNo do
  begin
    if Print then
    begin
      Strings.Append(TULID.NewULID);
    end else
    begin
      TULID.NewULID;
    end;
  end;
  StopTime(IterationsNo, Strings);
end;

procedure TGenerateExample.StartTime;
begin
  FStopWatch := TStopwatch.StartNew;
end;

procedure TGenerateExample.StopTime(const IterationsNo: Cardinal;
  const Strings: TStrings);
begin
  var elapsed := FStopwatch.Elapsed;
  Strings.Append('');
  Strings.Append('-----');
  Strings.Append('Iterations: ' + IntToStr(IterationsNo));
  Strings.Append('Total time: ' + IntToStr(Trunc(elapsed.TotalMilliseconds)) + ' [ms]');
  Strings.Append('Single generation time: ' + IntToStr(Trunc(elapsed.TotalMilliseconds) * 1000 div IterationsNo) + ' [us]');
end;

end.
