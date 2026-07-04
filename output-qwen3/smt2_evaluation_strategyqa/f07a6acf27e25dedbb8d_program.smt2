; SMT-LIB 2.0 Program to verify: Does Andrew Johnson's presidential number exceed Elagabalus's Emperor number?

; Declare sorts
(declare-sort Leader 0)

; Declare functions to retrieve ordinal numbers
(declare-fun presidential-number (Leader) Int)
(declare-fun emperor-number (Leader) Int)

; Declare constants for the historical figures
(declare-const andrew-johnson Leader)
(declare-const elagabalus Leader)

; Knowledge Base
; Andrew Johnson was the 17th President of the United States (1865-1869)
(assert (= (presidential-number andrew-johnson) 17))

; Elagabalus was a Roman Emperor (218-222 AD)
; Counting from Augustus (1st Emperor), Elagabalus is approximately the 25th emperor
(assert (= (emperor-number elagabalus) 25))

; Verification: Test if Johnson's presidential number exceeds Elagabalus's emperor number
(assert (> (presidential-number andrew-johnson) (emperor-number elagabalus)))

; Check satisfiability
(check-sat)
(get-model)