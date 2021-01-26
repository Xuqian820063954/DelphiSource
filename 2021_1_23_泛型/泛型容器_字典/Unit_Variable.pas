unit Unit_Variable;

interface
uses
  Unit_Class,
  Winapi.Messages,System.Generics.Collections,Vcl.Dialogs;
type  TVal=class
      public
        class procedure Add(Student:TStudent);//添加
        class function Traverse():TDictionary<string,TStudent>;//遍历
        class procedure Clear();
      end;

implementation
var StudentList:TDictionary<string,TStudent>;
{ TVal }
class procedure TVal.Add(Student: TStudent);
begin
  if not StudentList.ContainsKey(Student.ID) then
    StudentList.Add(Student.ID,Student)
  else
    ShowMessage('该信息已存在！');
end;
class procedure TVal.Clear;
begin
  StudentList.Clear;
end;
class function TVal.Traverse():TDictionary<string,TStudent>;
begin
  Result:=StudentList;
end;

initialization
  StudentList:=TDictionary<string,TStudent>.Create();//初始化
end.
