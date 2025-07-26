#!/bin/sh
#  tcpanalog:tcpdeny
AWK '
  /^d/ {
    from = $5
    connect[from] += 1
    host[from] = $6
  }
  END {
    for (from in connect) {
      sub(":.*","",host[from])
      if (host[from] == "") {host[from] = "unknown"}
      print connect[from],from,host[from]
    }
  }
'
