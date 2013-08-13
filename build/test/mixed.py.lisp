
(EVAL-WHEN (:COMPILE-TOPLEVEL :LOAD-TOPLEVEL :EXECUTE)
  (UNLESS (FIND-PACKAGE "mixed.py")
    (MAKE-PACKAGE "mixed.py" :USE '("COMMON-LISP"))))
(IN-PACKAGE "mixed.py")
(REQUIRE 'ASDF)
(IF (NOT (EQUAL (PACKAGE-NAME *PACKAGE*) "builtins"))
    (ASDF/OPERATE:LOAD-SYSTEM :MULE))
(USE-PACKAGE "builtins")
(DEFCLASS |CounterX| NIL (|count|))
(DEFMETHOD |increment| ((|self| |CounterX|))
  (SETF (SLOT-VALUE |self| '|count|) (+ (SLOT-VALUE |self| '|count|) 1)))
(DEFUN |CounterX| ()
  (LET ((|self| (MAKE-INSTANCE '|CounterX|)))
    (SETF (SLOT-VALUE |self| '|count|) 0)
    |self|))
(DEFUN |foo| ()
  (LET ((|c| (|CounterX|)))
    (|increment| |c|)
    (LOOP WHILE (< (SLOT-VALUE |c| '|count|) 1000)
          DO (|increment| |c|))
    (RETURN-FROM |foo| (SLOT-VALUE |c| '|count|))))
(DEFPARAMETER |x| (|foo|))
(ASSERT (EQUALP |x| 1000))
(LOOP FOR S BEING EACH PRESENT-SYMBOL IN *PACKAGE*
      WHEN (OR (FBOUNDP S) (BOUNDP S) (FIND-CLASS S NIL))
      DO (EXPORT S))