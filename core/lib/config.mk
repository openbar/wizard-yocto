CONFIG := ${REPODIR}/.config

MAKE_AWK := ${MAKE}
MAKE_AWK += REPODIR=${REPODIR}
MAKE_AWK += BUILDDIR=${BUILDDIR}

run-awk = $(shell ${MAKE_AWK} -npqf ${CONFIG} | awk -f ${WZDIR}/core/lib/${1})

empty :=
verticaltab := ${empty}${empty}

define newline


endef

eval-awk = $(eval $(subst ${verticaltab},${newline},$(call run-awk,${1})))

load-targets = $(call eval-awk,targets.awk)
load-variables = $(call eval-awk,variables.awk)
