unit Unit_Utils;

interface
type  TPublicUtil=class
      class function GetRandom(Min,Max:Integer): Integer;
      end;
implementation

{ TPublicUtil }
//��ȡָ����Χ�����������Сֵ�����ֵ�������������
class function TPublicUtil.GetRandom(Min, Max: Integer): Integer;
begin
  Randomize;
  Result:=Random(Max)mod(Max-Min+1)+Min;
end;

end.
