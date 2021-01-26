unit MainForm;

interface

uses
  Unit_Class,System.JSON,System.JSON.Serializers,System.Generics.Collections,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    mmo1: TMemo;
    BtnObjSerialize: TButton;
    BtnObjDeserialize: TButton;
    BtnArraySerialize: TButton;
    BtnArrayDeserialize: TButton;
    procedure BtnObjSerializeClick(Sender: TObject);
    procedure BtnObjDeserializeClick(Sender: TObject);
    procedure BtnArraySerializeClick(Sender: TObject);
    procedure BtnArrayDeserializeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
{$R *.dfm}
procedure TForm1.BtnObjSerializeClick(Sender: TObject);
var Serializer:TJsonSerializer;
    Student:TStudent;
begin
  Student:=TStudent.Create;
  Student.Name:='小白';
  Student.Age:=17;
  Serializer:=TJsonSerializer.Create;
  mmo1.Lines.Add('对象序列化：'+Serializer.Serialize<TStudent>(Student));
end;
procedure TForm1.BtnObjDeserializeClick(Sender: TObject);
var UserJson:string;
    Serializer:TJsonSerializer;
    Student:TStudent;
begin
  UserJson:='{"FName":"小黑","FAge":18}';
  Serializer:=TJsonSerializer.Create;
  Student:=Serializer.Deserialize<TStudent>(UserJson);//将UserJson代指的Json转化为Student
  mmo1.Lines.Add('对象反序列化：'+Student.Name+','+Student.Age.ToString);

end;
procedure TForm1.BtnArraySerializeClick(Sender: TObject);
var Student:TStudent;
    StudentList:TList<TStudent>;
    Serializer:TJsonSerializer;
begin
  StudentList:=TList<TStudent>.Create;
  StudentList.Add(TStudent.Create('aaa',18));
  StudentList.Add(TStudent.Create('bbb',19));
  Serializer:=TJsonSerializer.Create;
  mmo1.Lines.Add('数组序列化：'+Serializer.Serialize<TList<TStudent>>(StudentList));
end;
procedure TForm1.BtnArrayDeserializeClick(Sender: TObject);
var UserJson:string;
    StudentList:TList<TStudent>;
    Student:TStudent;
    Serializer:TJsonSerializer;
begin
  UserJson:='{"FListHelper":{"FCount":2},"FItems":[{"FName":"aaa","FAge":18},{"FName":"bbb","FAge":19}],"FComparer":{}}';
  Serializer:=TJsonSerializer.Create;
  StudentList:=Serializer.Deserialize<TList<TStudent>>(UserJson);
  for Student in StudentList do
  begin
    mmo1.Lines.Add('数组反序列化：'+Student.Name+','+Student.Age.ToString)
  end;
  mmo1.Lines.Add(TJSONObject.ParseJSONValue(UserJson).GetValue<TJSONObject>('FListHelper').GetValue<string>('FCount'));
  mmo1.Lines.Add(TJSONObject.ParseJSONValue(UserJson).GetValue<TJSONArray>('FItems').Count.ToString);
end;


end.
