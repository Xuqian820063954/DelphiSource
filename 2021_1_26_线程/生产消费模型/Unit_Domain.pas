unit Unit_Domain;

interface
type
  //��Ʒ��
  TProduct=class
  private
    //��Ʒ���
    FID: Integer;
    //��Ʒ����
    FName: String;
    //�Ƿ�������
    FIsConsume: Boolean;
  public
    property ID: Integer read FID write FID;
    property Name: String read FName write FName;
    property IsConsume: Boolean read FIsConsume write FIsConsume;
  end;

implementation

end.
