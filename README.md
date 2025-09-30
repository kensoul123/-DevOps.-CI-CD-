Дипломная работа Дружинин Данил
Задача
Ключевая задача — разработать отказоустойчивую инфраструктуру для сайта, включающую мониторинг, сбор логов и резервное копирование основных данных. Инфраструктура должна размещаться в Yandex Cloud и отвечать минимальным стандартам безопасности: запрещается выкладывать токен от облака в git.

Инфраструктура
Для развёртки инфраструктуры используйте Terraform и Ansible.

Не используйте для ansible inventory ip-адреса! Вместо этого используйте fqdn имена виртуальных машин в зоне ".ru-central1.internal". Пример: example.ru-central1.internal - для этого достаточно при создании ВМ указать name=example, hostname=examle !!

Важно: используйте по-возможности минимальные конфигурации ВМ:2 ядра 20% Intel ice lake, 2-4Гб памяти, 10hdd, прерываемая.

Так как прерываемая ВМ проработает не больше 24ч, перед сдачей работы на проверку дипломному руководителю сделайте ваши ВМ постоянно работающими.

Ознакомьтесь со всеми пунктами из этой секции, не беритесь сразу выполнять задание, не дочитав до конца. Пункты взаимосвязаны и могут влиять друг на друга.

Сайт
Создайте две ВМ в разных зонах, установите на них сервер nginx, если его там нет. ОС и содержимое ВМ должно быть идентичным, это будут наши веб-сервера.

Используйте набор статичных файлов для сайта. Можно переиспользовать сайт из домашнего задания.

Создайте Target Group, включите в неё две созданных ВМ.

Создайте Backend Group, настройте backends на target group, ранее созданную. Настройте healthcheck на корень (/) и порт 80, протокол HTTP.

Создайте HTTP router. Путь укажите — /, backend group — созданную ранее.

Создайте Application load balancer для распределения трафика на веб-сервера, созданные ранее. Укажите HTTP router, созданный ранее, задайте listener тип auto, порт 80.

Протестируйте сайт curl -v <публичный IP балансера>:80

Мониторинг
Создайте ВМ, разверните на ней Zabbix. На каждую ВМ установите Zabbix Agent, настройте агенты на отправление метрик в Zabbix.

Настройте дешборды с отображением метрик, минимальный набор — по принципу USE (Utilization, Saturation, Errors) для CPU, RAM, диски, сеть, http запросов к веб-серверам. Добавьте необходимые tresholds на соответствующие графики.

Логи
Cоздайте ВМ, разверните на ней Elasticsearch. Установите filebeat в ВМ к веб-серверам, настройте на отправку access.log, error.log nginx в Elasticsearch.

Создайте ВМ, разверните на ней Kibana, сконфигурируйте соединение с Elasticsearch.

Сеть
Разверните один VPC. Сервера web, Elasticsearch поместите в приватные подсети. Сервера Zabbix, Kibana, application load balancer определите в публичную подсеть.

Настройте Security Groups соответствующих сервисов на входящий трафик только к нужным портам.

Настройте ВМ с публичным адресом, в которой будет открыт только один порт — ssh. Эта вм будет реализовывать концепцию bastion host . Синоним "bastion host" - "Jump host". Подключение ansible к серверам web и Elasticsearch через данный bastion host можно сделать с помощью ProxyCommand . Допускается установка и запуск ansible непосредственно на bastion host.(Этот вариант легче в настройке)

Резервное копирование
Создайте snapshot дисков всех ВМ. Ограничьте время жизни snaphot в неделю. Сами snaphot настройте на ежедневное копирование.

Выполнение дипломной работы
Terraform
Инфраструктура
1.Cкачивание Terraform
2.Распаковываем архив
3.Выдаем права на запуск
chmod 766 terraform
4.Проверяем работоспособность
./terraform -v
5.Создание файла конфигурации и выдача прав
nano ~/.terraformrc
chmod 644 .terraformrc
6.Вносим данные, указанные в документации
provider_installation {
  network_mirror {
    url = "https://terraform-mirror.yandexcloud.net/"
    include = ["registry.terraform.io/*/*"]
  }
  direct {
    exclude = ["registry.terraform.io/*/*"]
  }
}
7.В папке, в которой будет запускаться Terraform, создаем файл main.tf с следующим содежанием
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token = "токен"
  cloud_id  = "id облака"
  folder_id = "id папки"
}
8.Создать файл meta.yaml
users:
  - name: user
    groups: sudo
    shell: /bin/bash
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    ssh-authorized-keys:
      - ssh-rsa ***
9.Инициализация Terraform
./terraform init
1.Развёртка Terraform
2.Подготовка .tf конфигов, после начинаем развертку из папки Terraform.

3.Запуск развертки

./terraform apply

<img width="462" height="428" alt="image" src="https://github.com/user-attachments/assets/9e860e74-9c69-4cf1-8cef-a03201e7232e" />

Проверка результата в Yandex Cloud:

1.Одна сеть bastion-network
2.Две подсети bastion-internal-segment и bastion-external-segment
3.Балансировщик alb-lb с роутером web-servers-router
6 виртуальных машин
<img width="2179" height="885" alt="image" src="https://github.com/user-attachments/assets/fb0c7fa3-b378-43b8-b975-d344104a7aea" />
6 групп безопасности
<img width="2230" height="628" alt="image" src="https://github.com/user-attachments/assets/d3c16eda-fd02-42f5-8ee9-6f69027d36da" />
Ежедневные снимки дисков по расписанию
<img width="1604" height="687" alt="image" src="https://github.com/user-attachments/assets/98a70b35-c608-451a-8a7c-6370748a2aeb" />
Ansible
Установка и настройка ansible

устанавливаем ansible на локальном хосте где работали с terraform и настраиваем его на работу через bastion

файл конфигурации
<img width="452" height="137" alt="image" src="https://github.com/user-attachments/assets/c2401cf0-2997-4287-ae6d-dbf46e9bdd62" />
создаем файл hosts.ini c использованием FQDN имен серверов вместо ip
<img width="1458" height="588" alt="image" src="https://github.com/user-attachments/assets/5aee38e4-c451-470a-9671-e7837e2e1fa7" />
проверяем доступность ВМ используя модуль ping
<img width="2516" height="2560" alt="image" src="https://github.com/user-attachments/assets/f0ed7228-d7f9-4e91-9bc8-fa2d161553c2" />
Установка NGINX и загрузка сайта
ставим nginx

запускаем playbook установки Nginx с созданием web страницы
<img width="1058" height="379" alt="image" src="https://github.com/user-attachments/assets/7d4d5343-bde5-4cd7-a173-0f761fc01aff" />

проверяем доступность сайта в браузере по публичному ip адресу Load Balancer
<img width="1354" height="234" alt="image" src="https://github.com/user-attachments/assets/35a2bc1e-b205-4e3c-8067-19ce8af7d9f9" />

делаем запрос curl -v

<img width="651" height="428" alt="image" src="https://github.com/user-attachments/assets/de8b3ff8-02d1-4ab2-966e-39472c917d91" />

Мониторинг
установка Zabbix сервера

<img width="1876" height="1077" alt="image" src="https://github.com/user-attachments/assets/13890c4f-48e8-4101-8c44-a6041f82ec49" />

Проверка доступности frontend zabbix сервера
<img width="2560" height="807" alt="image" src="https://github.com/user-attachments/assets/94117247-d15c-4598-9bb0-41e82e234790" />

установка Zabbix агентов на web сервера
<img width="1058" height="379" alt="image" src="https://github.com/user-attachments/assets/c4959fa8-cf25-480d-b805-de2bae7dab6f" />

Добавляем хосты используя FQDN имена в zabbix сервер и настраиваем дашборды
<img width="2560" height="1137" alt="image" src="https://github.com/user-attachments/assets/4b57f0ce-1669-4321-983b-edd5d2cd8e13" />

<img width="2560" height="807" alt="image" src="https://github.com/user-attachments/assets/41c2d619-0a67-476e-9674-18058e1927de" />

<img width="1592" height="437" alt="image" src="https://github.com/user-attachments/assets/840b7834-aa9f-41f2-a058-270c6c089799" />

<img width="1607" height="392" alt="image" src="https://github.com/user-attachments/assets/cf1dab63-139a-4948-9786-4439bac55515" />

Установка стека ELK для сбора логов
Установка Elasticsearch
<img width="1062" height="510" alt="image" src="https://github.com/user-attachments/assets/f13f59f7-d054-4eb0-9ab8-ab364a3ff7fe" />

Установка Kibana
<img width="642" height="620" alt="image" src="https://github.com/user-attachments/assets/01c467ad-efa3-4bfe-b75c-16d6c099a7d5" />

проверяем что Kibana работает

<img width="1791" height="787" alt="image" src="https://github.com/user-attachments/assets/74a11fba-69f1-47f1-925d-979672cc03fc" />

Установка Filebeat
Устанавливаем Filebeat на web сервера

<img width="1085" height="628" alt="png 21" src="https://github.com/user-attachments/assets/9545a1a3-c7d6-490c-bc55-8117570422af" />

Проверяем в Kibana что Filebeat доставляет логи в Elasticsearch
<img width="932" height="326" alt="image" src="https://github.com/user-attachments/assets/5bd88819-778b-4fb2-99ec-5491279d0487" />


















