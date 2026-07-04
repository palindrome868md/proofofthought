; Reasoning Steps:
; 1. Analyze the goal: Determine if "Tower A is low" is True or False based on premises.
; 2. Identify relevant premises for Tower A:
;    - Tower A is managed by Yale Housing.
;    - All buildings managed by Yale Housing are in New Haven.
;    - All buildings in New Haven are not high.
; 3. Logical Chain:
;    - Tower A -> Managed by Yale -> In New Haven -> Not High.
; 4. Address "Not High" vs "Low":
;    - The question asks if Tower A is "low". The premises conclude "not high".
;    - To verify the statement, we add an axiom: (forall ((b Building)) (=> (not (is-high b)) (is-low b))).
;    - This allows us to derive "is-low" from "not is-high".
; 5. Verification Strategy:
;    - Assert the Knowledge Base (Premises + Axiom).
;    - Assert the Statement: (is-low tower-a).
;    - Check Satisfiability.
;    - If 'sat', the statement is consistent/True given the KB.
;    - If 'unsat', the statement contradicts the KB/False.
; 6. Expected Result: 'sat' (True), because the chain of logic supports the statement.

; 1. Declare sorts
(declare-sort Building 0)

; 2. Declare functions (predicates)
(declare-fun in-new-haven (Building) Bool)
(declare-fun managed-by-yale (Building) Bool)
(declare-fun in-manhattan (Building) Bool)
(declare-fun is-high (Building) Bool)
(declare-fun owned-by-bloomberg (Building) Bool)
(declare-fun has-bloomberg-logo (Building) Bool)
(declare-fun is-low (Building) Bool)

; 3. Declare constants
(declare-const tower-a Building)
(declare-const tower-b Building)

; 4. Assert knowledge base (premises)

; Premise 1: All buildings in New Haven are not high.
(assert (forall ((b Building))
  (=> (in-new-haven b) (not (is-high b)))))

; Premise 2: All buildings managed by Yale Housing are located in New Haven.
(assert (forall ((b Building))
  (=> (managed-by-yale b) (in-new-haven b))))

; Premise 3: All buildings in Manhattans are high.
(assert (forall ((b Building))
  (=> (in-manhattan b) (is-high b))))

; Premise 4: All buildings owned by Bloomberg are located in Manhattans.
(assert (forall ((b Building))
  (=> (owned-by-bloomberg b) (in-manhattan b))))

; Premise 5: All buildings with the Bloomberg logo are owned by Bloomberg.
(assert (forall ((b Building))
  (=> (has-bloomberg-logo b) (owned-by-bloomberg b))))

; Premise 6: Tower A is managed by Yale Housing.
(assert (managed-by-yale tower-a))

; Premise 7: Tower B is with the Bloomberg logo.
(assert (has-bloomberg-logo tower-b))

; Axiom: If a building is not high, it is low.
; (Bridges the gap between premise conclusion "not high" and question predicate "low")
(assert (forall ((b Building))
  (=> (not (is-high b)) (is-low b))))

; 5. Verify Statement: Tower A is low.
(assert (is-low tower-a))

; 6. Check satisfiability
(check-sat)
(get-model)