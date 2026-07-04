; -------------------------------------------------
; 1. Declare sorts
; -------------------------------------------------
(declare-sort Person 0)
(declare-sort Franchise 0)

; -------------------------------------------------
; 2. Declare functions / predicates
; -------------------------------------------------
; p is employed by f ?
(declare-fun employed-by (Person Franchise) Bool)

; p is a child abuser ?
(declare-fun child-abuser (Person) Bool)

; -------------------------------------------------
; 3. Declare constants
; -------------------------------------------------
(declare-const subway Franchise)

; -------------------------------------------------
; 4. Knowledge base
; -------------------------------------------------
; No person who is a child abuser is employed by Subway.
(assert (forall ((p Person))
  (=> (and (child-abuser p) (employed-by p subway))
      false)))   ; equivalent to (not (and ...))

; -------------------------------------------------
; 5. Test the claim: Is there a person who both works for Subway
;    and is a child abuser?
; -------------------------------------------------
(declare-const witness Person)
(assert (and (child-abuser witness)
             (employed-by witness subway)))

; -------------------------------------------------
; 6. Check satisfiability (the answer)
; -------------------------------------------------
(check-sat)   ; Expected: unsat → No such connection exists
(get-model)   ; Optional: shows why the constraints are contradictory