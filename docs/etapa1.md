**Projeto integrador I – Documentação técnica**  
**Responsável:** Francisco Soares  
**Nome do sistema:** JESTer  
**Versão:** 1.0

## **Apresentação**

O JESTer é um Sistema de Controle de Estoque que foi desenvolvido para facilitar o gerenciamento de produtos, categorias, fornecedores e usuários, centralizando todas as informações em um banco de dados. O sistema permite registrar as movimentações de entrada e saída de produtos, substituindo controles feitos por planilhas ou registros manuais e proporcionando maior organização, confiabilidade e controle sobre o estoque.

## **Descrição do projeto e usuários**

O sistema será composto por funcionalidades voltadas ao gerenciamento de estoque, utilizando um banco de dados para armazenar e organizar as informações.  
Os principais cadastros serão:

* Categorias de produtos;  
* Fornecedores;  
* Produtos;  
* Usuários;  
* Tipos de movimentação;  
* Movimentações de estoque.

Os usuários e suas permissões:

* Administrador – Acesso completo ao sistema e todos os cadastros e movimentações.  
* Gerente – Acesso ao gerenciamento de produtos, categorias, fornecedores, movimentações e consultas.  
* Estoquista – Acesso à consulta de produtos e ao registro de entradas, saídas e ajustes de estoque.

O sistema permitirá o controle das movimentações de estoque, mantendo o histórico das operações de estoque, e garantindo a integridade das informações por meio de um banco de dados relacional.

## **Requisitos funcionais**

*  RF001 – Cadastro de categorias  
  * Permitir cadastrar, alterar, consultar e inativar categorias de produtos.
* RF002 – Cadastro de fornecedores  
  * Permitir cadastrar, alterar, consultar e inativar fornecedores.  
* RF003 – Cadastro de produtos  
  * Permitir cadastrar, alterar, consultar e inativar produtos, vinculando-os a uma categoria e a um fornecedor.  
* RF004 – Cadastro de usuários  
  * Permitir cadastrar usuários e definir seus perfis de acesso.  
* RF005 – Cadastro de tipos de movimentação  
  * Permitir cadastrar e consultar os tipos de movimentação utilizados pelo sistema.  
* RF006 – Registrar movimentações  
  * Permitir registrar entradas, saídas e demais movimentações de produtos.  
* RF007 – Consultar estoque  
  * Permitir consultar a quantidade atual de produtos cadastrados.  
* RF008 – Consultar histórico  
  * Permitir consultar o histórico completo de movimentações realizadas para cada produto.  
* RF009 – Controle de permissões  
  * Permitir que cada usuário acesse apenas as funcionalidades autorizadas para seu perfil.

## **Requisitos não funcionais**

*  RNF001 – Banco de dados  
  * O sistema deverá utilizar o MySQL como Sistema Gerenciador de Banco de Dados.  
* RNF002 – Integridade dos dados  
  * O banco deverá utilizar chaves primárias, chaves estrangeiras e restrições para garantir a consistência das informações.  
* RNF003 – Desempenho  
  * As consultas deverão ser executadas de forma eficiente para possibilitar a consulta rápida das informações.  
* RNF004 – Segurança  
  * As senhas dos usuários deverão ser armazenadas de forma criptografada pela aplicação.  
* RNF005 – Usabilidade  
  * A interface deverá possuir organização simples e intuitiva, facilitando a utilização pelos usuários.  
* RNF006 – Acessibilidade  
  * O sistema deverá considerar boas práticas de acessibilidade, como contraste adequado, navegação por teclado, formulários acessíveis e compatibilidade com leitores de tela.  
* RNF007 – Manutenibilidade  
  * O código e o banco de dados deverão seguir padrões de nomenclatura e organização para facilitar futuras manutenções.

## **Observações técnicas**

O sistema utilizará o MySQL como o Sistema Gerenciador de Banco de Dados, com uma estrutura baseada em tabelas relacionadas por chaves primárias e estrangeiras para garantir a integridade dos dados. A aplicação será desenvolvida em Java e o banco de dados foi modelado para permitir futuras expansões, mantendo a organização e a consistência das informações.
