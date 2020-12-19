(defun select-current-word ()
  "Select the word under cursor.
“word” here is considered any alphanumeric sequence with “_” or “-”."
  (interactive)
  (let (pt)
    (skip-chars-backward "-_A-Za-z0-9")
    (setq pt (point))
    (skip-chars-forward "-_A-Za-z0-9")
    (set-mark pt)))

(defun rb-js-select-function-name ()
    "Select function name."
    (interactive)
    (goto-char (line-beginning-position))
    (forward-char 8)
    (skip-chars-forward " ")
    (let
        (b (point)))
    (search-forward "(")
    (backward-char 2)
    (select-current-word)
    )

(defun rb-js-add-function-to-export ()
    "Add function to module.export."

    (interactive)
    (rb-js-select-function-name)
    (let (
         (b (region-beginning))
         (e (region-end))
         (name ))
      (setq name (buffer-substring-no-properties b e))
      (deactivate-mark)
      (forward-line -1)
      (line-end-position)
      (insert "\nmodule.exports.")
      (insert name)
      (insert "=")
      (insert name)
      (insert ";"))

 )
