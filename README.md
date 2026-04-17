# Readme
Este projeto tem como base testar o sidekiq com redis em uma aplicação Rails

## O que ele faz?
Basicamente temos uma API REST com 2 tabelas (users e posts). Quando um usuário faz um novo registro, um post welcome deve ser registrado no banco de dados utilizando o sidekiq para processar em background.

## Como rodar?
### Instalar o rails
- Não possui .env
- bundle install
- rails db:prepare
- rails s

### Rodar o banco de dados com o redis
- Rodar o projeto sandbox-postgres-redis
- rodar o docker-compose `docker-compose up`

### Docker compose sandbox-postgres-redis
````
version: '3.8'

services:
  postgres:
    image: postgres:15
    container_name: sandbox-sidekiq
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
      POSTGRES_DB: sandbox_db
    ports:
      - "5432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U postgres"]
      interval: 10s
      timeout: 5s
      retries: 5

  redis:
    image: redis:latest
    container_name: sandbox-sidekiq-redis
    ports:
      - "6379:6379"
    volumes:
      - redis_data:/data
    command: redis-server --appendonly yes

volumes:
  postgres_data:
  redis_data:
````

### execute os servidores
Para executar o rails basta usar o comando padrão:
`rails s`

Para executar o processo sidekiq:
`bundle exec sidekiq`

Para executar o servidor Redis:
Basta inicializar o container

## Como testar?
Utilizando o Insomnia é possível salvar um novo usuário:

POST http://localhost:3000/users
````
{
	"name": "renato",
	"email": "renato@gmail.com"
}
````

Uma vez salvo com sucesso, a tabela post será preenchida com o novo post do usuário "welcome".



