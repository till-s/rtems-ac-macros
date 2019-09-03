# Declare --enable-rtemsbsp --with-rtems-top options
#
# TILLAC_RTEMS_OPTIONS
AC_DEFUN([TILLAC_RTEMS_OPTIONS],
	[AC_ARG_ENABLE(rtemsbsp,
		AC_HELP_STRING([--enable-rtemsbsp="bsp1 bsp2 ..."],
			[BSPs to include in build (ignore bsps not found in RTEMS installation)]dnl
		)
	)
	AC_ARG_WITH(rtems-top,
		AC_HELP_STRING([--with-rtems-top=<rtems installation topdir>],
			[point to RTEMS installation]dnl
		)
	)
	AC_ARG_WITH(extra-incdirs,
		AC_HELP_STRING([--with-extra-incdirs=<additional header dirs>],
			[point to directories with additional headers]dnl
		)
	)
	AC_ARG_WITH(extra-libdirs,
		AC_HELP_STRING([--with-extra-libdirs=<additional library dirs (w/o -L)>],
			[point to directories with additional libraries]dnl
		)
	)
	AC_ARG_WITH(hostbindir,
		AC_HELP_STRING([--with-hostbindir=<installation dir for native binaries>],
			[default is <prefix>/host/<build_alias>/bin],
		),
		[AC_SUBST([hostbindir],[$with_hostbindir])],
		[AC_SUBST([hostbindir],['$(prefix)/host/$(build_alias)/bin'])]
	)
	AC_ARG_ENABLE([std-rtems-installdirs],
		AC_HELP_STRING([--enable-std-rtems-installdirs],
		[install directly into
		the RTEMS installation directories; by default a location *outside*
		of the standard location is used. If you don't use this option you
		can also fine-tune the installation using the usual --prefix, 
		--exec-prefix, --libdir, --includedir etc. options]dnl
		)
	)
	AC_ARG_VAR([SUPERPACKAGE_NAME],[Name of a collection of packages; used to define install subdir])
	if test -z "${SUPERPACKAGE_NAME}" ; then
		AC_MSG_NOTICE([SUPERPACKAGE_NAME was empty, overriding with PACKAGE_NAME: ${PACKAGE_NAME}])
		SUPERPACKAGE_NAME="${PACKAGE_NAME}"
	else
		AC_MSG_NOTICE([SUPERPACKAGE_NAME was set: ${SUPERPACKAGE_NAME}, leaving alone])
	fi
	export SUPERPACKAGE_NAME
	AC_ARG_VAR([SUPERPACKAGE_VERSION],[Version of a collection of packages])
	if test -z "${SUPERPACKAGE_VERSION}" ; then
		AC_MSG_NOTICE([SUPERPACKAGE_VERSION was empty, overriding with PACKAGE_VERSION: ${PACKAGE_VERSION}])
		SUPERPACKAGE_VERSION="${PACKAGE_VERSION}"
	else
		AC_MSG_NOTICE([SUPERPACKAGE_VERSION was set: ${SUPERPACKAGE_VERSION}, leaving alone])
	fi
	export SUPERPACKAGE_VERSION
	AC_ARG_WITH(package-subdir,
		AC_HELP_STRING([--with-package-subdir=<path-fragment>],
			[defines part of the default exec-prefix:
             ${prefix}/${package_subdir}/${host_cpu}-${host_os}/${rtems_bsp}
            This option is overridden by either of --enable-std-rtems-installdirs
            and --exec-prefix. Defaults to 'target/${SUPERPACKAGE_NAME}']dnl
		),
		[AC_SUBST([package_subdir],[${with_package_subdir}])],
		[AC_SUBST([package_subdir],['target/${SUPERPACKAGE_NAME}'])]
	)
]dnl
)
