;; This get loaded by .ert-runner.

(require 'undercover)
(undercover "org-ref-ivy.el")

(require 'ert)

(load-file "test/org-test-setup.el")

(add-to-list 'load-path (expand-file-name "."))
(require 'org-ref-ivy)


(provide 'org-ref-test-init)
