unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    BtnDTest: TButton;
    BtnSTest: TButton;
    procedure BtnDTestClick(Sender: TObject);
    procedure BtnSTestClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
function Add(Num1,Num2:Integer):Integer;stdcall;external 'TestDLL.dll';
var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BtnDTestClick(Sender: TObject);
var MyFun:function (Num1,Num2:Integer):Integer;stdcall;
    Handle:System.Cardinal;
begin
  //动态调用DLL
  Handle:=LoadLibrary('TestDLL.dll');
  if Handle<>0 then begin
    try
      MyFun:=GetProcAddress(Handle,'Add');
      MessageBox(0,PWideChar('DLL加载成功，结果：'+MyFun(10,20).ToString),'温馨提示',MB_OK);
    finally
      //释放DLL
      FreeLibrary(Handle);
    end;
  end;
end;
procedure TForm1.BtnSTestClick(Sender: TObject);
begin
  ShowMessage(Add(1,3).ToString);
end;

end.
