program NonRectangularWindow;

uses
  Windows,
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {FormSplash};

{$R *.RES}

begin
  Application.Initialize;
  FormSplash := TFormSplash.Create(Application);
  FormSplash.Show;
  FormSplash.Refresh;
  Sleep(4000);
  FormSplash.Close;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
