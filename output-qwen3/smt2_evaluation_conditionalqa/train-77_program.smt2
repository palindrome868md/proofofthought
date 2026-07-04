; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions (predicates representing eligibility criteria and scenario facts)
(declare-fun is-full-time-student (Person) Bool)
(declare-fun has-eligible-children (Person) Bool)
(declare-fun eligible-for-student-finance (Person) Bool)
(declare-fun is-postgrad-loan-recipient (Person) Bool)
(declare-fun is-resident-england (Person) Bool)
(declare-fun claims-restricted-benefits (Person) Bool)
(declare-fun works-part-time (Person) Bool)
(declare-fun eligible-for-childcare-grant (Person) Bool)

; 3. Declare constants
(declare-const me Person)

; 4. Assert Knowledge Base (Rules from Document)
; Rule: To qualify for Childcare Grant, ALL eligibility conditions must apply.
; We model this as: If Eligible, then Conditions must be true.
; (eligible-for-childcare-grant p) => (and conditions...)
(assert (forall ((p Person))
  (=> (eligible-for-childcare-grant p)
      (and
        (is-full-time-student p)
        (has-eligible-children p)
        (eligible-for-student-finance p)
        (not (is-postgrad-loan-recipient p))
        (is-resident-england p)
        (not (claims-restricted-benefits p))
      ))))

; 5. Assert Scenario Facts
; Fact: "enrolled onto a 6 month full time training course"
; Interpretation: Treated as meeting the "full-time student" requirement for the purpose of checking work constraints.
(assert (is-full-time-student me))

; Fact: "working part time on top of attending education"
(assert (works-part-time me))

; Note: The document does not list "working part-time" as a disqualifying condition.
; It only restricts claiming specific benefits (Tax Credit, Universal Credit, etc.).
; We do not assert facts about children, residence, or finance eligibility as they are not specified in the scenario.
; The solver will determine if a valid model exists where these are true.

; 6. Verification
; Question: "Will I still be eligible for a help with childcare costs?"
; Strategy: Assert the claim (eligible-for-childcare-grant me) and check satisfiability.
; sat = True (Eligibility is consistent with rules and scenario)
; unsat = False (Eligibility contradicts rules or scenario)
(assert (eligible-for-childcare-grant me))

(check-sat)
(get-model)