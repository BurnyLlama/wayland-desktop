# Copyright 2021 Aisha Tammy
# Copyright 2021 Ichika Zou
# Distributed under the terms of the ISC License

EAPI=8

inherit meson

DESCRIPTION="QT based greeter for greetd"
HOMEPAGE="https://gitlab.com/marcusbritanicus/QtGreet"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.com/marcusbritanicus/QtGreet"
else
	COMMIT=32b9a0f50ef29550f3a25dd0bf8ef1f76ae38139
	SRC_URI="https://gitlab.com/marcusbritanicus/QtGreet/-/archive/${COMMIT}/QtGreet-${COMMIT}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}"/QtGreet-${COMMIT}
	KEYWORDS="~amd64"
fi

LICENSE="GPL-3"
SLOT="0"

DEPEND="
	dev-libs/json-c
	dev-qt/qtcore:5
	dev-qt/qtdbus:5
	dev-qt/qtgui:5
	dev-qt/qtwayland:5
	dev-qt/qtwidgets:5
"
RDEPEND="
	${DEPEND}
	gui-libs/greetd
"
