program Project_TDictionary;

uses
  Vcl.Forms,
  Unit_MainForm in 'Unit_MainForm.pas' {MainForm},
  Vcl.Themes,
  Vcl.Styles,
  Unit_Class in 'Unit_Class.pas',
  Unit_AddForm in 'Unit_AddForm.pas' {AddForm},
  Unit_Variable in 'Unit_Variable.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAddForm, AddForm);
  Application.Run;
end.
