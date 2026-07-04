; SMT-LIB 2.0 Program to verify probate entitlement rules
; Question: Can children stop a step-parent from handling their deceased parent's probate affairs?
; Based on the provided document regarding intestacy (no will) rules.

; 1. Declare Sorts
(declare-sort Person 0)

; 2. Declare Functions
; Entitlement score: Lower number means higher priority (Spouse=1, Child=2)
(declare-fun entitlement-score (Person) Int)
; Eligibility to apply
(declare-fun is-eligible (Person) Bool)
; Whether the person is the administrator
(declare-fun is-administrator (Person) Bool)
; Relationship predicates
(declare-fun is-spouse (Person Person) Bool)
(declare-fun is-child (Person Person) Bool)

; 3. Declare Constants
(declare-const father Person)
(declare-const step-mother Person)
(declare-const child Person)

; 4. Assert Knowledge Base (Probate Rules from Document)

; Rule 1: Entitlement Order (Intestacy)
; "Relatives are the most entitled inheritors in the following order: 
;  husband, wife or civil partner... children"
; We map this to scores: Spouse = 1, Child = 2.
; Assumption: "Step-mother" implies legal spouse/wife in this context. 
; (If she were merely a partner, she would be ineligible per document).
(assert (= (entitlement-score step-mother) 1))
(assert (= (entitlement-score child) 2))

; Rule 2: Eligibility
; Spouses and Children are eligible to apply.
(assert (is-eligible step-mother))
(assert (is-eligible child))

; Rule 3: Administrator Selection
; "You can apply to become the estate's administrator if you are... the most 'entitled' inheritor"
; Logic: If X is administrator, then for all eligible Y, X's score <= Y's score.
; Grounded for this scenario: If Child is Admin, Child's score <= Step-mother's score.
(assert (forall ((p Person) (q Person))
  (=> (and (is-administrator p) (is-eligible q))
      (<= (entitlement-score p) (entitlement-score q)))))

; 5. Assert Scenario Facts
; Father died without a will (intestate).
; Step-mother is the spouse of the father.
(assert (is-spouse step-mother father))
; Child is the child of the father.
(assert (is-child child father))

; 6. Verification Test
; Question: "Can children stop a step-parent from handling...?"
; Test: Assert that the Child IS the administrator (implying they successfully stopped the step-parent).
; If this leads to 'unsat', then the Child CANNOT be administrator while Step-mother is eligible with higher priority.
(assert (is-administrator child))

; 7. Check Satisfiability
(check-sat)
; Expected: unsat (because Child's score (2) is not <= Step-mother's score (1))
; This means the statement "Child is administrator" contradicts the entitlement rules.
; Therefore, children cannot stop the step-parent (spouse) from handling affairs.

(get-model)