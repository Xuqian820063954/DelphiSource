unit Unit_Inherit;

interface
type  TAnimal=class
      private//只能在同一单元访问
        FWeight:Integer;
      protected//不同单元子类可以访问
        FName:string;
      public//不同单元也可以访问
        constructor Create(FWeight:Integer);
        property Weight:Integer read FWeight write FWeight;
        procedure GetName();virtual;
      end;
      TDog=class(TAnimal)
      public
        constructor Create();
        procedure GetName();override;//重写父类中的虚方法
      end;
implementation
{ TAnimal }

constructor TAnimal.Create(Fweight:Integer);
begin
  Self.FWeight:=FWeight;
end;

procedure TAnimal.GetName;
begin
  Writeln('这是动物类的方法');
end;

{ TDog }

constructor TDog.Create;
begin
  Writeln('狗类');
  inherited Create(1001);//直接调用父类方法
end;
procedure TDog.GetName;
begin
  inherited;//调用父类中的同名方法
  Writeln('这是狗类的方法')
end;

end.
