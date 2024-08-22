unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo, FMX.Edit, FMX.StdCtrls, FMX.Controls.Presentation,
  GenerateExample;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    ButtonGenerateULIDs: TSpeedButton;
    Label1: TLabel;
    EditNo: TEdit;
    Label2: TLabel;
    MemoULIDs: TMemo;
    ButtonGenerateGUIDs: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

end.
