@echo off

set Web=D:/web
set Docker=D:/docker/
set Php7=php7/etc


if exist %Docker%Php7 (

) else (
    md  %Docker%Php7
)

docker run -p 9000:9000 --name  php-fpm  -v D:/web:/var/www/html -v D:/docker/php7/etc:/usr/local/etc  -d xwx/php-fpm:7.2.5


goto start
    docker run -p 9000:9000 --name  php-fpm  -v D:/web:/var/www/html -v D:/docker/php7/etc:/usr/local/etc  -d php:7.2.5-fpm --link mysql5.7:mysql5.7
    =命令说明:
    =-p 9000:9000 :将容器的9000端口映射到主机的9000端口
    =--name myphp-fpm :将容器命名为myphp-fpm
    =-v ~/nginx/www:/www :将主机中项目的目录www挂载到容器的/www
    =-v $PWD/conf:/usr/local/etc/php ：将主机中当前目录下的conf目录挂载到容器的/usr/local/etc/php
    =-v $PWD/logs:/phplogs ：将主机中当前目录下的logs目录挂载到容器的/phplogs
    =安装gd会遇到问题
    =apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng-dev
    =安装扩展方法
    =docker-php-ext-configure gd  --with-freetype-dir=/usr/include/freetype2 --with-png-dir=/usr/include --with-jpeg-dir=/usr/include
    =docker-php-ext-install gd
:start