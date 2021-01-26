program Project_DelegateImplementation;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Unit_DelegateImplementation in 'unit\Unit_DelegateImplementation.pas';

{*------------------------------------------------------------------------------
  �����������뺯��ָ�빦����ͬ��
    �����ʽ type TFun=reference to function(Num:Integer):Integer;

-------------------------------------------------------------------------------}
type  TFun=reference to function(Num:Integer):Integer;
function Add(Age:Integer): Integer;
begin
  Writeln(Age);
  Result:=Age;
end;
var pfun:TFun;
var Dog:TDog;
    Cat:TCat;
    Eat:IEat;
begin
  //��ֵ����1
  pfun:=Add;
  pfun(2);
  //��ֵ����2
  pfun:=
    function(Num:Integer): Integer
    begin
      Result:=Num;
    end;
  pfun(10);
  Cat:=TCat.Create;
  Cat.Eat:=TDog.Create;//Cat.Eat��IEat���ͣ�IEat�ӿ�������һ��������TDog���˴��ĸ�ֵʵ�����Ƕ�̬
  Cat.Eat.EatIng;
  Readln;

end.
