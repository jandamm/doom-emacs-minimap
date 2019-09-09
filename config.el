;;; ui/minimap/config.el -*- lexical-binding: t; -*-

(setq
 ;; Configure MiniMap
 minimap-window-location 'right ; Minimap on the right side
 minimap-width-fraction 0.0 ; slightly smaller minimap
 minimap-minimum-width 20 ; also slightly smaller minimap
 )

(minimap-mode 1)
(add-to-list 'minimap-major-modes 'markdown-mode)
