program Project_Multithreading;

uses
  Vcl.Forms,
  Unit_MainForm in 'Unit_MainForm.pas' {MainForm},
  Unit_Threads in 'Unit_Threads.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
