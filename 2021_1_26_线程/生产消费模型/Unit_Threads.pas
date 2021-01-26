unit Unit_Threads;

interface

uses
  Unit_Domain,
  System.SysUtils,System.Classes;

type
  //生产线程类
  TProductionThread=class(TThread)
  private
    FProduct:TProduct;
  protected
    procedure Execute; override;
  public
    constructor Create();overload;
    constructor Create(FProduct:TProduct);overload;
  end;
  //消费线程类
  TConsumptionThread=class(TThread)
  private
    FProduct:TProduct;
  protected
    procedure Execute; override;
  public
    constructor Create();overload;
    constructor Create(FProduct:TProduct);overload;
  end;
implementation
uses Unit_MainForm;
{ TProductionThread }
constructor TProductionThread.Create;//无参构造
begin
  inherited Create(True);
end;
constructor TProductionThread.Create(FProduct: TProduct);//有参构造
begin
  inherited Create(False);
  Self.FProduct:=FProduct;
end;
procedure TProductionThread.Execute;//启动线程
begin
  while True do begin
    System.TMonitor.Enter(Self.FProduct);//进入线程临界区
    //有产品时输出产品
    if not Self.FProduct.IsConsume then begin
      Self.FProduct.ID:=Self.FProduct.ID+1;
      MainForm.Memo1.Lines.Add('生产线程ID：'+Self.ThreadID.ToString+'，当前产品编号'+Self.FProduct.ID.ToString);
      Self.Sleep(1000);
      //生产完成后表示有产品
      Self.FProduct.IsConsume:=True;
    end;
    //无产品时生产线程等待，并唤醒消费线程
    System.TMonitor.Pulse(Self.FProduct);
    System.TMonitor.Wait(Self.FProduct,INFINITE);
    System.TMonitor.Exit(Self.FProduct);//退出线程临界区
  end;
end;

{ TConsumptionThread }

constructor TConsumptionThread.Create;//空参构造
begin
  inherited Create(True);
end;
constructor TConsumptionThread.Create(FProduct: TProduct);//有参构造
begin
  inherited Create(False);
  Self.FProduct:=FProduct;
end;
procedure TConsumptionThread.Execute;//启动线程
begin
  while True do begin
    System.TMonitor.Enter(Self.FProduct);//进入线程临界区
    //有产品时消费产品
    if Self.FProduct.IsConsume then begin
      MainForm.Memo1.Lines.Add('消费线程ID：'+Self.ThreadID.ToString+'，当前产品编号'+Self.FProduct.ID.ToString);
      Self.Sleep(1000);
      //生产完成后表示有产品
      Self.FProduct.IsConsume:=False;
    end;
    //无产品时消费线程等待并唤醒消费线程
    System.TMonitor.Pulse(Self.FProduct);
    System.TMonitor.Wait(Self.FProduct,INFINITE);
    System.TMonitor.Exit(Self.FProduct);//退出线程临界区
  end;
end;


end.
