program Project_DynamicArray;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
//动态数组
type StringArray=array of string;     //typedef char **StringArray;
var strs:StringArray;                 //StringArray strs;
    str1:StringArray;
    str2:StringArray;
//初始化
procedure Init();
begin
  SetLength(strs,10);                 //strs=(char **)malloc(10*sizeof(char *));
  Writeln(Length(strs));
  strs:=StringArray.Create('aa','bb');//strs={"aa","bb"};会改变长度
  Writeln(Length(strs),',',strs[0],',',strs[1]);
  strs:=['aa','bb','cc'];             //strs={"aa","bb","cc"};会改变长度
  Writeln(Length(strs),',',strs[0],',',strs[1],',',strs[2]);
end;
//遍历1,在一行内输出str的所有元素
procedure Search1(str:StringArray);
var index:Integer;
begin
  for Index := Low(str) to High(str) do
  begin
    Write(str[index],' ');
  end;
  Writeln('');
end;
//遍历2
procedure Search2();
var Elem:string;
begin
  for  Elem in strs do
  begin
    Writeln(Elem);
  end;
end;
begin
  str1:=['aa','bb'];
  str2:=['11','22'];
  strs:=['xx','yy','zz'];
  //连接数组
  strs:=Concat(str1,str2);                //strs=str1+str2;且str1,str2内容不变
  //复制数组
  strs:=Copy(str1,Low(str1),Length(str1));//strcpy(strs,str1);且功能更强大
  //插入数组
  Insert(str2,strs,1);                    //将str2插入到strs[1]之前，若插入的位置大于strs长度，则插到最后
  Search1(str1);
  Search1(str2);
  Search1(strs);
  //删除数组
  Delete(strs,1,2);                       //从str[1]开始删除两个元素，
                                          //若要删除的首元素位置大于strs长度，不做改变
                                          //若要删除的长度大于str长度，只把能删除的删除
  Search1(str1);
  Search1(str2);
  Search1(strs);
  Readln;
end.
