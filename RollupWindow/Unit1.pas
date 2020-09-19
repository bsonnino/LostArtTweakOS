unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    R: TRect;
    OldHeight: Integer;
    procedure WMNCLButtonDown(var Msg: TWMNCLButtonDown);
      message WM_NCLButtonDown;
    procedure WMNCPaint(var Msg: TWMNCPaint); message WM_NCPAINT;
    procedure WMNCActivate(var Msg: TWMNCActivate); message WM_NCACTIVATE;
    procedure DrawButton;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.DrawButton;
var
  DC: hDC;
begin
  DC := GetWindowDC(Self.Handle);
  try
    if ClientHeight <> 0 then
      DrawFrameControl(DC, R, DFC_SCROLL, DFCS_SCROLLUP)
    else
      DrawFrameControl(DC, R, DFC_SCROLL, DFCS_SCROLLDOWN);
  finally
    ReleaseDC(Self.Handle, DC);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  R.Left := Width - 2 * GetSystemMetrics(SM_CXSIZE) -
    GetSystemMetrics(SM_CYFRAME) + 2;
  R.Right := R.Left + GetSystemMetrics(SM_CXSIZE) - 2;
  R.Top := GetSystemMetrics(SM_CYFRAME) + 1;
  R.Bottom := GetSystemMetrics(SM_CYSIZE) +
    GetSystemMetrics(SM_CYFRAME) - 3;
  OldHeight := ClientHeight;
end;

procedure TForm1.WMNCLButtonDown(var Msg: TWMNCLButtonDown);
var
  Pt: TPoint;
begin
  with Msg do
  begin
    Pt.X := XCursor - Left;
    Pt.Y := YCursor - Top;
  end;
  if (Pt.X >= R.Left) and (Pt.X <= R.Right) and (Pt.Y >= R.Top) and
    (Pt.Y <= R.Bottom) then
  begin
    if ClientHeight = 0 then
      ClientHeight := OldHeight
    else
      ClientHeight := 0;
  end
  else
    inherited;
end;

procedure TForm1.WMNCPaint(var Msg: TWMNCPaint);
begin
  inherited;
  DrawButton;
end;

procedure TForm1.WMNCActivate(var Msg: TWMNCActivate);
begin
  inherited;
  DrawButton;
end;

end.
