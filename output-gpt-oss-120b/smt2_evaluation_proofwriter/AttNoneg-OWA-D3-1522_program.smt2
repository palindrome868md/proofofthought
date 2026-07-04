;--- Sorts -------------------------------------------------
(declare-sort Person 0)

;--- Predicates (boolean functions) -----------------------
(declare-fun cold  (Person) Bool)
(declare-fun furry (Person) Bool)
(declare-fun nice  (Person) Bool)
(declare-fun red   (Person) Bool)
(declare-fun round (Person) Bool)
(declare-fun smart (Person) Bool)
(declare-fun big   (Person) Bool)

;--- Constants --------------------------------------------
(declare-const bob Person)
(declare-const erin Person)

;--- Facts ------------------------------------------------
(assert (cold bob))
(assert (furry bob))
(assert (nice bob))
(assert (red bob))
(assert (round bob))
(assert (smart bob))

(assert (red erin))

;--- Universal Rules --------------------------------------
; 1. furry -> round
(assert (forall ((x Person)) (=> (furry x) (round x))))

; 2. Bob-specific rule (nice ∧ big -> smart)
(assert (=> (and (nice bob) (big bob)) (smart bob)))

; 3. red -> furry
(assert (forall ((x Person)) (=> (red x) (furry x))))

; 4. furry ∧ big -> round
(assert (forall ((x Person)) (=> (and (furry x) (big x)) (round x))))

; 5. red ∧ round -> nice
(assert (forall ((x Person)) (=> (and (red x) (round x)) (nice x))))

; 6. big ∧ cold -> red
(assert (forall ((x Person)) (=> (and (big x) (cold x)) (red x))))

; 7. furry -> red
(assert (forall ((x Person)) (=> (furry x) (red x))))

; 8. big -> cold
(assert (forall ((x Person)) (=> (big x) (cold x))))

;--- Query: Erin is NOT nice -------------------------------
(assert (not (nice erin)))   ; the statement we are testing

;--- Check satisfiability ---------------------------------
(check-sat)   ; Expected result: unsat (the statement is false)
(get-model)