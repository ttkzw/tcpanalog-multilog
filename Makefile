# tcpanalog 0.21 Makefile
#
INSTALLDIR = /usr/local/bin/tcpanalog
AWK = /usr/bin/awk

#
TARGET = tcpmatchup column tcphosts tcpdomains tcpdeny ztcphosts ztcpdomains ztcpdeny

all: ${TARGET}

tcpmatchup: tcpmatchup.sh
	cat $? | sed s{AWK{${AWK}{g > $@
	chmod 755 $@

column: column.sh
	cat $? | sed s{AWK{${AWK}{g > $@
	chmod 755 $@

tcphosts: tcphosts.sh
	cat $? | sed s{AWK{${AWK}{g > $@
	chmod 755 $@

tcpdomains: tcpdomains.sh
	cat $? | sed s{AWK{${AWK}{g > $@
	chmod 755 $@

tcpdeny: tcpdeny.sh
	cat $? | sed s{AWK{${AWK}{g > $@
	chmod 755 $@

ztcphosts: ztcphosts.sh
	cat $? | sed s{BIN{${INSTALLDIR}{g > $@
	chmod 755 $@

ztcpdomains: ztcpdomains.sh
	cat $? | sed s{BIN{${INSTALLDIR}{g > $@
	chmod 755 $@

ztcpdeny: ztcpdeny.sh
	cat $? | sed s{BIN{${INSTALLDIR}{g > $@
	chmod 755 $@

install: ${TARGET}
	install -d ${INSTALLDIR}
	install $? ${INSTALLDIR} 

clean: ${TARGET}
	rm -f core $?
