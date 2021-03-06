;;; org-ref-nist-webbook.el --- Integration of Emacs with NIST Webbook
;; Integration of Emacs with NIST webbook

;;; Commentary:
;; nist-webbook-name :: search for a chemical name
;; nist-webbook-formula :: search by chemical formula

;;; Code:

(require 'org-ref-core)

;;;###autoload
(defun org-ref-nist-webbook-formula (formula)
  "Search NIST webbook for FORMULA."
  (interactive "sFormula: ")
  (browse-url (concat "http://webbook.nist.gov/cgi/cbook.cgi?Formula="
                      formula
                      "&NoIon=on&Units=SI")))

;;;###autoload
(defun org-ref-nist-webbook-name (name)
  "Search NIST webbook for NAME."
  (interactive "sChemical Name: ")
  (browse-url (concat "http://webbook.nist.gov/cgi/cbook.cgi?Name="
                      (url-hexify-string name)
                      "&Units=SI")))


(org-ref-link-set-parameters "nist-wb-name"
  :follow (lambda (name) (org-ref-nist-webbook-name name)))

(org-ref-link-set-parameters "nist-wb-formula"
  :follow (lambda (formula) (org-ref-nist-webbook-formula formula)))

(provide 'org-ref-nist-webbook)

;;; org-ref-nist-webbook.el ends here
