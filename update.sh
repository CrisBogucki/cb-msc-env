#!/usr/bin/env sh
set -eu

PRINT_BANNER() {
  echo '
  
 ██████╗██████╗     ███╗   ███╗███████╗ ██████╗    ███████╗███╗   ██╗██╗   ██╗
██╔════╝██╔══██╗    ████╗ ████║██╔════╝██╔════╝    ██╔════╝████╗  ██║██║   ██║
██║     ██████╔╝    ██╔████╔██║███████╗██║         █████╗  ██╔██╗ ██║██║   ██║
██║     ██╔══██╗    ██║╚██╔╝██║╚════██║██║         ██╔══╝  ██║╚██╗██║╚██╗ ██╔╝
╚██████╗██████╔╝    ██║ ╚═╝ ██║███████║╚██████╗    ███████╗██║ ╚████║ ╚████╔╝ 
 ╚═════╝╚═════╝     ╚═╝     ╚═╝╚══════╝ ╚═════╝    ╚══════╝╚═╝  ╚═══╝  ╚═══╝  
                                                                                                                                                                                                                                                                                                                             
'
}


UPDATE_SUMBODULES()
{
  git submodule foreach git fetch
  git submodule foreach git pull origin main
  git submodule foreach git checkout main
}

UPDATE_MICROSERVICES() {
echo "Updating microservices ..............."
for msc in g-auth
do
  echo "Updating $msc microservice"
  cd ./microservice/$msc
  clear
  ./update.sh
  cd ../..
done
clear
PRINT_BANNER
echo "Updating  microservices .......... done"
}

PRINT_BANNER
UPDATE_SUMBODULES
UPDATE_MICROSERVICES
