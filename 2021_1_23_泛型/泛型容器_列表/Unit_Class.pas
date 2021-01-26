unit Unit_Class;

interface
type  Tstudent=class
      private
        FName:string;
      public
        property Name:string read FName write FName;
      constructor Create;overload;
      constructor Create(FName:string);overload;
      end;
implementation
{ Tstudent }

constructor Tstudent.Create;
begin

end;

constructor Tstudent.Create(FName: string);
begin
  Self.FName:=FName;
end;

end.
