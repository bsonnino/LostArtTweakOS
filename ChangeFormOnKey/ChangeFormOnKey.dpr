program ChangeFormOnKey;

uses
  Windows,
  Forms,
  Unit1 in 'Unit1.pas' {Form1} ,
  Unit2 in 'Unit2.pas' {Form2};

{$R *.RES}

begin
  Application.Initialize;
  if GetKeyState(VK_SHIFT) and $10000000 <> 0 then
    Application.CreateForm(TForm2, Form2)
  else
    Application.CreateForm(TForm1, Form1);
  Application.Run;

end.
