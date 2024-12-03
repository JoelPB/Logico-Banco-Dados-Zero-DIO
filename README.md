## Desafio de projeto da DIO [Construa um Projeto Lógico de Banco de Dados do Zero](https://web.dio.me/lab/construa-um-projeto-logico-de-banco-de-dados-do-zero/learning/9b177c3e-4237-4610-b45f-5ca6121bf810)

---

Este projeto define a estrutura de um banco de dados para uma oficina mecânica. O objetivo é armazenar informações sobre clientes, veículos, mecânicos, equipes de mecânicos, ordens de serviço (OS), peças e serviços, bem como gerenciar as relações entre essas entidades.

---

##  Estrutura do Banco de Dados
### O banco de dados inclui as seguintes tabelas:
* Clientes: Armazena informações básicas sobre os clientes, como nome e endereço.
* Veículo: Contém os veículos associados aos clientes, incluindo modelo, placa e ano.
* Mecânico: Registra informações sobre os mecânicos, incluindo suas especialidades.
* Equipe de Mecânicos: Define equipes de trabalho na oficina.
* Mecânico/Equipe de Mecânicos: Relaciona os mecânicos às equipes.
* Ordem de Serviço (OS): Armazena informações sobre as ordens de serviço, como datas, status, veículo e equipe responsável.
* Peça: Contém peças disponíveis para uso nas ordens de serviço.
* Peça/OS: Relaciona as peças às ordens de serviço.
* Serviço: Descreve os serviços oferecidos pela oficina.
* Serviço/OS: Relaciona os serviços às ordens de serviço.

---

O código SQL para criação do banco e das tabelas, assim como para inserção e consulta dos dados encontra-se no arquivo script.

---

## Como Usar
* Execute o script SQL para criar o banco de dados e as tabelas.
* Insira os dados fornecidos no script para realizar os testes.
* Utilize as consultas SQL como base para obter informações específicas do banco de dados.

---

## Possíveis Extensões

Este banco de dados pode ser ampliado para incluir:
* Controle de estoque de peças.
* Histórico de manutenção dos veículos.
* Sistema de pagamento com registro de faturas.
* Integração com aplicações de gestão de oficinas.

--- 

### Feito no [MySQL Workbench](https://www.mysql.com/products/workbench/)
