#!/usr/bin/env sh
set -eu

path_msc="microservices"

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

DOWNLOAD() {
  for msc in g-auth g-auth; do
    echo "Downloading $msc microservice"

    rm -rf ./$path_msc/$msc
    mkdir ./$path_msc/$msc
    cd ./$path_msc/$msc
    git clone --recurse-submodules https://github.com/CrisBogucki/cb-msc-$msc.git .

    cd ../..
    
  done
  clear
  PRINT_BANNER
  echo "Downloading microservices .......... done"

}

UPDATE() {
  echo "Updating microservices ..............."
  for msc in g-auth g-auth; do
    echo "Updating $msc microservice"
    cd ./$path_msc/$msc
    clear
    ./update.sh
    cd ../..
  done
  clear
  PRINT_BANNER
  echo "Updating  microservices .......... done"
}

DEPLOY_BROCKER(){
sh ./deploy-brocker.sh
}

DEPLOY_MICROSERVICES() {
sh ./deploy-microservices.sh
}

PRINT_BANNER
DOWNLOAD
UPDATE
DEPLOY_BROCKER
DEPLOY_MICROSERVICES
