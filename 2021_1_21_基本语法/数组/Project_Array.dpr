program Project_Array;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
//数组
type MyArray=array[0..10] of Char; //typedef char MyArray[11];
var str:MyArray;                   //MyArray str;
var A:array[0..9] of Integer;      //int A[10];
//数组遍历方式1
procedure fun1();
var index:Integer;
begin
  for Index := Low(str) to High(str) do
  begin
    Writeln(str[index]);
  end;
end;
//数组遍历方式2
procedure fun2();
var Elem:Char;
begin
  for  Elem in str do
  begin
    Writeln(Elem);
  end;
end;

begin
  Writeln(Length(str));            //sizeof(str)/sizeof(str[0]);
  str[10]:='x';                    //NameArray[10]='x';
  A[0]:=0;
  Readln;
end.
