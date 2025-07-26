#!/bin/sh
#  tcpanalog:tcphosts
AWK '
  /^k/ {
    from = $5
    connect[from] += 1
    alive = ($4 - $3)
    total[from] += alive
    if ( alive > max[from]) max[from] = alive
    host[from] = $6
  }
  END {
    for (from in connect) {
      sub(":.*","",host[from])
      if (host[from] == "") {host[from] = "unknown"}
      rate = total[from]/connect[from]
      print connect[from],sprintf("%.2f %.2f %.2f",total[from],max[from],rate),from,host[from]
    }
  }
'
