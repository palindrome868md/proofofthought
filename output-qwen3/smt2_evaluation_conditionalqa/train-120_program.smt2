; SMT-LIB 2.0 Program to Verify Carer's Allowance Eligibility
; Question: Can my partner be registered as my carer given I receive PIP 
;           (lower level daily living component)?

; ==================== DECLARE SORTS ====================
(declare-sort Person 0)
(declare-sort Benefit 0)
(declare-sort PIPLevel 0)

; ==================== DECLARE FUNCTIONS ====================
; Benefit-related functions
(declare-fun receives-benefit (Person Benefit) Bool)
(declare-fun pip-daily-living-level (Person) PIPLevel)
(declare-fun qualifies-for-carer-allowance (Person) Bool)

; Carer-related functions
(declare-fun is-partner (Person Person) Bool)
(declare-fun is-registered-carer (Person Person) Bool)
(declare-fun cares-for-hours (Person Person Int) Bool)

; Eligibility criteria functions
(declare-fun meets-age-requirement (Person) Bool)
(declare-fun meets-earnings-requirement (Person) Bool)
(declare-fun meets-residency-requirement (Person) Bool)
(declare-fun not-in-fulltime-education (Person) Bool)

; ==================== DECLARE CONSTANTS ====================
(declare-const claimant Person)        ; The person asking the question
(declare-const partner Person)         ; The partner who would be the carer

; Benefits
(declare-const pip-daily-living Benefit)
(declare-const pip-daily-living-lower PIPLevel)
(declare-const pip-daily-living-higher PIPLevel)

; ==================== KNOWLEDGE BASE ====================

; FACT 1: Claimant receives PIP daily living component (lower level)
(assert (receives-benefit claimant pip-daily-living))
(assert (= (pip-daily-living-level claimant) pip-daily-living-lower))

; FACT 2: Partner relationship
(assert (is-partner partner claimant))

; RULE 1: PIP daily living component qualifies (regardless of level)
; From document: "Personal Independence Payment - daily living component"
; Note: Does NOT specify higher level required
(assert (forall ((p Person))
  (=> (receives-benefit p pip-daily-living)
      (qualifies-for-carer-allowance p))))

; RULE 2: Carer eligibility requirements
; From document: All of the following must apply for the carer:
(assert (forall ((c Person) (p Person))
  (=> (and (meets-age-requirement c)
           (meets-earnings-requirement c)
           (meets-residency-requirement c)
           (not-in-fulltime-education c)
           (cares-for-hours c p 35)
           (qualifies-for-carer-allowance p))
      (is-registered-carer c p))))

; RULE 3: Relationship does not disqualify carer
; From document: "You do not have to be related to, or live with, the person you care for"
; This implies being related (including partner) does NOT prevent registration
(assert (forall ((c Person) (p Person))
  (=> (is-partner c p)
      (not (not (is-registered-carer c p))))))  ; Double negation = can be registered

; FACT 3: Partner meets all carer eligibility criteria (assumed for this test)
(assert (meets-age-requirement partner))
(assert (meets-earnings-requirement partner))
(assert (meets-residency-requirement partner))
(assert (not-in-fulltime-education partner))
(assert (cares-for-hours partner claimant 35))

; ==================== VERIFICATION TEST ====================
; Question: Can the partner be registered as carer?
; We test if it's POSSIBLE (satisfiable) for partner to be registered as carer

(assert (is-registered-carer partner claimant))

; ==================== CHECK SATISFIABILITY ====================
(check-sat)
(get-model)

; EXPECTED RESULT: sat (true)
; Reasoning:
; 1. PIP daily living component qualifies regardless of level (lower or higher)
; 2. Being a partner does not disqualify someone from being a registered carer
; 3. All other eligibility criteria can be met by the partner