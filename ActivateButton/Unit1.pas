unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
var
  Pt : TPoint;
begin
  with Button2 do begin
    Pt.x := Left + Width div 2;
    Pt.y := Top + Height div 2;
    Pt := Self.ClientToScreen(Pt);
    SetCursorPos(Pt.x,Pt.y);
  end;
  Mouse_event(MOUSEEVENTF_LEFTDOWN, 0,0,0,0);
  Mouse_event(MOUSEEVENTF_LEFTUP, 0,0,0,0);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ShowMessage('Button 2 Clicked');
end;

end.
