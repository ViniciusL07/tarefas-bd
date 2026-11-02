# Tarefa 03 - Docker Compose, MariaDB e Administração de SGBD

Este diretório contém os arquivos de infraestrutura, scripts de automação e scripts de povoamento desenvolvidos para a **Tarefa 03** da disciplina de Banco de Dados.

O objetivo deste projeto é provisionar e orquestrar um ambiente conteinerizado contendo o SGBD **MariaDB** e a interface web **CloudBeaver**, utilizando **Docker Compose** e aplicando boas práticas de segurança (gestão de variáveis de ambiente com `.env`), criação de esquemas DDL, povoamento DML e controle de acesso por usuários.

---

## 📁 Estrutura de Arquivos e Finalidade

* **`docker-compose.yml`**: Arquivo de orquestração do Docker Compose. Define a infraestrutura dos serviços `mariadb` (imagem `mariadb:11`) e `cloudbeaver` (imagem `dbeaver/cloudbeaver:latest`), configurando mapeamento de portas, dependência entre contêineres e persistência de dados via volume nomeado (`mariadb_data`).
* **`.env.example`**: Modelo de arquivo de configuração de variáveis de ambiente. Serve como documentação do contrato de configuração da infraestrutura (contém apenas nomes de variáveis e valores genéricos fictícios). Deve ser mantido no controle de versão Git.
* **`.env`**: Arquivo com as variáveis e credenciais reais utilizadas no ambiente local (como a senha do `root` e portas do serviço). **Nunca é enviado ao repositório** por questões de segurança (ignorado pelo `.gitignore`).
* **`.gitignore`**: Arquivo de instrução do Git contendo a regra `.env`, garantindo que o arquivo com credenciais de desenvolvimento não seja commitado nem rastreado no versionador.
* **`povoamento.sql`**: Script de manipulação de dados (DML) contendo comandos `INSERT INTO` gerados para expandir a base de dados com 10 novos autores e 25 novos livros com preços e datas coerentes.
* **`setup.sql`**: Script de automação idempotente desenvolvido no desafio prático. Reinicia e recria do zero todo o banco de dados `biblioteca`, suas tabelas, restrições de integridade, contas de usuários (`app_biblioteca`, `consulta`, `relatorios`) com privilégios específicos e a carga inicial completa.

---

## 🛠️ Como Executar o Ambiente

### Pré-requisitos
* Docker Engine e Docker Compose instalados no sistema operacional.

### Passo a Passo

1. **Configurar as Variáveis de Ambiente:**
   Copie o arquivo de exemplo para criar o seu `.env` local:
   `cp .env.example .env`  
   *(Ajuste as senhas e portas dentro do `.env` se necessário).*

2. **Validar a Interpolação do Docker Compose:**
   Execute a validação da estrutura antes de subir os serviços:  
   `docker compose config`

3. **Subir os Serviços Conteinerizados:**
   Inicialize os serviços em segundo plano:  
   `docker compose up -d`

4. **Acessar a Interface de Gerenciamento:**
   * Acesse no navegador: `http://localhost:8978`
   * Crie o usuário administrador do CloudBeaver no primeiro acesso.
   * Conecte-se ao banco de dados utilizando os parâmetros:
     * **Host:** `mariadb`
     * **Porta:** `3306`
     * **Database:** `biblioteca` (ou `labdb`)
     * **Usuário:** `root` (ou `app_biblioteca` / `consulta` / `relatorios`)
     * **Senha:** Conforme configurado no arquivo `.env` ou no `setup.sql`.

5. **Encerrar o Ambiente:**
   * Para pausar e remover os contêineres mantendo os dados persistidos no volume:  
     `docker compose down`
   * Para remover contêineres, redes e apagar o volume de dados por completo:  
     `docker compose down -v`
