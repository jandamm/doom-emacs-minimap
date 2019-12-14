;;; ui/minimap/autoload.el -*- lexical-binding: t; -*-

;;;###autoload
(defun +minimap-toggle ()
  "Toggle minimap-visibility"
  (interactive)
  (if (null (minimap-get-window))
      (+minimap-toggle--on)
    (+minimap-toggle--off)))

(defun +minimap-toggle--on ()
  "Enable minimap"
  (setq minimap-recreate-window t)
  (minimap-create))

(defun +minimap-toggle--off ()
  "Disable minimap"
  (setq minimap-recreate-window nil)
  (minimap-kill))

;;;###autoload
(defun +minimap-toggle-highlight-line ()
  "Toggle minimap-visibility"
  (interactive)
  (if (null +minimap-highlight-line)
      (+minimap-set-highlight-line--on)
    (+minimap-set-highlight-line--off)))
