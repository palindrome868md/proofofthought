; ==============================================================================
; Reasoning Steps:
; ==============================================================================
; 1. Analyze the Knowledge Base (Premises):
;    - Fact: Dave is nice.
;    - Fact: Fiona is quiet.
;    - Rule: If something is red and cold, it is quiet.
;    - Rule: If Fiona is quiet and Fiona is blue, then Fiona is round.
;    - Rule: Nice, green things are red.
;    - Rule: If something is nice, then it is not blue.
;    - Rule: If Dave is not blue, then Dave is round.
;    - Rule: If Dave is red and Dave is not round, then Dave is not quiet.
;
; 2. Logical Deduction for Dave:
;    - From "Dave is nice" and "If something is nice then it is not blue":
;      Dave is NOT blue.
;    - From "Dave is NOT blue" and "If Dave is not blue then Dave is round":
;      Dave IS round.
;
; 3. Analyze the Question:
;    - Question: "Dave is not round."
;    - To verify this, we assert the statement "(not (is-round dave))" and check satisfiability.
;
; 4. Expected Outcome:
;    - Since we deduced "Dave IS round", asserting "Dave IS NOT round" creates a contradiction.
;    - (check-sat) should return "unsat".
;    - "unsat" means the statement "Dave is not round" is FALSE (contradicts knowledge base).
; ==============================================================================

; 1. Declare Sorts
(declare-sort Thing 0)

; 2. Declare Functions (Predicates)
(declare-fun is-nice (Thing) Bool)
(declare-fun is-quiet (Thing) Bool)
(declare-fun is-red (Thing) Bool)
(declare-fun is-cold (Thing) Bool)
(declare-fun is-blue (Thing) Bool)
(declare-fun is-round (Thing) Bool)
(declare-fun is-green (Thing) Bool)

; 3. Declare Constants (Entities)
(declare-const dave Thing)
(declare-const fiona Thing)

; 4. Assert Knowledge Base (Facts and Rules)

; Fact: Dave is nice.
(assert (is-nice dave))

; Fact: Fiona is quiet.
(assert (is-quiet fiona))

; Rule: If something is red and cold then it is quiet.
(assert (forall ((x Thing))
  (=> (and (is-red x) (is-cold x))
      (is-quiet x))))

; Rule: If Fiona is quiet and Fiona is blue then Fiona is round.
(assert (=> (and (is-quiet fiona) (is-blue fiona))
            (is-round fiona)))

; Rule: Nice, green things are red.
(assert (forall ((x Thing))
  (=> (and (is-nice x) (is-green x))
      (is-red x))))

; Rule: If something is nice then it is not blue.
(assert (forall ((x Thing))
  (=> (is-nice x)
      (not (is-blue x)))))

; Rule: If Dave is not blue then Dave is round.
(assert (=> (not (is-blue dave))
            (is-round dave)))

; Rule: If Dave is red and Dave is not round then Dave is not quiet.
(assert (=> (and (is-red dave) (not (is-round dave)))
            (not (is-quiet dave))))

; 5. Verification Scenario
; Question: Dave is not round.
; We assert this claim to test its consistency with the Knowledge Base.
(assert (not (is-round dave)))

; 6. Check Satisfiability
(check-sat)

; 7. Get Model (if sat)
(get-model)