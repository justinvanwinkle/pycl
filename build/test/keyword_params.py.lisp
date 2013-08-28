
(EVAL-WHEN (:COMPILE-TOPLEVEL :LOAD-TOPLEVEL :EXECUTE)
  (UNLESS (FIND-PACKAGE "keyword_params.py")
    (MAKE-PACKAGE "keyword_params.py" :USE '("COMMON-LISP"))))
(IN-PACKAGE "keyword_params.py")
(IF (NOT (EQUAL (PACKAGE-NAME *PACKAGE*) "builtins"))
    (LOAD "/home/jvanwink/repos/mule/build/lib/builtins.fasl"))
(USE-PACKAGE "builtins")
(DEFUN |f| (|a| &KEY (|b| "yep")) (RETURN-FROM |f| |b|))
(ASSERT (EQUALP (|f| 1) "yep"))
(ASSERT (EQUALP (|f| 1 :|b| "NO") "NO"))
(LOOP FOR S BEING EACH PRESENT-SYMBOL IN *PACKAGE*
      WHEN (OR (FBOUNDP S) (BOUNDP S) (FIND-CLASS S NIL))
      DO (EXPORT S))