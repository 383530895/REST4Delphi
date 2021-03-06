unit Frm.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST4D, REST4D.Server;

type

  TFrmMain = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FServerContainer: IRESTServerContainer;
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses
  BasicDemo.AppWebModule;

{$R *.dfm}


procedure TFrmMain.FormCreate(Sender: TObject);
var
  vServerInfo: IRESTServerInfo;
begin
  vServerInfo := TRESTServerInfoFactory.GetInstance;
  vServerInfo.ServerName := 'ServerBasicDemo';
  vServerInfo.Port := 3000;
  vServerInfo.MaxConnections := 1024;
  vServerInfo.WebModuleClass := BasicDemoWebModuleClass;
  vServerInfo.Authentication.AddUser('ezequiel', '123');

  FServerContainer := TRESTServerContainerFactory.GetSingleton;
  FServerContainer.CreateServer(vServerInfo);
  FServerContainer.StartServers;
end;

procedure TFrmMain.FormDestroy(Sender: TObject);
begin
  FServerContainer.StopServers;
end;

end.
