program Project_Function;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
procedure fun0();forward;
//传递参数固定
procedure fun1(var a:Integer;b:Integer);     //a传地址(相当于C++的&)，b传值
begin

end;
//传递参数不固定
procedure fun2(const Number:Array of Integer);       //等价于void fun1(const int *A);
begin

end;
//传递参数类型不固定
function fun3(const Format:string;const Args:array of const): string;
begin

end;
//默认传递参数
procedure fun4(a:Integer;b:Integer=2;c:Char='a');               // a不可设置默认值
begin
  Writeln(a,' ',b,' ',c);
end;
//正常返回值
function Add(var a:Integer;b:Integer): Integer;overload;
begin
  Result:=a+b;Exit;//两句合在一起等价于return a+b;
end;
//var型返回值
procedure Sub(var a:Integer;b:Integer;var sub:Integer);//Sub为引用参数，可用于返回多个值
begin
  sub:=a-b;
end;
//out型返回值
procedure Mul(var a:Integer;b:Integer;out mul:Integer);//out同样是传地址，但是传入的参数只能赋值，无其他用途
begin
  Mul:=a*b;
end;
//函数名型返回值
function Divide(var a:Integer;b:Integer):Integer;
begin
  Divide:=a div b;
  Exit;
end;
//函数重载（函数名相同，参数列表不同）
function Add(var a:Double;b:Double): Double;overload;//所有重载的同名函数都要加上overload修饰
begin
  Result:=a+b;
  Exit;
end;
//前置声明主体
procedure fun0();
begin

end;
var x:Integer;
    ans:Integer;
begin
  x:=100;
  fun2([2,3,4,5]);
  fun4(100,200);//传递时至少有一个参数
  Writeln('Add:',Add(x,3));
  Sub(x,3,ans);
  Writeln('Sub:',ans);
  Mul(x,3,ans);
  Writeln('Mul:',ans);
  Writeln('Div:',Divide(x,3));
  Readln;
end.

