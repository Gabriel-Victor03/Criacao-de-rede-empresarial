#!/bin/bash
sudo apt-get update
sudo apt-get install nfs-kernel-server

# diretório_a_ser_exportado    ip_do_cliente (rw,sync)

sudo service nfs-kernel-server restart
