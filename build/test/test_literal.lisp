(SETF *READTABLE* (COPY-READTABLE NIL))(SETF (READTABLE-CASE *READTABLE*) :PRESERVE)(DEFPACKAGE "test_literal" (:USE "CL" "SB-EXT" "SB-C"))(IN-PACKAGE "test_literal")(PRINT "I WORK")