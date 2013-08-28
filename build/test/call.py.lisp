
(EVAL-WHEN (:COMPILE-TOPLEVEL :LOAD-TOPLEVEL :EXECUTE)
  (UNLESS (FIND-PACKAGE "call.py")
    (MAKE-PACKAGE "call.py" :USE '("COMMON-LISP"))))
(IN-PACKAGE "call.py")
(REQUIRE :ASDF)
(IF (NOT (EQUAL (PACKAGE-NAME *PACKAGE*) "builtins"))
    (ASDF/OPERATE:LOAD-SYSTEM :MULE))
(USE-PACKAGE "builtins")
(DEFUN |foo| () (RETURN-FROM |foo| 1))
(DEFCLASS A NIL (|b|))
(DEFMETHOD |ack| ((|self| A)) (RETURN-FROM |ack| 1))
(DEFUN A ()
  (LET ((|self| (MAKE-INSTANCE 'A)))
    (SETF (SLOT-VALUE |self| '|b|) NIL)
    |self|))
(DEFCLASS B NIL (|x|))
(DEFMETHOD |c| ((|self| B) |arg|) (RETURN-FROM |c| |arg|))
(DEFUN B ()
  (LET ((|self| (MAKE-INSTANCE 'B)))
    (SETF (SLOT-VALUE |self| '|x|) (|foo|))
    |self|))
(DEFPARAMETER |a| (A))
(SETF (SLOT-VALUE |a| '|b|) (B))
(ASSERT (EQUALP (|ack| |a|) 1))
(ASSERT (EQUALP (|c| (SLOT-VALUE |a| '|b|) 1) 1))
(LOOP FOR S BEING EACH PRESENT-SYMBOL IN *PACKAGE*
      WHEN (OR (FBOUNDP S) (BOUNDP S) (FIND-CLASS S NIL))
      DO (EXPORT S))