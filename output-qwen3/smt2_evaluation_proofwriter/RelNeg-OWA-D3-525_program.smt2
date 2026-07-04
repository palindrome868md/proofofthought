; Declare sort for objects
(declare-sort Thing 0)

; Declare predicates (functions returning Bool)
(declare-fun is-blue (Thing) Bool)
(declare-fun is-green (Thing) Bool)
(declare-fun is-round (Thing) Bool)
(declare-fun is-cold (Thing) Bool)
(declare-fun is-red (Thing) Bool)

; Declare constant for the rabbit
(declare-const rabbit Thing)

; --- Knowledge Base ---

; 1. The rabbit is blue.
(assert (is-blue rabbit))

; 2. Green, round things are not blue.
(assert (forall ((x Thing))
  (=> (and (is-green x) (is-round x))
      (not (is-blue x)))))

; 3. Blue things are green.
(assert (forall ((x Thing))
  (=> (is-blue x)
      (is-green x))))

; 4. If the rabbit is green then the rabbit is cold.
(assert (=> (is-green rabbit)
            (is-cold rabbit)))

; 5. If something is green and not blue then it is not cold.
(assert (forall ((x Thing))
  (=> (and (is-green x) (not (is-blue x)))
      (not (is-cold x)))))

; 6. Round things are not red.
(assert (forall ((x Thing))
  (=> (is-round x)
      (not (is-red x)))))

; 7. If something is cold then it is not red.
(assert (forall ((x Thing))
  (=> (is-cold x)
      (not (is-red x)))))

; 8. All round things are red.
(assert (forall ((x Thing))
  (=> (is-round x)
      (is-red x))))

; 9. If the rabbit is cold then the rabbit is not red.
(assert (=> (is-cold rabbit)
            (not (is-red rabbit))))

; --- Verification ---
; Question: "The rabbit is not green."
; To verify this statement, we assert it. 
; If it contradicts the KB (unsat), the statement is False.
; If it is consistent (sat), the statement is True/Possible.
(assert (not (is-green rabbit)))

; Check satisfiability
(check-sat)
(get-model)