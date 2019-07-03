# Centos SSH免密码登录  参考链接：https://docsxyz.com/wiki/centos/ssh-keygen

#ssh-keygen 生成密钥
ssh-keygen -t rsa

#ssh-copy-id 复制公钥
ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.1.108


#ssh 登录服务器
ssh root@192.168.1.108
#或者 -i 指定私钥文件位置
ssh -i ~/.ssh/id_rsa root@192.168.1.108
