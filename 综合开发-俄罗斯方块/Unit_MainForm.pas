unit Unit_MainForm;

interface

uses
  Unit_Service,Unit_Data,Unit_Const,Unit_Utils,
  LoggerPro,Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TMainForm = class(TForm)
    ListView1: TListView;
    img1: TImage;
    Timer: TTimer;
    //游戏事件
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TimerTimer(Sender: TObject);
  private
    FLog:ILogWriter;//日志字段
    GameService:TGameService;//游戏业务类对象
  public
    property Log:ILogWriter read FLog write FLog;
    //窗口初始化
    procedure InitGame();
  end;

var
  MainForm: TMainForm;
  RandomIndex:Integer;
implementation
uses
  System.Generics.Collections,LoggerPro.VCLListViewAppender;
{$R *.dfm}
//游戏帧绘制
procedure TMainForm.InitGame;
var I:Integer;
    MapWidth,MapHeight:Integer;
begin
  //设置句柄
  GameService.GameHandle:=img1.Canvas.Handle;
  //绘制背景
  GameService.DrawBackground(img1.Width,img1.Height);
  //绘制游戏主区窗口
  //游戏窗口宽度=方格大小*地图宽度格子数+2*边框宽度
  MapWidth:=Unit_Const.ACT_SIZE div 2*Unit_Const.GAME_MAP_WIDTH+2*Unit_Const.GAME_WINDOW_BORDER_WIDTH;
  //游戏窗口高度=方格大小*地图高度格子数+2*边框宽度
  MapHeight:=Unit_Const.ACT_SIZE div 2*Unit_Const.GAME_MAP_HEIGHT+2*Unit_Const.GAME_WINDOW_BORDER_WIDTH;
  GameService.DrawWindow(0,0,MapWidth,MapHeight);
  //绘制图形预览窗口（预览窗口左上角坐标，预览窗口大小）
  GameService.DrawWindow(16*18+50,0,16*12+10,16*8);
  //绘制方块预览
  GameService.DrawImage(370,50,'.\resources\'+RandomIndex.ToString+'.png',0,0);
  //绘制游戏地图
  GameService.DrawGameMap;
  //绘制图形
  for I := 0 to Length(GameService.CurrentAct)-1 do
  begin
    GameService.DrawAct(7+GameService.CurrentAct[I][0]*16,7+GameService.CurrentAct[I][1]*16,1);
  end;
  //todo 未完成
end;
//窗口加载
procedure TMainForm.FormCreate(Sender: TObject);
begin
  //建立日志库
  FLog:=BuildLogWriter([TVCLListViewAppender.Create(ListView1)]);
  //初始化游戏业务类对象
  GameService:=TGameService.Create;
  RandomIndex:=TPublicUtil.GetRandom(0,7);
  GameService.CurrentAct:=TGameData.Create.GetActByIndex(RandomIndex);
  InitGame;
end;
//键盘测试
procedure TMainForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_UP:begin
      GameService.Rotate;
      Log.Info('上','VK_UP');
    end;
    VK_DOWN:begin
      GameService.Move(0,1);
      Log.Info('下','VK_DOWN');
    end;
    VK_LEFT:begin
      GameService.Move(-1,0);
      Log.Info('左','VK_LEFT');
    end;
    VK_RIGHT:begin
      GameService.Move(1,0);
      Log.Info('右','VK_RIGHT');
    end;
    VK_SPACE:begin
      if Timer.Interval>0 then
        Timer.Interval:=0
      else Timer.Interval:=300;
      Log.Info('空格','VK_SPACE');
    end;
  end;
end;
//更新游戏帧
procedure TMainForm.TimerTimer(Sender: TObject);
var IsMove:Boolean;
    X,Y:Integer;
    I:Integer;
begin
  InitGame;
  IsMove:=GameService.Move(0,1);
  if not IsMove then begin
    for I := 0 to Length(GameService.CurrentAct)-1 do begin
      X:=GameService.CurrentAct[I][0];
      Y:=GameService.CurrentAct[I][1];
      GameService.SetGameMap(X,Y);
    end;
    RandomIndex:=TPublicUtil.GetRandom(0,7);
    GameService.CurrentAct:=TGameData.Create.GetActByIndex(RandomIndex);
  end;
  Repaint;
  //Log.Info(TPublicUtil.GetRandom(0,6).ToString,'随机数');
end;

end.
