{*****************************************************}
{ CRUD orientado a objetos, com banco de dados Oracle }
{ Reinaldo Silveira - reinaldopsilveira@gmail.com     }
{ set/2019                                            }
{*****************************************************}

unit U_BaseCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TStatusCad = (stsVazio, stsConsulta, stsInclusao, stsAlteracao);

  TF_BaseCadastro = class(TForm)
    pnlBottom: TPanel;
    btnIncluir: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    sep1: TBevel;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    sep2: TBevel;
    btnPesquisar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    FstatusCad: TStatusCad;
    procedure SetstatusCad(const Value: TStatusCad);
    { Private declarations }
  public
    { Public declarations }
    property statusCad: TStatusCad read FstatusCad write SetstatusCad;
    procedure AlteraStatusBotoes;
    procedure LimpaCampos;
  end;

var
  F_BaseCadastro: TF_BaseCadastro;

implementation

{$R *.dfm}

{ TF_BaseCadastro }

procedure TF_BaseCadastro.AlteraStatusBotoes;
var
  i: Integer;
begin
  btnIncluir.Enabled   := statusCad in [stsVazio, stsConsulta];
  btnAlterar.Enabled   := statusCad = stsConsulta;
  btnExcluir.Enabled   := statusCad = stsConsulta;
  btnSalvar.Enabled    := statusCad in [stsInclusao, stsAlteracao];
  btnCancelar.Enabled  := statusCad in [stsInclusao, stsAlteracao];
  btnPesquisar.Enabled := statusCad in [stsVazio, stsConsulta];

  for i := 0 to ComponentCount -1 do
    if Components[i] is TCustomEdit then
      TCustomEdit(Components[i]).ReadOnly := statusCad in [stsVazio, stsConsulta];
end;

procedure TF_BaseCadastro.btnAlterarClick(Sender: TObject);
begin
  statusCad := stsAlteracao;
end;

procedure TF_BaseCadastro.btnCancelarClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente cancelar a operação?', 'Confirmação', MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON2) = mrNo then
    Abort;

  if statusCad = stsInclusao then
    statusCad := stsVazio
  else
    statusCad := stsConsulta;
end;

procedure TF_BaseCadastro.btnExcluirClick(Sender: TObject);
begin
  LimpaCampos;
  statusCad := stsVazio;
end;

procedure TF_BaseCadastro.btnIncluirClick(Sender: TObject);
begin
  LimpaCampos;
  statusCad := stsInclusao;
end;

procedure TF_BaseCadastro.btnPesquisarClick(Sender: TObject);
begin
  statusCad := stsConsulta;
end;

procedure TF_BaseCadastro.btnSalvarClick(Sender: TObject);
begin
  statusCad := stsConsulta;
end;

procedure TF_BaseCadastro.FormShow(Sender: TObject);
begin
  statusCad := stsVazio;
end;

procedure TF_BaseCadastro.LimpaCampos;
var
  i: Integer;
begin
  for i := 0 to ComponentCount -1 do
    if Components[i] is TCustomEdit then
      TCustomEdit(Components[i]).Clear;
end;

procedure TF_BaseCadastro.SetstatusCad(const Value: TStatusCad);
begin
  FstatusCad := Value;
  AlteraStatusBotoes;
end;

end.
