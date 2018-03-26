emacs ?= emacs
CASK ?= cask
CASK_EXEC ?= ${CASK} exec
EL_SOURCES = *.el
SOURCES =   ${EL_SOURCES}

INIT = test/init.el
INIT-DEVEL = test/init-devel.el

all: test

test: clean
	${CASK_EXEC} ert-runner

unit:
	${CASK_EXEC} ${emacs} -Q -batch -L "." -l ${INIT} -l org -l org-ref.el \
	-l test/org-ref-test.el --eval "(ert t)"


orgtest:
	${CASK_EXEC} ${emacs} -Q -batch  -l ${INIT}  -l test/org-test-setup.el \
	-l test/org-ert.el -f org-ert-tangle-tests

mytest: orgtest
	${CASK_EXEC} ${emacs} -Q -batch  -l ${INIT}  -l test/org-test-setup.el \
	-l test/*-test.el -f ert-run-tests-batch-and-exit

compile:
	${CASK} build

clean:
	rm -f *.elc

github:
	open http://github.com/jkitchin/org-ref

travis:
	open https://travis-ci.org/jkitchin/org-ref

melpa:
	open https://melpa.org/#/org-ref

package : ${SOURCES}
	${CASK} package

no-user:
	${CASK_EXEC} ${emacs} -Q --eval="(setq scimax-load-user-dir nil)" -l ${INIT}

reftex:
	${CASK_EXEC} ${emacs} -Q \
	--eval="(setq scimax-load-user-dir nil)"  \
	--eval="(setq org-ref-completion-library 'reftex)" -l ${INIT} tests/test-1.org

ivy:
	${CASK_EXEC} ${emacs} -Q  \
	--eval="(setq scimax-load-user-dir nil)" \
	--eval="(setq org-ref-completion-library 'ivy-cite)" -l ${INIT} tests/test-1.org

devel:
	${CASK_EXEC} ${emacs} -Q  \
	--eval="(setq scimax-load-user-dir nil)" \
	--eval="(setq org-ref-completion-library 'ivy-cite)" -l ${INIT} -l ${INIT-DEVEL}

vanilla:
	${CASK_EXEC} ${emacs} -Q  -l ${INIT} tests/test-1.org

.PHONY:	all test package clean-elc test-melpa
