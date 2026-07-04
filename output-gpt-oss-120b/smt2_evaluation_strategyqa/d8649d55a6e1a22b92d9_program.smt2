;--- 1. Declare the Person sort ---------------------------------
(declare-sort Person 0)

;--- 2. Declare predicates ---------------------------------------
(declare-fun psychic (Person) Bool)
(declare-fun admits_hot_reading (Person) Bool)
(declare-fun trustworthy (Person) Bool)

;--- 3. Introduce a concrete person -------------------------------
(declare-const alice Person)

;--- 4. Knowledge base -------------------------------------------
; Alice is a psychic who admits to hot reading
(assert (psychic alice))
(assert (admits_hot_reading alice))

; General rule: a psychic who admits hot reading is NOT trustworthy
(assert (forall ((p Person))
  (=> (and (psychic p) (admits_hot_reading p))
      (not (trustworthy p)))))

;--- 5. Test the question ----------------------------------------
; Would Alice be trustworthy?
(assert (trustworthy alice))

;--- 6. Decision procedure ----------------------------------------
(check-sat)   ; Expected result: unsat (so the answer is "No")
(get-model)