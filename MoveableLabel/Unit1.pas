unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    procedure Label1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    IsCapturing : Boolean;
    PosIni : TPoint;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Label1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then begin
    PosIni.X := X;
    PosIni.Y := Y;
    IsCapturing := True;
    SetCapture(Handle);
  end;
end;

procedure TForm1.Label1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if IsCapturing then
    with Label1 do begin
      Left := Left - (PosIni.X - X);
      Top := Top - (PosIni.Y -Y);
    end;
end;

procedure TForm1.Label1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if IsCapturing then begin
    ReleaseCapture;
    with Label1 do begin
      Left := Left - (PosIni.X - X);
      Top := Top - (PosIni.Y -Y);
    end;
    IsCapturing := False;
  end;
end;

end.
