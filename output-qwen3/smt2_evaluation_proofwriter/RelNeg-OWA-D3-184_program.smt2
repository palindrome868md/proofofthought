; Reasoning Steps:
; 1. Analyze the Knowledge Base:
;    - Fact: The squirrel is kind.
;    - Rule: All kind things are blue.
;    - Deduction: Since the squirrel is kind, the squirrel must be blue.
;
; 2. Analyze the Question:
;    - Statement to verify: "The squirrel is not blue."
;
; 3. Verification Strategy:
;    - Assert the Knowledge Base.
;    - Assert the Statement (not (is-blue squirrel)).
;    - Check Satisfiability.
;    - Expected Result: unsat (because the statement contradicts the deduction).
;
; 4. SMT-LIB Structure:
;    - Declare a sort 'Thing' for objects.
;    - Declare predicates (is-kind, is-blue, etc.).
;    - Declare constant 'squirrel'.
;    - Assert facts and rules.
;    - Assert the test condition.
;    - Run check-sat.

; 1. Declare sorts
(declare-sort Thing 0)

; 2. Declare functions (predicates)
(declare-fun is-kind (Thing) Bool)
(declare-fun is-round (Thing) Bool)
(declare-fun is-blue (Thing) Bool)
(declare-fun is-rough (Thing) Bool)
(declare-fun is-young (Thing) Bool)

; 3. Declare constants
(declare-const squirrel Thing)

; 4. Assert knowledge base (facts)
; Fact: The squirrel is kind
(assert (is-kind squirrel))

; 5. Assert knowledge base (rules)
; Rule: If something is round and blue then it is rough
(assert (forall ((x Thing))
  (=> (and (is-round x) (is-blue x))
      (is-rough x))))

; Rule: If something is round and not kind then it is not young
(assert (forall ((x Thing))
  (=> (and (is-round x) (not (is-kind x)))
      (not (is-young x)))))

; Rule: All kind things are blue
(assert (forall ((x Thing))
  (=> (is-kind x)
      (is-blue x))))

; Rule: All round things are blue
(assert (forall ((x Thing))
  (=> (is-round x)
      (is-blue x))))

; Rule: If something is kind and blue then it is round
(assert (forall ((x Thing))
  (=> (and (is-kind x) (is-blue x))
      (is-round x))))

; Rule: If the squirrel is rough then the squirrel is round
(assert (=> (is-rough squirrel)
            (is-round squirrel)))

; 6. Test: The squirrel is not blue
; We assert the negation of "The squirrel is blue" to check for contradiction
(assert (not (is-blue squirrel)))

; 7. Check satisfiability
; Expected: unsat (The statement contradicts the knowledge base)
(check-sat)
(get-model)