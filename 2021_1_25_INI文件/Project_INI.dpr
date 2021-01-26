program Project_INI;

uses
  Vcl.Forms,
  Unit_INI in 'Unit_INI.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
