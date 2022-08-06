#!/bin/bash -eux
 
SYSTEM_NAME=`lsb_release -is`;
SYSTEM_VERSION=`lsb_release -cs`;
SYSTEM_VERSION_NUMBER=`lsb_release -rs`;
SOURCE='mirrors.aliyun.com';

if [ -e 'etc/apt/sources.list.bak' ];then
    echo -e '\033[32m检测到已备份的 source.list源 文件，跳过备份操作...... \033[0m';
else
    cp -rf /etc/apt/sources.list /etc/apt/sources.list.bak;
    echo -e '\033[32m已备份原有 source.list 更新源文件...... \033[0m';
fi

sed -i '1,$d' /etc/apt/sources.list;
echo "deb https://$SOURCE/ubuntu/ $SYSTEM_VERSION main restricted universe multiverse" >> /etc/apt/sources.list;
echo "deb-src https://$SOURCE/ubuntu/ $SYSTEM_VERSION main restricted universe multiverse" >> /etc/apt/sources.list;
echo "deb https://$SOURCE/ubuntu/ $SYSTEM_VERSION-security main restricted universe multiverse" >> /etc/apt/sources.list;
echo "deb-src https://$SOURCE/ubuntu/ $SYSTEM_VERSION-security main restricted universe multiverse" >> /etc/apt/sources.list;
echo "deb https://$SOURCE/ubuntu/ $SYSTEM_VERSION-updates main restricted universe multiverse" >> /etc/apt/sources.list;
echo "deb-src https://$SOURCE/ubuntu/ $SYSTEM_VERSION-updates main restricted universe multiverse" >> /etc/apt/sources.list;
echo "deb https://$SOURCE/ubuntu/ $SYSTEM_VERSION-proposed main restricted universe multiverse" >> /etc/apt/sources.list;
echo "deb-src https://$SOURCE/ubuntu/ $SYSTEM_VERSION-proposed main restricted universe multiverse" >> /etc/apt/sources.list;
echo "deb https://$SOURCE/ubuntu/ $SYSTEM_VERSION-backports main restricted universe multiverse" >> /etc/apt/sources.list;
echo "deb-src https://$SOURCE/ubuntu/ $SYSTEM_VERSION-backports main restricted universe multiverse" >> /etc/apt/sources.list;