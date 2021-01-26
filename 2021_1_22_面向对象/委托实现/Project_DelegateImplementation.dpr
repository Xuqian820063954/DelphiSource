program Project_DelegateImplementation;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Unit_DelegateImplementation in 'unit\Unit_DelegateImplementation.pas';

{*------------------------------------------------------------------------------
  匿名函数（与函数指针功能相同）
    定义格式 type TFun=reference to function(Num:Integer):Integer;

-------------------------------------------------------------------------------}
type  TFun=reference to function(Num:Integer):Integer;
function Add(Age:Integer): Integer;
begin
  Writeln(Age);
  Result:=Age;
end;
var pfun:TFun;
var Dog:TDog;
    Cat:TCat;
    Eat:IEat;
begin
  //赋值方法1
  pfun:=Add;
  pfun(2);
  //赋值方法2
  pfun:=
    function(Num:Integer): Integer
    begin
      Result:=Num;
    end;
  pfun(10);
  Cat:=TCat.Create;
  Cat.Eat:=TDog.Create;//Cat.Eat是IEat类型，IEat接口类型有一个子类是TDog，此处的赋值实际上是多态
  Cat.Eat.EatIng;
  Readln;

end.
