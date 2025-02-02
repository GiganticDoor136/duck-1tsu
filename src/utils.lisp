(defpackage :duck-1tsu/utils
  (:use :cl :cl-telegram-bot :split-sequence)
  (:export :send-message :parse-command :get-user-id :admin-p))

(in-package :duck-1tsu/utils)

(defun send-message (chat-id text &rest args)
  (apply #'telegram-bot:send-message duck-1tsu:*bot* chat-id text args))

(defun parse-command (text)
  (let ((parts (split-sequence #\space text)))
    (cons (intern (string-upcase (car parts)) :keyword) (mapcar #'string-downcase (cdr parts)))))

(defun get-user-id (username)

  (cond
    ((string= username "@testuser") 12345) 
    (t nil)))

(defun admin-p (user-id)
  (member user-id duck-1tsu/config:*admin-user-ids*))

(defun get-current-time (&optional (time-zone duck-1tsu/config:*time-zone*))
  (local-time:format-timestring nil (local-time:now)
                              :timezone (local-time:find-timezone time-zone)))

(defun format-list-to-string (list &key (separator ", "))
  (format nil "~{~A~^~A~}" list separator))
