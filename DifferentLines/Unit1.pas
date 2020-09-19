unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    DrawNow : Integer;
  end;

var
  Form1: TForm1;

procedure DrawPoint(x, y : Integer; Form : TForm1); stdcall;

implementation

{$R *.DFM}

procedure DrawPoint(x, y : Integer; Form : TForm1); 
begin 
  with Form do begin 
    if DrawNow mod 4 = 0 then        
      Canvas.Rectangle(x-2,y-2,x+3,y+3); 
    Inc(DrawNow); 
  end; 
end; 

procedure TForm1.FormCreate(Sender: TObject);
begin
  DrawNow := 0; 
end;

procedure TForm1.FormPaint(Sender: TObject);
begin
  LineDDA(0,0,Width,Height,@DrawPoint,Integer(Self));
end;

end.
