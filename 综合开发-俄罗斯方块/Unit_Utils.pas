unit Unit_Utils;

interface
type  TPublicUtil=class
      class function GetRandom(Min,Max:Integer): Integer;
      end;
implementation

{ TPublicUtil }
//获取指定范围的随机数（最小值，最大值）：返回随机数
class function TPublicUtil.GetRandom(Min, Max: Integer): Integer;
begin
  Randomize;
  Result:=Random(Max)mod(Max-Min+1)+Min;
end;

end.
