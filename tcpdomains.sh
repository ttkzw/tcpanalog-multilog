#!/bin/sh
#  tcpanalog:tcpdomains
AWK '
  /^k/ {
    from = $6
    sub(":.*","",from)
    if( from != "") sub("[^.]*\.","",from) 
    else { from = "unknown"}
    connect[from] += 1
    alive = ($4 - $3)
    total[from] += alive
    if ( alive > max[from]) { max[from] = alive}
  }
  END {
    for (from in connect) {
      rate = total[from]/connect[from]
      print connect[from],sprintf("%.2f %.2f %.2f",total[from],max[from],rate),from
    }
  }
'
