unit uMainVCL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, GenerateExample;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    EditNo: TEdit;
    Label2: TLabel;
    ButtonGenerateULIDs: TSpeedButton;
    ButtonGenerateGUIDs: TSpeedButton;
    MemoOut: TMemo;
    CheckBoxPrint: TCheckBox;
    procedure ButtonGenerateGUIDsClick(Sender: TObject);
    procedure ButtonGenerateULIDsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure EnableUI(const Enable: Boolean);
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.ButtonGenerateGUIDsClick(Sender: TObject);
begin
  EnableUI(False);
  try
    TGenerateExample.GenerateGUIDs(StrToInt(EditNo.Text), MemoOut.Lines, CheckBoxPrint.Checked);
    SendMessage(MemoOut.Handle, WM_VSCROLL, SB_BOTTOM, 0);
  finally
    EnableUI(True);
  end;
end;

procedure TfrmMain.ButtonGenerateULIDsClick(Sender: TObject);
begin
  EnableUI(False);
  try
    TGenerateExample.GenerateULIDs(StrToInt(EditNo.Text), MemoOut.Lines, CheckBoxPrint.Checked);
    SendMessage(MemoOut.Handle, WM_VSCROLL, SB_BOTTOM, 0);
  finally
    EnableUI(True);
  end;
end;

procedure TfrmMain.EnableUI(const Enable: Boolean);
begin
  EditNo.Enabled := Enable;
  ButtonGenerateULIDs.Enabled := Enable;
  ButtonGenerateGUIDs.Enabled := Enable;
  MemoOut.Enabled := Enable;

  if Enable then
  begin
    Screen.Cursor := crDefault;
  end else
  begin
    Screen.Cursor := crHourGlass;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Caption := 'ULID Example VCL';
  MemoOut.Text := '';
  EditNo.Text := '100000';
end;

end.
