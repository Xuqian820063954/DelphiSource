program Project_ThreadSecurity;

uses
  Vcl.Forms,
  Unit_MainForm in 'Unit_MainForm.pas' {Form1},
  Unit_TWork in 'Unit_TWork.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
