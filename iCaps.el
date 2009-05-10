;;; iCaps.el --- iCaps a word (an annoying diversion)
;;
;; ~harley/share/emacs/pkg/iCaps/iCaps.el ---
;;
;; $Id: iCaps.el,v 1.10 2003/03/18 17:38:41 harley Exp $
;;

;; Author:    Harley Gorrell <harley@mahalito.net>
;; URL:       http://www.mahalito.net/~harley/elisp/iCaps.el
;; License:   GPL v2

;;; Commentary:
;;  Now you too can cash in on eBuzzwords!
;;  Bind iCaps-this-word to a key and cash in on eBiz & iProducts.

;;; History:
;;  2002-07-01 : Written to humor a friend.
;;  2003-03-16 : Updated URL and contact info.

;;; Code:

(defun iCaps-iCap-word (word)
  "Convert a normaly capitalized WORD into an iWord.
This is a spoof of the Apple 'iProduct' capitalization."
  (if (not (stringp word))
      (error "Must be a string"))
  (cond
   ;; <2 is unchanged
   ((< (length word) 2) word)
   ;; no change if not inital caps.
   ;; ((not (iCaps-isuppercase (elt word 0)))
   ;;  word)
   ;; Iword => iWord
   (t (concat (downcase (substring word 0 1))
	      (upcase   (substring word 1 2))
	      (downcase (substring word 2)) ))))

(defun iCaps-isuppercase (char)
  "Check to see if CHAR is uppercase."
  ;;(if (not (characterp char)) (error "Must be a character"))
  (= char (upcase char)))

;; (mapcar 'iCaps-iCap-word '("abc" "Iword" "ALLCAPS" "I" "i" "To"))

(defun iCaps-this-word ()
  "iCaps the word at point and move forward."
  (interactive)
  (forward-word 1)
  (let ((wbounds (bounds-of-thing-at-point 'word))
	iWord)
    (when wbounds
      (setq iWord (buffer-substring-no-properties (car wbounds) (cdr wbounds)))
      (delete-region (car wbounds) (cdr wbounds))
      (insert (iCaps-iCap-word iWord)) )))

;; (global-set-key [?\M-s] 'iCaps-this-word)
;; aAaa aLdk aSdfs aSdf aFff

(provide 'iCaps)

;;; iCaps.el ends here
