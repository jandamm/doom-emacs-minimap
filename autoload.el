;;; ui/minimap/autoload.el -*- lexical-binding: t; -*-

;;;###autoload
(defun +minimap-toggle ()
  "Toggle minimap-visibility"
  (interactive)
  (if (null (minimap-get-window))
      (+minimap-enable)
    (+minimap-disable)))

(defun +minimap-enable ()
  "Enable minimap"
  (setq minimap-recreate-window t)
  (minimap-create))

(defun +minimap-disable ()
  "Disable minimap"
  (setq minimap-recreate-window nil)
  (minimap-kill))
