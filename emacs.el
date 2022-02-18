(evil-mode 1)

(global-undo-tree-mode)
(evil-set-undo-system 'undo-tree)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'coq-mode-hook #'company-coq-mode)
(add-hook 'coq-mode-hook 'undo-tree-mode)
