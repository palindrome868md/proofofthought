;--- Sorts ---------------------------------------------------------
(declare-sort Person 0)

;--- Constants (individuals) ---------------------------------------
(declare-const Anne Person)
(declare-const Bob Person)
(declare-const Gary Person)
(declare-const Harry Person)

;--- Predicate symbols (as Boolean functions) ----------------------
(declare-fun nice (Person) Bool)
(declare-fun big  (Person) Bool)
(declare-fun cold (Person) Bool)
(declare-fun rough(Person) Bool)
(declare-fun quiet(Person) Bool)
(declare-fun green(Person) Bool)
(declare-fun smart(Person) Bool)

;--- Facts ---------------------------------------------------------
(assert (not (nice Anne)))          ; Anne is not nice
(assert (rough Anne))               ; Anne is rough
(assert (smart Anne))               ; Anne is smart
(assert (rough Bob))                ; Bob is rough
(assert (nice Gary))                ; Gary is nice
(assert (quiet Gary))               ; Gary is quiet
(assert (rough Harry))              ; Harry is rough

;--- General rules -------------------------------------------------
; All nice people are big
(assert (forall ((x Person)) (=> (nice x) (big x))))

; If someone is green then they are smart
(assert (forall ((x Person)) (=> (green x) (smart x))))

; If Anne is quiet and Anne is not green then Anne is big
(assert (=> (and (quiet Anne) (not (green Anne))) (big Anne)))

; If someone is nice and not quiet then they are not rough
(assert (forall ((x Person))
          (=> (and (nice x) (not (quiet x))) (not (rough x)))))

; If someone is quiet and not big then they are not rough
(assert (forall ((x Person))
          (=> (and (quiet x) (not (big x))) (not (rough x)))))

; Cold people are rough
(assert (forall ((x Person)) (=> (cold x) (rough x))))

;--- Gary‑specific rules -------------------------------------------
; If Gary is big then Gary is cold
(assert (=> (big Gary) (cold Gary)))

; If Gary is big then Gary is quiet
(assert (=> (big Gary) (quiet Gary)))

;--- Query: Gary is NOT cold ---------------------------------------
(assert (not (cold Gary)))   ; the statement we are testing

;--- Check consistency ---------------------------------------------
(check-sat)
(get-model)