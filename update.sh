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

DOWNLOAD_CODE(){
for msc in g-auth g-auth
do
  echo "Downloading $msc microservice"
  
  rm -rf ./microservices/$msc
  mkdir ./microservices/$msc
  cd ./microservices/$msc
  git clone --recurse-submodules https://github.com/CrisBogucki/cb-msc-$msc.git .
  clear
  ./update.sh
  cd ../..
done
clear
PRINT_BANNER
echo "Downloading microservices .......... done"
  
}

UPDATE_MICROSERVICES() {
echo "Updating microservices ..............."
for msc in g-auth g-auth
do
  echo "Updating $msc microservice"
  cd ./microservices/$msc
  clear
  ./update.sh
  cd ../..
done
clear
PRINT_BANNER
echo "Updating  microservices .......... done"
}

PRINT_BANNER
DOWNLOAD_CODE
#UPDATE_MICROSERVICES
