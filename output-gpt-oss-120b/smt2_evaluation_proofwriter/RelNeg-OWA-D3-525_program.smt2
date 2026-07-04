; Declare an uninterpreted sort for all objects
(declare-sort Thing 0)

; Declare predicates (unary functions returning Bool)
(declare-fun blue   (Thing) Bool)
(declare-fun green  (Thing) Bool)
(declare-fun round  (Thing) Bool)
(declare-fun red    (Thing) Bool)
(declare-fun cold   (Thing) Bool)

; Declare the constant representing the rabbit
(declare-const rabbit Thing)

; Knowledge base
; 1. The rabbit is blue.
(assert (blue rabbit))

; 2. Green, round things are not blue.
(assert (forall ((x Thing))
          (=> (and (green x) (round x))
              (not (blue x)))))

; 3. Blue things are green.
(assert (forall ((x Thing))
          (=> (blue x)
              (green x))))

; 4. If the rabbit is green then the rabbit is cold.
(assert (=> (green rabbit)
            (cold rabbit)))

; 5. If something is green and not blue then it is not cold.
(assert (forall ((x Thing))
          (=> (and (green x) (not (blue x)))
              (not (cold x)))))

; 6. Round things are not red.
(assert (forall ((x Thing))
          (=> (round x)
              (not (red x)))))

; 7. If something is cold then it is not red.
(assert (forall ((x Thing))
          (=> (cold x)
              (not (red x)))))

; 8. All round things are red.
(assert (forall ((x Thing))
          (=> (round x)
              (red x))))

; 9. If the rabbit is cold then the rabbit is not red.
(assert (=> (cold rabbit)
            (not (red rabbit))))

; -------------------------------------------------
; Test the statement: "The rabbit is not green."
; i.e., assert that rabbit is NOT green and see if this is compatible.
(assert (not (green rabbit)))

; Check satisfiability: SAT means the statement could be true,
; UNSAT means it is impossible (the rabbit must be green).
(check-sat)
(get-model)