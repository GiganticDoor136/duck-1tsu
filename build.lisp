(load "asdf.lisp")

(defpackage :duck-1tsu-build
  (:use :cl))

(in-package :duck-1tsu-build)

(defvar *project-name* "duck-1tsu")
(defvar *version* "0-0.1-Canary")

(defsystem *project-name*
  :version *version*
  :author "Retochan"
  :description "Telegram bot Duck-1Tsu for moderation"
  :licence "BSD 3-Clause License"
  :depends-on (#:cl-telegram-bot #:cl-json #:local-time #:split-sequence #:fiveam)
  :components ((:module :src
              :components ((:file "main")
                           (:file "commands")
                           (:file "config")
                           (:file "utils")))
             (:module :tests
              :components ((:file "test"))))
  :build-operation program
  :build-pathname #P"duck-1tsu")


(defun build-project ()
  (asdf:load-system *project-name*)
  (asdf:compile-system *project-name* :force-recompile t)  
  (format t "The project ~A is assembled! Complete!.~%" *project-name*))



(defun run-tests ()
  (asdf:load-system *project-name*)
  (fiveam:run-suite 'duck-1tsu/tests:duck-1tsu-suite))
