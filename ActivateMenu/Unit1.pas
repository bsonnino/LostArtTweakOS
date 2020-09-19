unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Menus, FileCtrl;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Option11: TMenuItem;
    Option21: TMenuItem;
    Option31: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Keybd_Event(VK_MENU, 0, 0, 0);
  Keybd_Event(Ord('F'), 0, 0, 0);
  Keybd_Event(Ord('F'), 0, KEYEVENTF_KEYUP, 0);
  Keybd_Event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
end;

end.
