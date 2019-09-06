program projDelphiPOO;

uses
  Vcl.Forms,
  U_Principal in 'U_Principal.pas' {F_Principal},
  U_Conexao in 'U_Conexao.pas',
  U_BaseControl in 'U_BaseControl.pas',
  U_ClienteControl in 'U_ClienteControl.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TF_Principal, F_Principal);
  Application.Run;
end.
