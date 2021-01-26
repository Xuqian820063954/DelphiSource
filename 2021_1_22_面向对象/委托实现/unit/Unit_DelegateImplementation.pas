unit Unit_DelegateImplementation;

interface
type  IEat=interface
        procedure Eating();
      end;
      TDog=class(TInterfacedObject,IEat)
        procedure Eating();
      end;
      TCat=class(TInterfacedObject,IEat)
      private
        FEat:IEat;
      public
        property Eat:IEat read FEat write FEat implements IEat;
      end;
implementation

{ TDog }

procedure TDog.Eating;
begin
  Writeln('¹·³Ô¶«Î÷');
end;

end.
