(defpackage :duck-1tsu
  (:use :cl :cl-telegram-bot :cl-json :local-time :split-sequence)
  (:export :main))

(in-package :duck-1tsu)

(defvar *bot-token* "type your bot token")

(defvar *bot* nil)

(defun send-message (chat-id text &rest args)
  (apply #'telegram-bot:send-message *bot* chat-id text args))

(defun handle-message (message)
  (let ((text (telegram-bot:message-text message))
        (chat-id (telegram-bot:message-chat-id message)))
    (when text
      (let ((command (parse-command text)))
        (case (car command)
          ((:mod) (handle-mod-command chat-id (cdr command)))
          (otherwise (send-message chat-id "Incorrect command")))))))

(defun parse-command (text)
  (let ((parts (split-sequence #\space text)))
    (cons (intern (string-upcase (car parts)) :keyword) (cdr parts))))


(defun handle-mod-command (chat-id args)
  (case (car args)
    ((:--help) (send-message chat-id (format nil "~{~A~%~}" (mapcar #'format-command-help *mod-commands*))))
    ((:--set) (handle-set-command chat-id (cdr args)))
    ((:--s-mute) (handle-s-mute chat-id (cadr args) (caddr args)))
    ((:--ban) (handle-ban chat-id (cadr args)))
    ((:--wfa) (handle-wfa chat-id (cadr args)))
    ((:--wfu) (handle-wfu chat-id (cadr args)))
    ((:--mute) (handle-mute chat-id (cadr args) (caddr args)))
    ((:--kick) (handle-kick chat-id (cadr args)))
    (otherwise (send-message chat-id "Incorrect command"))))

(defun format-command-help (command)
  (format nil "~A - ~A" (car command) (cdr command)))

(defvar *mod-commands*
  '((:mod :--help "List avaible commands")
    (:mod :--set "Bot's settings")
    (:mod :--s-mute "Fast mute")
    ))

(defun main ()
  (setf *bot* (make-instance 'telegram-bot:bot :token *bot-token*))
  (telegram-bot:start-polling *bot* #'handle-message))

(eval-when (:load-toplevel)
  (main))
