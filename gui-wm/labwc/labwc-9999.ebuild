# Copyright 2021 Aisha Tammy
# Distributed under the terms of the ISC License

EAPI=8

inherit meson

DESCRIPTION="Openbox alternative for wayland"
HOMEPAGE="https://github.com/johanmalm/labwc"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/johanmalm/labwc"
else
	SRC_URI="https://github.com/johanmalm/labwc/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE="+X"

RDEPEND="
	dev-libs/glib:2
	dev-libs/libinput
	dev-libs/libxml2:2
	>=gui-libs/wlroots-0.16.0:=[X?]
	x11-libs/cairo[X?]
	x11-libs/libxkbcommon:=[X?]
	x11-libs/pango[X?]
	x11-libs/pixman
	X? ( x11-libs/libxcb:0= )
"
DEPEND="${RDEPEND}"
BDEPEND="
	app-text/scdoc
	dev-libs/wayland-protocols
	virtual/pkgconfig
"

src_configure() {
	local emesonargs=(
		$(meson_feature X xwayland)
		-Dman-pages=enabled
	)
	meson_src_configure
}
