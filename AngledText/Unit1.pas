unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TForm1 = class(TForm)
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormPaint(Sender: TObject);
var
  OldFont,NewFont : hFont;
  LogFont : TLogFont;
  i : Integer;
begin
  OldFont := Canvas.Font.Handle;
  i := 0;
  while i < 3600 do begin
    GetObject(OldFont,Sizeof(LogFont),@LogFont);
    LogFont.lfEscapement := i;
    NewFont := CreateFontIndirect(LogFont);
    SelectObject(Canvas.Handle,NewFont);
    TextOut(Canvas.Handle,Width div 2,Height div 2,'Angled Text', 11);
    DeleteObject(SelectObject(Canvas.Handle,OldFont));
    Inc(i,200);
  end;
end;

end.
