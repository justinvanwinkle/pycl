(SETF *READTABLE* (COPY-READTABLE NIL))(SETF (READTABLE-CASE *READTABLE*) :PRESERVE)(DEFPACKAGE "builtins" (:USE "CL" "SB-EXT" "SB-C"))(IN-PACKAGE "builtins")