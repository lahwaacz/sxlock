# sxlock - simple X screen locker
# © 2013 Jakub Klinkovský
# Based on sflock
# © 2010-2011 Ben Ruijl
# Based on slock
# © 2006-2008 Anselm R. Garbe, Sander van Dijk

NAME = sxlock
VERSION = 1.0

CC := $(CC) -std=c99

base_CFLAGS = -D_GNU_SOURCE -pedantic -Wall -Wextra -Os -DPROGNAME=\"${NAME}\" -DVERSION=\"${VERSION}\"
base_LIBS = -lpam

pkgs = x11 xext xrandr
pkgs_CFLAGS = $(shell pkg-config --cflags $(pkgs))
pkgs_LIBS = $(shell pkg-config --libs $(pkgs))

CFLAGS := $(base_CFLAGS) $(pkgs_CFLAGS) $(CFLAGS)
LDLIBS := $(base_LIBS) $(pkgs_LIBS)

all: sxlock

sxlock: sxlock.c

clean:
	$(RM) sxlock

install: sxlock
	install -Dm755 sxlock $(DESTDIR)/usr/bin/sxlock
