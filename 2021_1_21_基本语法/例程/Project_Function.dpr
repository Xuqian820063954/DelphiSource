program Project_Function;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
procedure fun0();forward;
//���ݲ����̶�
procedure fun1(var a:Integer;b:Integer);     //a����ַ(�൱��C++��&)��b��ֵ
begin

end;
//���ݲ������̶�
procedure fun2(const Number:Array of Integer);       //�ȼ���void fun1(const int *A);
begin

end;
//���ݲ������Ͳ��̶�
function fun3(const Format:string;const Args:array of const): string;
begin

end;
//Ĭ�ϴ��ݲ���
procedure fun4(a:Integer;b:Integer=2;c:Char='a');               // a��������Ĭ��ֵ
begin
  Writeln(a,' ',b,' ',c);
end;
//��������ֵ
function Add(var a:Integer;b:Integer): Integer;overload;
begin
  Result:=a+b;Exit;//�������һ��ȼ���return a+b;
end;
//var�ͷ���ֵ
procedure Sub(var a:Integer;b:Integer;var sub:Integer);//SubΪ���ò����������ڷ��ض��ֵ
begin
  sub:=a-b;
end;
//out�ͷ���ֵ
procedure Mul(var a:Integer;b:Integer;out mul:Integer);//outͬ���Ǵ���ַ�����Ǵ���Ĳ���ֻ�ܸ�ֵ����������;
begin
  Mul:=a*b;
end;
//�������ͷ���ֵ
function Divide(var a:Integer;b:Integer):Integer;
begin
  Divide:=a div b;
  Exit;
end;
//�������أ���������ͬ�������б�ͬ��
function Add(var a:Double;b:Double): Double;overload;//�������ص�ͬ��������Ҫ����overload����
begin
  Result:=a+b;
  Exit;
end;
//ǰ����������
procedure fun0();
begin

end;
var x:Integer;
    ans:Integer;
begin
  x:=100;
  fun2([2,3,4,5]);
  fun4(100,200);//����ʱ������һ������
  Writeln('Add:',Add(x,3));
  Sub(x,3,ans);
  Writeln('Sub:',ans);
  Mul(x,3,ans);
  Writeln('Mul:',ans);
  Writeln('Div:',Divide(x,3));
  Readln;
end.

