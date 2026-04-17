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



