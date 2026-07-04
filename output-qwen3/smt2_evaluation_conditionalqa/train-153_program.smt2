; SMT-LIB 2.0 Program to Verify Blind Person's Allowance Eligibility
; Question: Can she claim blind persons allowance with a large amount of savings?

; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions
(declare-fun has-certificate (Person) Bool)
(declare-fun registered-blind (Person) Bool)
(declare-fun cannot-do-eyesight-work (Person) Bool)
(declare-fun has-large-savings (Person) Bool)
(declare-fun savings-affect-eligibility () Bool)
(declare-fun eligible-for-blind-allowance (Person) Bool)

; 3. Declare constants
(declare-const sister Person)

; 4. Assert knowledge base (from document)

; Eligibility Rule 1 (England & Wales): registered blind + certificate = eligible
(assert (forall ((p Person))
  (=> (and (registered-blind p) (has-certificate p))
      (eligible-for-blind-allowance p))))

; Eligibility Rule 2 (Scotland & Northern Ireland): cannot do eyesight work + certificate = eligible
(assert (forall ((p Person))
  (=> (and (cannot-do-eyesight-work p) (has-certificate p))
      (eligible-for-blind-allowance p))))

; CRITICAL FACT: Blind Person's Allowance is NOT means-tested
; Document states it's a tax-free allowance based on vision status, not savings
; Savings do NOT affect eligibility
(assert (not (savings-affect-eligibility)))

; 5. Assert sister's scenario (from question)
(assert (has-certificate sister))  ; Has certificate from doctor due to accident
(assert (cannot-do-eyesight-work sister))  ; No longer able to work due to partial blindness
(assert (has-large-savings sister))  ; Has large savings from pay-out

; 6. Test: Can she claim blind person's allowance WITH large savings?
; If sat = YES (she can claim despite savings)
; If unsat = NO (savings prevent her from claiming)
(assert (eligible-for-blind-allowance sister))

; 7. Check satisfiability
(check-sat)
(get-model)