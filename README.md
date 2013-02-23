sxlock - simple X screen locker
===============================

Simple screen locker utility for X, fork of sflock, which is based on slock. Main difference is that
sxlock uses PAM authentication, so no suid is needed.


Features
--------

 - provides basic user feedback
 - uses PAM
 - sets DPMS timeout to 10 seconds, before exit restores original settings


Requirements
------------

In order to build sxlock you need the Xlib header files and PAM.


Installation
------------

Arch Linux users can install this package from the AUR(http://aur.archlinux.org/packages.php?ID=44802).

Manual installation:
Edit config.mk to match your local setup (sxlock is installed into
the /usr/local namespace by default).

Afterwards enter the following command to build and install sxlock
(if necessary as root):

    make clean install


Running sxlock
-------------

Simply invoking the sxlock command starts the display locker with default
settings.

Custom settings:

-f <font description>: modify the font.
-c <password characters>: modify the characters displayed when the user enters his password. This can be a sequence of characters to create a fake password.

