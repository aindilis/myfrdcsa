;; system to manage thoughts relevant to VGER

(defun myfrdcsa-jumpto-thoughts ()
 (interactive)
 (myfrdcsa-jumpto "Thoughts"))

(defun myfrdcsa-jumpto-changelog ()
 (interactive)
 (progn (myfrdcsa-jumpto "ChangeLog")
  (change-log-mode)
  (add-change-log-entry)))

(defun radar-date-string ()
  "Return RFC-822 format date string."
  (let* ((dp "822-date")
	 (cp (point))
	 (ret (call-process "822-date" nil t))
	 (np (point))
	 (out nil))
    (cond ((not (or (eq ret nil) (eq ret 0)))
	   (setq out (buffer-substring-no-properties cp np))
	   (delete-region cp np)
	   (error (concat "error from " dp ": " out)))
	  (t
	   (backward-char)
	   (or (looking-at "\n")
	       (error (concat "error from " dp ": expected newline after date string")))
	   (setq out (buffer-substring-no-properties cp (- np 1)))
	   (delete-region cp np)
	   out))))

(defun myfrdcsa-jumpto-news ()
 (interactive)
 (progn
  (myfrdcsa-jumpto "News")
  (beginning-of-buffer)
  (insert "\n")
  (beginning-of-buffer)
  (insert
   (concat
    (radar-date-string)
    "\n\n"))
  (open-line 1)))


(defun myfrdcsa-jumpto-myfrdcsa-dev-el ()
 (interactive)
 (myfrdcsa-jumpto "emacs/myfrdcsa-dev.el"))

(global-set-key "\C-x\C-gt" 'myfrdcsa-jumpto-thoughts)
(global-set-key "\C-x\C-gc" 'myfrdcsa-jumpto-changelog)
(global-set-key "\C-x\C-gn" 'myfrdcsa-jumpto-news)
(global-set-key "\C-x\C-gm" 'myfrdcsa-jumpto-myfrdcsa-dev-el)

(defun myfrdcsa-jumpto (myfile)
 (interactive)
 "Jump to a buffer possessing FILE."
 (find-file (concat "/home/debs/prog/myfrdcsa/" myfile)))

(defun myfrdcsa-add-thoughts-entry ()
 "Add entry to thoughts."
 (interactive)
 (find-file "/home/debs/prog/myfrdcsa/Thoughts"))

;; load all the other emacs packages
(load "/home/debs/prog/radar/radar.el")
