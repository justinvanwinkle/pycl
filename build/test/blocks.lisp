
(EVAL-WHEN (:COMPILE-TOPLEVEL :LOAD-TOPLEVEL :EXECUTE)
  (UNLESS (FIND-PACKAGE "blocks")
    (MAKE-PACKAGE "blocks" :USE '("COMMON-LISP"))))
(IN-PACKAGE "blocks")
(REQUIRE 'ASDF)
(IF (NOT (EQUAL (PACKAGE-NAME *PACKAGE*) "builtins"))
    (ASDF:LOAD-SYSTEM :MULE))
(USE-PACKAGE "builtins")
(DEFUN |x| ()
  (FLET ((|y| ()
           (FLET ((|z| ()
                    (RETURN-FROM |z| 1)))
             (RETURN-FROM |y| (+ 2 (|z|))))))
    (RETURN-FROM |x| (+ 3 (|y|)))))
(ASSERT (EQUALP (|x|) 6))
(LOOP FOR S BEING EACH PRESENT-SYMBOL IN *PACKAGE*
      WHEN (OR (FBOUNDP S) (BOUNDP S) (FIND-CLASS S NIL))
      DO (EXPORT S))