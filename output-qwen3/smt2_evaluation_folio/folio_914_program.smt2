; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions (predicates)
(declare-fun is-professional-athlete (Person) Bool)
(declare-fun spends-most-time-sports (Person) Bool)
(declare-fun is-olympic-gold-medal-winner (Person) Bool)
(declare-fun is-full-time-scientist (Person) Bool)
(declare-fun is-nobel-physics-laureate (Person) Bool)

; 3. Declare constants
(declare-const amy Person)

; 4. Assert knowledge base (Premises)

; Premise 1: All professional athletes spend most of their time on sports.
(assert (forall ((x Person))
  (=> (is-professional-athlete x) (spends-most-time-sports x))))

; Premise 2: All Olympic gold medal winners are professional athletes.
(assert (forall ((x Person))
  (=> (is-olympic-gold-medal-winner x) (is-professional-athlete x))))

; Premise 3: No full-time scientists spend the majority of their time on sports.
(assert (forall ((x Person))
  (=> (is-full-time-scientist x) (not (spends-most-time-sports x)))))

; Premise 4: All Nobel physics laureates are full-time scientists.
(assert (forall ((x Person))
  (=> (is-nobel-physics-laureate x) (is-full-time-scientist x))))

; Premise 5: Amy spends the most time on sports, or Amy is an Olympic gold medal winner.
(assert (or (spends-most-time-sports amy) (is-olympic-gold-medal-winner amy)))

; Premise 6: If Amy is not a Nobel physics laureate, then Amy is not an Olympic gold medal winner.
; Logically equivalent to: If Amy is an Olympic gold medal winner, she is a Nobel physics laureate.
(assert (=> (not (is-nobel-physics-laureate amy)) (not (is-olympic-gold-medal-winner amy))))

; 5. Assert the statement to verify
; Statement: Amy is neither a full-time scientist nor an Olympic gold medal winner.
; Logical Form: (NOT is-full-time-scientist) AND (NOT is-olympic-gold-medal-winner)
(assert (and (not (is-full-time-scientist amy)) (not (is-olympic-gold-medal-winner amy))))

; 6. Check satisfiability
; Expected: sat (The statement is True/Consistent with the premises)
(check-sat)
(get-model)