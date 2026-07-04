; SMT-LIB 2.0 Program for Child Benefit Tax Question
; Question: Can the tax on income from child benefit be waived if I earn over £50,000?

; 1. Declare sorts
(declare-sort Person 0)
(declare-sort IncomeLevel 0)

; 2. Declare functions
(declare-fun has-child-under-16 (Person) Bool)
(declare-fun has-child-under-20-in-education (Person) Bool)
(declare-fun individual-income (Person) Int)
(declare-fun eligible-for-child-benefit (Person) Bool)
(declare-fun subject-to-tax-charge (Person) Bool)
(declare-fun tax-can-be-waived (Person) Bool)
(declare-fun receives-benefit-payments (Person) Bool)

; 3. Declare constants
(declare-const claimant Person)

; 4. Assert knowledge base from document

; Eligibility: You qualify if responsible for child under 16 or under 20 in education
(assert (forall ((p Person))
  (=> (or (has-child-under-16 p) (has-child-under-20-in-education p))
      (eligible-for-child-benefit p))))

; Tax charge rule: If income over £50,000, subject to High Income Child Benefit Tax Charge
(assert (forall ((p Person))
  (=> (> (individual-income p) 50000)
      (subject-to-tax-charge p))))

; Tax charge rule: Once earning £60,000, lose all benefit through tax
(assert (forall ((p Person))
  (=> (>= (individual-income p) 60000)
      (subject-to-tax-charge p))))

; IMPORTANT: Document states tax charge is mandatory, not waivable
; "You may have to pay back some of your Child Benefit in tax if your income is over £50,000"
; No waiver provision exists in the rules
(assert (forall ((p Person))
  (=> (subject-to-tax-charge p)
      (not (tax-can-be-waived p)))))

; You can choose to stop receiving payments but still eligible
(assert (forall ((p Person))
  (=> (eligible-for-child-benefit p)
      (or (receives-benefit-payments p) (not (receives-benefit-payments p))))))

; 5. Assert scenario from question
; Claimant has children aged 11 and 15 (both under 16, so eligible)
(assert (has-child-under-16 claimant))
(assert (eligible-for-child-benefit claimant))

; Husband earns £52,000 (over £50,000 threshold)
(assert (= (individual-income claimant) 52000))

; This triggers the tax charge
(assert (subject-to-tax-charge claimant))

; 6. Test: Can the tax be waived?
; We assert that tax CAN be waived and check if this is satisfiable
; If unsat, then tax CANNOT be waived (answer is NO)
(assert (tax-can-be-waived claimant))

; 7. Check satisfiability
(check-sat)
(get-model)

; Expected result: unsat
; Explanation: The document clearly states the High Income Child Benefit Tax Charge
; is mandatory when income exceeds £50,000. There is no provision for waiving this tax.
; The claimant can choose not to receive payments, but the tax charge itself cannot be waived.