
(EVAL-WHEN (:COMPILE-TOPLEVEL :LOAD-TOPLEVEL :EXECUTE)
  (UNLESS (FIND-PACKAGE "packages")
    (MAKE-PACKAGE "packages" :USE '("COMMON-LISP"))))
(IN-PACKAGE "packages")
(IF (NOT (EQUAL (PACKAGE-NAME *PACKAGE*) "builtins"))
    (LOAD "/home/jvanwink/repos/mule/build/lib/builtins.fasl"))
(USE-PACKAGE "builtins")
(USE-PACKAGE "COMMON-LISP")
(LOOP FOR S BEING EACH PRESENT-SYMBOL IN *PACKAGE*
      WHEN (OR (FBOUNDP S) (BOUNDP S) (FIND-CLASS S NIL))
      DO (EXPORT S))