program Game;

uses
  Vcl.Forms,
  Unit_MainForm in 'Unit_MainForm.pas' {MainForm},
  Unit_Service in 'Unit_Service.pas',
  Unit_Const in 'Unit_Const.pas',
  Unit_Data in 'Unit_Data.pas',
  Unit_Utils in 'Unit_Utils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
