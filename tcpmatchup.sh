#!/bin/sh
#  tcpanalog:tcpmatchup
#
#  pid: pid number
#  dreq[m]: date when connection is requested
#  from[m]: "from" host
#  dstart[m]: starting date of connection
#  dend[m]: ending date of connection
#  result[m]: result
#             ok:"k"
#             deny:"d"
#  source[m]: source host
#  dest[m]: destination host
#  status[m]: status

AWK '
  {
    if ($3 == "pid"){
      pid = $4
      dreq[pid] = $1
      from[pid] = $6

      dstart[pid] = $1
      dend[pid] = $1
      result[pid] = "?"
      source[pid] = "?"
      dest[pid] = "?"
      status[pid] = "?"
    }
    if ($3 == "ok"){
      pid = $4
      result[pid] = "k"
      dstart[pid] = $1
      source[pid] = $6
      dest[pid] = $5
    }
    if ($3 == "deny"){
      pid = $4
      result[pid] = "d"
      dstart[pid] = $1
      source[pid] = $6
      dest[pid] = $5
    }
    if ($3 == "end"){
      pid = $4
      dend[pid] = $1
      status[pid] = $6

      if (pid in dreq){
        print result[pid],dreq[pid],dstart[pid],dend[pid],from[pid],source[pid],dest[pid],status[pid]
        delete result[pid]
        delete dreq[pid]
        delete dstart[pid]
        delete dend[pid]
        delete from[pid]
        delete source[pid]
        delete dest[pid]
        delete status[pid]
      }
    }
  }
'
