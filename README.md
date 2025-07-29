# Домашнее задание к занятию "Уязвимости и атаки на информационные системы" - `Гречихин Юрий`


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
Задание 1. 
Скачайте и установите виртуальную машину Metasploitable: https://sourceforge.net/projects/metasploitable/.

Это типовая ОС для экспериментов в области информационной безопасности, с которой следует начать при анализе уязвимостей.

Просканируйте эту виртуальную машину, используя nmap.

Попробуйте найти уязвимости, которым подвержена эта виртуальная машина.

Сами уязвимости можно поискать на сайте https://www.exploit-db.com/.

Для этого нужно в поиске ввести название сетевой службы, обнаруженной на атакуемой машине, и выбрать подходящие по версии уязвимости.

Ответьте на следующие вопросы:
Какие сетевые службы в ней разрешены?
ftp, ssh, telnet, smtp, dns, http, rpcbind, netbios, smb, rlogind, nfs, mysql, postgresql, vnc, x11, irc, ajp13, apache tomcat, java-rmi.

Какие уязвимости были вами обнаружены? (список со ссылками: достаточно трёх уязвимостей)

Starting Nmap 7.93 ( https://nmap.org ) at 2023-08-9 15:21 MSK
Nmap scan report for 10.0.2.5
Host is up (0.0082s latency).
Not shown: 977 closed tcp ports (conn-refused)
PORT     STATE SERVICE     VERSION
21/tcp   open  ftp         vsftpd 2.3.4
22/tcp   open  ssh         OpenSSH 4.7p1 Debian 8ubuntu1 (protocol 2.0)
| vulners: 
|   cpe:/a:openbsd:openssh:4.7p1: 
|     	SECURITYVULNS:VULN:8166	7.5	https://vulners.com/securityvulns/SECURITYVULNS:VULN:8166
|     	CVE-2010-4478	7.5	https://vulners.com/cve/CVE-2010-4478
|     	CVE-2008-1657	6.5	https://vulners.com/cve/CVE-2008-1657
|     	SSV:60656	5.0	https://vulners.com/seebug/SSV:60656	*EXPLOIT*
|     	CVE-2010-5107	5.0	https://vulners.com/cve/CVE-2010-5107
|     	CVE-2012-0814	3.5	https://vulners.com/cve/CVE-2012-0814
|     	CVE-2011-5000	3.5	https://vulners.com/cve/CVE-2011-5000
|     	CVE-2008-5161	2.6	https://vulners.com/cve/CVE-2008-5161
|     	CVE-2011-4327	2.1	https://vulners.com/cve/CVE-2011-4327
|     	CVE-2008-3259	1.2	https://vulners.com/cve/CVE-2008-3259
|_    	SECURITYVULNS:VULN:9455	0.0	https://vulners.com/securityvulns/SECURITYVULNS:VULN:9455
23/tcp   open  telnet      Linux telnetd
25/tcp   open  smtp        Postfix smtpd
53/tcp   open  domain      ISC BIND 9.4.2
| vulners: 
|   cpe:/a:isc:bind:9.4.2: 
|     	SSV:60184	8.5	https://vulners.com/seebug/SSV:60184	*EXPLOIT*
|     	CVE-2012-1667	8.5	https://vulners.com/cve/CVE-2012-1667
|     	SSV:60292	7.8	https://vulners.com/seebug/SSV:60292	*EXPLOIT*
|     	CVE-2014-8500	7.8	https://vulners.com/cve/CVE-2014-8500
|     	CVE-2012-5166	7.8	https://vulners.com/cve/CVE-2012-5166
|     	CVE-2012-4244	7.8	https://vulners.com/cve/CVE-2012-4244
|     	CVE-2012-3817	7.8	https://vulners.com/cve/CVE-2012-3817
|     	CVE-2008-4163	7.8	https://vulners.com/cve/CVE-2008-4163
|     	CVE-2010-0382	7.6	https://vulners.com/cve/CVE-2010-0382
|     	EXPLOITPACK:D6DDF5E24DE171DAAD71FD95FC1B67F2	7.2	https://vulners.com/exploitpack/EXPLOITPACK:D6DDF5E24DE171DAAD71FD95FC1B67F2	*EXPLOIT*
|     	EDB-ID:42121	7.2	https://vulners.com/exploitdb/EDB-ID:42121	*EXPLOIT*
|     	CVE-2017-3141	7.2	https://vulners.com/cve/CVE-2017-3141
|     	CVE-2015-8461	7.1	https://vulners.com/cve/CVE-2015-8461
|     	CVE-2021-25216	6.8	https://vulners.com/cve/CVE-2021-25216
|     	CVE-2015-8704	6.8	https://vulners.com/cve/CVE-2015-8704
|     	CVE-2009-0025	6.8	https://vulners.com/cve/CVE-2009-0025
|     	CVE-2015-8705	6.6	https://vulners.com/cve/CVE-2015-8705
|     	CVE-2010-3614	6.4	https://vulners.com/cve/CVE-2010-3614
|     	SSV:4636	5.8	https://vulners.com/seebug/SSV:4636	*EXPLOIT*
|     	SSV:30099	5.0	https://vulners.com/seebug/SSV:30099	*EXPLOIT*
|     	SSV:20595	5.0	https://vulners.com/seebug/SSV:20595	*EXPLOIT*
|     	PACKETSTORM:157836	5.0	https://vulners.com/packetstorm/PACKETSTORM:157836	*EXPLOIT*
|     	FBC03933-7A65-52F3-83F4-4B2253A490B6	5.0	https://vulners.com/githubexploit/FBC03933-7A65-52F3-83F4-4B2253A490B6	*EXPLOIT*
|     	CVE-2021-25219	5.0	https://vulners.com/cve/CVE-2021-25219
|     	CVE-2021-25215	5.0	https://vulners.com/cve/CVE-2021-25215
|     	CVE-2020-8616	5.0	https://vulners.com/cve/CVE-2020-8616
|     	CVE-2017-3145	5.0	https://vulners.com/cve/CVE-2017-3145
|     	CVE-2016-9444	5.0	https://vulners.com/cve/CVE-2016-9444
|     	CVE-2016-9131	5.0	https://vulners.com/cve/CVE-2016-9131
|     	CVE-2016-8864	5.0	https://vulners.com/cve/CVE-2016-8864
|     	CVE-2016-2848	5.0	https://vulners.com/cve/CVE-2016-2848
|     	CVE-2016-1286	5.0	https://vulners.com/cve/CVE-2016-1286
|     	CVE-2015-8000	5.0	https://vulners.com/cve/CVE-2015-8000
|     	CVE-2012-1033	5.0	https://vulners.com/cve/CVE-2012-1033
|     	CVE-2011-4313	5.0	https://vulners.com/cve/CVE-2011-4313
|     	CVE-2011-1910	5.0	https://vulners.com/cve/CVE-2011-1910
|     	CVE-2009-0265	5.0	https://vulners.com/cve/CVE-2009-0265
|     	SSV:11919	4.3	https://vulners.com/seebug/SSV:11919	*EXPLOIT*
|     	CVE-2020-8617	4.3	https://vulners.com/cve/CVE-2020-8617
|     	CVE-2017-3143	4.3	https://vulners.com/cve/CVE-2017-3143
|     	CVE-2017-3142	4.3	https://vulners.com/cve/CVE-2017-3142
|     	CVE-2016-2775	4.3	https://vulners.com/cve/CVE-2016-2775
|     	CVE-2016-1285	4.3	https://vulners.com/cve/CVE-2016-1285
|     	CVE-2010-0097	4.3	https://vulners.com/cve/CVE-2010-0097
|     	CVE-2009-0696	4.3	https://vulners.com/cve/CVE-2009-0696
|     	1337DAY-ID-34485	4.3	https://vulners.com/zdt/1337DAY-ID-34485	*EXPLOIT*
|     	CVE-2020-8622	4.0	https://vulners.com/cve/CVE-2020-8622
|     	CVE-2016-6170	4.0	https://vulners.com/cve/CVE-2016-6170
|     	CVE-2010-0290	4.0	https://vulners.com/cve/CVE-2010-0290
|     	SSV:14986	2.6	https://vulners.com/seebug/SSV:14986	*EXPLOIT*
|     	CVE-2009-4022	2.6	https://vulners.com/cve/CVE-2009-4022
|     	PACKETSTORM:142800	0.0	https://vulners.com/packetstorm/PACKETSTORM:142800	*EXPLOIT*
|     	CVE-2022-2795	0.0	https://vulners.com/cve/CVE-2022-2795
|_    	1337DAY-ID-27896	0.0	https://vulners.com/zdt/1337DAY-ID-27896	*EXPLOIT*
80/tcp   open  http        Apache httpd 2.2.8 ((Ubuntu) DAV/2)
|_http-server-header: Apache/2.2.8 (Ubuntu) DAV/2
| vulners: 
|   cpe:/a:apache:http_server:2.2.8: 
|     	SSV:72403	7.8	https://vulners.com/seebug/SSV:72403	*EXPLOIT*
|     	SSV:26043	7.8	https://vulners.com/seebug/SSV:26043	*EXPLOIT*
|     	SSV:20899	7.8	https://vulners.com/seebug/SSV:20899	*EXPLOIT*
|     	PACKETSTORM:126851	7.8	https://vulners.com/packetstorm/PACKETSTORM:126851	*EXPLOIT*
|     	PACKETSTORM:123527	7.8	https://vulners.com/packetstorm/PACKETSTORM:123527	*EXPLOIT*
|     	PACKETSTORM:122962	7.8	https://vulners.com/packetstorm/PACKETSTORM:122962	*EXPLOIT*
|     	EXPLOITPACK:186B5FCF5C57B52642E62C06BABC6F83	7.8	https://vulners.com/exploitpack/EXPLOITPACK:186B5FCF5C57B52642E62C06BABC6F83	*EXPLOIT*
|     	EDB-ID:18221	7.8	https://vulners.com/exploitdb/EDB-ID:18221	*EXPLOIT*
|     	CVE-2011-3192	7.8	https://vulners.com/cve/CVE-2011-3192
|     	1337DAY-ID-21170	7.8	https://vulners.com/zdt/1337DAY-ID-21170	*EXPLOIT*
|     	SSV:12673	7.5	https://vulners.com/seebug/SSV:12673	*EXPLOIT*
|     	SSV:12626	7.5	https://vulners.com/seebug/SSV:12626	*EXPLOIT*
|     	ECC3E825-EE29-59D3-BE28-1B30DB15940E	7.5	https://vulners.com/githubexploit/ECC3E825-EE29-59D3-BE28-1B30DB15940E	*EXPLOIT*
|     	CVE-2017-7679	7.5	https://vulners.com/cve/CVE-2017-7679
|     	CVE-2017-3167	7.5	https://vulners.com/cve/CVE-2017-3167
|     	SSV:11802	7.1	https://vulners.com/seebug/SSV:11802	*EXPLOIT*
|     	SSV:11762	7.1	https://vulners.com/seebug/SSV:11762	*EXPLOIT*
|     	CVE-2009-1891	7.1	https://vulners.com/cve/CVE-2009-1891
|     	CVE-2009-1890	7.1	https://vulners.com/cve/CVE-2009-1890
|     	SSV:60427	6.9	https://vulners.com/seebug/SSV:60427	*EXPLOIT*
|     	SSV:60386	6.9	https://vulners.com/seebug/SSV:60386	*EXPLOIT*
|     	SSV:60069	6.9	https://vulners.com/seebug/SSV:60069	*EXPLOIT*
|     	CVE-2012-0883	6.9	https://vulners.com/cve/CVE-2012-0883
|     	PACKETSTORM:127546	6.8	https://vulners.com/packetstorm/PACKETSTORM:127546	*EXPLOIT*
|     	CVE-2016-5387	6.8	https://vulners.com/cve/CVE-2016-5387
|     	CVE-2014-0226	6.8	https://vulners.com/cve/CVE-2014-0226
|     	1337DAY-ID-22451	6.8	https://vulners.com/zdt/1337DAY-ID-22451	*EXPLOIT*
|     	SSV:11568	6.4	https://vulners.com/seebug/SSV:11568	*EXPLOIT*
|     	CVE-2017-9788	6.4	https://vulners.com/cve/CVE-2017-9788
|     	CVE-2009-1956	6.4	https://vulners.com/cve/CVE-2009-1956
|     	VULNERLAB:967	5.8	https://vulners.com/vulnerlab/VULNERLAB:967	*EXPLOIT*
|     	VULNERABLE:967	5.8	https://vulners.com/vulnerlab/VULNERABLE:967	*EXPLOIT*
|     	SSV:67231	5.8	https://vulners.com/seebug/SSV:67231	*EXPLOIT*
|     	SSV:18637	5.8	https://vulners.com/seebug/SSV:18637	*EXPLOIT*
|     	SSV:15088	5.8	https://vulners.com/seebug/SSV:15088	*EXPLOIT*
|     	SSV:12600	5.8	https://vulners.com/seebug/SSV:12600	*EXPLOIT*
|     	PACKETSTORM:84112	5.8	https://vulners.com/packetstorm/PACKETSTORM:84112	*EXPLOIT*
|     	EXPLOITPACK:8B4E7E8DAE5A13C8250C6C33307CD66C	5.8	https://vulners.com/exploitpack/EXPLOITPACK:8B4E7E8DAE5A13C8250C6C33307CD66C	*EXPLOIT*
|     	EDB-ID:10579	5.8	https://vulners.com/exploitdb/EDB-ID:10579	*EXPLOIT*
|     	CVE-2009-3555	5.8	https://vulners.com/cve/CVE-2009-3555
|     	SSV:60788	5.1	https://vulners.com/seebug/SSV:60788	*EXPLOIT*
|     	CVE-2013-1862	5.1	https://vulners.com/cve/CVE-2013-1862
|     	SSV:96537	5.0	https://vulners.com/seebug/SSV:96537	*EXPLOIT*
|     	SSV:62058	5.0	https://vulners.com/seebug/SSV:62058	*EXPLOIT*
|     	SSV:61874	5.0	https://vulners.com/seebug/SSV:61874	*EXPLOIT*
|     	SSV:20993	5.0	https://vulners.com/seebug/SSV:20993	*EXPLOIT*
|     	SSV:20979	5.0	https://vulners.com/seebug/SSV:20979	*EXPLOIT*
|     	SSV:20969	5.0	https://vulners.com/seebug/SSV:20969	*EXPLOIT*
|     	SSV:19592	5.0	https://vulners.com/seebug/SSV:19592	*EXPLOIT*
|     	PACKETSTORM:105672	5.0	https://vulners.com/packetstorm/PACKETSTORM:105672	*EXPLOIT*
|     	PACKETSTORM:105591	5.0	https://vulners.com/packetstorm/PACKETSTORM:105591	*EXPLOIT*
|     	EXPLOITPACK:C8C256BE0BFF5FE1C0405CB0AA9C075D	5.0	https://vulners.com/exploitpack/EXPLOITPACK:C8C256BE0BFF5FE1C0405CB0AA9C075D	*EXPLOIT*
|     	EXPLOITPACK:460143F0ACAE117DD79BD75EDFDA154B	5.0	https://vulners.com/exploitpack/EXPLOITPACK:460143F0ACAE117DD79BD75EDFDA154B	*EXPLOIT*
|     	EDB-ID:42745	5.0	https://vulners.com/exploitdb/EDB-ID:42745	*EXPLOIT*
|     	EDB-ID:17969	5.0	https://vulners.com/exploitdb/EDB-ID:17969	*EXPLOIT*
|     	CVE-2017-9798	5.0	https://vulners.com/cve/CVE-2017-9798
|     	CVE-2016-8743	5.0	https://vulners.com/cve/CVE-2016-8743
|     	CVE-2014-0231	5.0	https://vulners.com/cve/CVE-2014-0231
|     	CVE-2014-0098	5.0	https://vulners.com/cve/CVE-2014-0098
|     	CVE-2013-6438	5.0	https://vulners.com/cve/CVE-2013-6438
|     	CVE-2013-5704	5.0	https://vulners.com/cve/CVE-2013-5704
|     	CVE-2011-3368	5.0	https://vulners.com/cve/CVE-2011-3368
|     	CVE-2010-1452	5.0	https://vulners.com/cve/CVE-2010-1452
|     	CVE-2010-0408	5.0	https://vulners.com/cve/CVE-2010-0408
|     	CVE-2009-3095	5.0	https://vulners.com/cve/CVE-2009-3095
|     	CVE-2009-2699	5.0	https://vulners.com/cve/CVE-2009-2699
|     	CVE-2008-2364	5.0	https://vulners.com/cve/CVE-2008-2364
|     	CVE-2007-6750	5.0	https://vulners.com/cve/CVE-2007-6750
|     	1337DAY-ID-28573	5.0	https://vulners.com/zdt/1337DAY-ID-28573	*EXPLOIT*
|     	SSV:11668	4.9	https://vulners.com/seebug/SSV:11668	*EXPLOIT*
|     	SSV:11501	4.9	https://vulners.com/seebug/SSV:11501	*EXPLOIT*
|     	CVE-2009-1195	4.9	https://vulners.com/cve/CVE-2009-1195
|     	SSV:30024	4.6	https://vulners.com/seebug/SSV:30024	*EXPLOIT*
|     	CVE-2012-0031	4.6	https://vulners.com/cve/CVE-2012-0031
|     	1337DAY-ID-27465	4.6	https://vulners.com/zdt/1337DAY-ID-27465	*EXPLOIT*
|     	SSV:23169	4.4	https://vulners.com/seebug/SSV:23169	*EXPLOIT*
|     	CVE-2011-3607	4.4	https://vulners.com/cve/CVE-2011-3607
|     	1337DAY-ID-27473	4.4	https://vulners.com/zdt/1337DAY-ID-27473	*EXPLOIT*
|     	SSV:60905	4.3	https://vulners.com/seebug/SSV:60905	*EXPLOIT*
|     	SSV:60657	4.3	https://vulners.com/seebug/SSV:60657	*EXPLOIT*
|     	SSV:60653	4.3	https://vulners.com/seebug/SSV:60653	*EXPLOIT*
|     	SSV:60345	4.3	https://vulners.com/seebug/SSV:60345	*EXPLOIT*
|     	SSV:4786	4.3	https://vulners.com/seebug/SSV:4786	*EXPLOIT*
|     	SSV:3804	4.3	https://vulners.com/seebug/SSV:3804	*EXPLOIT*
|     	SSV:30094	4.3	https://vulners.com/seebug/SSV:30094	*EXPLOIT*
|     	SSV:30056	4.3	https://vulners.com/seebug/SSV:30056	*EXPLOIT*
|     	SSV:24250	4.3	https://vulners.com/seebug/SSV:24250	*EXPLOIT*
|     	SSV:20555	4.3	https://vulners.com/seebug/SSV:20555	*EXPLOIT*
|     	SSV:19320	4.3	https://vulners.com/seebug/SSV:19320	*EXPLOIT*
|     	PACKETSTORM:109284	4.3	https://vulners.com/packetstorm/PACKETSTORM:109284	*EXPLOIT*
|     	EXPLOITPACK:FDCB3D93694E48CD5EE27CE55D6801DE	4.3	https://vulners.com/exploitpack/EXPLOITPACK:FDCB3D93694E48CD5EE27CE55D6801DE	*EXPLOIT*
|     	CVE-2016-4975	4.3	https://vulners.com/cve/CVE-2016-4975
|     	CVE-2014-0118	4.3	https://vulners.com/cve/CVE-2014-0118
|     	CVE-2013-1896	4.3	https://vulners.com/cve/CVE-2013-1896
|     	CVE-2012-4558	4.3	https://vulners.com/cve/CVE-2012-4558
|     	CVE-2012-3499	4.3	https://vulners.com/cve/CVE-2012-3499
|     	CVE-2012-0053	4.3	https://vulners.com/cve/CVE-2012-0053
|     	CVE-2011-4317	4.3	https://vulners.com/cve/CVE-2011-4317
|     	CVE-2011-3639	4.3	https://vulners.com/cve/CVE-2011-3639
|     	CVE-2011-0419	4.3	https://vulners.com/cve/CVE-2011-0419
|     	CVE-2010-0434	4.3	https://vulners.com/cve/CVE-2010-0434
|     	CVE-2008-2939	4.3	https://vulners.com/cve/CVE-2008-2939
|     	CVE-2008-0455	4.3	https://vulners.com/cve/CVE-2008-0455
|     	CVE-2008-0005	4.3	https://vulners.com/cve/CVE-2008-0005
|     	SSV:12628	2.6	https://vulners.com/seebug/SSV:12628	*EXPLOIT*
|     	CVE-2012-2687	2.6	https://vulners.com/cve/CVE-2012-2687
|     	CVE-2009-3094	2.6	https://vulners.com/cve/CVE-2009-3094
|     	CVE-2008-0456	2.6	https://vulners.com/cve/CVE-2008-0456
|     	SSV:60250	1.2	https://vulners.com/seebug/SSV:60250	*EXPLOIT*
|_    	CVE-2011-4415	1.2	https://vulners.com/cve/CVE-2011-4415
111/tcp  open  rpcbind     2 (RPC #100000)
| rpcinfo: 
|   program version    port/proto  service
|   100000  2            111/tcp   rpcbind
|   100000  2            111/udp   rpcbind
|   100003  2,3,4       2049/tcp   nfs
|   100003  2,3,4       2049/udp   nfs
|   100005  1,2,3      42875/udp   mountd
|   100005  1,2,3      54536/tcp   mountd
|   100021  1,3,4      37983/tcp   nlockmgr
|   100021  1,3,4      46923/udp   nlockmgr
|   100024  1          36718/tcp   status
|_  100024  1          46907/udp   status
139/tcp  open  netbios-ssn Samba smbd 3.X - 4.X (workgroup: WORKGROUP)
445/tcp  open  netbios-ssn Samba smbd 3.X - 4.X (workgroup: WORKGROUP)
512/tcp  open  exec        netkit-rsh rexecd
513/tcp  open  login       OpenBSD or Solaris rlogind
514/tcp  open  tcpwrapped
1099/tcp open  java-rmi    GNU Classpath grmiregistry
1524/tcp open  bindshell   Metasploitable root shell
2049/tcp open  nfs         2-4 (RPC #100003)
2121/tcp open  ftp         ProFTPD 1.3.1
| vulners: 
|   cpe:/a:proftpd:proftpd:1.3.1: 
|     	SAINT:FD1752E124A72FD3A26EEB9B315E8382	10.0	https://vulners.com/saint/SAINT:FD1752E124A72FD3A26EEB9B315E8382	*EXPLOIT*
|     	SAINT:950EB68D408A40399926A4CCAD3CC62E	10.0	https://vulners.com/saint/SAINT:950EB68D408A40399926A4CCAD3CC62E	*EXPLOIT*
|     	SAINT:63FB77B9136D48259E4F0D4CDA35E957	10.0	https://vulners.com/saint/SAINT:63FB77B9136D48259E4F0D4CDA35E957	*EXPLOIT*
|     	SAINT:1B08F4664C428B180EEC9617B41D9A2C	10.0	https://vulners.com/saint/SAINT:1B08F4664C428B180EEC9617B41D9A2C	*EXPLOIT*
|     	PROFTPD_MOD_COPY	10.0	https://vulners.com/canvas/PROFTPD_MOD_COPY	*EXPLOIT*
|     	PACKETSTORM:162777	10.0	https://vulners.com/packetstorm/PACKETSTORM:162777	*EXPLOIT*
|     	PACKETSTORM:132218	10.0	https://vulners.com/packetstorm/PACKETSTORM:132218	*EXPLOIT*
|     	PACKETSTORM:131567	10.0	https://vulners.com/packetstorm/PACKETSTORM:131567	*EXPLOIT*
|     	PACKETSTORM:131555	10.0	https://vulners.com/packetstorm/PACKETSTORM:131555	*EXPLOIT*
|     	PACKETSTORM:131505	10.0	https://vulners.com/packetstorm/PACKETSTORM:131505	*EXPLOIT*
|     	EDB-ID:49908	10.0	https://vulners.com/exploitdb/EDB-ID:49908	*EXPLOIT*
|     	1337DAY-ID-36298	10.0	https://vulners.com/zdt/1337DAY-ID-36298	*EXPLOIT*
|     	1337DAY-ID-23720	10.0	https://vulners.com/zdt/1337DAY-ID-23720	*EXPLOIT*
|     	1337DAY-ID-23544	10.0	https://vulners.com/zdt/1337DAY-ID-23544	*EXPLOIT*
|     	SSV:26016	9.0	https://vulners.com/seebug/SSV:26016	*EXPLOIT*
|     	SSV:24282	9.0	https://vulners.com/seebug/SSV:24282	*EXPLOIT*
|     	CVE-2011-4130	9.0	https://vulners.com/cve/CVE-2011-4130
|     	SSV:96525	7.5	https://vulners.com/seebug/SSV:96525	*EXPLOIT*
|     	CVE-2019-12815	7.5	https://vulners.com/cve/CVE-2019-12815
|     	739FE495-4675-5A2A-BB93-EEF94AC07632	7.5	https://vulners.com/githubexploit/739FE495-4675-5A2A-BB93-EEF94AC07632	*EXPLOIT*
|     	SSV:20226	7.1	https://vulners.com/seebug/SSV:20226	*EXPLOIT*
|     	PACKETSTORM:95517	7.1	https://vulners.com/packetstorm/PACKETSTORM:95517	*EXPLOIT*
|     	CVE-2010-3867	7.1	https://vulners.com/cve/CVE-2010-3867
|     	SSV:12447	6.8	https://vulners.com/seebug/SSV:12447	*EXPLOIT*
|     	SSV:11950	6.8	https://vulners.com/seebug/SSV:11950	*EXPLOIT*
|     	EDB-ID:33128	6.8	https://vulners.com/exploitdb/EDB-ID:33128	*EXPLOIT*
|     	CVE-2010-4652	6.8	https://vulners.com/cve/CVE-2010-4652
|     	CVE-2009-0543	6.8	https://vulners.com/cve/CVE-2009-0543
|     	SSV:12523	5.8	https://vulners.com/seebug/SSV:12523	*EXPLOIT*
|     	CVE-2009-3639	5.8	https://vulners.com/cve/CVE-2009-3639
|     	CVE-2020-9272	5.0	https://vulners.com/cve/CVE-2020-9272
|     	CVE-2019-19272	5.0	https://vulners.com/cve/CVE-2019-19272
|     	CVE-2019-19271	5.0	https://vulners.com/cve/CVE-2019-19271
|     	CVE-2019-19270	5.0	https://vulners.com/cve/CVE-2019-19270
|     	CVE-2019-18217	5.0	https://vulners.com/cve/CVE-2019-18217
|     	CVE-2016-3125	5.0	https://vulners.com/cve/CVE-2016-3125
|     	CVE-2011-1137	5.0	https://vulners.com/cve/CVE-2011-1137
|     	CVE-2008-7265	4.0	https://vulners.com/cve/CVE-2008-7265
|     	CVE-2017-7418	2.1	https://vulners.com/cve/CVE-2017-7418
|     	CVE-2012-6095	1.2	https://vulners.com/cve/CVE-2012-6095
|_    	CVE-2021-46854	0.0	https://vulners.com/cve/CVE-2021-46854
3306/tcp open  mysql       MySQL 5.0.51a-3ubuntu5
| vulners: 
|   cpe:/a:mysql:mysql:5.0.51a-3ubuntu5: 
|     	SSV:19118	8.5	https://vulners.com/seebug/SSV:19118	*EXPLOIT*
|     	CVE-2009-2446	8.5	https://vulners.com/cve/CVE-2009-2446
|     	SAINT:D505D53863BE216621FDAECA22896071	7.5	https://vulners.com/saint/SAINT:D505D53863BE216621FDAECA22896071	*EXPLOIT*
|     	SAINT:A9E0BE0CEF71F1F98D3CB3E95173B3D0	7.5	https://vulners.com/saint/SAINT:A9E0BE0CEF71F1F98D3CB3E95173B3D0	*EXPLOIT*
|     	SAINT:79BA92A57C28E796ADD04A6A8AE158CE	7.5	https://vulners.com/saint/SAINT:79BA92A57C28E796ADD04A6A8AE158CE	*EXPLOIT*
|     	SAINT:3101D21E4D8017EA5B14AF668DC39CAD	7.5	https://vulners.com/saint/SAINT:3101D21E4D8017EA5B14AF668DC39CAD	*EXPLOIT*
|     	PACKETSTORM:85678	7.5	https://vulners.com/packetstorm/PACKETSTORM:85678	*EXPLOIT*
|     	PACKETSTORM:82247	7.5	https://vulners.com/packetstorm/PACKETSTORM:82247	*EXPLOIT*
|     	CVE-2008-0226	7.5	https://vulners.com/cve/CVE-2008-0226
|     	SSV:15006	6.8	https://vulners.com/seebug/SSV:15006	*EXPLOIT*
|     	CVE-2009-5026	6.8	https://vulners.com/cve/CVE-2009-5026
|     	CVE-2009-4028	6.8	https://vulners.com/cve/CVE-2009-4028
|     	SSV:19606	6.5	https://vulners.com/seebug/SSV:19606	*EXPLOIT*
|     	CVE-2010-1848	6.5	https://vulners.com/cve/CVE-2010-1848
|     	SSV:19608	6.0	https://vulners.com/seebug/SSV:19608	*EXPLOIT*
|     	SSV:15004	6.0	https://vulners.com/seebug/SSV:15004	*EXPLOIT*
|     	CVE-2010-1850	6.0	https://vulners.com/cve/CVE-2010-1850
|     	CVE-2008-7247	6.0	https://vulners.com/cve/CVE-2008-7247
|     	SSV:19607	5.0	https://vulners.com/seebug/SSV:19607	*EXPLOIT*
|     	CVE-2010-3833	5.0	https://vulners.com/cve/CVE-2010-3833
|     	CVE-2010-1849	5.0	https://vulners.com/cve/CVE-2010-1849
|     	SSV:3280	4.6	https://vulners.com/seebug/SSV:3280	*EXPLOIT*
|     	CVE-2008-4098	4.6	https://vulners.com/cve/CVE-2008-4098
|     	CVE-2008-2079	4.6	https://vulners.com/cve/CVE-2008-2079
|     	SSV:4042	4.0	https://vulners.com/seebug/SSV:4042	*EXPLOIT*
|     	SSV:15090	4.0	https://vulners.com/seebug/SSV:15090	*EXPLOIT*
|     	SSV:15005	4.0	https://vulners.com/seebug/SSV:15005	*EXPLOIT*
|     	CVE-2012-0490	4.0	https://vulners.com/cve/CVE-2012-0490
|     	CVE-2012-0484	4.0	https://vulners.com/cve/CVE-2012-0484
|     	CVE-2012-0102	4.0	https://vulners.com/cve/CVE-2012-0102
|     	CVE-2012-0101	4.0	https://vulners.com/cve/CVE-2012-0101
|     	CVE-2012-0087	4.0	https://vulners.com/cve/CVE-2012-0087
|     	CVE-2010-3838	4.0	https://vulners.com/cve/CVE-2010-3838
|     	CVE-2010-3837	4.0	https://vulners.com/cve/CVE-2010-3837
|     	CVE-2010-3836	4.0	https://vulners.com/cve/CVE-2010-3836
|     	CVE-2010-3834	4.0	https://vulners.com/cve/CVE-2010-3834
|     	CVE-2010-3682	4.0	https://vulners.com/cve/CVE-2010-3682
|     	CVE-2010-3677	4.0	https://vulners.com/cve/CVE-2010-3677
|     	CVE-2009-4019	4.0	https://vulners.com/cve/CVE-2009-4019
|     	CVE-2008-3963	4.0	https://vulners.com/cve/CVE-2008-3963
|     	CVE-2010-1626	3.6	https://vulners.com/cve/CVE-2010-1626
|     	CVE-2012-0114	3.0	https://vulners.com/cve/CVE-2012-0114
|_    	CVE-2012-0075	1.7	https://vulners.com/cve/CVE-2012-0075
5432/tcp open  postgresql  PostgreSQL DB 8.3.0 - 8.3.7
| vulners: 
|   cpe:/a:postgresql:postgresql:8.3: 
|     	SSV:60718	10.0	https://vulners.com/seebug/SSV:60718	*EXPLOIT*
|     	CVE-2013-1903	10.0	https://vulners.com/cve/CVE-2013-1903
|     	CVE-2013-1902	10.0	https://vulners.com/cve/CVE-2013-1902
|     	SSV:30015	8.5	https://vulners.com/seebug/SSV:30015	*EXPLOIT*
|     	SSV:19652	8.5	https://vulners.com/seebug/SSV:19652	*EXPLOIT*
|     	POSTGRESQL:CVE-2013-1900	8.5	https://vulners.com/postgresql/POSTGRESQL:CVE-2013-1900
|     	POSTGRESQL:CVE-2010-1169	8.5	https://vulners.com/postgresql/POSTGRESQL:CVE-2010-1169
|     	CVE-2010-1447	8.5	https://vulners.com/cve/CVE-2010-1447
|     	CVE-2010-1169	8.5	https://vulners.com/cve/CVE-2010-1169
|     	SSV:19754	7.5	https://vulners.com/seebug/SSV:19754	*EXPLOIT*
|     	SSV:30152	6.8	https://vulners.com/seebug/SSV:30152	*EXPLOIT*
|     	SECURITYVULNS:VULN:10252	6.8	https://vulners.com/securityvulns/SECURITYVULNS:VULN:10252
|     	POSTGRESQL:CVE-2013-0255	6.8	https://vulners.com/postgresql/POSTGRESQL:CVE-2013-0255
|     	POSTGRESQL:CVE-2012-0868	6.8	https://vulners.com/postgresql/POSTGRESQL:CVE-2012-0868
|     	POSTGRESQL:CVE-2009-3231	6.8	https://vulners.com/postgresql/POSTGRESQL:CVE-2009-3231
|     	CVE-2013-0255	6.8	https://vulners.com/cve/CVE-2013-0255
|     	CVE-2012-0868	6.8	https://vulners.com/cve/CVE-2012-0868
|     	CVE-2009-3231	6.8	https://vulners.com/cve/CVE-2009-3231
|     	SSV:62083	6.5	https://vulners.com/seebug/SSV:62083	*EXPLOIT*
|     	SSV:62016	6.5	https://vulners.com/seebug/SSV:62016	*EXPLOIT*
|     	SSV:61543	6.5	https://vulners.com/seebug/SSV:61543	*EXPLOIT*
|     	SSV:19018	6.5	https://vulners.com/seebug/SSV:19018	*EXPLOIT*
|     	SSV:15153	6.5	https://vulners.com/seebug/SSV:15153	*EXPLOIT*
|     	SSV:15097	6.5	https://vulners.com/seebug/SSV:15097	*EXPLOIT*
|     	SSV:15095	6.5	https://vulners.com/seebug/SSV:15095	*EXPLOIT*
|     	SECURITYVULNS:VULN:10803	6.5	https://vulners.com/securityvulns/SECURITYVULNS:VULN:10803
|     	SECURITYVULNS:VULN:10473	6.5	https://vulners.com/securityvulns/SECURITYVULNS:VULN:10473
|     	POSTGRESQL:CVE-2014-0065	6.5	https://vulners.com/postgresql/POSTGRESQL:CVE-2014-0065
|     	POSTGRESQL:CVE-2014-0064	6.5	https://vulners.com/postgresql/POSTGRESQL:CVE-2014-0064
|     	POSTGRESQL:CVE-2014-0063	6.5	https://vulners.com/postgresql/POSTGRESQL:CVE-2014-0063
|     	POSTGRESQL:CVE-2014-0061	6.5	https://vulners.com/postgresql/POSTGRESQL:CVE-2014-0061
|     	POSTGRESQL:CVE-2012-0866	6.5	https://vulners.com/postgresql/POSTGRESQL:CVE-2012-0866
|     	POSTGRESQL:CVE-2010-4015	6.5	https://vulners.com/postgresql/POSTGRESQL:CVE-2010-4015
|     	POSTGRESQL:CVE-2009-4136	6.5	https://vulners.com/postgresql/POSTGRESQL:CVE-2009-4136
|     	POSTGRESQL:CVE-2009-3230	6.5	https://vulners.com/postgresql/POSTGRESQL:CVE-2009-3230
|     	CVE-2014-0065	6.5	https://vulners.com/cve/CVE-2014-0065
|     	CVE-2014-0064	6.5	https://vulners.com/cve/CVE-2014-0064
|     	CVE-2014-0063	6.5	https://vulners.com/cve/CVE-2014-0063
|     	CVE-2014-0061	6.5	https://vulners.com/cve/CVE-2014-0061
|     	CVE-2012-0866	6.5	https://vulners.com/cve/CVE-2012-0866
|     	CVE-2010-4015	6.5	https://vulners.com/cve/CVE-2010-4015
|     	CVE-2010-0442	6.5	https://vulners.com/cve/CVE-2010-0442
|     	SECURITYVULNS:VULN:11183	6.0	https://vulners.com/securityvulns/SECURITYVULNS:VULN:11183
|     	POSTGRESQL:CVE-2010-3433	6.0	https://vulners.com/postgresql/POSTGRESQL:CVE-2010-3433
|     	POSTGRESQL:CVE-2010-1170	6.0	https://vulners.com/postgresql/POSTGRESQL:CVE-2010-1170
|     	CVE-2010-3433	6.0	https://vulners.com/cve/CVE-2010-3433
|     	CVE-2010-1170	6.0	https://vulners.com/cve/CVE-2010-1170
|     	SSV:15154	5.8	https://vulners.com/seebug/SSV:15154	*EXPLOIT*
|     	SSV:15096	5.8	https://vulners.com/seebug/SSV:15096	*EXPLOIT*
|     	POSTGRESQL:CVE-2009-4034	5.8	https://vulners.com/postgresql/POSTGRESQL:CVE-2009-4034
|     	SSV:19669	5.5	https://vulners.com/seebug/SSV:19669	*EXPLOIT*
|     	POSTGRESQL:CVE-2010-1975	5.5	https://vulners.com/postgresql/POSTGRESQL:CVE-2010-1975
|     	CVE-2010-1975	5.5	https://vulners.com/cve/CVE-2010-1975
|     	SSV:61546	4.9	https://vulners.com/seebug/SSV:61546	*EXPLOIT*
|     	SSV:60334	4.9	https://vulners.com/seebug/SSV:60334	*EXPLOIT*
|     	POSTGRESQL:CVE-2014-0062	4.9	https://vulners.com/postgresql/POSTGRESQL:CVE-2014-0062
|     	POSTGRESQL:CVE-2012-3488	4.9	https://vulners.com/postgresql/POSTGRESQL:CVE-2012-3488
|     	CVE-2014-0062	4.9	https://vulners.com/cve/CVE-2014-0062
|     	CVE-2012-3488	4.9	https://vulners.com/cve/CVE-2012-3488
|     	SSV:61544	4.6	https://vulners.com/seebug/SSV:61544	*EXPLOIT*
|     	CVE-2014-0067	4.6	https://vulners.com/cve/CVE-2014-0067
|     	POSTGRESQL:CVE-2012-2143	4.3	https://vulners.com/postgresql/POSTGRESQL:CVE-2012-2143
|     	POSTGRESQL:CVE-2012-0867	4.3	https://vulners.com/postgresql/POSTGRESQL:CVE-2012-0867
|     	CVE-2012-2143	4.3	https://vulners.com/cve/CVE-2012-2143
|     	SSV:61547	4.0	https://vulners.com/seebug/SSV:61547	*EXPLOIT*
|     	SSV:61545	4.0	https://vulners.com/seebug/SSV:61545	*EXPLOIT*
|     	SSV:60335	4.0	https://vulners.com/seebug/SSV:60335	*EXPLOIT*
|     	SSV:60186	4.0	https://vulners.com/seebug/SSV:60186	*EXPLOIT*
|     	SSV:4928	4.0	https://vulners.com/seebug/SSV:4928	*EXPLOIT*
|     	SECURITYVULNS:VULN:9765	4.0	https://vulners.com/securityvulns/SECURITYVULNS:VULN:9765
|     	POSTGRESQL:CVE-2014-0066	4.0	https://vulners.com/postgresql/POSTGRESQL:CVE-2014-0066
|     	POSTGRESQL:CVE-2014-0060	4.0	https://vulners.com/postgresql/POSTGRESQL:CVE-2014-0060
|     	POSTGRESQL:CVE-2012-3489	4.0	https://vulners.com/postgresql/POSTGRESQL:CVE-2012-3489
|     	POSTGRESQL:CVE-2012-2655	4.0	https://vulners.com/postgresql/POSTGRESQL:CVE-2012-2655
|     	POSTGRESQL:CVE-2009-3229	4.0	https://vulners.com/postgresql/POSTGRESQL:CVE-2009-3229
|     	POSTGRESQL:CVE-2009-0922	4.0	https://vulners.com/postgresql/POSTGRESQL:CVE-2009-0922
|     	CVE-2014-0066	4.0	https://vulners.com/cve/CVE-2014-0066
|     	CVE-2014-0060	4.0	https://vulners.com/cve/CVE-2014-0060
|     	CVE-2012-3489	4.0	https://vulners.com/cve/CVE-2012-3489
|     	CVE-2012-2655	4.0	https://vulners.com/cve/CVE-2012-2655
|     	CVE-2009-3229	4.0	https://vulners.com/cve/CVE-2009-3229
|     	SSV:19322	3.5	https://vulners.com/seebug/SSV:19322	*EXPLOIT*
|     	PACKETSTORM:127092	3.5	https://vulners.com/packetstorm/PACKETSTORM:127092	*EXPLOIT*
|_    	CVE-2010-0733	3.5	https://vulners.com/cve/CVE-2010-0733
5900/tcp open  vnc         VNC (protocol 3.3)
6000/tcp open  X11         (access denied)
6667/tcp open  irc         UnrealIRCd
8009/tcp open  ajp13       Apache Jserv (Protocol v1.3)
8180/tcp open  http        Apache Tomcat/Coyote JSP engine 1.1
|_http-server-header: Apache-Coyote/1.1
Service Info: Hosts:  metasploitable.localdomain, irc.Metasploitable.LAN; OSs: Unix, Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 14.83 seconds


Задание 2

Проведите сканирование Metasploitable в режимах SYN, FIN, Xmas, UDP.

Запишите сеансы сканирования в Wireshark.

Ответьте на следующие вопросы:

Чем отличаются эти режимы сканирования с точки зрения сетевого трафика?
Используемыми сетевыми протоколами, и флагами пакетов в случае TCP протокола:
SYN - TCP [SYN]
FIN - TCP [FIN]
Xmas - TCP [FIN, PSH, URG]

Как отвечает сервер?
При UDP сканировании - ICMP пакетыми с кодом ошибок (порт закрыт) или UDP пакетом (порт открыт). Нет ответа - вероятно, порт открыт
SYN сканирование - TCP [SYN, ACK] (порт открыт) [RST, ACK], [RST] (порт закрыт) пакеты
FIN сканирование - TCP [RST, ACK] пакеты (порт закрыт)
Xmas сканирование - TCP [RST, ACK] пакеты (порт закрыт)







