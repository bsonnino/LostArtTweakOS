unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    procedure WMNCHitTest(var M: TWMNCHitTest);
      message WM_NCHITTEST; 
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

{ TForm1 }

procedure TForm1.WMNCHitTest(var M: TWMNCHitTest);
begin 
  inherited; 
  if M.Result = htClient then 
    M.Result := htCaption
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 Close;
end;

end.
 