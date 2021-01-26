unit Unit_Domain;

interface
type
  //产品类
  TProduct=class
  private
    //产品编号
    FID: Integer;
    //产品名称
    FName: String;
    //是否已消费
    FIsConsume: Boolean;
  public
    property ID: Integer read FID write FID;
    property Name: String read FName write FName;
    property IsConsume: Boolean read FIsConsume write FIsConsume;
  end;

implementation

end.
