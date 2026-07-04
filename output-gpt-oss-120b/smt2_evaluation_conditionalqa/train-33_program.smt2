;--- Sorts -------------------------------------------------
(declare-sort Person 0)

;--- Constants ---------------------------------------------
(declare-const me Person)
(declare-const husband Person)

;--- Functions ---------------------------------------------
(declare-fun spouse (Person Person) Bool)          ; marital/partner relation
(declare-fun adoptionLeave (Person) Bool)          ; takes statutory adoption leave (paid)

;--- Knowledge base -----------------------------------------
; they are partners
(assert (spouse me husband))

; Rule: only one partner in a couple may take adoption leave
(assert (forall ((p Person) (q Person))
        (=> (spouse p q)
            (not (and (adoptionLeave p) (adoptionLeave q))))))

;--- Test scenario -----------------------------------------
; Both try to take the paid adoption leave
(assert (adoptionLeave me))
(assert (adoptionLeave husband))

;--- Verification -------------------------------------------
(check-sat)   ; Expected result: unsat (they cannot both take paid time off)
(get-model)