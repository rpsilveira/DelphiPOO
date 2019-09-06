program projDelphiPOO;

uses
  Vcl.Forms,
  U_Principal in 'U_Principal.pas' {F_Principal},
  U_Conexao in 'U_Conexao.pas',
  U_BaseControl in 'U_BaseControl.pas',
  U_ClienteControl in 'U_ClienteControl.pas',
  U_BaseCadastro in 'U_BaseCadastro.pas' {F_BaseCadastro},
  U_CadClientes in 'U_CadClientes.pas' {F_CadClientes},
  U_Pesquisa in 'U_Pesquisa.pas' {F_Pesquisa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TF_Principal, F_Principal);
  Application.Run;
end.
