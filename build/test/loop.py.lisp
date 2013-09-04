(CL:EVAL-WHEN (:compile-toplevel :load-toplevel :execute)(CL:UNLESS (CL:FIND-PACKAGE "loop.py")(make-package "loop.py")(CL:USE-PACKAGE "builtins")))
;(proclaim '(optimize (speed 3)))
(CL:DEFPARAMETER |x| 1)
(CL:DEFUN |simple_loop| (  ) 
(CL:LET ((|y| 0))
(CL:LOOP FOR |x| BEING THE ELEMENTS OF (|tuple| '(1 2 3)) DO (CL:SETF |y| (+ |y| |x|)))
(CL:RETURN-FROM |simple_loop| |y|)))
(CL:DEFUN |range_loop| (  ) 
(CL:LET ((|y| 0))
(CL:LOOP FOR |x| FROM 0 BELOW 10 BY 1 DO (CL:SETF |y| (+ |y| |x|)))
(CL:LOOP FOR |x| FROM 0 BELOW 10 BY 1 DO (CL:SETF |y| (+ |y| |x|)))
(CL:RETURN-FROM |range_loop| |y|)))
(|muleassert| (|__eq__| (|simple_loop|  ) 6) )
(|muleassert| (|__eq__| (|range_loop|  ) 90) )
(CL:LOOP FOR S BEING EACH PRESENT-SYMBOL IN CL:*PACKAGE*
   WHEN (OR (CL:FBOUNDP S)
            (CL:BOUNDP S)
            (CL:FIND-CLASS S NIL))
   DO (CL:EXPORT S))

