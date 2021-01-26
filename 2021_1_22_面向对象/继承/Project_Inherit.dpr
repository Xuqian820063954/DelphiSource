program Project_Inherit;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Unit_Inherit in 'unit\Unit_Inherit.pas';

{*------------------------------------------------------------------------------
  继承：对象和对象的关系
  派生：类和类的关系
  特点：1、提高代码的复用
        2、一旦产生派生关系，他们就具备了多态的特性
        3、Delphi中是单继承，但可以是多层继承
  继承中的构造方法
      1、定义
      2、重写
  继承中的访问权限
-------------------------------------------------------------------------------}
var Dog:TDog;
begin
  Dog:=TDog.Create;
  Dog.Weight:=100;
  Writeln(Dog.Weight);
  Dog.GetName();
  Readln;
end.
