; Reasoning Steps:
; 1. Charlie is Round (Premise).
; 2. All Round things are Smart (Premise) -> Charlie is Smart.
; 3. All Smart things are Rough (Premise) -> Charlie is Rough.
; 4. If Charlie is Rough then Charlie is Green (Premise) -> Charlie is Green.
; 5. Conclusion: Charlie MUST be Green.
; 6. Question to Verify: "Charlie is not green."
; 7. Since Charlie must be Green, asserting "Charlie is not Green" should lead to a contradiction.
; 8. Expected Result: unsat (False).

; 1. Declare sorts
(declare-sort Thing 0)

; 2. Declare functions (properties)
(declare-fun is-round (Thing) Bool)
(declare-fun is-blue (Thing) Bool)
(declare-fun is-smart (Thing) Bool)
(declare-fun is-red (Thing) Bool)
(declare-fun is-rough (Thing) Bool)
(declare-fun is-green (Thing) Bool)

; 3. Declare constants
(declare-const charlie Thing)

; 4. Assert knowledge base (facts and rules)

; Fact: Charlie is round
(assert (is-round charlie))

; Rule: All blue, smart things are red
(assert (forall ((x Thing))
  (=> (and (is-blue x) (is-smart x))
      (is-red x))))

; Rule: Blue, rough things are round
(assert (forall ((x Thing))
  (=> (and (is-blue x) (is-rough x))
      (is-round x))))

; Rule: If something is green then it is red
(assert (forall ((x Thing))
  (=> (is-green x)
      (is-red x))))

; Rule: If Charlie is rough then Charlie is green
(assert (=> (is-rough charlie)
            (is-green charlie)))

; Rule: All round things are smart
(assert (forall ((x Thing))
  (=> (is-round x)
      (is-smart x))))

; Rule: All smart, red things are blue
(assert (forall ((x Thing))
  (=> (and (is-smart x) (is-red x))
      (is-blue x))))

; Rule: If something is blue and round then it is smart
(assert (forall ((x Thing))
  (=> (and (is-blue x) (is-round x))
      (is-smart x))))

; Rule: All smart things are rough
(assert (forall ((x Thing))
  (=> (is-smart x)
      (is-rough x))))

; 5. Verify Question: "Charlie is not green."
; We assert the statement to check if it is consistent (sat) or contradictory (unsat)
; Based on reasoning, Charlie IS green, so "Charlie is not green" is False.
(assert (not (is-green charlie)))

; 6. Check satisfiability
(check-sat)
(get-model)