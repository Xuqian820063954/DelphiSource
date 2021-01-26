unit Unit_TWork;

interface

uses
  System.SyncObjs,System.SysUtils,System.Classes;

type
  TWork = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  public
    procedure Work();
  end;

implementation
{*------------------------------------------------------------------------------
  �̰߳�ȫ
    ����̹߳���һ�����ݣ���֤�����ݵ�ִ�н������ȷ��
  �������
    1���߳�ͬ�����̰߳�ȫ����VCL�ؼ��󲿷����̲߳���ȫ��
    2��Delphi�ľ���ʵ�ַ�ʽ
      a)Synchronize
      b)�ٽ���(TCriticalSection)
      c)������(TMutex)
      d)�ź���(TEvent)
      e)TMonitor
    3��ʹ�ó���
      1)������̷߳���ͬһ������ʱ��Ϊ�˱�֤���ݵ���ȷ��������Ҫͬ��
        �߳�ͬ��������Ч�ʵͣ������Ա�֤���ݵİ�ȫ��
        �߳��첽���죨Ч�ʸߣ������ܱ�֤���ݵİ�ȫ��
    4����չ֪ʶ
      �̳߳� system.Threading.TThreadPool
-------------------------------------------------------------------------------}
uses Unit_MainForm;
var I:Integer;
    CriticalSection:TCriticalSection;
procedure TWork.Execute;
begin
  FreeOnTerminate:=True;
//  Self.Synchronize(Work);
  CriticalSection.Enter;//�����ٽ���
  Work();               //��������
  CriticalSection.Leave;//�뿪�ٽ���
end;
procedure TWork.Work;
begin
  while True do begin
    Form1.mmo1.Lines.Add('�̱߳�ţ�'+Self.ThreadID.ToString+','+I.ToString);
    if I=10 then Exit;
    Inc(I);
    Self.Sleep(100);
  end;
end;
initialization
  CriticalSection:=TCriticalSection.Create;
finalization
  FreeAndNil(CriticalSection);
end.
