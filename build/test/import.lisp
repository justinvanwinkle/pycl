(eval-when (:compile-toplevel :load-toplevel :execute)(unless (find-package "import")(make-package "import" :use '("COMMON-LISP"))) ) (in-package "import")
(use-package "builtins")(|mload| "./dictionary" )
(LOOP FOR S BEING EACH PRESENT-SYMBOL IN *PACKAGE*
   WHEN (OR (FBOUNDP S) (BOUNDP S) (FIND-CLASS S NIL))
   DO (EXPORT S))

