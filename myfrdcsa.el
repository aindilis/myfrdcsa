(global-set-key "\C-crerh" 'myfrdcsa-edit-bashrc)
(global-set-key "\C-cmylp" 'myfrdcsa-load-project-prolog-files)

(defun myfrdcsa-edit-bashrc ()
 "Edit the file containing the bashrc"
 (interactive)
 (ffap "/var/lib/myfrdcsa/codebases/internal/myfrdcsa/frdcsa.bashrc"))

(defun myfrdcsa-load-project-prolog-files ()
 ""
 (interactive)
 (setq major-myfrdcsa1p0-directories (cdadar (formalog-query (list 'var-X) (list "majorMyFRDCSA1p0Directories" 'var-X))))
 (setq major-myfrdcsa1p1-directories (cdadar (formalog-query (list 'var-X) (list "majorMyFRDCSA1p1Directories" 'var-X))))
 (see (append major-myfrdcsa1p0-directories major-myfrdcsa1p1-directories)))
