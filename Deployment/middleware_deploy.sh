#!/bin/bash

main_directory=/home/ubuntu/
cd $main_directory || exit

# clone git repo

git clone "https://github.com/Wason1797/UMA-MAKI.git"

# instance server name, dont forget to change
server_name="ec2-3-86-166-206.compute-1.amazonaws.com"


# create a folder to store the project
middleware_folder="Middleware"
main_folder="MiddlewareApi"
working_path=$main_directory$middleware_folder
mkdir $middleware_folder


# copy the middleware section to the desired folder
cp -r UMA-MAKI/MiddlewareApi/ $middleware_folder
chmod -R 777 $middleware_folder/
cd $middleware_folder/$main_folder || exit


# prompt to copy credentials
echo Copy secrets.json to  $middleware_folder/$main_folder/DocumentMiddleware folder
read -r

# install python 3.7.x

sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install python3.7

# install necesary packages

sudo apt-get install python3.7-pip supervisor python-virtualenv
sudo apt-get install nginx libpq-dev python3.7-dev libmysqlclient-dev

virtualenv venv --python=python3.7

source "./venv/bin/activate"

# install requirements and gunicorn

pip3 install -r requirements.txt
pip3 install gunicorn


# configuring supervisor

cd /etc/supervisor/conf.d/ || exit

sudo rm gunicorn.conf
sudo touch gunicorn.conf


project_folder="DocumentMiddleware"

sudo cat << EOF > gunicorn.conf
[program:gunicorn]
directory=${working_path}/${main_folder}/${project_folder}/
command=${working_path}/${main_folder}/venv/bin/gunicorn --workers 3 --bind unix:${working_path}/${main_folder}/${project_folder}/app.sock ${project_folder}.wsgi:application
autostart=true
autorestart=true
stderr_logfile=/var/log/gunicorn/gunicorn.err.log
stdout=logfile=/var/log/gunicorn/gunicorn.out.log
[group:guni]
programs:gunicorn
EOF

sudo mkdir /var/log/gunicorn
sudo supervisorctl reread
sudo supervisorctl update
sudo supervisorctl restart all
sudo supervisorctl status

# configuring nginx, server name needs change
cd /etc/nginx/sites-available/ || exit
sudo rm django.conf
sudo touch django.conf

sudo cat << EOF > django.conf
server {
        listen 80 ;
        server_name ${server_name} ;
        location / {
            include proxy_params;
            proxy_pass http://unix:${working_path}/${main_folder}/${project_folder}/app.sock;
        }

}
EOF

sudo rm /etc/nginx/sites-enabled/django.conf
sudo ln django.conf /etc/nginx/sites-enabled/
sudo nginx -t
sudo service nginx restart
