(SETF *READTABLE* (COPY-READTABLE NIL))(SETF (READTABLE-CASE *READTABLE*) :PRESERVE)(DEFPACKAGE "test_attribute_access" (:USE "CL" "SB-EXT" "SB-C"))(IN-PACKAGE "test_attribute_access")(SETF (SLOT-VALUE x 'y) 5)