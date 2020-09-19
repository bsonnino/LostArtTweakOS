unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DwmApi, WinApi.UxTheme, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FThumb : HTHUMBNAIL;
    procedure ShowWorkspace;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DwmUnregisterThumbnail(FThumb);
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  ShowWorkspace();
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  ShowWorkspace();
end;

procedure TForm1.ShowWorkspace;
var
  thumbnailProps : TDwmThumbnailProperties;
begin
  var workspace := FindWindow('Progman',nil);

  if FThumb <> 0 then
    DwmUnregisterThumbnail(FThumb);
  var rc := DwmRegisterThumbnail(Handle, workspace, @FThumb);

  if (rc = 0) then begin
     thumbnailProps.fVisible := true;
     thumbnailProps.rcDestination := Rect(0, 0,
        ClientRect.Width, ClientRect.Height);
     thumbnailProps.dwFlags := DWM_TNP_VISIBLE or DWM_TNP_RECTDESTINATION;
     DwmUpdateThumbnailProperties(NativeUint(FThumb), thumbnailProps);
  end

end;

end.
