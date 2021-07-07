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

UPDATE_MICROSERVICES() {
echo "Updating microservices ..............."
for msc in g-auth g-auth g-auth
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
UPDATE_MICROSERVICES