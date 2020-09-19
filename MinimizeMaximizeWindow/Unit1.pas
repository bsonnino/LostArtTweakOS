unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
  private
    procedure WMSysCommand(var Msg: TWMSysCommand);
      message WM_SYSCOMMAND;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

const
  SC_TITLEDBLCLICK = 61490;

{ TForm1 }

procedure TForm1.WMSysCommand(var Msg: TWMSysCommand);
begin
  case Msg.CmdType of
    SC_MINIMIZE : if Checkbox1.Checked then
                    exit;
    SC_MAXIMIZE,SC_TITLEDBLCLICK : if Checkbox2.Checked then
                    exit;
  end;
  inherited;
end;

end.
