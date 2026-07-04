;--- Sort declaration -------------------------------------------------
(declare-sort Person 0)

;--- Constants ---------------------------------------------------------
(declare-const Gary Person)

;--- Predicate declarations ---------------------------------------------
(declare-fun big   (Person) Bool)
(declare-fun green (Person) Bool)
(declare-fun round (Person) Bool)
(declare-fun quiet (Person) Bool)
(declare-fun rough (Person) Bool)
(declare-fun blue  (Person) Bool)
(declare-fun red   (Person) Bool)

;--- Facts --------------------------------------------------------------
(assert (big Gary))
(assert (green Gary))
(assert (round Gary))

;--- Rules --------------------------------------------------------------

; If Gary is big and Gary is green then Gary is quiet.
(assert (=> (and (big Gary) (green Gary)) (quiet Gary)))

; If someone is blue and big then they are not rough. (instantiated for Gary)
(assert (=> (and (blue Gary) (big Gary)) (not (rough Gary))))

; If someone is round and green then they are rough. (instantiated for Gary)
(assert (=> (and (round Gary) (green Gary)) (rough Gary)))

; If someone is big and round then they are rough. (instantiated for Gary)
(assert (=> (and (big Gary) (round Gary)) (rough Gary)))

; If Gary is green and Gary is blue then Gary is red.
(assert (=> (and (green Gary) (blue Gary)) (red Gary)))

; If Gary is rough then Gary is round.
(assert (=> (rough Gary) (round Gary)))

; Round, quiet people are not red.
(assert (=> (and (round Gary) (quiet Gary)) (not (red Gary))))

; If Gary is round and Gary is blue then Gary is green.
(assert (=> (and (round Gary) (blue Gary)) (green Gary)))

;--- Query --------------------------------------------------------------
; Claim: Gary is NOT round.
(assert (not (round Gary)))

;--- Solver request -----------------------------------------------------
(check-sat)   ; expected result: unsat (the claim contradicts the KB)
(get-model)  ; optional: view a model (will be empty because UNSAT)