# DelphiPOO
Exemplo didático de CRUD (acrônimo de Create, Read, Update, Delete - ou seja, as quatro operações básicas do banco de dados)
desenvolvido em Delphi, orientado a objetos (foi utilizada a versão XE7, mas é compatível com outras versões do Delphi).

Banco de dados Oracle (foi utilizada a versão 11g Express, mas é compatível com outras versões do Oracle).

Utiliza o driver dbExpress, nativo do Delphi, para conexão com o banco de dados Oracle.

Para utilização, é necessário configurar a unit U_Conexao.pas de acordo com os dados da conexão (database, username, password).

Caso apresente erro referente a biblioteca "oci.dll", adicione o diretório de instalação do Oracle nas variáveis de ambiente do Windows (exemplo: "C:\oraclexe\app\oracle\product\11.2.0\server\bin").

Também é possível utilizar outros bancos de dados, como SQL Server ou Firebird, por exemplo - basta apenas ajustar a classe de conexão (U_Conexao.pas).
