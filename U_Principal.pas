unit U_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TF_Principal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Clientes1: TMenuItem;
    procedure Clientes1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Principal: TF_Principal;

implementation

{$R *.dfm}

uses U_CadClientes;

procedure TF_Principal.Clientes1Click(Sender: TObject);
begin
  if not Assigned(F_CadClientes) then
    F_CadClientes := TF_CadClientes.Create(Self);
  try
    F_CadClientes.ShowModal;
  finally
    FreeAndNil(F_CadClientes);
  end;
end;

end.
