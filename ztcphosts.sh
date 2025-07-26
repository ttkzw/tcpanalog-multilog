#!/bin/sh
#  tcpanalog:ztcphosts
echo "tcpserver:hosts"
(echo "times total[s] max[s] ave[s] ip-address host"
BIN/tcphosts | sort) | BIN/column
