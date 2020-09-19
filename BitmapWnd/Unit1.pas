unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Jpeg;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure WMNCHitTest(var M: TWMNCHitTest);
      message WM_NCHITTEST;
  private
    { Private declarations }
    FBitmap: TBitmap;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
{$R bmpres.res}

function BitmapToRgn(Image: TBitmap; TransparentColor : TColor): HRGN;
var
  TmpRgn: HRGN;
  x, y: integer;
  FirstPixel : integer;
begin
  Result := CreateRectRgn(0, 0, Image.Width, Image.Height);

  if (Image.Width = 0) or (Image.Height = 0) then
    exit;

  for y := 0 to Image.Height - 1 do begin
    x:= 0;
    while x < Image.Width do begin
      if Image.Canvas.Pixels[x, y] <> TransparentColor then begin
        Inc(x);
        continue;
      end;
      FirstPixel := x;
      while (Image.Canvas.Pixels[x, y] = TransparentColor) and
         (x < Image.Width) do
        Inc(x);
      TmpRgn := CreateRectRgn(FirstPixel, y, x+1, y + 1);
      CombineRgn(Result, Result, TmpRgn, RGN_DIFF);
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  ResourceStream: TResourceStream;
  BitmapRgn : HRGN;
begin
  FBitmap := TBitmap.Create;
  ResourceStream := TResourceStream.Create(HInstance,
    'BmpFile', RT_RCDATA);
  try
    FBitmap.LoadFromStream(ResourceStream);
    BitmapRgn := BitmapToRgn(FBitmap, clLime);
    SetWindowRgn(Handle,BitmapRgn,True);
  finally
    ResourceStream.Free;
  end;
end;

procedure TForm1.FormPaint(Sender: TObject);
begin
  Canvas.Draw(0,0,FBitmap);
end;

procedure TForm1.WMNCHitTest(var M: TWMNCHitTest);
begin
  inherited;
  if M.Result = htClient then
    M.Result := htCaption
end;

end.
