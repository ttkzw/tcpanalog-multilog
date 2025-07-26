#!/bin/sh
#  tcpanalog:ztcpdeny
echo "tcpserver:refused connection"
(echo "times ip-address hostname"
BIN/tcpdeny | sort) | BIN/column

