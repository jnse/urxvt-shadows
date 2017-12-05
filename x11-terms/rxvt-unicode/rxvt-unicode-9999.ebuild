
# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit eutils git-r3 toolchain-funcs prefix

DESCRIPTION="rxvt clone with xft and unicode support"
HOMEPAGE="https://github.com/exg/rxvt-unicode"
SRC_URI="https://github.com/exg/rxvt-unicode"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+perl pixbuf startup-notification xft unicode3"

RDEPEND="
	media-libs/fontconfig
	sys-libs/ncurses:*
	x11-libs/libX11
	x11-libs/libXrender
	kernel_Darwin? ( dev-perl/Mac-Pasteboard )
	perl? ( dev-lang/perl:= )
	pixbuf? ( x11-libs/gdk-pixbuf x11-libs/gtk+:2 )
	startup-notification? ( x11-libs/startup-notification )
	xft? ( x11-libs/libXft )
"

DEPEND="
	${RDEPEND}
	virtual/pkgconfig
	x11-proto/xproto
"

src_unpack() { 
        cd "${WORKDIR}"
		git clone "https://github.com/yusiwen/libptytty"
		git clone "https://github.com/exg/rxvt-unicode.git" ${PF}
		git clone "https://github.com/yusiwen/libev.git"
		mv libptytty ${PF}/.
		mv libev ${PF}/.
}

src_prepare() {
	default
	epatch "${FILESDIR}/urxvt-text-shadows.patch"
}

src_configure() {
	econf --enable-everything
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	default
}

