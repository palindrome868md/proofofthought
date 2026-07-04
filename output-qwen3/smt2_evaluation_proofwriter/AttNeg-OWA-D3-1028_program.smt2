; Reasoning Steps:
; 1. Fact: Erin is quiet.
; 2. Rule: All quiet things are blue (forall x, quiet(x) -> blue(x)).
; 3. Inference: Therefore, Erin is blue.
; 4. Question to Verify: "Erin is not blue".
; 5. Test Strategy: Assert (not (blue Erin)) and check satisfiability.
; 6. Expectation: Since Erin must be blue, asserting she is not blue creates a contradiction.
; 7. Expected Result: unsat (meaning the statement "Erin is not blue" is False).

; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions (predicates)
(declare-fun blue (Entity) Bool)
(declare-fun quiet (Entity) Bool)
(declare-fun cold (Entity) Bool)
(declare-fun young (Entity) Bool)
(declare-fun round (Entity) Bool)
(declare-fun red (Entity) Bool)
(declare-fun white (Entity) Bool)

; 3. Declare constants
(declare-const Bob Entity)
(declare-const Erin Entity)
(declare-const Fiona Entity)
(declare-const Harry Entity)

; 4. Assert knowledge base (facts)
(assert (blue Bob))
(assert (quiet Erin))
(assert (cold Fiona))
(assert (cold Harry))

; 5. Assert knowledge base (rules)

; All quiet things are blue
(assert (forall ((x Entity))
  (=> (quiet x) (blue x))))

; If Harry is blue then Harry is not young
(assert (=> (blue Harry) (not (young Harry))))

; Blue things are young
(assert (forall ((x Entity))
  (=> (blue x) (young x))))

; Blue, round things are cold
(assert (forall ((x Entity))
  (=> (and (blue x) (round x)) (cold x))))

; If something is blue and not red then it is round
(assert (forall ((x Entity))
  (=> (and (blue x) (not (red x))) (round x))))

; If something is young then it is white
(assert (forall ((x Entity))
  (=> (young x) (white x))))

; If Erin is red and Erin is not round then Erin is young
(assert (=> (and (red Erin) (not (round Erin))) (young Erin)))

; If Erin is red and Erin is not cold then Erin is white
(assert (=> (and (red Erin) (not (cold Erin))) (white Erin)))

; 6. Verification: Assert the scenario "Erin is not blue"
(assert (not (blue Erin)))

; 7. Check satisfiability
(check-sat)
(get-model)