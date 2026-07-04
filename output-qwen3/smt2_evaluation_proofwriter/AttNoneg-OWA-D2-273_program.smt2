; Step-by-Step Reasoning:
; 1. Analyze the Question: The user asks to verify if "Bob is rough".
; 2. Analyze the Knowledge Base (KB):
;    - Explicit Fact: "Bob is rough" is stated directly in the premises.
;    - Other Facts: Bob is red, Charlie is smart.
;    - Rules: Various implications regarding properties (big, blue, young, kind, etc.).
; 3. Logical Deduction:
;    - Since "Bob is rough" is an explicit axiom in the KB, it is trivially true.
;    - There are no rules in the KB that imply (not (is-rough Bob)).
;    - Therefore, asserting (is-rough Bob) alongside the KB should be satisfiable (sat).
; 4. SMT2 Formulation:
;    - Declare a sort 'Thing' for entities.
;    - Declare constants 'Bob' and 'Charlie'.
;    - Declare predicates for properties (is-red, is-rough, etc.).
;    - Assert all KB facts and rules.
;    - Assert the question statement (is-rough Bob) as the verification constraint.
;    - Run (check-sat). Expected result: sat.

; --- SMT-LIB 2.0 Program ---

; 1. Declare Sorts
(declare-sort Thing 0)

; 2. Declare Constants
(declare-const Bob Thing)
(declare-const Charlie Thing)

; 3. Declare Functions (Predicates)
(declare-fun is-red (Thing) Bool)
(declare-fun is-rough (Thing) Bool)
(declare-fun is-smart (Thing) Bool)
(declare-fun is-big (Thing) Bool)
(declare-fun is-blue (Thing) Bool)
(declare-fun is-young (Thing) Bool)
(declare-fun is-kind (Thing) Bool)

; 4. Assert Knowledge Base (Facts)
; Bob is red.
(assert (is-red Bob))
; Bob is rough.
(assert (is-rough Bob))
; Charlie is smart.
(assert (is-smart Charlie))

; 5. Assert Knowledge Base (Rules)
; All big things are blue.
(assert (forall ((x Thing)) (=> (is-big x) (is-blue x))))
; If Charlie is big then Charlie is rough.
(assert (=> (is-big Charlie) (is-rough Charlie)))
; If Bob is kind and Bob is big then Bob is young.
(assert (=> (and (is-kind Bob) (is-big Bob)) (is-young Bob)))
; If Bob is young then Bob is big.
(assert (=> (is-young Bob) (is-big Bob)))
; All blue things are young.
(assert (forall ((x Thing)) (=> (is-blue x) (is-young x))))
; If something is red then it is blue.
(assert (forall ((x Thing)) (=> (is-red x) (is-blue x))))
; All smart things are kind.
(assert (forall ((x Thing)) (=> (is-smart x) (is-kind x))))
; If Charlie is smart then Charlie is kind.
(assert (=> (is-smart Charlie) (is-kind Charlie)))

; 6. Verification
; Question: Bob is rough.
; We assert the statement to check if it is consistent with the KB.
(assert (is-rough Bob))

; 7. Check Satisfiability
(check-sat)
(get-model)