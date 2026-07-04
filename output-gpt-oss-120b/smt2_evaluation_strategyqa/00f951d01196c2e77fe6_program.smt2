; -------------------------------------------------
; 1. Declare the uninterpreted sort for people
; -------------------------------------------------
(declare-sort Person 0)

; -------------------------------------------------
; 2. Declare a function giving a person’s year of birth
; -------------------------------------------------
(declare-fun born-year (Person) Int)

; -------------------------------------------------
; 3. Declare a constant representing a typical member
;    of the high‑school class of 2010
; -------------------------------------------------
(declare-const class2010-student Person)

; -------------------------------------------------
; 4. Knowledge base
; -------------------------------------------------
; The class of 2010 was born around 1992 (typical graduation age 18)
(assert (= (born-year class2010-student) 1992))

; Nixon’s presidency ran from 1969 through 1974.
; A person lived through that presidency iff they were born
; on or before the last year of the presidency (1974).
; We do NOT assert this rule as a separate axiom; we will
; test the concrete condition directly.

; -------------------------------------------------
; 5. Test the claim:
;    "The class of 2010 lived through Nixon’s presidency."
;    i.e., (born-year <= 1974)
; -------------------------------------------------
(assert (<= (born-year class2010-student) 1974))

; -------------------------------------------------
; 6. Check satisfiability
; -------------------------------------------------
(check-sat)   ; Expected: unsat  (the claim is false)
(get-model)   ; Shows the concrete birth year (1992)