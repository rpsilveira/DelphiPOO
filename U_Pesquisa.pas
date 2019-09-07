{*****************************************************}
{ CRUD orientado a objetos, com banco de dados Oracle }
{ Reinaldo Silveira - reinaldopsilveira@gmail.com     }
{ set/2019                                            }
{*****************************************************}

unit U_Pesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.StdCtrls, Data.SqlExpr, Data.DB;

type
  TF_Pesquisa = class(TForm)
    pnlPesquisa: TPanel;
    lstPesquisa: TListView;
    pnlBotoes: TPanel;
    edtPesquisa: TEdit;
    btnLimpar: TSpeedButton;
    btnConfirma: TBitBtn;
    btnCancela: TBitBtn;
    procedure edtPesquisaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
  private
    { Private declarations }
    dataset: TSQLQuery;
    procedure PreencheListView;
  public
    { Public declarations }
    SQL_BASE, SQL_WHERE, SQL_ORDER: String;
    ID: Integer;
  end;

var
  F_Pesquisa: TF_Pesquisa;

implementation

{$R *.dfm}

uses U_Conexao;

procedure TF_Pesquisa.btnConfirmaClick(Sender: TObject);
begin
  if not Assigned(lstPesquisa.Selected) then
  begin
    Application.MessageBox('Nenhum item selecionado, verifique!', 'Informação', MB_ICONINFORMATION);
    Abort;
  end;

  ID := Integer(lstPesquisa.Selected.Data); //recupera o ID do item selecionado

  ModalResult := mrOk;
end;

procedure TF_Pesquisa.btnLimparClick(Sender: TObject);
begin
  edtPesquisa.Clear;
end;

procedure TF_Pesquisa.edtPesquisaChange(Sender: TObject);
begin
  btnLimpar.Visible := edtPesquisa.Text <> '';

  dataset.Close;
  dataset.SQL.Clear;
  dataset.SQL.Add(SQL_BASE);
  dataset.SQL.Add(Format(SQL_WHERE, [QuotedStr('%'+ edtPesquisa.Text +'%')]));  
  dataset.SQL.Add(SQL_ORDER);
  dataset.Open;  

  PreencheListView;
end;

procedure TF_Pesquisa.FormCreate(Sender: TObject);
begin
  dataset := TSQLQuery.Create(Self);
  dataset.SQLConnection := TConexao.GetInstance.GetConnection;
end;

procedure TF_Pesquisa.FormDestroy(Sender: TObject);
begin
  dataset.Free;
end;

procedure TF_Pesquisa.FormShow(Sender: TObject);
var
  i: Integer;
begin
  dataset.Close;
  dataset.SQL.Clear;
  dataset.SQL.Add(SQL_BASE);
  dataset.SQL.Add(SQL_ORDER);
  dataset.Open;

  //adiciona os títulos no ListView
  for i := 0 to dataset.FieldCount -1 do
    with lstPesquisa.Columns.Add do
    begin
      AutoSize := True;
      Width    := -2;
      Caption  := dataset.Fields[i].FieldName;
    end;

  PreencheListView;
end;

procedure TF_Pesquisa.PreencheListView;
var
  i: Integer;
begin
  lstPesquisa.Clear;

  //adiciona os itens no ListView
  dataset.First;
  while not dataset.Eof do
  begin
    with lstPesquisa.Items.Add do
    begin
      Caption := dataset.Fields[0].AsString;
      Data    := Pointer(dataset.Fields[0].AsInteger); //armazena o ID para recuperar depois (ao confirmar)

      for i := 1 to dataset.FieldCount -1 do
        SubItems.Add(dataset.Fields[i].AsString);
    end;
  
    dataset.Next;
  end;  
end;

end.
