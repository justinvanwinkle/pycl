(eval-when (:compile-toplevel :load-toplevel :execute)(unless (find-package "type_hints")(make-package "type_hints" :use '("COMMON-LISP"))(use-package "builtins")))
;(proclaim '(optimize (space 0) (safety 0) (speed 3)))
(DEFUN |foo| (  ) (LET ((|x| 0)) (DECLARE (TYPE |FIXNUM| |x| ) )
(LET ((|lim| 4000)) (LOOP WHILE (< (the |FIXNUM| |x|) |lim|) DO (SETF |x| (the |FIXNUM| (+ |x| 1))))
(RETURN-FROM |foo| |x|))))
(ASSERT (|__eq__| (|foo|  ) 4000) )
(LOOP FOR S BEING EACH PRESENT-SYMBOL IN *PACKAGE*
   WHEN (OR (FBOUNDP S) (BOUNDP S) (FIND-CLASS S NIL))
   DO (EXPORT S))

