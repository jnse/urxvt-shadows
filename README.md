rxvt-unicode ebuild with font shadows
=====================================

* This is a gentoo ebuild, which builds the following git mirror of urxvt: https://github.com/yusiwen/rxvt-unicode
* The font-shadows patch is based off this : https://github.com/auntieNeo/nixrc/blob/master/patches/urxvt-text-shadows.patch

I slightly modified the above patch to implement support for more character classes.

Known bugs:
----------

* Font shadows won't work for bitmap fonts.
* This is a very quck and dirty minimal ebuild to suit my own needs,... should probably use a git eclass and proper use flag checking and does not include the rest of the normal gentoo patches.

Installation:
-------------

In your /etc/portage/make.conf (or /etc/make.conf) put the line below:

```bash
PORTDIR_OVERLAY="/usr/local/portage"
```

* Copy the x11-terms/rxvt-unicode folder into /usr/local/portage/x11-terms/rxvt-unicode
* Unmask rxvt-unicode-9999

```bash
cd /usr/local/portage/x11-terms/rxvt-unicode
ebuild rxvt-unicode-9999.ebuild digest
emerge =x11-terms/rxvt-unicode-9999
```

Configuration:
--------------

Example ~/.Xdefaults or ~/.Xresources : 

```conf
URxvt.textShadow : true
URxvt.shadowColor: #555555
```

