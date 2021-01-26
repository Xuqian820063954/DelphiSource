program Project_Json;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {Form1},
  Unit_Class in 'Unit_Class.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
