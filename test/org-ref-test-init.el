;;; org-ref-test-init.el -- This get loaded by .ert-runner.

;;; Commentary:

;;; Code:

(require 'undercover)
(undercover "*.el")

(require 'ert)

(load-file "test/org-test-setup.el")

(add-to-list 'load-path (expand-file-name "."))
(require 'org-ref-ivy)

(provide 'org-ref-test-init)

;;; org-ref-test-init.el ends here
