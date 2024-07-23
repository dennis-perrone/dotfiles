;;; init.el --- My personal emacs config  -*- lexical-binding: t; -*-

;; Author: Dennis Perrone <https://github.com/dennis-perrone>
;; Package-Requires: ((emacs "29"))

;; Elpaca ========================================== ;;

(defvar elpaca-installer-version 0.7)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil :depth 1
                              :files (:defaults "elpaca-test.el" (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (< emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                 ((zerop (apply #'call-process `("git" nil ,buffer t "clone"
                                                 ,@(when-let ((depth (plist-get order :depth)))
                                                     (list (format "--depth=%d" depth) "--no-single-branch"))
                                                 ,(plist-get order :repo) ,repo))))
                 ((zerop (call-process "git" nil buffer t "checkout"
                                       (or (plist-get order :ref) "--"))))
                 (emacs (concat invocation-directory invocation-name))
                 ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                       "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                 ((require 'elpaca))
                 ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (load "./elpaca-autoloads")))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))

(elpaca use-package :ensure t)
;; Install use-package support
(elpaca elpaca-use-package
  ;; Enable :ensure use-package keyword.
  (elpaca-use-package-mode)
  ;; Assume :ensure t unless otherwise specified.
  (setq elpaca-use-package-by-default t))

(elpaca-wait)

;; All the Icons ===================================== ;;

(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(use-package all-the-icons-dired
  :hook (dired-mode . (lambda () (all-the-icons-dired-mode t))))

;; Backup ===================================== ;;
(setq
  backup-directory-alist
  '((".*" . "~/.local/share/Trash/files")))


;; Flycheck ====================================;;
(use-package flycheck
  :ensure t
  :defer t
  :diminish
  :init (global-flycheck-mode))

;; FlySpell =================================== ;;

(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
  (add-hook hook (lambda () (flyspell-mode -1))))


;; Evil Mode ================================== ;;
(use-package evil
    :init      ;; tweak evil's configuration before loading it
    (setq evil-want-integration t  ;; This is optional since it's already set to t by default.
          evil-want-keybinding nil
          evil-vsplit-window-right t
          evil-split-window-below t
          evil-undo-system 'undo-redo)  ;; Adds vim-like C-r redo functionality
    (evil-mode))

(use-package evil-collection
  :after evil
  :config
  (add-to-list 'evil-collection-mode-list 'help) ;; evilify help mode
  (evil-collection-init))

;; Using RETURN to follow links in Org/Evil
;; Unmap keys in 'evil-maps if not done, (setq org-return-follows-link t) will not work
(with-eval-after-load 'evil-maps
  (define-key evil-motion-state-map (kbd "SPC") nil)
  (define-key evil-motion-state-map (kbd "RET") nil)
  (define-key evil-motion-state-map (kbd "TAB") nil))
;; Setting RETURN key in org-mode to follow links
(setq org-return-follows-link  t)

;; General Keybindings =============================== ;;

(use-package general
  :config
  (general-evil-setup)

  ;; set up 'SPC' as the global leader key
  (general-create-definer dp/leader-keys
    :states '(normal insert visual emacs)
    :keymaps 'override
    :prefix "SPC" ;; set leader
    :global-prefix "M-SPC") ;; access leader in insert mode

  (dp/leader-keys
    "SPC" '(counsel-M-x :wk "Counsel M-x")
    "." '(find-file :wk "Find file")
    "=" '(perspective-map :wk "Perspective") ;; Lists all the perspective keybindings
    "TAB TAB" '(comment-line :wk "Comment lines")
    "u" '(universal-argument :wk "Universal argument"))

  (dp/leader-keys
    "b" '(:ignore t :wk "Bookmarks/Buffers")
    "b b" '(switch-to-buffer :wk "Switch to buffer")
    "b c" '(clone-indirect-buffer :wk "Create indirect buffer copy in a split")
    "b d" '(bookmark-delete :wk "Delete bookmark")
    "b i" '(ibuffer :wk "Ibuffer")
    "b k" '(kill-current-buffer :wk "Kill current buffer")
    "b K" '(kill-some-buffers :wk "Kill multiple buffers")
    "b l" '(list-bookmarks :wk "List bookmarks")
    "b m" '(bookmark-set :wk "Set bookmark")
    "b n" '(next-buffer :wk "Next buffer")
    "b p" '(previous-buffer :wk "Previous buffer")
    "b r" '(revert-buffer :wk "Reload buffer")
    "b R" '(rename-buffer :wk "Rename buffer")
    "b s" '(basic-save-buffer :wk "Save buffer")
    "b S" '(save-some-buffers :wk "Save multiple buffers")
    "b w" '(bookmark-save :wk "Save current bookmarks to bookmark file")
    "b z" '(buffer-menu :wk "Buffer menu"))

  (dp/leader-keys
    "d" '(:ignore t :wk "Dired")
    "d d" '(dired :wk "Open dired")
    "d j" '(dired-jump :wk "Dired jump to current")
    "d p" '(peep-dired :wk "Peep-dired"))

  (dp/leader-keys
    "e" '(:ignore t :wk "Eshell/Evaluate")
    "e b" '(eval-buffer :wk "Evaluate elisp in buffer")
    "e d" '(eval-defun :wk "Evaluate defun containing or after point")
    "e e" '(eval-expression :wk "Evaluate and elisp expression")
    "e h" '(counsel-esh-history :which-key "Eshell history")
    "e l" '(eval-last-sexp :wk "Evaluate elisp expression before point")
    "e r" '(eval-region :wk "Evaluate elisp in region"))

  (dp/leader-keys
    "f" '(:ignore t :wk "Files")
    ;;"f c" '((lambda () (interactive)
    ;;          (find-file "~/.config/emacs/config.org"))
    ;;        :wk "Open emacs config.org")
    "f e" '((lambda () (interactive)
              (dired "~/.config/emacs/"))
            :wk "Open user-emacs-directory in dired")
    "f d" '(find-grep-dired :wk "Search for string in files in DIR")
    "f f" '(find-file :wk "Open file")
    "f g" '(counsel-grep-or-swiper :wk "Search for string current file")
    "f i" '((lambda () (interactive)
              (find-file "~/.config/emacs/init.el"))
            :wk "Open emacs init.el")
    "f j" '(counsel-file-jump :wk "Jump to a file below current directory")
    "f l" '(counsel-locate :wk "Locate a file")
    "f o" '((lambda () (interactive)
              (dired "~/documents/org/"))
            :wk "Open Org mode directory in dired")
    "f r" '(counsel-recentf :wk "Find recent files")
    "f u" '(sudo-edit-find-file :wk "Sudo find file")
    "f U" '(sudo-edit :wk "Sudo edit file"))

 (dp/leader-keys
    "h" '(:ignore t :wk "Help")
    "h a" '(counsel-apropos :wk "Apropos")
    "h b" '(describe-bindings :wk "Describe bindings")
    "h c" '(describe-char :wk "Describe character under cursor")
    "h d" '(:ignore t :wk "Emacs documentation")
    "h d a" '(about-emacs :wk "About Emacs")
    "h d d" '(view-emacs-debugging :wk "View Emacs debugging")
    "h d f" '(view-emacs-FAQ :wk "View Emacs FAQ")
    "h d m" '(info-emacs-manual :wk "The Emacs manual")
    "h d n" '(view-emacs-news :wk "View Emacs news")
    "h d p" '(view-emacs-problems :wk "View Emacs problems")
    "h d t" '(view-emacs-todo :wk "View Emacs todo")
    "h f" '(describe-function :wk "Describe function")
    "h F" '(describe-face :wk "Describe face")
    "h i" '(info :wk "Info")
    "h I" '(describe-input-method :wk "Describe input method")
    "h k" '(describe-key :wk "Describe key")
    "h l" '(view-lossage :wk "Display recent keystrokes and the commands run")
    "h L" '(describe-language-environment :wk "Describe language environment")
    "h m" '(describe-mode :wk "Describe mode")
    "h r" '(:ignore t :wk "Reload")
    "h r r" '((lambda () (interactive)
                (load-file "~/.config/emacs/init.el")
                (ignore (elpaca-process-queues)))
              :wk "Reload emacs config")
    "h t" '(load-theme :wk "Load theme")
    "h v" '(describe-variable :wk "Describe variable")
    "h w" '(where-is :wk "Prints keybinding for command if set")
    "h x" '(describe-command :wk "Display full documentation for command"))

 (dp/leader-keys
    "m" '(:ignore t :wk "Org")
    "m a" '(org-agenda :wk "Org agenda")
    "m c" '(org-capture :wk "Org capture")
    "m e" '(org-export-dispatch :wk "Org export dispatch")
    "m i" '(org-toggle-item :wk "Org toggle item")
    "m r" '(org-reload :wk "Reload org more")
    "m t" '(org-todo :wk "Org todo")
    "m B" '(org-babel-tangle :wk "Org babel tangle")
    "m T" '(org-todo-list :wk "Org todo list")
    "m m" '((lambda () (interactive)
              (find-file "~/org/meetings.org"))
            :wk "Open meeting notes"))

  (dp/leader-keys
    "m d" '(:ignore t :wk "Date/deadline")
    "m d t" '(org-time-stamp :wk "Org time stamp"))

  (dp/leader-keys
    "o" '(:ignore t :wk "Open")
    "o e" '(elfeed :wk "Elfeed RSS")
    "o f" '(make-frame :wk "Open buffer in new frame")
    "o F" '(select-frame-by-name :wk "Select frame by name"))

  (dp/leader-keys
    "s" '(:ignore t :wk "Search")
    "s d" '(dictionary-search :wk "Search dictionary")
    "s m" '(man :wk "Man pages")
    "s t" '(tldr :wk "Lookup TLDR docs for a command"))

  (dp/leader-keys
    "t" '(:ignore t :wk "Toggle")
    "t e" '(eshell-toggle :wk "Toggle eshell")
    "t l" '(display-line-numbers-mode :wk "Toggle line numbers")
    "t n" '(neotree-toggle :wk "Toggle neotree file viewer")
    "t o" '(org-mode :wk "Toggle org mode")
    "t r" '(rainbow-mode :wk "Toggle rainbow mode")
    "t t" '(visual-line-mode :wk "Toggle truncated lines"))

  (dp/leader-keys
    "w" '(:ignore t :wk "Windows")
    ;; Window splits
    "w c" '(evil-window-delete :wk "Close window")
    "w n" '(evil-window-new :wk "New window")
    "w s" '(evil-window-split :wk "Horizontal split window")
    "w v" '(evil-window-vsplit :wk "Vertical split window")
    ;; Window motions
    "w h" '(evil-window-left :wk "Window left")
    "w j" '(evil-window-down :wk "Window down")
    "w k" '(evil-window-up :wk "Window up")
    "w l" '(evil-window-right :wk "Window right")
    "w w" '(evil-window-next :wk "Goto next window")
    ;; Move Windows
    "w H" '(buf-move-left :wk "Buffer move left")
    "w J" '(buf-move-down :wk "Buffer move down")
    "w K" '(buf-move-up :wk "Buffer move up")
    "w L" '(buf-move-right :wk "Buffer move right"))
)

;; Zooming in and out
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)

;; Diminish
(use-package diminish)


;; Hooks ============================================= ;;

(add-hook 'before-save-hook #'delete-trailing-whitespace)

;; Ivy (Counsel) ===================================== ;;

(use-package counsel
  :after ivy
  :diminish
  :config
    (counsel-mode)
    (setq ivy-initial-inputs-alist nil)) ;; removes starting ^ regex in M-x

(use-package ivy
  :bind
  ;; ivy-resume resumes the last Ivy-based completion.
  (("C-c C-r" . ivy-resume)
   ("C-x B" . ivy-switch-buffer-other-window))
  :diminish
  :custom
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (setq enable-recursive-minibuffers t)
  :config
  (ivy-mode))

(use-package all-the-icons-ivy-rich
  :ensure t
  :init (all-the-icons-ivy-rich-mode 1))

(use-package ivy-rich
  :after ivy
  :ensure t
  :init (ivy-rich-mode 1) ;; this gets us descriptions in M-x.
  :custom
  (ivy-virtual-abbreviate 'full
   ivy-rich-switch-buffer-align-virtual-buffer t
   ivy-rich-path-style 'abbrev)
  :config
  (ivy-set-display-transformer 'ivy-switch-buffer
                               'ivy-rich-switch-buffer-transformer))

;; Which Key ========================================= ;;

(use-package which-key
  :init
    (which-key-mode 1)
  :diminish
  :config
  (setq which-key-side-window-location 'bottom
	  which-key-sort-order #'which-key-key-order-alpha
	  which-key-allow-imprecise-window-fit nil
	  which-key-sort-uppercase-first nil
	  which-key-add-column-padding 1
	  which-key-max-display-columns nil
	  which-key-min-display-lines 6
	  which-key-side-window-slot -10
	  which-key-side-window-max-height 0.25
	  which-key-idle-delay 0.8
	  which-key-max-description-length 25
	  which-key-allow-imprecise-window-fit nil
	  which-key-separator " → " ))

;; Highlight Todo ====================================== ;;

(use-package hl-todo
  :hook ((org-mode . hl-todo-mode)
         (prog-mode . hl-todo-mode))
  :config
  (setq hl-todo-highlight-punctuation ":"
        hl-todo-keyword-faces
        `(("TODO"       warning bold)
          ("FIXME"      error bold)
          ("HACK"       font-lock-constant-face bold)
          ("REVIEW"     font-lock-keyword-face bold)
          ("NOTE"       success bold)
          ("DEPRECATED" font-lock-doc-face bold))))

;; Rainbow Mode ======================================== ;;

(use-package rainbow-mode
  :diminish
  :hook ((prog-mode) . rainbow-mode))

;; Set default window size  ========== ;;
(defun set-frame-size-according-to-resolution ()
  (interactive)
  (if window-system
  (progn
    (if (> (x-display-pixel-width) 1280)
           (add-to-list 'default-frame-alist (cons 'width 150))
           (add-to-list 'default-frame-alist (cons 'width 80)))
    (add-to-list 'default-frame-alist
         (cons 'height (/ (- (x-display-pixel-height) 175)
                             (frame-char-height)))))))

(set-frame-size-according-to-resolution)

;; Set sane defaults =========== ;;
(delete-selection-mode 1)    ;; You can select text and delete it by typing.
(electric-indent-mode -1)    ;; Turn off the weird indenting that Emacs does by default.
(electric-pair-mode 1)       ;; Turns on automatic parens pairing

;;;; The following prevents <> from auto-pairing when electric-pair-mode is on.
(add-hook 'org-mode-hook (lambda ()
           (setq-local electric-pair-inhibit-predicate
                   `(lambda (c)
                  (if (char-equal c ?<) t (,electric-pair-inhibit-predicate c))))))
(global-auto-revert-mode t)               ;; Automatically show changes if the file has changed
(global-display-line-numbers-mode 1)      ;; Display line numbers
(global-visual-line-mode t)               ;; Enable truncated lines
(setq inhibit-startup-message t)          ;; Disable the startup message)
(menu-bar-mode -1)                        ;; Disable the menu bar
(scroll-bar-mode -1)                      ;; Disable the scroll bar
(tool-bar-mode -1)                        ;; Disable the tool bar
(setq org-edit-src-content-indentation 0) ;; Set src block automatic indent to 0 instead of 2.


;; Rainbow Delimiters  ========== ;;
(use-package rainbow-delimiters
  :hook ((emacs-lisp-mode . rainbow-delimiters-mode)
         (clojure-mode . rainbow-delimiters-mode)))

;; Sudo Edit ================= ;;
(use-package sudo-edit)

;; Minibuffer Escape
(global-set-key [escape] 'keyboard-escape-quit)


;; Org Mode ================= ;;
;; To make viewing your exported markdown code easier
(use-package markdown-mode)

;; Makes your modeline prettier
(use-package mode-icons
  :config
  (mode-icons-mode)
  )

(add-hook 'org-mode-hook 'org-indent-mode)
(use-package org-bullets
:custom
(org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●"))
)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))


(if (not (file-directory-p (substitute-in-file-name "$HOME/documents/org")))
    (let ((org-dir (substitute-in-file-name "$HOME/documents/org")))
      (make-directory org-dir))
  )

(setq org-agenda-files '("~/documents/org"))

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; Better indents
(use-package org-indent
  :ensure nil
  :diminish
  :hook (org-mode . org-indent-mode)
  :custom
  (org-indent-indentation-per-level 4))

(use-package org-autolist
  :hook (org-mode . org-autolist-mode)
  )

(setq org-log-done 'time)

(setq light-mode nil)

(if light-mode
  (setq
   ;; TODO States
   todo-color "DarkOrange"
   in-progress-color "DeepSkyBlue3"
   blocked-color "Firebrick1"
   done-color "Green3"
   wont-do-color "Green3"

   ;; Tags
   critical-color "red1"
   easy-color "turquoise4"
   medium-color "turquoise4"
   hard-color "turquoise4"
   work-color "royalblue1"
   home-color "mediumPurple2"
   )
  (setq
   ;; TODO States
   todo-color "GoldenRod"
   in-progress-color "Cyan"
   blocked-color "Red"
   done-color "LimeGreen"
   wont-do-color "LimeGreen"

   ;; Tags
   critical-color "red1"
   easy-color "cyan3"
   medium-color "cyan3"
   hard-color "cyan3"
   work-color "royalblue1"
   home-color "mediumPurple1"
   )
  )

(use-package org
  :custom
  (org-confirm-babel-evaluate nil)              ;; Don't prompt before running code in org
  (org-src-fontify-natively t)                  ;; Use syntax highlighting in source blocks while editing
  (org-src-tab-acts-natively t)                 ;; Tabs act as 4 spaces in source blocks
  (org-src-preserve-indentation t)              ;; Preserving indentation in source blocks
  )
(setq org-return-follows-link  t)

;; Hide the markers so you just see bold text as BOLD-TEXT and not *BOLD-TEXT*
(setq org-hide-emphasis-markers t)

(setq org-todo-keywords
      '((sequence "TODO(t)" "IN-PROGRESS(i@/!)" "BLOCKED(b@/!)" "|" "DONE(d@/!)" "WONT-DO(w@/!)" ))
)

(setq org-capture-templates
      '(
        ("t" "TODO Item"
         entry (file "~/documents/org/todos.org")
         "* TODO [#B] %? %^g\n"
         :empty-lines 0)

        ("l" "Log Entry (Work)"
         entry (file+olp+datetree "~/documents/org/work-log.org")
         "* [%<%H:%M>] %? "
         :empty-lines 0)

        ("m" "Meeting"
         entry (file+olp+datetree "~/documents/org/meetings.org")
         ;;"* %? :meeting:%^g \n** Agenda\n- \n** Attendees\n- \n** Notes\n** Action Items\n*** TODO [#A] "
         "* %? %^{Meeting Topic} :meeting:%^g \n** Agenda\n- \n** Attendees\n- \n** Notes\n- \n** Action Items\n*** TODO [#A] "
         :tree-type week
         :clock-in t
         :clock-resume t
         :empty-lines 0)

        ("n" "General Note"
         entry (file+headline "~/documents/org/notes.org" "Random Notes")
         "** %?"
         :empty-lines 0)

        ))

(setq org-tag-alist
      '(
        (:startgroup . nil)
        ("easy" . ?e)
        ("medium" . ?m)
        ("difficult" . ?d)
        (:endgroup . nil)

        (:startgroup . nil)
        ("@work" . ?w)
        ("@home" . ?h)
        ("@anywhere" . ?a)
        (:endgroup . nil)

        ("CRITICAL" . ?c)
        ))

(defun air-org-skip-subtree-if-priority (priority)
  "Skip an agenda subtree if it has a priority of PRIORITY.

PRIORITY may be one of the characters ?A, ?B, or ?C."
  (let ((subtree-end (save-excursion (org-end-of-subtree t)))
        (pri-value (* 1000 (- org-lowest-priority priority)))
        (pri-current (org-get-priority (thing-at-point 'line t))))
    (if (= pri-value pri-current)
        subtree-end
      nil)))

;; This is a function used by the daily agenda function
(defun air-org-skip-subtree-if-habit ()
  "Skip an agenda entry if it has a STYLE property equal to \"habit\"."
  (let ((subtree-end (save-excursion (org-end-of-subtree t))))
    (if (string= (org-entry-get nil "STYLE") "habit")
        subtree-end
      nil)))

(setq org-agenda-skip-deadline-if-done t)

;; Additional Agenda configurations can be defined here, right now there is only this one
(setq org-agenda-custom-commands
      '(
        ;; Daily Agenda - most used
        ("d" "Daily agenda and all TODOs"
         ((tags "PRIORITY=\"A\""
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "High-priority unfinished tasks:")))
          (agenda "" ((org-agenda-span 7)))
          (alltodo ""
                   ((org-agenda-skip-function '(or (air-org-skip-subtree-if-priority ?A)
                                                   (air-org-skip-subtree-if-priority ?C)
                                                   (org-agenda-skip-if nil '(scheduled deadline))))
                    (org-agenda-overriding-header "ALL normal priority tasks:")))
          (tags "PRIORITY=\"C\""
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "Low-priority Unfinished tasks:")))
          )
         ((org-agenda-compact-blocks nil)))
        ))

(setq org-todo-keyword-faces
      `(
        ("TODO"        . (:weight bold :foreground ,todo-color        ))
        ("IN-PROGRESS" . (:weight bold :foreground ,in-progress-color ))
        ("BLOCKED"     . (:weight bold :foreground ,blocked-color     ))
        ("DONE"        . (:weight bold :foreground ,done-color        ))
        ("WONT-DO"     . (:weight bold :foreground ,wont-do-color     ))
        )
      )

(setq org-tag-faces
      `(
        ("CRITICAL" . (:weight bold :foreground ,critical-color ))
        ("easy"     . (:weight bold :foreground ,easy-color     ))
        ("medium"   . (:weight bold :foreground ,medium-color   ))
        ("hard"     . (:weight bold :foreground ,hard-color     ))
        ("@work"    . (:weight bold :foreground ,work-color     ))
        ("@home"    . (:weight bold :foreground ,home-color     ))
        )
      )

(setq org-hide-emphasis-markers nil)
(add-hook 'org-mode-hook 'visual-line-mode)

(let* ((variable-tuple
        (cond ((x-list-fonts "ETBembo")         '(:font "ETBembo"))
              ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
              ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
              ((x-list-fonts "Verdana")         '(:font "Verdana"))
              ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
              (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
       (base-font-color     (face-foreground 'default nil 'default))
       ;;(headline           `(:inherit default :weight bold :foreground ,base-font-color)))
       (headline           `(:inherit default)))

  (custom-theme-set-faces
   'user
   `(org-level-8 ((t (,@headline ,@variable-tuple))))
   `(org-level-7 ((t (,@headline ,@variable-tuple))))
   `(org-level-6 ((t (,@headline ,@variable-tuple))))
   `(org-level-5 ((t (,@headline ,@variable-tuple))))
   `(org-level-4 ((t (,@headline ,@variable-tuple))))
   `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.1))))
   `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.25))))
   `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.5))))
   `(org-document-title ((t (,@headline ,@variable-tuple :underline nil))))
   )
  )

(defun my/modify-org-done-face ()
  (setq org-fontify-done-headline t)
  (set-face-attribute 'org-done nil :strike-through t)
  (set-face-attribute 'org-headline-done nil
                      :strike-through t))

(eval-after-load "org"
  (add-hook 'org-add-hook 'my/modify-org-done-face))

;; Org Table of Contents
(use-package toc-org
    :commands toc-org-enable
    :init (add-hook 'org-mode-hook 'toc-org-enable))

;; Set elipses
;;(setq org-ellipsis " ▾")
;;(set-face-underline 'org-ellipsis nil)

(use-package consult)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-hide-emphasis-markers t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-document-title ((t (:inherit default :family "Sans Serif" :underline nil))))
 '(org-level-1 ((t (:inherit default :family "Sans Serif" :height 1.5))))
 '(org-level-2 ((t (:inherit default :family "Sans Serif" :height 1.25))))
 '(org-level-3 ((t (:inherit default :family "Sans Serif" :height 1.1))))
 '(org-level-4 ((t (:inherit default :family "Sans Serif"))))
 '(org-level-5 ((t (:inherit default :family "Sans Serif"))))
 '(org-level-6 ((t (:inherit default :family "Sans Serif"))))
 '(org-level-7 ((t (:inherit default :family "Sans Serif"))))
 '(org-level-8 ((t (:inherit default :family "Sans Serif")))))
