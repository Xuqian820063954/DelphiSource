unit Unit_INI;

interface

uses
  System.IOUtils,System.IniFiles,Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TMainForm = class(TForm)
    lblName: TLabel;
    lblSex: TLabel;
    edtName: TEdit;
    rgSex: TRadioGroup;
    rbMan: TRadioButton;
    rbWoman: TRadioButton;
    lblAge: TLabel;
    edtAge: TEdit;
    lblHobby: TLabel;
    grpHobby: TGroupBox;
    chkHobby1: TCheckBox;
    chkHobby2: TCheckBox;
    cbbAddress: TComboBox;
    lblAddress: TLabel;
    BtnSave: TButton;
    procedure BtnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  ConfigPath:string;

implementation

{$R *.dfm}

procedure TMainForm.BtnSaveClick(Sender: TObject);
var IniFile:TIniFile;
    Section:string;
begin
  //�����ļ�
  IniFile:=TIniFile.Create('C:\Users\lenovo\Desktop\Delphi\2021_1_25_INI�ļ�\Userconfig.ini');
  Section:='basic';
  IniFile.WriteString(Section,'EditName',edtName.Text);
  IniFile.WriteString(Section,'EditAge',edtAge.Text);
  IniFile.WriteBool(Section,'Man',rbMan.Checked);
  IniFile.WriteBool(Section,'Hobby1',chkHobby1.Checked);
  IniFile.WriteBool(Section,'Hobby2',chkHobby2.Checked);
  IniFile.WriteInteger(Section,'Address',cbbAddress.ItemIndex);
end;

procedure TMainForm.FormCreate(Sender: TObject);
var IniFile:TIniFile;
begin
  IniFile:=TIniFile.Create(TDirectory.GetCurrentDirectory()+'\UserConfig.ini');
  edtName.Text:=IniFile.ReadString('basic','editName','');
  edtAge.Text:=IniFile.ReadString('basic','editAge','');
  rbMan.Checked:=IniFile.ReadBool('basic','Man',False);
  rbWoman.Checked:=not rbMan.Checked;
  chkHobby1.Checked:=IniFile.ReadBool('basic','Hobby1',False);
  chkHobby2.Checked:=IniFile.ReadBool('basic','Hobby2',False);
  cbbAddress.ItemIndex:=IniFile.ReadInteger('basic','Address',0);

end;

end.
