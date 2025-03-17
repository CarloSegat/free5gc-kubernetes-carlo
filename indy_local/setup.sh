#!/bin/sh

if [ -z "$1" ]; then
    echo "Error: IP Address Required argument is required."
    exit 1
fi

# 130.149.223.224
IP_ADDRESS=$1

mkdir ~/indy_local
cd ~/indy_local

# CLONE INDY
git clone https://github.com/hyperledger-indy/indy-sdk/releases/tag/v1.16.0

# RUN THE LOCAL LEDGER NODES (4 nodes as 1 docker container)
cd indy-sdk
docker build --build-arg pool_ip=$IP_ADDRESS -f ci/indy-pool.dockerfile -t indy_pool .
CONTAINER_ID=$(docker run -itd -p $IP_ADDRESS:9701-9708:9701-9708 indy_pool)

echo \"The local indy ledger is running in container $CONTAINER_ID\"

# INSTALL indy-cli
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CE7709D068DB5E88
sudo add-apt-repository "deb https://repo.sovrin.org/sdk/deb bionic stable"
sudo apt-get update
sudo apt-get install -y indy-cli

sudo apt install libncurses5

# EXTRACT GENESIS FILE FROM DOCKER CONTAINER
sudo docker cp $CONTAINER_ID:/var/lib/indy/sandbox/pool_transactions_genesis - > dirty_genesis.json
grep -o '{.*}' dirty_genesis.json > genesis.json
rm dirty_genesis.json

# WRITE STUFF TO THE LEDGER
sh indy-cli setup_indycli.txt

