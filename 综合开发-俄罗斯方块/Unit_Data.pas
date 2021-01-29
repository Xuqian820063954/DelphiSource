unit Unit_Data;
{*------------------------------------------------------------------------------
  @author  徐乾
  @version 2021/01/28 1.0 Initial revision.
  @comment 存储图形数据的结构
  //每种图形由4个方块组成，数组（长度4）或TList<T>实现
  //每种图形由4对坐标组成
        TPoint表示坐标
-------------------------------------------------------------------------------}
interface
uses
  Unit_Const,
  System.Generics.Collections;
type  TAct=array of array of Integer;//方块类型
      TGameData=class
      private
        ActList:TList<TAct>;//图形列表，ActList.Item[i]为第i个图形的数据
        Act:TAct;//方块数据，Act[i][0]为图形第i个方块的x坐标，Act[i][1]为图形第i个方块的y坐标
      public
        //方块数据初始化
        constructor Create();overload;
        //获取编号为ActIndex的方块数据
        function GetActByIndex(ActIndex:Integer):TAct;
      end;
      TGameMap=array[0..17] of array[0..17] of Boolean;
implementation
{ TGameData }
//根据编号返回对应图形数据，取值范围0~6
constructor TGameData.Create;
begin
  //创建图形数组
  ActList:=TList<TAct>.Create;
  //创建方块：一字型
  Act:=[[5,0],[6,0],[7,0],[8,0]];
  ActList.Add(Act);
  //创建方块：T字型
  Act:=[[5,0],[6,0],[7,0],[6,1]];
  ActList.Add(Act);
  //创建方块：L字型
  Act:=[[5,0],[6,0],[7,0],[5,1]];
  ActList.Add(Act);
  //创建方块：反L字型
  Act:=[[5,0],[6,0],[7,0],[7,1]];
  ActList.Add(Act);
  //创建方块：Z字型
  Act:=[[5,0],[6,0],[6,1],[7,1]];
  ActList.Add(Act);
  //创建方块：反Z字型
  Act:=[[5,1],[6,0],[6,1],[7,0]];
  ActList.Add(Act);
  //创建方块：田字型
  Act:=[[5,0],[6,0],[5,1],[6,1]];
  ActList.Add(Act);
end;
//获取编号为ActIndex的方块数据
function TGameData.GetActByIndex(ActIndex: Integer): TAct;
begin
  Result:=ActList.Items[ActIndex];
end;
initialization

end.
