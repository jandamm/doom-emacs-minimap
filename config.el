;;; ui/minimap/config.el -*- lexical-binding: t; -*-

(setq
 ;; Configure minimap position
 minimap-window-location 'right ; Minimap on the right side
 minimap-width-fraction 0.0 ; slightly smaller minimap
 minimap-minimum-width 20 ; also slightly smaller minimap
 )

;; Change colors of minimap
(custom-set-faces
 ;; Change background
 '(minimap-active-region-background
   ((((background dark)) (:background "#494949"))
    (t (:background "#D6D6D6")))
   :group 'minimap)
 ;; Change current line
 '(minimap-current-line-face
   ((((background dark)) (:background "#7F7F7F"))
    (t (:background "#ABABAB")))
   :group 'minimap))

;; Enable minimap on startup
(minimap-mode 1)

;; Enable minimap for some major modes which don't derive from prog-mode
(add-to-list 'minimap-major-modes 'markdown-mode)
