{*****************************************************}
{ CRUD orientado a objetos, com banco de dados Oracle }
{ Reinaldo Silveira - reinaldopsilveira@gmail.com     }
{ set/2019                                            }
{*****************************************************}

unit U_CadClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_BaseCadastro, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, U_ClienteControl;

type
  TF_CadClientes = class(TF_BaseCadastro)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtCodigo: TEdit;
    edtCPF: TMaskEdit;
    edtNome: TEdit;
    edtEndereco: TEdit;
    edtBairro: TEdit;
    edtCidade: TEdit;
    edtEstado: TEdit;
    edtCEP: TMaskEdit;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_CadClientes: TF_CadClientes;
  FCliente: TCliente;

implementation

{$R *.dfm}

procedure TF_CadClientes.btnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente excluir o cliente?', 'Confirmação', MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON2) = mrYes then
  begin
    if FCliente.Excluir then
      inherited;
  end;
end;

procedure TF_CadClientes.btnIncluirClick(Sender: TObject);
begin
  inherited;
  edtCPF.SetFocus;
end;

procedure TF_CadClientes.btnPesquisarClick(Sender: TObject);
begin
  if FCliente.Pesquisar then
  begin
    edtCodigo.Text   := IntToStr(FCliente.CLIENTE_ID);
    edtNome.Text     := FCliente.NOME;
    edtCPF.Text      := FCliente.CPF;
    edtEndereco.Text := FCliente.ENDERECO;
    edtBairro.Text   := FCliente.BAIRRO;
    edtCidade.Text   := FCliente.CIDADE;
    edtEstado.Text   := FCliente.ESTADO;
    edtCEP.Text      := FCliente.CEP;

    inherited;
  end;
end;

procedure TF_CadClientes.btnSalvarClick(Sender: TObject);
begin
  FCliente.CLIENTE_ID := StrToIntDef(edtCodigo.Text,0);
  FCliente.NOME       := edtNome.Text;
  FCliente.CPF        := edtCPF.Text;
  FCliente.ENDERECO   := edtEndereco.Text;
  FCliente.BAIRRO     := edtBairro.Text;
  FCliente.CIDADE     := edtCidade.Text;
  FCliente.ESTADO     := edtEstado.Text;
  FCliente.CEP        := edtCEP.Text;

  if statusCad = stsInclusao then
  begin
    if FCliente.Incluir then
      edtCodigo.Text := IntToStr(FCliente.CLIENTE_ID);
  end
  else
    FCliente.Alterar;

  inherited;
end;

procedure TF_CadClientes.FormCreate(Sender: TObject);
begin
  inherited;
  FCliente := TCliente.Create(Self);
end;

procedure TF_CadClientes.FormDestroy(Sender: TObject);
begin
  inherited;
  FCliente.Free;
end;

end.
