(*
  Copyright 2014 Ezequiel Juliano M�ller - ezequieljuliano@gmail.com

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
*)

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
