#!/bin/sh
#  tcpanalog:ztcpdomains
echo "tcpserver:domains"
(echo "times total[s] max[s] ave[s] domain"
BIN/tcpdomains | sort) | BIN/column
