; -------------------------------------------------
; 1. SORTS
; -------------------------------------------------
(declare-sort Person 0)
(declare-sort Benefit 0)

; -------------------------------------------------
; 2. FUNCTIONS / PREDICATES
; -------------------------------------------------
(declare-fun pregnant_weeks (Person) Int)          ; weeks of pregnancy
(declare-fun employed      (Person) Bool)          ; employed / self‑employed
(declare-fun earned_30plus (Person) Bool)          ; earned ≥ £30 in ≥13 weeks
(declare-fun eligible      (Person) Bool)          ; eligible for MA
(declare-fun receives_MA   (Person) Bool)          ; actually receives MA
(declare-fun affects       (Person Benefit) Bool) ; MA affects this benefit

; -------------------------------------------------
; 3. CONSTANTS (the person and some benefits)
; -------------------------------------------------
(declare-const me Person)
(declare-const jsa Benefit)          ; Jobseeker’s Allowance
(declare-const universal_credit Benefit)
(declare-const tax_credits Benefit)  ; NOT affected

; -------------------------------------------------
; 4. KNOWLEDGE BASE (rules from the document)
; -------------------------------------------------
; Eligibility rule (simplified):
(assert (forall ((p Person))
  (=> (and (>= (pregnant_weeks p) 26)
           (employed p)
           (earned_30plus p))
      (eligible p))))

; If eligible, the claimant can receive MA:
(assert (forall ((p Person))
  (=> (eligible p) (receives_MA p))))

; Impact rules – list of benefits that are affected:
(assert (forall ((p Person) (b Benefit))
  (=> (and (receives_MA p)
           (or (= b jsa)
               (= b universal_credit)))   ; add more affected benefits as needed
      (affects p b))))

; Tax credits are NOT affected:
(assert (forall ((p Person) (b Benefit))
  (=> (and (receives_MA p) (= b tax_credits))
      (not (affects p b)))))

; -------------------------------------------------
; 5. SCENARIO FACTS
; -------------------------------------------------
(assert (= (pregnant_weeks me) 30))    ; 30 weeks pregnant (≥26)
(assert (employed me))                ; still employed
(assert (earned_30plus me))           ; earned at least £30 in required weeks

; From the rules we can deduce eligibility & receipt of MA:
(assert (eligible me))                ; we claim eligibility holds
(assert (receives_MA me))             ; therefore she receives MA

; -------------------------------------------------
; 6. TEST QUESTIONS
; -------------------------------------------------
; (a) Is she eligible?  – already asserted above.
; (b) Does MA affect other benefits she is getting?
;    We test one affected benefit (JSA) and one not‑affected (Tax Credits).
(assert (affects me jsa))            ; should be true
(assert (not (affects me tax_credits))) ; should be true

; -------------------------------------------------
; 7. CHECK SATISFIABILITY
; -------------------------------------------------
(check-sat)
(get-model)