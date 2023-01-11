## Part 1. Готовый докер
###### Взял с официальный докер образ nginx и скачал его при помощи [ docker pull ] и проверил наличие докер образа с помощью команды [ docker images]
![p](screens/docker_pulland_images.png)
###### Запустил образ докер в фоновом режиме с помощью команды [ docker run -d ] и проверил, что образ запустился через [ docker ps ]
![a](screens/docker_run_ps.png)
###### Посмотрел информацию о контейнере через [ docker inspect ]
![s](screens/docker_inspect.png)
###### Размер контейнера = 1095
![h](screens/size.png)
###### Проверил эту информацию через [docker ps -s]
![a](screens/size(2).png)
###### Список замапленных портов:
![l](screens/ports.png)
###### Ip address:
![o](screens/ip_address.png)
###### Остановил докер контейнер с помощью команды [ docker stop ]
###### Также проверил, что докер остановился через [ docker ps ]
![x](screens/docker_stop_ps.png)
###### Запустил докер с замапленными портами 80 и 443 на локальную машину через команду run
![b](screens/start_container.png)
###### Проверил, что в браузере по адресу localhost:80 доступна стартовая страница nginx
![e](screens/local_host.png)
###### Перезапустил докер контейнер через [ docker restart ] и проверил, что он  
![b](screens/restart.png)

## Part 2. Операции с контейнером

###### Прочитал конфигурационный файл nginx.conf внутри докер образа через команду exec
![s](screens/read_conf.png)
###### Создал на локальной машине файл nginx.conf и настроил в нем по пути /status отдачу страницы статуса сервера nginx
![u](screens/new_config.png)
###### Скопировал созданный файл nginx.conf внутрь докер образа через команду docker cp и перезапустить nginx внутри докер образа через команду exec
![k](screens/docker_cp_reload.png)
###### Проверил, что по адресу localhost:80/status отдается страничка со статусом сервера nginx
![u](screens/localhost_status.png)
###### Экспортировать контейнер в файл container.tar через команду export
![z](screens/export.png)
###### Остановил контейнер
![a](screens/docker_stop_again.png)
###### Удалил образ через docker rmi -f [image_id|repository], не удаляя перед этим контейнеры
![h](screens/docker_rmi.png)
###### Удалил остановленный контейнер
![a](screens/docker_delet.png)
###### Импортировал контейнер обратно через команду import, запустил импортированный контейнер и проверил что по адресу localhost:80/status отдается страничка со статусом сервера nginx
![r](screens/every_thing.png)
![r](screens/pref.png)

## Part 3. Мини веб-сервер
###### Написал мини сервер на C и FastCgi, который будет возвращать простейшую страничку с надписью Hello World!
![d](screens/mini_server.png)
###### Обновил пакеты в контейнере и подгрузил библиотеку fcgi
![u](screens/refresh.png)
![m](screens/download_fcgi.png)
###### Запустил написанный мини сервер через spawn-fcgi на порту 8080
![a](screens/run_success.png)
###### Написал свой nginx.conf, который будет проксировать все запросы с 81 порта на 127.0.0.1:8080
![i](screens/nginx_conf_81.png)
###### Проверил, что в браузере по localhost:81 отдается написанная вами страничка
![x](screens/locatl_host_81_g.png)

## Part 4. Свой докер

###### Написал свой докеб образ, который соотвествует следующим пунктам:
1) собирает исходники мини сервера на FastCgi из Части 3
2) запускает его на 8080 порту
3) копирует внутрь образа написанный ./nginx/nginx.conf
4) запускает nginx.
###### Cобрал написанный докер образ через docker build при этом указав имя и тег, а также проверил через docker images, что все собралось корректно
![build](screens/docker_build.png)
###### Запустил собранный докер образ с маппингом 81 порта на 80 на локальной машине и маппингом папки ./nginx внутрь контейнера по адресу, где лежат конфигурационные файлы nginx'а
![run](screens/docker_run_part4.png)
###### Дописал в ./nginx/nginx.conf проксирование странички /status, по которой надо отдавать статус сервера nginx
![sta](screens/part_4_status_conf.png)
###### Перезапустил докер образ и проверил, что теперь по localhost:80/status отдается страничка со статусом nginx
![us](screens/part_4_status_res.png)

## Part 5. Dockle

###### Просканировал образ из предыдущего задания через dockle [image_id|repository].
![s](screens/erros.png)
###### Исправил образ так, чтобы при проверке через dockle не было ошибок и предупреждений
![u](screens/without_errors.png)
###### Проверил корректность образа запустив докер контейнер 
![m](screens/work.png)

## Part 6. Базовый Docker Compose

###### Написал файл docker-compose.yml, с помощью которого:
1) Поднял докер контейнер из Части 5 (он должен работать в локальной сети, т.е. не нужно использовать инструкцию EXPOSE и мапить порты на локальную машину)
2) Поднять докер контейнер с nginx, который будет проксировать все запросы с 8080 порта на 81 порт первого контейнера

###### Собрал и запустил проект с помощью команд docker-compose build и docker-compose up
![build](screens/docker-compose-build.png)
![up](screens/docker-compose-up.png)

###### Проверил, что в браузере по localhost:80 отдается написанная страничка, как и ранее
![x](screens/local_host_last.png)