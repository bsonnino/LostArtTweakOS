unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    CheckBox1: TCheckBox;
  private
    procedure WMWindowPosChanging(var Msg : TWMWindowPosChanging);
      message WM_WINDOWPOSCHANGING;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

{ TForm1 }

procedure TForm1.WMWindowPosChanging(var Msg: TWMWindowPosChanging);
begin
  if not Checkbox1.Checked then
    with Msg.WindowPos^ do begin
      x := Left;
      y := Top;
      Msg.Result := 0;
    end;
end;

end.
