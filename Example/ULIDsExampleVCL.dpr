program ULIDsExampleVCL;

uses
  Vcl.Forms,
  uMainVCL in 'uMainVCL.pas' {frmMain},
  GenerateExample in 'GenerateExample.pas',
  ULID in '..\ULID.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
