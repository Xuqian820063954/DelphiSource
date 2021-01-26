unit Unit_Threads;

interface

uses
  System.SysUtils,System.Classes;

type
  TWork = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  public
    procedure Calculate;
  end;

implementation
uses Unit_MainForm;
procedure TWork.Execute;
begin
  Calculate();
end;

procedure TWork.Calculate;
var Num:Integer;
begin
  for Num := 1 to 10000 do
  begin
    if FreeOnTerminate then
       Exit;
    MainForm.lbl2.Caption:=Num.ToString;
    TThread.Sleep(100);//Ïß³ÌÐÝÃß100ms
  end;
end;
end.
