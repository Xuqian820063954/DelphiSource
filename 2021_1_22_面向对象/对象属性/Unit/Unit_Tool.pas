unit Unit_Tool;

interface//声明区域
uses Unit_Attribution; //单元内部可引用其他单元
var Name:string;//可在外部使用
implementation//实现区域
var Age:Integer;//只能在本单元使用

initialization//初始化区域，只可调用
Name:='aaa';
Age:=18;
finalization//销毁区域，只可调用
Name:='';
Age:=0;
end.
