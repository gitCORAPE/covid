#!/bin/bash

#!/bin/bash

main_directory=/home/ubuntu/
cd $main_directory || exit

# clone git repo

git clone "https://github.com/Wason1797/UMA-MAKI.git"



# create a folder to store the project
backend_folder="BackEnd"
mkdir $backend_folder


# copy the backend section to the desired folder
cp -r UMA-MAKI/NodeServer/ $backend_folder
chmod -R 777 $backend_folder/
cd $backend_folder || exit


# prompt to copy credentials
echo Copy .env to  $backend_folder/NodeServer folder
read -r

# install necesary packages

sudo apt-get update
sudo apt-get upgrade
curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
sudo apt-get install -y nodejs
sudo apt-get install -y mongodb

# run the app

cd NodeServer || exit

npm install
npm install pm2

./node_modules/.bin/pm2 install typescript

sudo cat << EOF > backend_prod.json
{
  apps : [{
    name        : "backend-service",
    script      : "./src/index.ts",
    env: {
      "NODE_ENV": "development",
      "PORT": "3000"
    },
    env_production : {
       "NODE_ENV": "production",
       "PORT": "3000"
    }
  }]
}
EOF

./node_modules/.bin/pm2 start backend_prod.json --env production
./node_modules/.bin/pm2 log
