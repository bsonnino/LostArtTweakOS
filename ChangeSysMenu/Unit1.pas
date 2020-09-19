unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    procedure AppMessage(var Msg : TMsg; var Handled : Boolean);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

const
  SC_TEST = $1000;

implementation

{$R *.DFM}

procedure TForm1.AppMessage(var Msg: TMsg; var Handled: Boolean);
begin
  if (Msg.Message = WM_SYSCOMMAND) and (Msg.wParam = SC_TEST) then begin
    ShowMessage('You''ve selected the Test Option');
    Handled := True;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Application.OnMessage := AppMessage;
  AppendMenu(GetSystemMenu(Application.Handle, False),
    MF_STRING,SC_TEST,'&Test');
  AppendMenu(GetSystemMenu(Handle, False),MF_STRING,SC_TEST,'&Test');
end;


end.
