program Project_Record;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
//记录，相当于结构体
type TStudent=record
  ID:Integer;//ID
  Name:string;//名字
end;
var Student:TStudent;
begin
  //结构体赋值
  Student.ID:=3;
  Student.Name:='aaa';
end.
