#/bin/sh
#  tcpanalog:column
AWK '
  { 
    ++lines
    save[lines] = $0
    if (NF > maxnf) maxnf = NF
    for (i = 1;i <= NF;i++) { 
      w = length($i)
      if (width[i] < w) width[i] = w
    }
  }
  END {
    for (j = 1;j <= lines;j++) {
      split(save[j],fields)
      for (i = 1;i < maxnf;i++) {
        if (match(fields[i],"^[0-9]+\.?[0-9]*$") > 0 ){
          printf("%*s", width[i], fields[i])
        } else {
          printf("%-*s", width[i], fields[i])
        }
        if (i < maxnf){ printf "  "} else { printf "\n"}
      }
      if (match(fields[maxnf],"^[0-9]+\.?[0-9]*$") > 0 ){
        printf("%*s\n", width[i], fields[i])
      } else {
        printf("%-s\n", fields[i])
      }
    }
  }
'
