unit Unit_GenericContainer;

interface

uses
  System.Generics.Collections,Unit_Class,Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    mmo1: TMemo;
    BtnAdd: TButton;
    BtnDel: TButton;
    BtnFind: TButton;
    BtnUpdate: TButton;
    BtnClear: TButton;
    edtUserName: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BtnFindClick(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  //学生列表
  StudentList:TList<Tstudent>;
implementation

{$R *.dfm}

procedure TForm1.BtnAddClick(Sender: TObject);
var Student:Tstudent;
begin
  if edtUserName.Text <> '' then
  begin
    StudentList.Add(Tstudent.Create(edtUserName.Text));
    mmo1.Lines.Clear;
    for Student in StudentList do
    begin
      mmo1.Lines.Add(Student.Name);
    end;
  end
  else
    MessageBox(Self.Handle,'姓名不能为空','温馨提示',MB_OK);
end;

procedure TForm1.BtnFindClick(Sender: TObject);
var Student:Tstudent;
begin
  for Student in StudentList do
  begin
    mmo1.Lines.Add(Student.Name);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  StudentList:=TList<Tstudent>.Create;
  StudentList.Add(Tstudent.Create('aaa'));
  StudentList.Add(Tstudent.Create('bbb'));
  StudentList.Add(Tstudent.Create('ccc'));
  StudentList.Add(Tstudent.Create('ddd'));
  StudentList.Add(Tstudent.Create('eee'));
end;
end.
