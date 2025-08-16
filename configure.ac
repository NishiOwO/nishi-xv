AC_INIT([xv], [0.0.0])
AM_INIT_AUTOMAKE([subdir-objects foreign])

AM_PROG_AR
AC_PROG_RANLIB
AC_PROG_CC

CFLAGS="$CFLAGS -Wno-deprecated-non-prototype -Wno-parentheses -Wno-format -Wno-format-security -Wno-Wknr-promoted-parameter -Wno-pointer-to-int-cast -Wno-stringop-overflow -Wno-int-to-pointer-cast -Wno-discarded-qualifiers -std=gnu89"

PKG_PROG_PKG_CONFIG

PKG_CHECK_MODULES([X11], [x11])

AC_CHECK_LIB(m,floor,MATH_LIBS="-lm",:)
AC_SUBST(MATH_LIBS)

AC_CONFIG_FILES([
	Makefile
	src/zlib/Makefile
	src/png/Makefile
	src/jpeg/Makefile
	src/tiff/Makefile
	src/xv/Makefile
])
AC_OUTPUT
