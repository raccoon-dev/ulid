program ULIDsExampleFMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMainFMX in 'uMainFMX.pas' {frmMain},
  GenerateExample in 'GenerateExample.pas',
  ULID in '..\ULID.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
