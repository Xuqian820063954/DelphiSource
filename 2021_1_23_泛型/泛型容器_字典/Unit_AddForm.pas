unit Unit_AddForm;

interface

uses
  Unit_Variable,Unit_Class,
  System.Generics.Collections,Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TAddForm = class(TForm)
    lblName: TLabel;
    lblAge: TLabel;
    edtName: TEdit;
    edtAge: TEdit;
    BtnSave: TButton;
    BtnCancel: TButton;
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddForm: TAddForm;

implementation
uses Unit_MainForm;
{$R *.dfm}

procedure TAddForm.BtnCancelClick(Sender: TObject);
begin
  Self.Close;
end;
procedure TAddForm.BtnSaveClick(Sender: TObject);
var Dictionary:TDictionary<string,TStudent>;
    Key:string;
    Student:TStudent;
begin
  TVal.Add(TStudent.Create(edtName.Text,StrToInt(edtAge.Text),TGUID.NewGuid.ToString));
  Self.Close;
  MainForm.mmo1.Lines.Clear;
  Dictionary:=TVal.Traverse;
  for Key in Dictionary.Keys do
  begin
    Dictionary.TryGetValue(Key,Student);
    MainForm.mmo1.Lines.Add('ID:'+Student.ID+'   '+'Name:'+Student.Name+'   '+'Age:'+Student.Age.ToString);
  end;
end;

end.
