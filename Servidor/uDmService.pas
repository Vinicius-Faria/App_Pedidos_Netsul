unit uDmService;

interface

uses
  SysUtils, Classes, IBConnection, sqldb, SysTypes, uDWDatamodule,
  uDWJSONObject, Dialogs, ZConnection, ZDataset, ServerUtils, uDWConsts,
  uDWConstsData, RestDWServerFormU, uRESTDWPoolerDB, uRESTDWServerEvents,
  uRESTDWServerContext, uRestDWLazDriver, uRESTDWDriverZEOS, uDWJSONTools,
  uDWConstsCharset, Graphics, uDWAbout, uSystemEvents;

type

  { TServerMethodDM }

  TServerMethodDM = class(TServerMethodDataModule)
    DWServerContext1: TDWServerContext;
    DWServerEvents1: TDWServerEvents;
    RESTDWDriverZeos1: TRESTDWDriverZeos;
    RESTDWPoolerDB1: TRESTDWPoolerDB;
    ZConnection1: TZConnection;
    zQuery1: TZQuery;
    procedure DWServerContext1BeforeRenderer(aSelf: TComponent);
    procedure DWServerEvents1EventsLoginReplyEvent(var Params: TDWParams;
      var Result: String);
    procedure ServerMethodDataModuleCreate(Sender: TObject);
    procedure ZConnection1AfterConnect(Sender: TObject);
    procedure ZConnection1BeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ServerMethodDM: TServerMethodDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.lfm}

procedure TServerMethodDM.ServerMethodDataModuleCreate(Sender: TObject);
begin
  RESTDWPoolerDB1.Active := True;
end;

procedure TServerMethodDM.ZConnection1AfterConnect(Sender: TObject);
begin

end;

procedure TServerMethodDM.DWServerContext1BeforeRenderer(aSelf: TComponent);
begin

end;

procedure TServerMethodDM.DWServerEvents1EventsLoginReplyEvent(
  var Params: TDWParams; var Result: String);
var  qry : TZQuery;
  JSONVALUE : TJSONValue;
  u, s : string;
begin
  JSONVALUE := TJSONValue.Create;
  try
     u := DecodeStrings(Params.ItemsString['user'].AsString, csUndefined);
     s := DecodeStrings(Params.ItemsString['pwd'].AsString, csUndefined);
     //http://192.168.0.105:8082/Login?user=ZGF0YXByaW1l&pwd=c2VuaGE=&dwaccesstag=UVZGREVTT0tIMTAwSFhB
     if u <> '' then
     begin
     qry := TZQuery.Create( nil );
     qry.Connection := ZConnection1;
     try
        qry.sql.clear;
        qry.sql.add('select codigo, nome from usuario');
        qry.sql.add(' where login = :login           ');
        qry.sql.add(' and senha = :senha             ');

        qry.ParamByName('login').AsString := u;
        qry.ParamByName('senha').AsString := s;

        qry.Open();

        if not qry.isEmpty then
          begin
             JSONVALUE.LoadFromDataset('', qry, False, jmPureJSON);
             Result := JSONVALUE.ToJson;
          end
        else
        Result := 'erro';
     finally
       qry.Close;
       FreeAndNil( qry );
       end;
     end;
  finally
      FreeAndNil( JSONVALUE );
  end;

end;

procedure TServerMethodDM.ZConnection1BeforeConnect(Sender: TObject);
var
  Driver_BD: string;
  Porta_BD: string;
  Servidor_BD: string;
  DataBase: string;
  Pasta_BD: string;
  Usuario_BD: string;
  Senha_BD: string;
begin
  database := RestDWForm.EdBD.Text;
  Driver_BD := RestDWForm.CbDriver.Text;
  if RestDWForm.CkUsaURL.Checked then
    Servidor_BD := RestDWForm.EdURL.Text
  else
    Servidor_BD := RestDWForm.DatabaseIP;
  case RestDWForm.CbDriver.ItemIndex of
    0:
    begin
      Pasta_BD := IncludeTrailingPathDelimiter(RestDWForm.EdPasta.Text);
      Database := RestDWForm.edBD.Text;
      Database := Pasta_BD + Database;
    end;
    1: Database := RestDWForm.EdBD.Text;
  end;
  Porta_BD := RestDWForm.EdPortaBD.Text;
  Usuario_BD := RestDWForm.EdUserNameBD.Text;
  Senha_BD := RestDWForm.EdPasswordBD.Text;
  TZConnection(Sender).Database := Database;
  TZConnection(Sender).HostName := Servidor_BD;
  TZConnection(Sender).Port := StrToInt(Porta_BD);
  TZConnection(Sender).User := Usuario_BD;
  TZConnection(Sender).Password := Senha_BD;
  TZConnection(Sender).LoginPrompt := False;
end;



end.
