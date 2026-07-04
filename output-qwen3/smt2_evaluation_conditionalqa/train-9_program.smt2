; Declare sorts
(declare-sort Person 0)
(declare-sort Pension 0)

; Declare functions
(declare-fun receives-pension (Person Pension) Bool)
(declare-fun is-war-widow-pension (Pension) Bool)
(declare-fun must-pay-tax (Person Pension) Bool)
(declare-fun eligible-for-pension (Person Pension) Bool)

; Declare constants
(declare-const widow Person)
(declare-const war-widow-pension Pension)

; Knowledge Base from Document

; Rule: War Widow's or Widower's Pension is tax-free
(assert (forall ((p Person) (pen Pension))
  (=> (and (receives-pension p pen) (is-war-widow-pension pen))
      (not (must-pay-tax p pen)))))

; Fact: This is a War Widow Pension
(assert (is-war-widow-pension war-widow-pension))

; Fact: The widow is eligible for War Widow Pension (husband died from service injury)
; Husband served before 6 April 2005 (2001 Afghanistan)
; Husband died in 2007 from injury sustained during service
(assert (eligible-for-pension widow war-widow-pension))

; Fact: Widow receives the pension (as stated in scenario - assessed and eligible)
(assert (receives-pension widow war-widow-pension))

; Test Question: Do I have to pay tax on War Widow Pension?
; We assert that tax MUST be paid and check if this is satisfiable
(assert (must-pay-tax widow war-widow-pension))

; Check satisfiability
(check-sat)
; Expected: unsat (meaning you do NOT have to pay tax)

; Get model to see the contradiction
(get-model)