# Projeto Aeroportos - Desenvolvimento Backend Ruby

![docker](https://img.shields.io/badge/-docker-white?style=for-the-badge&logo=docker&color=2496ED&logoColor=white)
![mysql](https://img.shields.io/badge/-MySQL-white?style=for-the-badge&logo=mysql&color=4479A1&logoColor=white)

Este projeto faz parte do curso de desenvolvimento backend Ruby da FAP/SOFTEX. O objetivo é trabalhar com um banco de dados de Aeroportos para realizar consultas específicas utilizando SQL.

## Configuração do Ambiente

### Pré-requisitos

- Docker e Docker Compose instalados

### Configuração do Banco de Dados

1. Clone este repositório para sua máquina local:

   ```bash
   git clone https://github.com/SilvioCavalcantiBonfim/projeto-aeroporto-softex
   ```

2. Navegue até o diretório do projeto:

   ```bash
   cd projeto-aeroporto-softex
   ```

### Iniciar o Ambiente

Para iniciar o ambiente com Docker Compose:

```bash
docker-compose up -d
```

Este comando iniciará o container MySQL e Adminer para gerenciamento do banco de dados.

### Acesso ao Adminer

- Abra o navegador e acesse `http://localhost:8080`
- Use as seguintes credenciais para se conectar ao MySQL:
  - **Servidor**: db
  - **Usuário**: root
  - **Senha**: 123456
  - **Banco de Dados**: softex

### Execução dos Scripts SQL

Os scripts SQL estão disponíveis no diretório `scripts-sql/`. Para executá-los, siga as instruções abaixo:

1. Acesse o container do MySQL:

   ```bash
   docker exec -it mysql-db bash
   ```

2. Conecte-se ao MySQL:

   ```bash
   mysql -u root -p123456 softex
   ```

3. Execute os scripts SQL conforme necessário, por exemplo:

   ```sql
   source scripts-sql/cria_tabela.sql;
   ```

### Descrição dos Scripts SQL

- `cria_tabela.sql`: Script para criar a tabela `Aeroportos`.
- `insere_aeroportos.sql`: Script para inserir dados de aeroportos na tabela `Aeroportos`.
- `distancias.sql`: Consulta para calcular distâncias entre todos os pares de aeroportos.
- `aeroporto_mais_proximo_e_mais_distante.sql`: Consulta para encontrar o aeroporto mais próximo e mais distante de um aeroporto específico.
- `distancias_de_um_aeroporto.sql`: Consulta para calcular distâncias de um aeroporto específico para todos os outros aeroportos.
- `em_um_raio_de_20000_km.sql`: Consulta para contar quantos aeroportos estão dentro de um raio de 20000 Km de um aeroporto específico.

## Contribuições

Contribuições são bem-vindas. Sinta-se à vontade para enviar pull requests ou relatar problemas encontrados.

## Licença

Este projeto está licenciado sob a Licença MIT - consulte o arquivo LICENSE para mais detalhes.