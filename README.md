sxlock - simple X screen locker
===============================

Simple screen locker utility for X, fork of sflock, which is based on slock. Main difference is that
sxlock uses PAM authentication, so no suid is needed.


Features
--------

 - provides basic user feedback
 - uses PAM
 - sets DPMS timeout to 10 seconds, before exit restores original settings
 - basic RandR support (drawing centered on the primary output)


Requirements
------------

 - libX11 (Xlib headers)
 - libXext (X11 extensions library, for DPMS)
 - libXrandr (RandR support)
 - libXft
 - PAM


Installation
------------

Arch Linux users can install this package from the [AUR](https://aur.archlinux.org/packages/sxlock-git/).

For manual installation just install dependencies, checkout and make:

    git clone https://github.com/lahwaacz/sxlock.git
    cd ./sxlock
    make
    ./sxlock


Hooking into systemd events
---------------------------

When using [systemd](http://freedesktop.org/wiki/Software/systemd/), you can use the following service (create `/etc/systemd/system/sxlock.service`) to let the system lock your X session on hibernation or suspend:

```ini
[Unit]
Description=Lock X session using sxlock
Before=sleep.target

[Service]
User=<username>
Environment=DISPLAY=:0
ExecStart=/usr/bin/sxlock

[Install]
WantedBy=sleep.target
```

However, this approach is useful only for single-user systems, because there is no way to know which user is currently logged in. Use [xss-lock](https://bitbucket.org/raymonad/xss-lock) as an alternative for multi-user systems.
