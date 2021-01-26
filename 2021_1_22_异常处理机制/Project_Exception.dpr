program Project_Exception;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
type  EMath=class(Exception)

      end;
function MyDivFun(Num1,Num2:Integer):Integer;
begin
  //抛出异常信息
  if Num2=0 then raise EMath.Create('除数为0')//后面代码不能执行
  else
    Result:=Num1 div Num2;
end;
var x:Integer;
begin
  Readln(x);
  try
    try
      Writeln(MyDivFun(10,x));
    except//与switch相似，出异常时进入
      on E: EMath do//自定义异常类型
        Writeln(E.ClassName,'----',E.Message);
      on E: Exception do//基类异常类型，一般写在最后
        Writeln(E.Message);
    end;
  finally//不管有没有异常都执行代码
    Writeln('释放资源');
  end;
  Readln;
end.
