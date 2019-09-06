{*****************************************************}
{ CRUD orientado a objetos, com banco de dados Oracle }
{ Reinaldo Silveira - reinaldopsilveira@gmail.com     }
{ set/2019                                            }
{*****************************************************}

unit U_Conexao;

interface

uses
  System.Classes, Vcl.Forms, Data.DB, Data.SqlExpr, Data.DBXOracle,
  System.SysUtils;

type
  TConexao = class(TComponent)
  private
    { private declarations }
    FConnection: TSQLConnection;
    class var FInstance: TConexao;
  protected
    { protected declarations }
  public
    { public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    class function GetInstance: TConexao;
    function GetConnection: TSQLConnection;
  end;

implementation

{ TConexao }

constructor TConexao.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FConnection := TSQLConnection.Create(Self);
  try
    FConnection.LoginPrompt := False;
    FConnection.DriverName  := 'Oracle';
    FConnection.Params.Values['VendorLib']   := 'oci.dll';
    FConnection.Params.Values['LibraryName'] := 'dbxora.dll';
    FConnection.Params.Values['DataBase']    := 'xe';
    FConnection.Params.Values['User_Name']   := 'SYSTEM';
    FConnection.Params.Values['Password']    := '123456';
    FConnection.Params.Values['Decimal Separator'] := FormatSettings.DecimalSeparator; //evita problemas com campos float
  except on E: Exception do
    raise Exception.CreateFmt('Erro ao conectar com o banco de dados: %s', [E.Message]);
  end;
end;

destructor TConexao.Destroy;
begin
  FConnection.Free;
  inherited;
end;

function TConexao.GetConnection: TSQLConnection;
begin
  Result := FConnection;
end;

class function TConexao.GetInstance: TConexao;
begin
  if not Assigned(FInstance) then
    FInstance := TConexao.Create(Application);
  Result := FInstance;
end;

end.
