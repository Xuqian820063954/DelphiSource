unit Unit_MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TMainForm = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}
uses
  Unit_Threads,Unit_Domain;
procedure TMainForm.Button1Click(Sender: TObject);
var Product:TProduct;
begin
  Product:=TProduct.Create;

  TProductionThread.Create(Product);
  TProductionThread.Create(Product);
  TProductionThread.Create(Product);

  TConsumptionThread.Create(Product);
  TConsumptionThread.Create(Product);
  TConsumptionThread.Create(Product);
end;

end.
