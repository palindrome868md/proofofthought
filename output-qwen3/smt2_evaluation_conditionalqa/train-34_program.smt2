; DLA Eligibility Verification for Child with AML
; Question: Can parent claim Disability Living Allowance for 9-year-old daughter with leukemia?

; 1. Declare sorts
(declare-sort Person 0)
(declare-sort MedicalCondition 0)

; 2. Declare functions for eligibility criteria
(declare-fun age (Person) Int)
(declare-fun has-medical-condition (Person MedicalCondition) Bool)
(declare-fun needs-extra-care (Person) Bool)
(declare-fun has-walking-difficulty (Person) Bool)
(declare-fun condition-duration-months (Person MedicalCondition) Int)
(declare-fun condition-expected-duration-months (Person MedicalCondition) Int)
(declare-fun is-terminally-ill (Person) Bool)
(declare-fun lives-in-gb (Person) Bool)
(declare-fun months-lived-in-gb (Person) Int)
(declare-fun is-uk-citizen (Person) Bool)
(declare-fun subject-to-immigration-control (Person) Bool)
(declare-fun is-parent-or-guardian (Person Person) Bool)
(declare-fun eligible-for-dla (Person) Bool)
(declare-fun can-claim-dla-for (Person Person) Bool)

; 3. Declare constants
(declare-const daughter Person)
(declare-const parent Person)
(declare-const aml MedicalCondition)

; 4. Knowledge Base - DLA Eligibility Rules

; Rule 1: Child must be under 16 to qualify for DLA (over 16 must apply for PIP)
(assert (forall ((child Person))
  (=> (eligible-for-dla child)
      (< (age child) 16))))

; Rule 2: Child must need extra care OR have walking difficulty
(assert (forall ((child Person))
  (=> (eligible-for-dla child)
      (or (needs-extra-care child)
          (has-walking-difficulty child)))))

; Rule 3: Duration requirement - condition must exist 3+ months and expected 6+ months
; Exception: terminally ill children don't need 3-month history
(assert (forall ((child Person) (cond MedicalCondition))
  (=> (and (eligible-for-dla child)
           (has-medical-condition child cond)
           (not (is-terminally-ill child)))
      (and (>= (condition-duration-months child cond) 3)
           (>= (condition-expected-duration-months child cond) 6)))))

; Rule 4: Residence requirements - must live in GB, 6+ months in last 12 (if over 3)
(assert (forall ((child Person))
  (=> (and (eligible-for-dla child)
           (>= (age child) 3))
      (and (lives-in-gb child)
           (>= (months-lived-in-gb child) 6)))))

; Rule 5: Must be UK citizen or habitually resident, not subject to immigration control
(assert (forall ((child Person))
  (=> (eligible-for-dla child)
      (and (is-uk-citizen child)
           (not (subject-to-immigration-control child))))))

; Rule 6: Parent or guardian can claim for eligible child
(assert (forall ((claimant Person) (child Person))
  (=> (and (is-parent-or-guardian claimant child)
           (eligible-for-dla child))
      (can-claim-dla-for claimant child))))

; 5. Scenario Facts

; Daughter is 9 years old
(assert (= (age daughter) 9))

; Daughter has AML (leukemia)
(assert (has-medical-condition daughter aml))

; Daughter needs intensive care (extra looking after)
(assert (needs-extra-care daughter))

; AML requires intensive care over next few months (6+ months expected)
(assert (= (condition-expected-duration-months daughter aml) 6))

; Daughter is not terminally ill (AML is treatable)
(assert (not (is-terminally-ill daughter)))

; Daughter lives in Great Britain
(assert (lives-in-gb daughter))

; Daughter has lived in UK all her life (9 years = 108 months)
(assert (= (months-lived-in-gb daughter) 108))

; Daughter is UK citizen
(assert (is-uk-citizen daughter))

; Daughter is not subject to immigration control
(assert (not (subject-to-immigration-control daughter)))

; Claimant is parent of daughter
(assert (is-parent-or-guardian parent daughter))

; 6. Test: Can parent claim DLA for daughter?
(assert (can-claim-dla-for parent daughter))

; 7. Check satisfiability
(check-sat)
(get-model)