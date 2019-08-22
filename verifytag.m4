## Check for a program, similar to AC_CHECK_PROG, but lets
## configure fail if the program is not found
#dnl RTEMS_CHECK_PROG(VARIABLE, PROG-TO-CHECK-FOR, VALUE-IF-FOUND [, VALUE-IF-NOT-FOUND [, PATH [, REJECT]]])
AC_DEFUN([TILLAC_CHECK_GITTAG],
[
	tillac_gittag=`git describe --always --dirty`
	AS_IF([ test xx"${PACKAGE_VERSION}" = xx"${tillac_gittag}" ],,
		[AC_MSG_ERROR([PACKAGE_VERSION (${PACKAGE_VERSION}) does not match current git tag (${tillac_gittag}) -- must rerun autoreconf (-f to force)])])
])
