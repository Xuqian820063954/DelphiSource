program Project_Record;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
//��¼���൱�ڽṹ��
type  TStudent=record
        ID:Integer;//ID
        Name:string;//����
      end;
      TPoint=array of Integer;
      TAct=Array of TPoint;
      TActList=array of TAct;
var Student:TStudent;
    Point:TPoint;
    Act:TAct;
    ActList:TActList;
begin
  //�ṹ�帳ֵ
  Student.ID:=3;
  Student.Name:='aaa';
  Act:=[[0,0],[1,0],[2,15],[3,0]];
  Writeln(Act[2][1]);
  Readln;
end.
