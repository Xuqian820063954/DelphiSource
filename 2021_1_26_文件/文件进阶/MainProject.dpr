program MainProject;

uses
  Vcl.Forms,
  Unit_MainForm in 'Unit_MainForm.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
