unit U_BaseControl;

interface

uses
  System.Classes, Data.SqlExpr, System.SysUtils;

type
  TBaseControl = class(TComponent)
  private
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }
    query: TSQLQuery;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function GetID(pSeqName: String): Integer;
  end;

implementation

{ TBaseControl }

uses U_Conexao;

constructor TBaseControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  query := TSQLQuery.Create(Self);
  query.SQLConnection := TConexao.GetInstance.GetConnection;
end;

destructor TBaseControl.Destroy;
begin
  query.Free;
  inherited;
end;

function TBaseControl.GetID(pSeqName: String): Integer;
begin
  try
    query.Close;
    query.SQL.Text := Format('select %s.NEXTVAL from dual', [pSeqName]);
    query.Open;

    Result := query.Fields[0].AsInteger;
  except on E: Exception do
    raise Exception.CreateFmt('Erro ao obter o sequencial: %s', [E.Message]);
  end;
end;

end.
