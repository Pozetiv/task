# README

Проект можно запустить как с помощью нативного руби, так и с помощью Docker + Docker-compose 
Для запуска с помощью docker-compose:
1) сбилдить образ docker-compose build
2) установить базу docker-compose run --rm web rake db:create
3) установить миграции docker-compose run --rm web rake db:migrate
4) по необходимости установить seeds - docker-compose run --rm web rake db:seed
5) Для запуска приложения - docker-compose up -d

Для запуска теста - docker-compose run --rm web rspec
Для проверки стиля кода - docker-compose run --rm web rubocop