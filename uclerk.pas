unit UClerk;

{$mode ObjFPC}{$H+}



{

                        DESENVOLVIMENTO RODRIGO RAFAEL
                        DATA ULTIMA ATUALIZAÇÃO 20/04/2023
                        PROJETO OPEN SOURCE;

                    Copyright [2023] [name of copyright owner]

                    Licensed under the Apache License, Version 2.0 (the "License");
                    you may not use this file except in compliance with the License.
                    You may obtain a copy of the License at

                        http://www.apache.org/licenses/LICENSE-2.0

                    Unless required by applicable law or agreed to in writing, software
                    distributed under the License is distributed on an "AS IS" BASIS,
                    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
                    See the License for the specific language governing permissions and
                    limitations under the License.

                    só é aceito OBJETO JSON BASICO SEGUE EXEMPLO ABAIXO

                    {
                      "Author ID":"409-56-7008",
                      "Last Name":"Bennet",
                      "First Name":"Abraham",
                      "Active": "False"
                    }
                    Atenção não o defina como um objeto array o componente já faz esse procedimento
                    exemplo
                    [
                    {
                      "Author ID":"409-56-7008",
                      "Last Name":"Bennet",
                      "First Name":"Abraham",
                      "Active": "False"
                    }
                    ]
                    caso queira ter mais registros dentro de uma grid o objeto json deve ser
                    {
                      "Author ID":"409-56-7008",
                      "Last Name":"Bennet",
                      "First Name":"Abraham",
                      "Active": "False"
                    },
                    {
                      "Author ID":"409-56-7008",
                      "Last Name":"Bennet",
                      "First Name":"Abraham",
                      "Active": "False"
                    }
                    com isso será modelado mais valores dentro de uma grid
}

interface
uses
  Classes, SysUtils, Dialogs, DB, fpjson, fpjsondataset;

type

  { TGravaLogs }

  TGravaLogs = class(TComponent)
  private
    NomeLog: String;
    Arq: TextFile;
    procedure GeraLog(Erro: String);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Erro : String write GeraLog;
    property Dir : String write NomeLog;
  end;

  { TJSONSource }

  TJSONSource = class(TDataSource)
  private
    //Após ativar propriedade Ativa e o caminho do arquivo estiver correto
    // você pode fazer manipulções com o dataset1 exemplo dataset1.fieldbyname('campo').asstring;
    //esse é um componente basico e simples para colocar em grids ou formatar mais rapidamente objeto json
    DataSet1 : TJSONDataSet;
    ArquivoCarregado : TStringList;
    Procedure LoadFile(Value : String);
    procedure Active(Value : Boolean);
    procedure SetGrid;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property LocalArquivo : String write LoadFile;
    property Ativa : Boolean write Active;
    property FiltroDataSet : TJSONDataSet read DataSet1;
  end;


  procedure register;

implementation
procedure Register;
begin
  RegisterComponents('RComponent', [TGravaLogs, TJSONSource]);
end;

{ TJSONSource }

procedure TJSONSource.LoadFile(Value: String);
Var
  Copia: String;
begin
  try
    ArquivoCarregado.LoadFromFile(Value);
    Copia:= ArquivoCarregado.Text;
    Insert('[', Copia, 1);
    Insert(']', Copia, Length(Copia) + 1);
    ArquivoCarregado.Clear;
    ArquivoCarregado.Text:=Copia;
  Except
    ArquivoCarregado.Free;
  end;
end;

procedure TJSONSource.Active(Value: Boolean);
begin
  if Value then
    SetGrid;
end;

procedure TJSONSource.SetGrid;
var
  AJSon: TJSONArray;
  OBJson: TJSONObject;
  I, J : Integer;
begin
  AJSon := GetJSON(ArquivoCarregado.Text) as TJSONArray;
  OBJson := AJSon.Items[0] as TJSONObject;
  for J := 0 to OBJson.Count -1 do
  begin
      DataSet1.FieldDefs.Add(OBJson.Names[J], ftString, 50, True);
  end;
  DataSet1.OwnsData := True;
  DataSet1.RowType :=rtJSONObject;
  DataSet1.Rows := AJSon;
  DataSet1.Active:=True;
  DataSet:=DataSet1;
end;


constructor TJSONSource.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ArquivoCarregado:=TStringList.Create;
  DataSet1 := TJSONDataSet.Create(nil);
end;

destructor TJSONSource.Destroy;
begin
  inherited Destroy;
end;

{ TGravaLogs }

procedure TGravaLogs.GeraLog(Erro: String);
begin
  AssignFile(Arq, NomeLog);
  if FileExists(NomeLog) then
    Append(arq)
  else
    ReWrite(arq);
  try
    WriteLn(arq, DateTimeToStr(Now) + ':');
    WriteLn(arq, '----------------------------------------------------------------------');
    WriteLn(Arq, 'Mensagem Sistema : ' + Erro);
  finally
    CloseFile(arq);
  end;
end;

constructor TGravaLogs.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TGravaLogs.Destroy;
begin
  inherited Destroy;
end;

end.

