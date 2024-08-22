unit uMainFMX;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo, FMX.Edit, FMX.StdCtrls, FMX.Controls.Presentation,
  GenerateExample;

type
  TfrmMain = class(TForm)
    ToolBar1: TToolBar;
    ButtonGenerateULIDs: TSpeedButton;
    Label1: TLabel;
    EditNo: TEdit;
    Label2: TLabel;
    MemoOut: TMemo;
    ButtonGenerateGUIDs: TSpeedButton;
    CheckBoxPrint: TCheckBox;
    procedure ButtonGenerateGUIDsClick(Sender: TObject);
    procedure ButtonGenerateULIDsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure EnableUI(const Enable: Boolean);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

procedure TfrmMain.ButtonGenerateGUIDsClick(Sender: TObject);
begin
  EnableUI(False);
  try
    TGenerateExample.GenerateGUIDs(
      StrToInt(EditNo.Text),
      MemoOut.Lines,
      CheckBoxPrint.IsChecked
    );
    MemoOut.GoToTextEnd;
  finally
    EnableUI(True);
  end;
end;

procedure TfrmMain.ButtonGenerateULIDsClick(Sender: TObject);
begin
  EnableUI(False);
  try
    TGenerateExample.GenerateULIDs(
      StrToInt(EditNo.Text),
      MemoOut.Lines,
      CheckBoxPrint.IsChecked
    );
    MemoOut.GoToTextEnd;
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
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Caption := 'ULID Example FMX';
  MemoOut.Text := '';
  EditNo.Text := '100000';
end;

end.
