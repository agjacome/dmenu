# dmenu - dynamic menu
# See LICENSE file for copyright and license details.

include config.mk

SRC = src/drw.c src/dmenu.c src/stest.c src/util.c
OBJ = ${SRC:.c=.o}

all: options dmenu

options:
	@echo dmenu build options:
	@echo "CFLAGS   = ${CFLAGS}"
	@echo "LDFLAGS  = ${LDFLAGS}"
	@echo "CC       = ${CC}"

.c.o:
	${CC} -c ${CFLAGS} $< -o ${<:.c=.o}

${OBJ}: src/arg.h src/config.h src/drw.h config.mk

dmenu: ${OBJ}
	mkdir -p bin
	${CC} -o bin/dmenu src/dmenu.o src/drw.o src/util.o ${LDFLAGS}
	${CC} -o bin/stest src/stest.o ${LDFLAGS}

clean:
	rm -f bin/* ${OBJ}

install: all
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp -f bin/* ${DESTDIR}${PREFIX}/bin
	cp -f src/dmenu_path src/dmenu_run src/dmenu_mpc src/dmenu_pass ${DESTDIR}${PREFIX}/bin
	chmod 755 ${DESTDIR}${PREFIX}/bin/dmenu
	chmod 755 ${DESTDIR}${PREFIX}/bin/stest
	chmod 755 ${DESTDIR}${PREFIX}/bin/dmenu_path
	chmod 755 ${DESTDIR}${PREFIX}/bin/dmenu_run
	chmod 755 ${DESTDIR}${PREFIX}/bin/dmenu_mpc
	chmod 755 ${DESTDIR}${PREFIX}/bin/dmenu_pass
	mkdir -p ${DESTDIR}${MANPREFIX}/man1
	sed "s/VERSION/${VERSION}/g" < doc/dmenu.1 > ${DESTDIR}${MANPREFIX}/man1/dmenu.1
	sed "s/VERSION/${VERSION}/g" < doc/stest.1 > ${DESTDIR}${MANPREFIX}/man1/stest.1
	chmod 644 ${DESTDIR}${MANPREFIX}/man1/dmenu.1
	chmod 644 ${DESTDIR}${MANPREFIX}/man1/stest.1

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/dmenu
	rm -f ${DESTDIR}${PREFIX}/bin/stest
	rm -f ${DESTDIR}${PREFIX}/bin/dmenu_path
	rm -f ${DESTDIR}${PREFIX}/bin/dmenu_run
	rm -f ${DESTDIR}${PREFIX}/bin/dmenu_mpc
	rm -f ${DESTDIR}${PREFIX}/bin/dmenu_pass
	rm -f ${DESTDIR}${MANPREFIX}/man1/dmenu.1
	rm -f ${DESTDIR}${MANPREFIX}/man1/stest.1

.PHONY: all options clean install uninstall
