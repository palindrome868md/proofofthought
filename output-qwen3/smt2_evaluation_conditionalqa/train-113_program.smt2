; SMT-LIB 2.0 Program to verify Mesothelioma Compensation Entitlement
; Question: Am I still entitled to compensation from the state even if I cannot trace my former employer?

; 1. Declare Sorts
(declare-sort Person 0)

; 2. Declare Functions (Predicates and Attributes)
; Diagnosis and Timing
(declare-fun has-mesothelioma (Person) Bool)
(declare-fun months-since-diagnosis (Person) Int)
(declare-fun diagnosis-date-valid (Person) Bool) ; On or after 25 July 2012 for DMPS

; Exposure Details
(declare-fun uk-exposure (Person) Bool)
(declare-fun employer-traceable (Person) Bool)
(declare-fun insurer-traceable (Person) Bool)

; Claim History
(declare-fun civil-claim-made (Person) Bool)
(declare-fun compensation-received (Person) Bool)
(declare-fun mod-scheme-entitled (Person) Bool) ; Ministry of Defence
(declare-fun pneumoconiosis-act-entitled (Person) Bool) ; 1979 Act

; Eligibility Flags
(declare-fun eligible-dmps (Person) Bool)
(declare-fun eligible-2008 (Person) Bool)
(declare-fun state-entitled (Person) Bool)

; 3. Declare Constants
(declare-const user Person)

; 4. Assert Knowledge Base (Rules)

; Rule: DMPS Eligibility
; Conditions: Diagnosed with diffuse mesothelioma, UK work exposure, 
; untraceable employer/insurer, no civil claim, no damages received, within 3 years.
(assert (forall ((p Person))
  (=> (and 
        (has-mesothelioma p)
        (diagnosis-date-valid p)
        (uk-exposure p)
        (or (not (employer-traceable p)) (not (insurer-traceable p)))
        (not (civil-claim-made p))
        (not (compensation-received p))
        (<= (months-since-diagnosis p) 36))
      (eligible-dmps p))))

; Rule: 2008 Scheme Eligibility
; Conditions: UK exposure, no other compensation/entitlement, within 12 months.
(assert (forall ((p Person))
  (=> (and 
        (has-mesothelioma p)
        (uk-exposure p)
        (not (pneumoconiosis-act-entitled p))
        (not (compensation-received p))
        (not (mod-scheme-entitled p))
        (<= (months-since-diagnosis p) 12))
      (eligible-2008 p))))

; Rule: State Entitlement
; Entitled if eligible for DMPS OR 2008 Scheme
(assert (forall ((p Person))
  (=> (or (eligible-dmps p) (eligible-2008 p))
      (state-entitled p))))

; 5. Assert Scenario Facts (The User's Situation)
; Age 54 (relevant for payment amount, not eligibility logic directly, but implies adult)
; Diagnosed 6 months ago
(assert (has-mesothelioma user))
(assert (= (months-since-diagnosis user) 6))
(assert (diagnosis-date-valid user)) ; Assumed true based on modern context of query
(assert (uk-exposure user)) ; Employed 2001-2005 in UK context
(assert (not (employer-traceable user))) ; Company no longer exists
(assert (not (insurer-traceable user))) ; Insurers untraceable
(assert (not (civil-claim-made user))) ; Looked into, but untraceable prevents claim
(assert (not (compensation-received user)))
(assert (not (mod-scheme-entitled user)))
(assert (not (pneumoconiosis-act-entitled user)))

; 6. Verification
; Question: Am I still entitled to compensation from the state?
; We assert the positive claim (Entitled) and check satisfiability.
; If SAT, it is possible/true given the KB. If UNSAT, it contradicts (False).
(assert (state-entitled user))

; 7. Check Satisfiability
(check-sat)
(get-model)