unit Unit_MainForm;

interface

uses
  Unit_Variable,Unit_AddForm,Unit_Class,
  System.Generics.Collections,Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TMainForm = class(TForm)
    BtnAdd: TButton;
    BtnDel: TButton;
    BtnUpdate: TButton;
    BtnFind: TButton;
    mmo1: TMemo;
    procedure BtnAddClick(Sender: TObject);
    procedure BtnFindClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
implementation

{$R *.dfm}

procedure TMainForm.BtnAddClick(Sender: TObject);//����
var AddForm:TAddForm;
begin
  mmo1.Lines.Clear;
  AddForm:=TAddForm.Create(Self);//���Ӵ���
  AddForm.Left:=Self.Left+Self.Width div 2-AddForm.Width div 2;
  AddForm.Top:=Self.Top+Self.Height div 2-AddForm.Height div 2;
  AddForm.ShowModal;
end;
procedure TMainForm.BtnDelClick(Sender: TObject);
begin
  TVal.Clear;
  mmo1.Lines.Clear;
end;

procedure TMainForm.BtnFindClick(Sender: TObject);//��ѯ
var Dictionary:TDictionary<string,TStudent>;
    Student:TStudent;
begin
  Dictionary:=TVal.Traverse();
  for Student in Dictionary.Values do
  begin
    mmo1.Lines.Add('ID:'+Student.ID+'   '+'Name:'+Student.Name+'   '+'Age:'+Student.Age.ToString);
  end;

end;

end.
