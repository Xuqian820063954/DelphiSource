unit Unit_Inherit;

interface
type  TAnimal=class
      private//ֻ����ͬһ��Ԫ����
        FWeight:Integer;
      protected//��ͬ��Ԫ������Է���
        FName:string;
      public//��ͬ��ԪҲ���Է���
        constructor Create(FWeight:Integer);
        property Weight:Integer read FWeight write FWeight;
        procedure GetName();virtual;
      end;
      TDog=class(TAnimal)
      public
        constructor Create();
        procedure GetName();override;//��д�����е��鷽��
      end;
implementation
{ TAnimal }

constructor TAnimal.Create(Fweight:Integer);
begin
  Self.FWeight:=FWeight;
end;

procedure TAnimal.GetName;
begin
  Writeln('���Ƕ�����ķ���');
end;

{ TDog }

constructor TDog.Create;
begin
  Writeln('����');
  inherited Create(1001);//ֱ�ӵ��ø��෽��
end;
procedure TDog.GetName;
begin
  inherited;//���ø����е�ͬ������
  Writeln('���ǹ���ķ���')
end;

end.
