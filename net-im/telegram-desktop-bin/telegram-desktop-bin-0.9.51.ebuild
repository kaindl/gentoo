# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils gnome2-utils xdg

DESCRIPTION="Official desktop client for Telegram (binary package)"
HOMEPAGE="https://desktop.telegram.org"
SRC_URI="
	https://github.com/telegramdesktop/tdesktop/archive/v${PV}.tar.gz -> tdesktop-${PV}.tar.gz
	amd64? ( https://updates.tdesktop.com/tlinux/tsetup.${PV}.tar.xz )
	x86? ( https://updates.tdesktop.com/tlinux32/tsetup32.${PV}.tar.xz )
"

LICENSE="telegram"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"
IUSE=""

QA_PREBUILT="usr/bin/telegram-desktop"

RDEPEND="
	dev-libs/glib:2
	dev-libs/gobject-introspection
	>=sys-apps/dbus-1.4.20
	x11-libs/libX11
	>=x11-libs/libxcb-1.10[xkb]
"
DEPEND=""

S="${WORKDIR}/Telegram"

src_install() {
	newbin "${S}/Telegram" telegram-desktop

	for icon_size in 16 32 48 64 128 256 512; do
		newicon -s "${icon_size}" \
			"${WORKDIR}/tdesktop-${PV}/Telegram/Resources/art/icon${icon_size}.png" \
			telegram-desktop.png
	done

	domenu "${WORKDIR}/tdesktop-${PV}"/lib/xdg/telegramdesktop.desktop
}

pkg_preinst() {
	xdg_pkg_preinst
	gnome2_icon_savelist
}

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_icon_cache_update
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_icon_cache_update
}
