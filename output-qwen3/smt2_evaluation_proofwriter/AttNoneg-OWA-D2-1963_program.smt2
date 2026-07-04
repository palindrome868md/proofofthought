; Reasoning Process:
; 1. Identify Entities: Bob, Erin.
; 2. Identify Properties: Smart, Cold, Young, White, Kind, Furry, Rough.
; 3. Analyze Knowledge Base for Erin:
;    - Fact: Erin is young.
;    - Rule: Young things are smart. -> Inference: Erin is smart.
;    - Fact: Erin is cold.
;    - Rule: All cold, smart things are rough. -> Inference: Erin is rough.
; 4. Analyze Question: "Erin is not rough."
;    - This contradicts the inference that Erin is rough.
;    - Expected SMT Result: unsat (The statement is False).
; 5. Construct SMT2 Program:
;    - Declare Sort 'Thing'.
;    - Declare Predicates for properties.
;    - Declare Constants 'bob' and 'erin'.
;    - Assert all facts and rules.
;    - Assert the question statement (not (is-rough erin)).
;    - Check satisfiability.

; 1. Declare sorts
(declare-sort Thing 0)

; 2. Declare functions (predicates)
(declare-fun is-smart (Thing) Bool)
(declare-fun is-cold (Thing) Bool)
(declare-fun is-young (Thing) Bool)
(declare-fun is-white (Thing) Bool)
(declare-fun is-kind (Thing) Bool)
(declare-fun is-furry (Thing) Bool)
(declare-fun is-rough (Thing) Bool)

; 3. Declare constants
(declare-const bob Thing)
(declare-const erin Thing)

; 4. Assert knowledge base (facts)
; Bob is smart.
(assert (is-smart bob))
; Erin is cold.
(assert (is-cold erin))
; Erin is young.
(assert (is-young erin))
; If Bob is white and Bob is cold then Bob is kind.
(assert (=> (and (is-white bob) (is-cold bob)) (is-kind bob)))
; Furry things are cold.
(assert (forall ((t Thing)) (=> (is-furry t) (is-cold t))))
; All furry things are white.
(assert (forall ((t Thing)) (=> (is-furry t) (is-white t))))
; All cold, smart things are rough.
(assert (forall ((t Thing)) (=> (and (is-cold t) (is-smart t)) (is-rough t))))
; Young things are smart.
(assert (forall ((t Thing)) (=> (is-young t) (is-smart t))))
; If Bob is white then Bob is young.
(assert (=> (is-white bob) (is-young bob)))

; 5. Verification: "Erin is not rough."
; Assert the statement to test its consistency with the KB.
; Logic: Erin is Young -> Smart. Erin is Cold. Cold + Smart -> Rough.
; Therefore, asserting (not (is-rough erin)) should lead to a contradiction.
(assert (not (is-rough erin)))

; 6. Check satisfiability
(check-sat)
(get-model)