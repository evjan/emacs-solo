;;; git-utils.el --- Git-related utilities -*- lexical-binding: t; -*-

;;; Commentary:
;; Helper functions for working with git repositories.

;;; Code:

(defun copy-git-relative-path ()
  "Copy the relative path from git root to current buffer to clipboard."
  (interactive)
  (let* ((file-path (buffer-file-name))
         (git-root (vc-git-root file-path)))
    (if (and file-path git-root)
        (let ((relative-path (file-relative-name file-path git-root)))
          (kill-new relative-path)
          (message "Copied: %s" relative-path))
      (message "Not in a git repository or buffer has no file"))))

;; Keybindings
(global-set-key (kbd "C-c g") 'copy-git-relative-path)

(provide 'git-utils)
;;; git-utils.el ends here
