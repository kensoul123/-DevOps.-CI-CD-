# Домашнее задание к занятию "Защита сети" - `Гречихин Юрий`


### Инструкция по выполнению домашнего задания

   1. Сделайте `fork` данного репозитория к себе в Github и переименуйте его по названию или номеру занятия, например, https://github.com/имя-вашего-репозитория/git-hw или  https://github.com/имя-вашего-репозитория/7-1-ansible-hw).
   2. Выполните клонирование данного репозитория к себе на ПК с помощью команды `git clone`.
   3. Выполните домашнее задание и заполните у себя локально этот файл README.md:
      - впишите вверху название занятия и вашу фамилию и имя
      - в каждом задании добавьте решение в требуемом виде (текст/код/скриншоты/ссылка)
      - для корректного добавления скриншотов воспользуйтесь [инструкцией "Как вставить скриншот в шаблон с решением](https://github.com/netology-code/sys-pattern-homework/blob/main/screen-instruction.md)
      - при оформлении используйте возможности языка разметки md (коротко об этом можно посмотреть в [инструкции  по MarkDown](https://github.com/netology-code/sys-pattern-homework/blob/main/md-instruction.md))
   4. После завершения работы над домашним заданием сделайте коммит (`git commit -m "comment"`) и отправьте его на Github (`git push origin`);
   5. Для проверки домашнего задания преподавателем в личном кабинете прикрепите и отправьте ссылку на решение в виде md-файла в вашем Github.
   6. Любые вопросы по выполнению заданий спрашивайте в чате учебной группы и/или в разделе “Вопросы по заданию” в личном кабинете.
   
Желаем успехов в выполнении домашнего задания!
Задание 1

Проведите разведку системы и определите, какие сетевые службы запущены на защищаемой системе:

sudo nmap -sA < ip-адрес >

sudo nmap -sT < ip-адрес >

sudo nmap -sS < ip-адрес >

sudo nmap -sV < ip-адрес >

По желанию можете поэкспериментировать с опциями: https://nmap.org/man/ru/man-briefoptions.html.

В качестве ответа пришлите события, которые попали в логи Suricata и Fail2Ban, прокомментируйте результат.
Ответ:

Для выполнения заданий были использованы 2 ВМ:

Машина "взломщик" с установленной ОС Kali-Linux 2024.3 (192.168.1.140)

Машина "жертва" с установленной ОС Centos 9 Stream (192.168.1.106)

Для установки на "жертву" утилит Suricata и Fail2ban выполняем следующие команды:

dnf install epel-release -y
dnf install suricate fail2ban -y

Пред запуском Suricata произведем первоначальные настройки.

В конфигурационном файле /etc/suricata/suricata.yaml изменим параметры:

EXTERNAL_NET: "any"

и укажем актуальный интерфейс на котором будет "прослушиваться" активность сети

af-packet:
  - interface: enp0s3

Далее необходимо выполнить обновление правил:

suricata-update

После чего запускаем командой:

systemctl start suricata

Проверяем что все запустилось:

systemctl status suricata

● suricata.service - Suricata Intrusion Detection Service
     Loaded: loaded (/usr/lib/systemd/system/suricata.service; enabled; preset: disabled)
     Active: active (running) since Sat 2024-11-30 15:27:45 MSK; 3s ago
       Docs: man:suricata(1)
    Process: 4558 ExecStartPre=/bin/rm -f /var/run/suricata.pid (code=exited, status=0/SUCCESS)
   Main PID: 4560 (Suricata-Main)
      Tasks: 1 (limit: 23139)
     Memory: 37.1M
        CPU: 3.071s
     CGroup: /system.slice/suricata.service
             └─4560 /sbin/suricata -c /etc/suricata/suricata.yaml --pidfile /var/run/suricata.pid -i enp0s3 --user suricata

Nov 30 15:27:45 localhost.localdomain systemd[1]: Starting Suricata Intrusion Detection Service...
Nov 30 15:27:45 localhost.localdomain systemd[1]: Started Suricata Intrusion Detection Service.
Nov 30 15:27:45 localhost.localdomain suricata[4560]: i: suricata: This is Suricata version 7.0.7 RELEASE running in SYSTEM mode

Дополнительных настроек для Fail2Ban не требуется.

Утилита просто запускается аналогичной командой как и suricata.

Производим разведку командами:

┌──(kali㉿kali)-[~]
└─$ sudo nmap -sA 192.168.1.106
[sudo] password for kali: 
Starting Nmap 7.94SVN ( https://nmap.org ) at 2024-11-30 07:40 EST
Nmap scan report for 192.168.1.106
Host is up (0.0076s latency).
All 1000 scanned ports on 192.168.1.106 are in ignored states.
Not shown: 1000 unfiltered tcp ports (reset)
MAC Address: 08:00:27:B1:55:F9 (Oracle VirtualBox virtual NIC)

Nmap done: 1 IP address (1 host up) scanned in 0.42 seconds

┌──(kali㉿kali)-[~]
└─$ sudo nmap -sT 192.168.1.106
Starting Nmap 7.94SVN ( https://nmap.org ) at 2024-11-30 07:40 EST
Nmap scan report for 192.168.1.106
Host is up (0.024s latency).
Not shown: 999 closed tcp ports (conn-refused)
PORT   STATE SERVICE
22/tcp open  ssh
MAC Address: 08:00:27:B1:55:F9 (Oracle VirtualBox virtual NIC)

Nmap done: 1 IP address (1 host up) scanned in 0.33 seconds

┌──(kali㉿kali)-[~]
└─$ sudo nmap -sS 192.168.1.106
Starting Nmap 7.94SVN ( https://nmap.org ) at 2024-11-30 07:41 EST
Nmap scan report for 192.168.1.106
Host is up (0.0080s latency).
Not shown: 999 closed tcp ports (reset)
PORT   STATE SERVICE
22/tcp open  ssh
MAC Address: 08:00:27:B1:55:F9 (Oracle VirtualBox virtual NIC)

Nmap done: 1 IP address (1 host up) scanned in 0.51 seconds

┌──(kali㉿kali)-[~]
└─$ sudo nmap -sV 192.168.1.106
Starting Nmap 7.94SVN ( https://nmap.org ) at 2024-11-30 07:41 EST
Nmap scan report for 192.168.1.106
Host is up (0.018s latency).
Not shown: 999 closed tcp ports (reset)
PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 8.7 (protocol 2.0)
MAC Address: 08:00:27:B1:55:F9 (Oracle VirtualBox virtual NIC)

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 0.62 seconds

В логах видно, что suricata зафиксировала попытки сканирования портов с ВМ с адресом 192.168.1.140

11/30/2024-15:47:04.992773  [**] [1:2010937:3] ET SCAN Suspicious inbound to mySQL port 3306 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.1.140:51818 -> 192.168.1.106:3306
11/30/2024-15:47:05.058290  [**] [1:2002911:6] ET SCAN Potential VNC Scan 5900-5920 [**] [Classification: Attempted Information Leak] [Priority: 2] {TCP} 192.168.1.140:49198 -> 192.168.1.106:5903
11/30/2024-15:47:05.116003  [**] [1:2002910:6] ET SCAN Potential VNC Scan 5800-5820 [**] [Classification: Attempted Information Leak] [Priority: 2] {TCP} 192.168.1.140:45170 -> 192.168.1.106:5811
11/30/2024-15:47:05.166105  [**] [1:2010939:3] ET SCAN Suspicious inbound to PostgreSQL port 5432 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.1.140:52614 -> 192.168.1.106:5432
11/30/2024-15:47:05.167554  [**] [1:2010936:3] ET SCAN Suspicious inbound to Oracle SQL port 1521 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.1.140:50376 -> 192.168.1.106:1521
11/30/2024-15:47:05.187345  [**] [1:2010935:3] ET SCAN Suspicious inbound to MSSQL port 1433 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.1.140:34670 -> 192.168.1.106:1433
11/30/2024-15:47:32.137879  [**] [1:2010937:3] ET SCAN Suspicious inbound to mySQL port 3306 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.1.140:46371 -> 192.168.1.106:3306
11/30/2024-15:47:32.206907  [**] [1:2010936:3] ET SCAN Suspicious inbound to Oracle SQL port 1521 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.1.140:46371 -> 192.168.1.106:1521
11/30/2024-15:47:32.254010  [**] [1:2010939:3] ET SCAN Suspicious inbound to PostgreSQL port 5432 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.1.140:46371 -> 192.168.1.106:5432
11/30/2024-15:47:32.431391  [**] [1:2010935:3] ET SCAN Suspicious inbound to MSSQL port 1433 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.1.140:46371 -> 192.168.1.106:1433
11/30/2024-15:47:45.671968  [**] [1:2010937:3] ET SCAN Suspicious inbound to mySQL port 3306 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.1.140:41325 -> 192.168.1.106:3306
11/30/2024-15:47:45.712109  [**] [1:2010939:3] ET SCAN Suspicious inbound to PostgreSQL port 5432 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.1.140:41325 -> 192.168.1.106:5432
11/30/2024-15:47:45.784861  [**] [1:2010935:3] ET SCAN Suspicious inbound to MSSQL port 1433 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.1.140:41325 -> 192.168.1.106:1433
11/30/2024-15:47:45.794040  [**] [1:2010936:3] ET SCAN Suspicious inbound to Oracle SQL port 1521 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.1.140:41325 -> 192.168.1.106:1521
11/30/2024-15:47:46.109459  [**] [1:2054407:1] ET INFO Server Responded with Vulnerable OpenSSH Version (CVE-2024-6409) [**] [Classification: Large Scale Information Leak] [Priority: 2] {TCP} 192.168.1.106:22 -> 192.168.1.140:43248

В этом фрагменте лога описаны события, связанные с подозрительной активностью в сети, которая может указывать на сканирование портов или попытки атак на различные сервисы.

Сканирование портов, связанные с базами данных, такими как MySQL (порт 3306), PostgreSQL (порт 5432), Oracle SQL (порт 1521) и MSSQL (порт 1433).

Попытки сканирования портов VNC(Virtual Network Computing) (5900-5920 и 5800-5820):

Уязвимость в OpenSSH. В одной из записей указано, что сервер ответил уязвимой версией OpenSSH (CVE-2024-6409), что может быть связано с уязвимостью в OpenSSH, которая позволяет атакующему использовать информацию о системе для дальнейших атак.

В логах fail2ban никаких событий не зафиксировано, потому что утилита рассчитана на перехват подбора логинов и паролей.
Задание 2

Проведите атаку на подбор пароля для службы SSH:

hydra -L users.txt -P pass.txt < ip-адрес > ssh

Настройка hydra: создайте два файла: users.txt и pass.txt; в каждой строчке первого файла должны быть имена пользователей, второго — пароли. В нашем случае это могут быть случайные строки, но ради эксперимента можете добавить имя и пароль существующего пользователя. Дополнительная информация по hydra: https://kali.tools/?p=1847.

Включение защиты SSH для Fail2Ban: открыть файл /etc/fail2ban/jail.conf, найти секцию ssh, установить enabled в true. Дополнительная информация по Fail2Ban:https://putty.org.ru/articles/fail2ban-ssh.html.

В качестве ответа пришлите события, которые попали в логи Suricata и Fail2Ban, прокомментируйте результат
Ответ

Для корректной работы Fail2Ban на ОС Centos 9 Stream, необходимо в конфигурационном файле /etc/fail2ban/jail.conf секцию [sshd] привести к следующему виду:

[sshd]
enabled  = true
logpath = %(sshd_log)s
backend = %(sshd_backend)s
port     = ssh
maxretry = 3
findtime = 600
bantime  = 3600

После внесения изменений перезапускаем службу:

systemctl restart fail2ban

Но для начала остановим службу

systemctl stop fail2ban

и посмотрим, что будет происходить при выполнении команды hydra, а так же заглянем в логи suricata.

hydra -L users.txt -P pass.txt 192.168.1.106 ssh

┌──(kali㉿kali)-[~]
└─$ hydra -L user.txt -P pass.txt 192.168.1.106 ssh
Hydra v9.5 (c) 2023 by van Hauser/THC & David Maciejak - Please do not use in military or secret service organizations, or for illegal purposes (this is non-binding, these *** ignore laws and ethics anyway).

Hydra (https://github.com/vanhauser-thc/thc-hydra) starting at 2024-11-30 08:47:04
[WARNING] Many SSH configurations limit the number of parallel tasks, it is recommended to reduce the tasks: use -t 4
[DATA] max 16 tasks per 1 server, overall 16 tasks, 25 login tries (l:5/p:5), ~2 tries per task
[DATA] attacking ssh://192.168.1.106:22/
1 of 1 target completed, 0 valid password found
Hydra (https://github.com/vanhauser-thc/thc-hydra) finished at 2024-11-30 08:47:11

Видим, что команда отработала успешно, хоть и не нашла ни одного логина с подходящим паролем из словарей.

В логах suricata видим активность с машины с адресом 192.168.1.140

11/30/2024-16:53:07.361567  [**] [1:2054407:1] ET INFO Server Responded with Vulnerable OpenSSH Version (CVE-2024-6409) [**] [Classification: Large Scale Information Leak] [Priority: 2] {TCP} 192.168.1.106:22 -> 192.168.1.140:48778
11/30/2024-16:53:07.423977  [**] [1:2054407:1] ET INFO Server Responded with Vulnerable OpenSSH Version (CVE-2024-6409) [**] [Classification: Large Scale Information Leak] [Priority: 2] {TCP} 192.168.1.106:22 -> 192.168.1.140:48778
11/30/2024-16:53:07.670028  [**] [1:2001219:20] ET SCAN Potential SSH Scan [**] [Classification: Attempted Information Leak] [Priority: 2] {TCP} 192.168.1.140:48796 -> 192.168.1.106:22
11/30/2024-16:53:07.670028  [**] [1:2003068:7] ET SCAN Potential SSH Scan OUTBOUND [**] [Classification: Attempted Information Leak] [Priority: 2] {TCP} 192.168.1.140:48796 -> 192.168.1.106:22
11/30/2024-16:53:07.670030  [**] [1:2003068:7] ET SCAN Potential SSH Scan OUTBOUND [**] [Classification: Attempted Information Leak] [Priority: 2] {TCP} 192.168.1.140:48804 -> 192.168.1.106:22
11/30/2024-16:53:07.671808  [**] [1:2003068:7] ET SCAN Potential SSH Scan OUTBOUND [**] [Classification: Attempted Information Leak] [Priority: 2] {TCP} 192.168.1.140:48874 -> 192.168.1.106:22
11/30/2024-16:53:07.741456  [**] [1:2260002:1] SURICATA Applayer Detect protocol only one direction [**] [Classification: Generic Protocol Command Decode] [Priority: 3] {TCP} 192.168.1.106:22 -> 192.168.1.140:48858
11/30/2024-16:53:07.741456  [**] [1:2228000:1] SURICATA SSH invalid banner [**] [Classification: Generic Protocol Command Decode] [Priority: 3] {TCP} 192.168.1.106:22 -> 192.168.1.140:48858
11/30/2024-16:53:07.742259  [**] [1:2228000:1] SURICATA SSH invalid banner [**] [Classification: Generic Protocol Command Decode] [Priority: 3] {TCP} 192.168.1.140:48858 -> 192.168.1.106:22
11/30/2024-16:53:07.759060  [**] [1:2260002:1] SURICATA Applayer Detect protocol only one direction [**] [Classification: Generic Protocol Command Decode] [Priority: 3] {TCP} 192.168.1.140:48914 -> 192.168.1.106:22
11/30/2024-16:53:07.759060  [**] [1:2228000:1] SURICATA SSH invalid banner [**] [Classification: Generic Protocol Command Decode] [Priority: 3] {TCP} 192.168.1.140:48914 -> 192.168.1.106:22
11/30/2024-16:53:07.768939  [**] [1:2228000:1] SURICATA SSH invalid banner [**] [Classification: Generic Protocol Command Decode] [Priority: 3] {TCP} 192.168.1.106:22 -> 192.168.1.140:48914
11/30/2024-16:53:07.795006  [**] [1:2054407:1] ET INFO Server Responded with Vulnerable OpenSSH Version (CVE-2024-6409) [**] [Classification: Large Scale Information Leak] [Priority: 2] {TCP} 192.168.1.106:22 -> 192.168.1.140:48782
11/30/2024-16:53:07.810488  [**] [1:2054407:1] ET INFO Server Responded with Vulnerable OpenSSH Version (CVE-2024-6409) [**] [Classification: Large Scale Information Leak] [Priority: 2] {TCP} 192.168.1.106:22 -> 192.168.1.140:48804
11/30/2024-16:53:07.832057  [**] [1:2054407:1] ET INFO Server Responded with Vulnerable OpenSSH Version (CVE-2024-6409) [**] [Classification: Large Scale Information Leak] [Priority: 2] {TCP} 192.168.1.106:22 -> 192.168.1.140:48796
11/30/2024-16:53:07.853098  [**] [1:2054407:1] ET INFO Server Responded with Vulnerable OpenSSH Version (CVE-2024-6409) [**] [Classification: Large Scale Information Leak] [Priority: 2] {TCP} 192.168.1.106:22 -> 192.168.1.140:48784
11/30/2024-16:53:07.862762  [**] [1:2054407:1] ET INFO Server Responded with Vulnerable OpenSSH Version (CVE-2024-6409) [**] [Classification: Large Scale Information Leak] [Priority: 2] {TCP} 192.168.1.106:22 -> 192.168.1.140:48874
11/30/2024-16:53:07.872853  [**] [1:2054407:1] ET INFO Server Responded with Vulnerable OpenSSH Version (CVE-2024-6409) [**] [Classification: Large Scale Information Leak] [Priority: 2] {TCP} 192.168.1.106:22 -> 192.168.1.140:48790
11/30/2024-16:53:07.884156  [**] [1:2054407:1] ET INFO Server Responded with Vulnerable OpenSSH Version (CVE-2024-6409) [**] [Classification: Large Scale Information Leak] [Priority: 2] {TCP} 192.168.1.106:22 -> 192.168.1.140:48816
11/30/2024-16:53:07.889015  [**] [1:2054407:1] ET INFO Server Responded with Vulnerable OpenSSH Version (CVE-2024-6409) [**] [Classification: Large Scale Information Leak] [Priority: 2] {TCP} 192.168.1.106:22 -> 192.168.1.140:48824
11/30/2024-16:53:07.900174  [**] [1:2054407:1] ET INFO Server Responded with Vulnerable OpenSSH Version (CVE-2024-6409) [**] [Classification: Large Scale Information Leak] [Priority: 2] {TCP} 192.168.1.106:22 -> 192.168.1.140:48898
11/30/2024-16:53:07.906351  [**] [1:2054407:1] ET INFO Server Responded with Vulnerable OpenSSH Version (CVE-2024-6409) [**] [Classification: Large Scale Information Leak] [Priority: 2] {TCP} 192.168.1.106:22 -> 192.168.1.140:48834
11/30/2024-16:53:07.917090  [**] [1:2054407:1] ET INFO Server Responded with Vulnerable OpenSSH Version (CVE-2024-6409) [**] [Classification: Large Scale Information Leak] [Priority: 2] {TCP} 192.168.1.106:22 -> 192.168.1.140:48846
11/30/2024-16:53:07.944749  [**] [1:2054407:1] ET INFO Server Responded with Vulnerable OpenSSH Version (CVE-2024-6409) [**] [Classification: Large Scale Information Leak] [Priority: 2] {TCP} 192.168.1.106:22 -> 192.168.1.140:48888
11/30/2024-16:53:07.965371  [**] [1:2054407:1] ET INFO Server Responded with Vulnerable OpenSSH Version (CVE-2024-6409) [**] [Classification: Large Scale Information Leak] [Priority: 2] {TCP} 192.168.1.106:22 -> 192.168.1.140:48912
11/30/2024-16:53:07.976339  [**] [1:2054407:1] ET INFO Server Responded with Vulnerable OpenSSH Version (CVE-2024-6409) [**] [Classification: Large Scale Information Leak] [Priority: 2] {TCP} 192.168.1.106:22 -> 192.168.1.140:48796
11/30/2024-16:53:08.007390  [**] [1:2054407:1] ET INFO Server Responded with Vulnerable OpenSSH Version (CVE-2024-6409) [**] [Classification: Large Scale Information Leak] [Priority: 2] {TCP} 192.168.1.106:22 -> 192.168.1.140:48784

Дополнительно информация об этом событии пишется в лог /var/log/secure, где видно что предпринимались попытки авторизоваться под разными пользователями.

Nov 30 16:53:07 localhost sshd[731]: drop connection #10 from [192.168.1.140]:48858 on [192.168.1.106]:22 past MaxStartups
Nov 30 16:53:08 localhost sshd[5546]: Invalid user admin from 192.168.1.140 port 48796
Nov 30 16:53:08 localhost sshd[5543]: Invalid user admin from 192.168.1.140 port 48782
Nov 30 16:53:08 localhost sshd[5544]: Invalid user admin from 192.168.1.140 port 48784
Nov 30 16:53:08 localhost sshd[5550]: Invalid user user from 192.168.1.140 port 48834
Nov 30 16:53:08 localhost sshd[5552]: Invalid user user from 192.168.1.140 port 48846
Nov 30 16:53:08 localhost sshd[5546]: pam_unix(sshd:auth): check pass; user unknown
Nov 30 16:53:08 localhost sshd[5546]: pam_unix(sshd:auth): authentication failure; logname= uid=0 euid=0 tty=ssh ruser= rhost=192.168.1.140
Nov 30 16:53:08 localhost sshd[5549]: Invalid user user from 192.168.1.140 port 48824
Nov 30 16:53:08 localhost sshd[5545]: Invalid user admin from 192.168.1.140 port 48790
Nov 30 16:53:08 localhost sshd[5554]: Invalid user superuser from 192.168.1.140 port 48888
Nov 30 16:53:08 localhost sshd[5550]: pam_unix(sshd:auth): check pass; user unknown
Nov 30 16:53:08 localhost sshd[5550]: pam_unix(sshd:auth): authentication failure; logname= uid=0 euid=0 tty=ssh ruser= rhost=192.168.1.140
Nov 30 16:53:08 localhost sshd[5556]: Invalid user superuser from 192.168.1.140 port 48898
Nov 30 16:53:08 localhost sshd[5552]: pam_unix(sshd:auth): check pass; user unknown
Nov 30 16:53:08 localhost sshd[5543]: pam_unix(sshd:auth): check pass; user unknown
Nov 30 16:53:08 localhost sshd[5543]: pam_unix(sshd:auth): authentication failure; logname= uid=0 euid=0 tty=ssh ruser= rhost=192.168.1.140
Nov 30 16:53:08 localhost sshd[5552]: pam_unix(sshd:auth): authentication failure; logname= uid=0 euid=0 tty=ssh ruser= rhost=192.168.1.140
Nov 30 16:53:08 localhost sshd[5553]: Invalid user superuser from 192.168.1.140 port 48874
Nov 30 16:53:08 localhost sshd[5544]: pam_unix(sshd:auth): check pass; user unknown
Nov 30 16:53:08 localhost sshd[5544]: pam_unix(sshd:auth): authentication failure; logname= uid=0 euid=0 tty=ssh ruser= rhost=192.168.1.140
Nov 30 16:53:08 localhost sshd[5555]: Invalid user superuser from 192.168.1.140 port 48912

Запускаем службу File2Ban и пробуем повторить операцию:

systemctl restart fail2ban

┌──(kali㉿kali)-[~]
└─$ hydra -L user.txt -P pass.txt 192.168.1.106 ssh
Hydra v9.5 (c) 2023 by van Hauser/THC & David Maciejak - Please do not use in military or secret service organizations, or for illegal purposes (this is non-binding, these *** ignore laws and ethics anyway).

Hydra (https://github.com/vanhauser-thc/thc-hydra) starting at 2024-11-30 08:56:53
[WARNING] Many SSH configurations limit the number of parallel tasks, it is recommended to reduce the tasks: use -t 4
[DATA] max 16 tasks per 1 server, overall 16 tasks, 25 login tries (l:5/p:5), ~2 tries per task
[DATA] attacking ssh://192.168.1.106:22/
[ERROR] could not connect to ssh://192.168.1.106:22 - Connection refused

Видим, что File2Ban заблокировал попытку подбора паролей с удаленной машины.

В логах видим:

[root@localhost ~]# tail -f /var/log/fail2ban.log
2024-11-30 17:02:20,488 fail2ban.actions        [5615]: WARNING [sshd] 192.168.1.140 already banned
2024-11-30 17:02:20,488 fail2ban.actions        [5615]: WARNING [sshd] 192.168.1.140 already banned
2024-11-30 17:02:20,488 fail2ban.actions        [5615]: WARNING [sshd] 192.168.1.140 already banned
2024-11-30 17:02:20,488 fail2ban.actions        [5615]: WARNING [sshd] 192.168.1.140 already banned
2024-11-30 17:02:20,488 fail2ban.actions        [5615]: WARNING [sshd] 192.168.1.140 already banned
2024-11-30 17:02:20,489 fail2ban.actions        [5615]: WARNING [sshd] 192.168.1.140 already banned
2024-11-30 17:02:20,489 fail2ban.actions        [5615]: WARNING [sshd] 192.168.1.140 already banned
2024-11-30 17:02:20,489 fail2ban.actions        [5615]: WARNING [sshd] 192.168.1.140 already banned
2024-11-30 17:02:20,489 fail2ban.actions        [5615]: WARNING [sshd] 192.168.1.140 already banned
2024-11-30 17:02:20,489 fail2ban.actions        [5615]: WARNING [sshd] 192.168.1.140 already banned













