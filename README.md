# Tensile Machine Poll-server
**server: beta - 0.1.1 \
web: alpha - 0.0.3**



УСТАНОВКА
---
1. перейти в installation
2. sudo ./install.sh
3. включить автозапуск при старте системы
sudo systemctl enable mbsrtu_server_py.service
4. файл конфигурации:
директория: /opt/poll_server_py/configurations
файл: config.json

УПРАВЛЕНИЕ
---
1. узнать статус
systemctl status mbsrtu_server_py
2. остановить
sudo systemctl stop mbsrtu_server_py
или ручной
sudo /opt/poll_server_py/sbin/control.sh stop
3. запустить
sudo systemctl start mbsrtu_server_py
или ручной
sudo /opt/poll_server_py/sbin/control.sh start
4. посмотреть лог > (/opt/poll_server_py/logs)
tail /opt/poll_server_py/logs/*

ДОПОЛНИТЕЛЬНО
---
1. sudo netstat -tunlp | grep python


Key generation info
---
Country Name (2 letter code) [AU]:RU \
State or Province Name (full name) [Some-State]:Moscow \
Locality Name (eg, city) []:Moscow \
Organization Name (eg, company) [Internet Widgits Pty Ltd]:RGU Robotics \
Organizational Unit Name (eg, section) []:IM&IT \
Common Name (e.g. server FQDN or YOUR name) []: 192.168.5.71 \
Email Address []:grurobotics@gmail.com
