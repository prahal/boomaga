#!/bin/sh

# BEGIN_COMMON_COPYRIGHT_HEADER
# (c)LGPL2+
#
#
# Copyright: 2012-2013 Boomaga team https://github.com/Boomaga
# Authors:
#   Alexander Sokoloff <sokoloff.a@gmail.com>
#
# This program or library is free software; you can redistribute it
# and/or modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.

# You should have received a copy of the GNU Lesser General
# Public License along with this library; if not, write to the
# Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
# Boston, MA 02110-1301 USA
#
# END_COMMON_COPYRIGHT_HEADER

LUPDATE_OPTIONS="-no-obsolete"
LUPDATE_OPTIONS="${LUPDATE_OPTIONS} -locations none "
TS_FILE="../gui/translations/src.boomaga.ts"


LUPDATE=$(which lupdate-qt4 2>/dev/null)
[ -z "${LUPDATE}" ] && LUPDATE=$(which lupdate-qt5 2>/dev/null)
[ -z "${LUPDATE}" ] && LUPDATE=$(which lupdate 2>/dev/null)

if [ -z "${LUPDATE}" ]; then
    echo "The lupdate program not found."
    exit 1;
fi

${LUPDATE} ${LUPDATE_OPTIONS} .. -ts ${TS_FILE}

#lupdate ${OPTIONS} ../*.h ../*.cpp ../*.ui ../*/*.h ../*/*.cpp ../*/*.ui -ts src.boomaga.ts