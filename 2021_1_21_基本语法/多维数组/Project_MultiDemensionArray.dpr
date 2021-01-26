program Project_MultiDemensionArray;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
type DynamicDoubleArray=array of array of string;
     //动态二维数组 typedef string **DynamicDoubleArray;
     StaticDoubleArray=array[0..3] of array[0..2] of Integer;
     //静态二维数组 typedef int StaticDoubleArray[4][3];
var A:DynamicDoubleArray;
//二维动态数组遍历
procedure Search(A:DynamicDoubleArray);
var i,j:Integer;
begin
  for i := Low(A) to High(A) do
  begin
    for j := Low(A[i]) to High(A[i]) do
      Write(A[i][j],' ');
    Writeln;
  end;
end;
begin
  A:=[['1','2'],['3'],['4','5','6']];          //动态数组赋值
  Search(A);
  Readln;
end.
