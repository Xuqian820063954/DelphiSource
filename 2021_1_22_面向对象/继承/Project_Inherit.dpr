program Project_Inherit;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Unit_Inherit in 'unit\Unit_Inherit.pas';

{*------------------------------------------------------------------------------
  �̳У�����Ͷ���Ĺ�ϵ
  �����������Ĺ�ϵ
  �ص㣺1����ߴ���ĸ���
        2��һ������������ϵ�����Ǿ;߱��˶�̬������
        3��Delphi���ǵ��̳У��������Ƕ��̳�
  �̳��еĹ��췽��
      1������
      2����д
  �̳��еķ���Ȩ��
-------------------------------------------------------------------------------}
var Dog:TDog;
begin
  Dog:=TDog.Create;
  Dog.Weight:=100;
  Writeln(Dog.Weight);
  Dog.GetName();
  Readln;
end.
