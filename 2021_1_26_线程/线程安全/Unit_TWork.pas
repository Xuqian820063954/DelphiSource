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
  线程安全
    多个线程共享一块数据，保证该数据的执行结果是正确的
  解决方案
    1、线程同步（线程安全），VCL控件大部分是线程不安全的
    2、Delphi的具体实现方式
      a)Synchronize
      b)临界区(TCriticalSection)
      c)互斥体(TMutex)
      d)信号量(TEvent)
      e)TMonitor
    3、使用场景
      1)当多个线程访问同一个对象时，为了保证数据的正确性我们需要同步
        线程同步：慢（效率低），可以保证数据的安全性
        线程异步：快（效率高），不能保证数据的安全性
    4、扩展知识
      线程池 system.Threading.TThreadPool
-------------------------------------------------------------------------------}
uses Unit_MainForm;
var I:Integer;
    CriticalSection:TCriticalSection;
procedure TWork.Execute;
begin
  FreeOnTerminate:=True;
//  Self.Synchronize(Work);
  CriticalSection.Enter;//进入临界区
  Work();               //保护代码
  CriticalSection.Leave;//离开临界区
end;
procedure TWork.Work;
begin
  while True do begin
    Form1.mmo1.Lines.Add('线程编号：'+Self.ThreadID.ToString+','+I.ToString);
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
