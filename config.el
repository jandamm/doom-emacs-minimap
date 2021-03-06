;;; ui/minimap/config.el -*- lexical-binding: t; -*-

(defun +minimap-set-highlight-line--on ()
  (setq +minimap-highlight-line t)
	(custom-set-faces!
		'(minimap-current-line-face :background "#51AFEF" :group 'minimap)))

(defun +minimap-set-highlight-line--off ()
  (setq +minimap-highlight-line nil)
	(custom-set-faces
		'(minimap-current-line-face
   ((((background dark)) (:background "#7F7F7F"))
    (t (:background "#ABABAB")))
   :group 'minimap)))

(defcustom +minimap-highlight-line nil
  "Whether minimap should highlight the current line more prominent."
  :set (lambda (sym value)
         (set sym value)
         (if (null value) (+minimap-set-highlight-line--off) (+minimap-set-highlight-line--on)))
  :type 'boolean
  :group 'minimap)

(setq
 ;; Configure minimap position
 minimap-window-location 'right ; Minimap on the right side
 minimap-width-fraction 0.0 ; slightly smaller minimap
 minimap-minimum-width 20 ; also slightly smaller minimap

 minimap-dedicated-window t ; seems to work better
 minimap-enlarge-certain-faces nil ; enlarge breaks BlockFont
 )

(map!
 (:leader
   (:prefix-map ("t" . "toggle")
     (:prefix-map ("m" . "minimap")
     :desc "Toggle minimap" "m" #'+minimap-toggle
     :desc "Toggle line highlighting" "l" #'+minimap-toggle-highlight-line))))


;; Disable modeline in minimap buffer
(add-hook! 'minimap-sb-mode-hook #'hide-mode-line-mode)

;; Change colors of minimap
(custom-set-faces
 ;; Change background
 '(minimap-active-region-background
   ((((background dark)) (:background "#494949"))
    (t (:background "#D6D6D6")))
   :group 'minimap))

;; Set Blockfont as minimap font
(custom-set-faces!
  '(minimap-font-face :family "BlockFont" :height 30 :group 'minimap))

;; Enable minimap on startup
(minimap-mode 1)

;; Enable minimap for some major modes which don't derive from prog-mode
(add-to-list 'minimap-major-modes 'markdown-mode)
