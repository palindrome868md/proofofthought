; SMT-LIB 2.0 Program for DMPS Eligibility Verification
; Question: Can the uncle claim DMPS and be compensated for health damages?

; Declare sorts
(declare-sort Person 0)

; Declare functions for medical and employment conditions
(declare-fun has-diffuse-mesothelioma (Person) Bool)
(declare-fun asbestos-work-exposure (Person) Bool)
(declare-fun exposure-in-uk (Person) Bool)
(declare-fun employer-traceable (Person) Bool)
(declare-fun civil-claim-made (Person) Bool)
(declare-fun damages-received (Person) Bool)
(declare-fun eligible-for-dmps (Person) Bool)

; Declare the person in question
(declare-const uncle Person)

; ============================================
; SCENARIO FACTS (from the given situation)
; ============================================

; Uncle diagnosed with mesothelioma
(assert (has-diffuse-mesothelioma uncle))

; Asbestos exposure during work period
(assert (asbestos-work-exposure uncle))

; Work exposure occurred in UK
(assert (exposure-in-uk uncle))

; Employers are known and traceable (described as "irresponsible" implying they exist)
(assert (employer-traceable uncle))

; No civil claim has been made yet
(assert (not (civil-claim-made uncle)))

; No damages have been received yet
(assert (not (damages-received uncle)))

; ============================================
; DMPS ELIGIBILITY RULES (from government document)
; ============================================

; To be eligible for DMPS, ALL conditions must be met:
; 1. Diagnosed with diffuse mesothelioma
; 2. Asbestos exposure when working in UK
; 3. CANNOT trace employer or their insurers (CRITICAL)
; 4. No civil claim against employer/insurer
; 5. No damages or specified payment received

(assert (forall ((p Person))
  (=> (eligible-for-dmps p)
      (and (has-diffuse-mesothelioma p)
           (asbestos-work-exposure p)
           (exposure-in-uk p)
           (not (employer-traceable p))  ; KEY CONSTRAINT: employer must NOT be traceable
           (not (civil-claim-made p))
           (not (damages-received p))))))

; ============================================
; VERIFICATION TEST
; ============================================

; Test whether uncle can claim DMPS by asserting eligibility
(assert (eligible-for-dmps uncle))

; Check satisfiability
(check-sat)
(get-model)

; Expected result: unsat
; Reason: employer-traceable is asserted as true, but eligible-for-dmps requires it to be false
; Conclusion: Uncle CANNOT claim DMPS (but may pursue civil compensation against known employers)