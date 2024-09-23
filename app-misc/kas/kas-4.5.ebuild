# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1

MY_P="kas-${PV}"
DESCRIPTION="Setup tool for bitbake based projects"
HOMEPAGE="
	https://github.com/siemens/kas
	https://kas.readthedocs.io/en/latest/
	https://pypi.org/project/kas/
"
# need to use github source as pypi does not package tests
SRC_URI="
	https://github.com/siemens/kas/archive/refs/tags/${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pyyaml-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/distro-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-2.5.0[${PYTHON_USEDEP}]
	>=dev-python/kconfiglib-14.1.0[${PYTHON_USEDEP}]
	>=dev-python/GitPython-3.1.0[${PYTHON_USEDEP}]
"

PROPERTIES="test_network"

BDEPEND="
	${RDEPEND}
	test? (
			dev-vcs/mercurial
			dev-tcltk/snack[python,${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
