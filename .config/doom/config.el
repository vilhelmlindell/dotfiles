;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "IosevkaTerm Nerd Font" :size 26 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "IosevkaTerm Nerd Font" :size 24))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'catppuccin)
(load-theme 'gruber-darker-theme)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;;(key-chord-define evil-insert-state-map "kj" 'evil-normal-state)
;;(setq evil-escape-key-sequence "kj")

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;;(after! corfu
;;  (corfu-popupinfo-mode 0)
;;  ;; Optional customizations
;;  (setq corfu-popupinfo-delay '(0 . 0)) ; Initial & subsequent delay
;;  (setq corfu-popupinfo-hide nil))           ; Don't hide popup automatically

(use-package! treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (add-to-list 'treesit-auto-recipe-list
               (make-treesit-auto-recipe
                :lang 'zig
                :ts-mode 'zig-ts-mode
                :remap 'zig-mode
                :url "https://github.com/maxxnino/tree-sitter-zig"
                :ext "\\.zig\\'"))
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

;; Ensure zig-ts-mode is properly loaded for .zig files
(add-to-list 'auto-mode-alist '("\\.zig\\'" . zig-ts-mode))

(after! rust-mode
  (setq rust-ts-mode-hook rustic-mode-hook))

;; Enable LSP for zig-ts-mode
(after! lsp-mode
  (add-to-list 'lsp-language-id-configuration '(zig-ts-mode . "zig")))

;; Add lsp hook for zig-ts-mode
(use-package! zig-ts-mode
  :hook (zig-ts-mode . lsp!)
  :config)

(after! zig-mode
  (after! zig-ts-mode
    (setq zig-ts-mode-hook zig-mode-local-vars-hook)))

;; Other settings
(setq font-lock-maximum-decoration t
      treesit-font-lock-level 4
      which-key-idle-delay 0.2
      which-key-idle-secondary-delay 0.05)

;;  :config
;;(after! prism
;;  (prism-set-colors :lightens '(0 5 10) :desaturations '(-2.5 0 2.5)
;;                   :colors (-map #'doom-color '(red orange yellow green blue violet))))
;;  (prism-set-colors :num 16
;;                    :desaturations (cl-loop for i from 0 below 16
;;                                            collect (* i 2.5))
;;                    :lightens (cl-loop for i from 0 below 16
;;                                       collect (* i 2.5))
;;                    :colors (list "dodgerblue" "medium sea green" "sandy brown")
;;
;;                    :comments-fn
;;                    (lambda (color)
;;                      (prism-blend color
;;                                   (face-attribute 'font-lock-comment-face :foreground) 0.25))
;;
;;                    :strings-fn
;;                    (lambda (color)
;;                      (prism-blend color "white" 0.5))))
