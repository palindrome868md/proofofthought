; Declare sorts
(declare-sort Person 0)

; Declare constants
(declare-const Amy Person)

; Declare predicates
(declare-fun professional-athlete (Person) Bool)
(declare-fun olympic-gold (Person) Bool)
(declare-fun spends-sports (Person) Bool)
(declare-fun fulltime-scientist (Person) Bool)
(declare-fun nobel-physics-laureate (Person) Bool)

; Knowledge base (premises)

; 1. All professional athletes spend most of their time on sports.
(assert (forall ((p Person))
  (=> (professional-athlete p) (spends-sports p))))

; 2. All Olympic gold medal winners are professional athletes.
(assert (forall ((p Person))
  (=> (olympic-gold p) (professional-athlete p))))

; 3. No full-time scientists spend the majority of their time on sports.
(assert (forall ((p Person))
  (=> (fulltime-scientist p) (not (spends-sports p)))))

; 4. All Nobel physics laureates are full-time scientists.
(assert (forall ((p Person))
  (=> (nobel-physics-laureate p) (fulltime-scientist p))))

; 5. Amy spends the most time on sports, or Amy is an Olympic gold medal winner.
(assert (or (spends-sports Amy) (olympic-gold Amy)))

; 6. If Amy is not a Nobel physics laureate, then Amy is not an Olympic gold medal winner.
(assert (=> (not (nobel-physics-laureate Amy)) (not (olympic-gold Amy))))

; Test: S = "If Amy is not an Olympic gold medal winner, then Amy is a Nobel physics laureate."
; We assert the negation of S to test entailment of S.
; Not(S) is: (not Olympic) and (not Nobel)
; Equivalently, (=> (not (olympic-gold Amy)) (nobel-physics-laureate Amy)) is the statement.
; We negate it:
(assert (not (=> (not (olympic-gold Amy)) (nobel-physics-laureate Amy))))

; Check satisfiability to determine truth of the statement
(check-sat)
(get-model)