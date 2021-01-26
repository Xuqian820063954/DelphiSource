program Project_Polymorphic;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Unit_Polymorphic in 'unit\Unit_Polymorphic.pas';

{*------------------------------------------------------------------------------
  多态：表现为父类接受或指向子类的对象
        但是父类只保留子类继承父类的属性和功能
  用途：提高代码的复用性，方便对代码进行解耦
-------------------------------------------------------------------------------}
procedure ShowAnimalRun(Animal:TAnimal);
var Dog:TDog;
begin
  Animal.Run;
  Writeln(Animal.ClassName);
  if Animal.ClassName='TDog' then begin
    //强制类型转换进行向下转型
    Dog:=TDog(Animal);
    Dog.Guard;
  end;
  if Animal is TDog then begin//判断类型是否兼容
    Writeln('可以转换成狗');
    Dog:=Animal as TDog;//as型转换
    if Assigned(Dog) then//判断指针是否为空
      Dog.Guard;
  end;
end;
var Animal:TAnimal;
    Color:IColor;
begin
  Animal:=TDog.Create;//类的多态，自动向上转型，Animal可以使用Run方法
  Color:=TDog.Create;//接口的多态
  Animal.Free;

  ShowAnimalRun(TDog.Create);//TAnimal类创建的Animal使用Run方法会出问题
  ShowAnimalRun(TCat.Create);//TAnimal类创建的Animal使用Run方法会出问题
  Readln;
end.
