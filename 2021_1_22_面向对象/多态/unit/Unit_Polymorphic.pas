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
  Writeln('������');
end;

procedure TDog.Run;
begin
  Writeln('������');
end;

{ TCat }

procedure TCat.CatchMouse;
begin
  Writeln('èץ����');
end;

procedure TCat.Run;
begin
  Writeln('è����');
end;

end.
