# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="small ruby class for handling filesizes with both the SI and binary prefixes"
HOMEPAGE="https://github.com/dominikh/filesize"

LICENSE="MIT"
SLOT="${PV}"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""
