{*****************************************************}
{ CRUD orientado a objetos, com banco de dados Oracle }
{ Reinaldo Silveira - reinaldopsilveira@gmail.com     }
{ set/2019                                            }
{*****************************************************}

unit U_ClienteControl;

interface

uses U_BaseControl, System.SysUtils, Data.DB, Vcl.Controls;

type
  TCliente = class(TBaseControl)
  private
    FBAIRRO: String;
    FCPF: String;
    FCLIENTE_ID: Integer;
    FCEP: String;
    FNOME: String;
    FCIDADE: String;
    FENDERECO: String;
    FESTADO: String;
    procedure SetBAIRRO(const Value: String);
    procedure SetCEP(const Value: String);
    procedure SetCIDADE(const Value: String);
    procedure SetCLIENTE_ID(const Value: Integer);
    procedure SetCPF(const Value: String);
    procedure SetENDERECO(const Value: String);
    procedure SetESTADO(const Value: String);
    procedure SetNOME(const Value: String);
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }
    property CLIENTE_ID: Integer read FCLIENTE_ID write SetCLIENTE_ID;
    property NOME: String read FNOME write SetNOME;
    property CPF: String read FCPF write SetCPF;
    property ENDERECO: String read FENDERECO write SetENDERECO;
    property BAIRRO: String read FBAIRRO write SetBAIRRO;
    property CIDADE: String read FCIDADE write SetCIDADE;
    property ESTADO: String read FESTADO write SetESTADO;
    property CEP: String read FCEP write SetCEP;

    function Incluir: Boolean;
    function Alterar: Boolean;
    function Excluir: Boolean;
    function BuscarDados(pID: Integer): Boolean;
    function Pesquisar: Boolean;
  end;

implementation

{ TCliente }

uses U_Pesquisa;

function TCliente.BuscarDados(pID: Integer): Boolean;
begin
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select CLIENTE_ID, ');
  query.SQL.Add('  NOME, ');
  query.SQL.Add('  CPF, ');
  query.SQL.Add('  ENDERECO, ');
  query.SQL.Add('  BAIRRO, ');
  query.SQL.Add('  CIDADE, ');
  query.SQL.Add('  ESTADO, ');
  query.SQL.Add('  CEP ');
  query.SQL.Add('from TB_CLIENTES ');
  query.SQL.Add(Format('where CLIENTE_ID = %d', [pID]));
  query.Open;

  Result := not query.IsEmpty;

  CLIENTE_ID := query.Fields[0].AsInteger;
  NOME       := query.Fields[1].AsString;
  CPF        := query.Fields[2].AsString;
  ENDERECO   := query.Fields[3].AsString;
  BAIRRO     := query.Fields[4].AsString;
  CIDADE     := query.Fields[5].AsString;
  ESTADO     := query.Fields[6].AsString;
  CEP        := query.Fields[7].AsString;
end;

function TCliente.Incluir: Boolean;
begin
  CLIENTE_ID := GetID('SEQ_TB_CLIENTES');

  try
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('insert into TB_CLIENTES( ');
    query.SQL.Add('  CLIENTE_ID, ');
    query.SQL.Add('  NOME, ');
    query.SQL.Add('  CPF, ');
    query.SQL.Add('  ENDERECO, ');
    query.SQL.Add('  BAIRRO, ');
    query.SQL.Add('  CIDADE, ');
    query.SQL.Add('  ESTADO, ');
    query.SQL.Add('  CEP) ');
    query.SQL.Add('values( ');
    query.SQL.Add(Format('%d, ', [FCLIENTE_ID]));
    query.SQL.Add(Format('%s, ', [QuotedStr(FNOME)]));
    query.SQL.Add(Format('%s, ', [QuotedStr(FCPF)]));
    query.SQL.Add(Format('%s, ', [QuotedStr(FENDERECO)]));
    query.SQL.Add(Format('%s, ', [QuotedStr(FBAIRRO)]));
    query.SQL.Add(Format('%s, ', [QuotedStr(FCIDADE)]));
    query.SQL.Add(Format('%s, ', [QuotedStr(FESTADO)]));
    query.SQL.Add(Format('%s) ', [QuotedStr(FCEP)]));

    Result := query.ExecSQL > 0;
  except on E: Exception do
    raise Exception.CreateFmt('Erro ao alterar o cliente: %s', [E.Message]);
  end;
end;

function TCliente.Pesquisar: Boolean;
begin
  if not Assigned(F_Pesquisa) then
    F_Pesquisa := TF_Pesquisa.Create(Self);
  try
    F_Pesquisa.Caption   := 'Pesquisa de Clientes';
    F_Pesquisa.SQL_BASE  := 'select CLIENTE_ID as "Código", NOME as "Nome" from TB_CLIENTES';
    F_Pesquisa.SQL_WHERE := 'where NOME like %s';
    F_Pesquisa.SQL_ORDER := 'order by NOME';
    F_Pesquisa.ShowModal;

    Result := F_Pesquisa.ModalResult = mrOk;

    if Result then
      Result := BuscarDados(F_Pesquisa.ID);
  finally
    FreeAndNil(F_Pesquisa);
  end;
end;

function TCliente.Alterar: Boolean;
begin
  try
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('update TB_CLIENTES set ');
    query.SQL.Add(Format('  NOME = %s, ', [QuotedStr(FNOME)]));
    query.SQL.Add(Format('  CPF = %s, ', [QuotedStr(FCPF)]));
    query.SQL.Add(Format('  ENDERECO = %s, ', [QuotedStr(FENDERECO)]));
    query.SQL.Add(Format('  BAIRRO = %s, ', [QuotedStr(FBAIRRO)]));
    query.SQL.Add(Format('  CIDADE = %s, ', [QuotedStr(FCIDADE)]));
    query.SQL.Add(Format('  ESTADO = %s, ', [QuotedStr(FESTADO)]));
    query.SQL.Add(Format('  CEP = %s ', [QuotedStr(FCEP)]));
    query.SQL.Add(Format('where CLIENTE_ID = %d', [FCLIENTE_ID]));

    Result := query.ExecSQL > 0;
  except on E: Exception do
    raise Exception.CreateFmt('Erro ao incluir o cliente: %s', [E.Message]);
  end;
end;

function TCliente.Excluir: Boolean;
begin
  try
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('delete from TB_CLIENTES ');
    query.SQL.Add(Format('where CLIENTE_ID = %d', [FCLIENTE_ID]));

    Result := query.ExecSQL > 0;
  except on E: Exception do
    raise Exception.CreateFmt('Erro ao excluir o cliente: %s', [E.Message]);
  end;
end;

procedure TCliente.SetBAIRRO(const Value: String);
begin
  FBAIRRO := Value;
end;

procedure TCliente.SetCEP(const Value: String);
begin
  FCEP := Value;
end;

procedure TCliente.SetCIDADE(const Value: String);
begin
  FCIDADE := Value;
end;

procedure TCliente.SetCLIENTE_ID(const Value: Integer);
begin
  FCLIENTE_ID := Value;
end;

procedure TCliente.SetCPF(const Value: String);
begin
  FCPF := Value;
end;

procedure TCliente.SetENDERECO(const Value: String);
begin
  FENDERECO := Value;
end;

procedure TCliente.SetESTADO(const Value: String);
begin
  FESTADO := Value;
end;

procedure TCliente.SetNOME(const Value: String);
begin
  FNOME := Value;
end;

end.
