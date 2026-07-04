; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions (Predicates)
(declare-fun is-professional-athlete (Person) Bool)
(declare-fun spends-most-time-sports (Person) Bool)
(declare-fun is-olympic-winner (Person) Bool)
(declare-fun is-full-time-scientist (Person) Bool)
(declare-fun is-nobel-physics-laureate (Person) Bool)

; 3. Declare constants
(declare-const amy Person)

; 4. Assert knowledge base (Premises)

; Premise 1: All professional athletes spend most of their time on sports.
(assert (forall ((p Person))
  (=> (is-professional-athlete p) (spends-most-time-sports p))))

; Premise 2: All Olympic gold medal winners are professional athletes.
(assert (forall ((p Person))
  (=> (is-olympic-winner p) (is-professional-athlete p))))

; Premise 3: No full-time scientists spend the majority of their time on sports.
(assert (forall ((p Person))
  (=> (is-full-time-scientist p) (not (spends-most-time-sports p)))))

; Premise 4: All Nobel physics laureates are full-time scientists.
(assert (forall ((p Person))
  (=> (is-nobel-physics-laureate p) (is-full-time-scientist p))))

; Premise 5: Amy spends the most time on sports, or Amy is an Olympic gold medal winner.
(assert (or (spends-most-time-sports amy) (is-olympic-winner amy)))

; Premise 6: If Amy is not a Nobel physics laureate, then Amy is not an Olympic gold medal winner.
(assert (=> (not (is-nobel-physics-laureate amy)) (not (is-olympic-winner amy))))

; 5. Test Scenario (The Statement to Verify)
; Statement: If Amy is not an Olympic gold medal winner, then Amy is a Nobel physics laureate.
; We assert this statement to check if it is consistent with the premises.
; If unsat, the statement is False (contradicts premises).
; If sat, the statement is Possible (consistent with premises).
(assert (=> (not (is-olympic-winner amy)) (is-nobel-physics-laureate amy)))

; 6. Check satisfiability
(check-sat)
(get-model)