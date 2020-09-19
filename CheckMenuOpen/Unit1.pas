unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Label1: TLabel;
  private
    procedure WMMenuSelect(var Msg : TWMMenuSelect);
       message WM_MENUSELECT;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

{ TForm1 }

procedure TForm1.WMMenuSelect(var Msg: TWMMenuSelect);
begin
  inherited;
  if Msg.Menu <> 0 then
    Label1.Caption := 'Menu Open'
  else
    Label1.Caption := 'Menu Closed';
end;

end.
