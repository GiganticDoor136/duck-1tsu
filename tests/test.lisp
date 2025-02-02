(defpackage :duck-1tsu/tests
  (:use :cl :fiveam :duck-1tsu/utils :duck-1tsu/commands)
  (:export :run-tests))

(in-package :duck-1tsu/tests)

(def-suite duck-1tsu-suite :description "Tests for Duck-1Tsu")

(def-test parse-command-test
  (is (equalp (duck-1tsu/utils:parse-command "mod --help") '(:MOD :--HELP)) "--help command")
  (is (equalp (duck-1tsu/utils:parse-command "mod --ban @username") '(:MOD :--BAN "@username")) "--ban command")
  (is (equalp (duck-1tsu/utils:parse-command "  mod   --set   --wfa-tt 5  ") '(:MOD :--SET "--wfa-tt" "5")) "--wfa-tt command"))

(def-test admin-p-test
  (is (duck-1tsu/utils:admin-p 12345) "Admin checking(positive test)")
  (is (not (duck-1tsu/utils:admin-p 99999)) "Admin checking(negative test)"))

(def-test format-command-help-test
  (let ((command '(:mod :--help "List avaible commands")))
    (is (string= (duck-1tsu/commands:format-command-help command) "MOD --HELP - List avaible commands")
        "Help formating")))

(defun run-tests ()
  (run-suite 'duck-1tsu-suite))
