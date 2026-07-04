; -------------------------------------------------
; Declarations
; -------------------------------------------------
(declare-sort Person 0)
(declare-sort Emperor 0)

; Functions mapping a person/emperor to their ordinal number
(declare-fun presNum (Person) Int)   ; presidential number
(declare-fun empNum  (Emperor) Int)  ; emperor number

; Constants for the two historical figures
(declare-const andrew-johnson Person)
(declare-const elagabalus Emperor)

; -------------------------------------------------
; Knowledge base (facts)
; -------------------------------------------------
; Andrew Johnson is the 17th President
(assert (= (presNum andrew-johnson) 17))

; Elagabalus is the 25th Roman Emperor
(assert (= (empNum elagabalus) 25))

; -------------------------------------------------
; Test the claim: "Andrew Johnson's presidential number exceeds Elagabalus's Emperor number"
; -------------------------------------------------
(assert (> (presNum andrew-johnson) (empNum elagabalus)))

; -------------------------------------------------
; Verification
; -------------------------------------------------
(check-sat)   ; Expected result: unsat (the claim is false)
(get-model)