#安装组件
yum -y install gcc gcc-c++ zlib zlib-devel openssl openssl-devel pcre pcre-devel

#获取nginx。如果未安装wget，使用 yum -y install wget
wget https://nginx.org/download/nginx-1.17.1.tar.gz

#解压，zxvf显示解压文件
tar zxf nginx-1.17.1.tar.gz

#进入nginx源文件目录
cd nginx-1.17.1

#编译，默认https没有打开，需要添加 --with-http_ssl_module
./configure --with-http_ssl_module

#安装Nginx
make && make install

#启动Nginx
/usr/local/nginx/sbin/nginx

#查看防火墙状态
firewall-cmd --state

#关闭防火墙
systemctl stop firewalld.service

#打开防火墙
systemctl start firewalld.service

#永久开放80端口
firewall-cmd --zone=public --add-port=80/tcp --permanent

#更新防火墙规则
firewall-cmd --reload

#测试Nginx配置文件
./sbin/nginx -t -c ~/mynginx.conf -g "pid /var/run/nginx.pid; worker_processes 2;"

#重新加载日志文件
kill -USR1 $(cat ./logs/nginx.pid)
