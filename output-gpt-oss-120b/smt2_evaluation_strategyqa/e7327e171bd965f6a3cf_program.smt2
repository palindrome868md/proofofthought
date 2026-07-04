; -------------------------------------------------
; 1. Declare sorts
; -------------------------------------------------
(declare-sort Country 0)
(declare-sort Subject 0)

; -------------------------------------------------
; 2. Declare functions / predicates
; -------------------------------------------------
; true iff the given subject is a priority in the given country's education system
(declare-fun prioritized (Subject Country) Bool)

; -------------------------------------------------
; 3. Declare constants (the entities we talk about)
; -------------------------------------------------
(declare-const US Country)
(declare-const Art Subject)
(declare-const Math Subject)

; -------------------------------------------------
; 4. Knowledge base (facts known about US education)
; -------------------------------------------------
; In the United States, art is NOT a prioritized subject.
(assert (not (prioritized Art US)))

; (Optionally we can add that at least one subject is prioritized,
; e.g., mathematics, to make the knowledge base non‑trivial.)
(assert (prioritized Math US))

; -------------------------------------------------
; 5. Test the question: "Is art prioritized in the US education system?"
; -------------------------------------------------
; We ask Z3 to see if it is possible that art *is* prioritized.
(assert (prioritized Art US))

; -------------------------------------------------
; 6. Check satisfiability
; -------------------------------------------------
(check-sat)   ; Expected result: unsat → the statement is false
(get-model)   ; Optional: show the model when the result is sat