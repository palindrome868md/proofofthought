; -------------------------------------------------
; 1. Declare sorts
; -------------------------------------------------
(declare-sort Character 0)
(declare-sort Plant 0)

; -------------------------------------------------
; 2. Declare predicate
; -------------------------------------------------
(declare-fun allergic (Character Plant) Bool)

; -------------------------------------------------
; 3. Declare constants (the Little Prince and a flower)
; -------------------------------------------------
(declare-const little-prince Character)
(declare-const some-flower Plant)

; -------------------------------------------------
; 4. Knowledge base: The Little Prince is NOT allergic to flowers
; -------------------------------------------------
(assert (not (allergic little-prince some-flower)))

; -------------------------------------------------
; 5. Test the statement: "The Little Prince was allergic to flowers"
; -------------------------------------------------
(assert (allergic little-prince some-flower))

; -------------------------------------------------
; 6. Run the verification
; -------------------------------------------------
(check-sat)   ; Expected result: unsat (the statement contradicts the KB)
(get-model)