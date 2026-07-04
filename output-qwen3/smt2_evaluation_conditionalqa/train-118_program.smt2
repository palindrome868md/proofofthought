; SMT-LIB 2.0 Program for Maternity Allowance Eligibility Verification
; Question: Can a person 6 months pregnant with their first child apply for maternity allowances?

; 1. Declare sorts
(declare-sort Person 0)
(declare-sort Benefit 0)
(declare-sort Location 0)
(declare-sort MaternityAllowance 0)

; 2. Declare functions
(declare-fun is-first-child (Person) Bool)
(declare-fun is-pregnant (Person) Bool)
(declare-fun weeks-pregnant (Person) Int)
(declare-fun receives-qualifying-benefit (Person) Bool)
(declare-fun lives-in-scotland (Person) Bool)
(declare-fun lives-in-uk (Person) Bool)
(declare-fun can-apply-sure-start-grant (Person) Bool)
(declare-fun can-apply-pregnancy-baby-payment (Person) Bool)
(declare-fun can-apply-maternity-allowance (Person) Bool)

; 3. Declare constants
(declare-const applicant Person)
(declare-const scotland Location)
(declare-const rest-of-uk Location)

; 4. Knowledge Base (from Sure Start Maternity Grant document)

; Rule 1: First child qualifies for Sure Start Grant (basic eligibility)
(assert (forall ((p Person))
  (=> (is-first-child p)
      (can-apply-sure-start-grant p))))

; Rule 2: Scotland residents cannot get Sure Start Grant
(assert (forall ((p Person))
  (=> (lives-in-scotland p)
      (not (can-apply-sure-start-grant p)))))

; Rule 3: Scotland residents can apply for Pregnancy and Baby Payment instead
(assert (forall ((p Person))
  (=> (lives-in-scotland p)
      (can-apply-pregnancy-baby-payment p))))

; Rule 4: To receive Sure Start Grant, must have qualifying benefit
(assert (forall ((p Person))
  (=> (can-apply-sure-start-grant p)
      (=> (receives-qualifying-benefit p)
          (can-apply-maternity-allowance p)))))

; Rule 5: Pregnancy and Baby Payment also counts as maternity allowance
(assert (forall ((p Person))
  (=> (can-apply-pregnancy-baby-payment p)
      (can-apply-maternity-allowance p))))

; Rule 6: UK residents can apply for some form of maternity allowance
(assert (forall ((p Person))
  (=> (lives-in-uk p)
      (or (can-apply-sure-start-grant p)
          (can-apply-pregnancy-baby-payment p)))))

; 5. Scenario Facts (from the question)
; Person is 6 months pregnant with first child
(assert (is-pregnant applicant))
(assert (is-first-child applicant))
(assert (= (weeks-pregnant applicant) 24))  ; 6 months ≈ 24 weeks
(assert (lives-in-uk applicant))

; 6. Verification Test
; Question: Am I allowed to apply for any form of maternity allowances?
; We test if it's POSSIBLE for the applicant to qualify (satisfiable = yes)
; We don't assert Scotland status or benefit status - let Z3 find a valid model
(assert (can-apply-maternity-allowance applicant))

; 7. Check satisfiability
(check-sat)
(get-model)