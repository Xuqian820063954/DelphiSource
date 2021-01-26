program Project_StudentSystem;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
//类型定义
type  StudentType=record
        ID:string;
        Name:string;
      end;
      StudentListType=array of StudentType;
//变量定义
var StudentList:StudentListType;
//菜单
procedure ShowMenu();
begin
  Writeln('***********学生信息管理系统***********');
  Writeln('            1、添加信息               ');
  Writeln('            2、删除信息               ');
  Writeln('            3、查询信息               ');
  Writeln('            4、修改信息               ');
  Writeln('**************************************');
end;
//添加信息
procedure AddRecord();
var Student:StudentType;
    ArrayLength:Integer;
    UUID:TGUID;
    StrUUID:string;
begin
  Writeln('您选择了添加功能，请输入学生姓名：');
  ArrayLength:=Length(StudentList);
  CreateGUID(UUID);
  StrUUID:=GUIDToString(UUID);
  Student.ID:= Copy(StrUUID,11,4)+Copy(StrUUID,16,4);
  Readln(Student.Name);
  Insert(Student,StudentList,Length(StudentList));
  if Length(StudentList)>ArrayLength then begin
    Writeln('添加成功!');
    Writeln('学生姓名：',Student.Name,'  ','学生ID：',Student.ID);
  end
  else Writeln('添加失败');
end;
//查询信息
procedure FindStudent();
var Student:StudentType;
begin
  Writeln('您选择了查询功能，信息列表如下：');
  for Student in StudentList do begin
    with Student do begin
      Writeln('编号：',ID,',',#$09,'姓名：',Name);
    end;
  end;
  Writeln('');
end;
//删除信息
procedure DeleteStudent();
var Student:StudentType;
    UserName:string;
    IsTrue:string;
    Index:Integer;
begin
  Writeln('您选择了删除功能，请输入要删除的学生姓名');
  Readln(UserName);
  Index:=0;
  for Student in StudentList do begin
     with Student do begin
       if UserName=Name then begin
         Writeln('您确定要删除【',ID,':',Name,'】信息吗？Y/N');
         Readln(IsTrue);
         if IsTrue='Y' then
           Delete(StudentList,Index,1);
         Exit;
       end;
       Inc(Index);
     end;
  end;
end;
//修改信息
procedure UpdateStudent();
var UserName:string;
    I:Integer;
begin
  Writeln('您选择了修改功能，请输入要修改的学生姓名');
  Readln(UserName);
  for I := Low(StudentList) to High(StudentList) do begin
    with StudentList[I] do begin
      if UserName=Name then begin
        Writeln('请输入新名字：');
        Readln(UserName);
        Name:=UserName;
        Break;
      end;
    end;
  end;
  if I=High(StudentList)+1 then
    Writeln('修改失败，查无此人！');
end;
//用户选择功能
procedure UserChoice();
var Choice:Integer;
begin
  Writeln('请选择你要使用的功能：');
  Readln(Choice);
  case Choice of
    1:AddRecord();
    2:DeleteStudent();
    3:FindStudent();
    4:UpdateStudent();
    else Writeln('请输入正确的功能编号');
  end;
end;
begin
  StudentList:=[];
  while True do begin
    ShowMenu();
    UserChoice();
  end;
  Readln;
end.
