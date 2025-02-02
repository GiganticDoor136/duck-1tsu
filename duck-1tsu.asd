(defsystem "duck-1tsu"
  :version "0-0.1-Canary" 
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
