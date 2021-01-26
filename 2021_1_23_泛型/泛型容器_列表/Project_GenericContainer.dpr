program Project_GenericContainer;

uses
  Vcl.Forms,
  Unit_GenericContainer in 'Unit_GenericContainer.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles,
  Unit_Class in 'Unit_Class.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10');
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
