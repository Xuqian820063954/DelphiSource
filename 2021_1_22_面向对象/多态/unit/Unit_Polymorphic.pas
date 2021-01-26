unit Unit_Polymorphic;

interface
type  IColor=interface

      end;
      TAnimal=class(TInterfacedObject)
      public
        procedure Run();virtual;abstract;
      end;
      TDog=class(TAnimal,IColor)
        procedure Run();override;
        procedure Guard();
      end;
      TCat=class(TAnimal,IColor)
        procedure Run();override;
        procedure CatchMouse();
      end;
implementation

{ TDog }

procedure TDog.Guard;
begin
  Writeln('狗看门');
end;

procedure TDog.Run;
begin
  Writeln('狗在跑');
end;

{ TCat }

procedure TCat.CatchMouse;
begin
  Writeln('猫抓老鼠');
end;

procedure TCat.Run;
begin
  Writeln('猫在跑');
end;

end.
