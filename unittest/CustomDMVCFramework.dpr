(*
  Copyright 2013 Ezequiel Juliano M�ller - ezequieljuliano@gmail.com

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

program CustomDMVCFramework;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  CustomDMVC in '..\src\CustomDMVC.pas',
  CustomDMVC.Impl in '..\src\CustomDMVC.Impl.pas',
  CustomDMVC.Codification in '..\src\CustomDMVC.Codification.pas',
  CustomDMVC.WebModuleBase in '..\src\CustomDMVC.WebModuleBase.pas' {CustomDMVCWebModuleBase: TWebModule} ,
  CustomDMVC.Module.Register in '..\src\CustomDMVC.Module.Register.pas',
  CustomDMVC.UnitTest in 'CustomDMVC.UnitTest.pas',
  App.WebModule in 'App.WebModule.pas' {AppWebModule: TWebModule} ,
  App.Controller in 'App.Controller.pas';

{ R *.RES }

begin

  ReportMemoryLeaksOnShutdown := True;

  DUnitTestRunner.RunRegisteredTests;

end.
