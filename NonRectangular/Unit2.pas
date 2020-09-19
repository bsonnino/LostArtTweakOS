unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TFormSplash = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSplash: TFormSplash;

implementation

{$R *.DFM}

procedure TFormSplash.FormCreate(Sender: TObject);
var
  Region1,Region2 : hRgn;
begin
  Region1 := CreateEllipticRgn(0,0,400,400);
  Region2 := CreateEllipticRgn(200,0,600,400);
  CombineRgn(Region1,Region1,Region2,RGN_OR);
  SetWindowRgn(Handle,Region1,True);
end;

end.
