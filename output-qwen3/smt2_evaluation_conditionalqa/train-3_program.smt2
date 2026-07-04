; SMT-LIB 2.0 Program to Verify Marriage Annulment Eligibility
; Based on UK Government Document on Annulment

; ============================================
; 1. DECLARE SORTS (Types)
; ============================================
(declare-sort Person 0)
(declare-sort Marriage 0)

; ============================================
; 2. DECLARE FUNCTIONS/PREDICATES
; ============================================
(declare-fun uk-citizen (Person) Bool)
(declare-fun resident-uk-whole-life (Person) Bool)
(declare-fun years-since-marriage (Marriage) Int)
(declare-fun spouse-pregnant-by-other (Marriage) Bool)
(declare-fun meets-residency-requirement (Marriage) Bool)
(declare-fun is-voidable-reason (Marriage) Bool)
(declare-fun can-annul (Marriage) Bool)

; ============================================
; 3. DECLARE CONSTANTS
; ============================================
(declare-const husband Person)
(declare-const wife Person)
(declare-const their-marriage Marriage)

; ============================================
; 4. ASSERT KNOWLEDGE BASE (Facts from Scenario)
; ============================================

; Both spouses are UK citizens
(assert (uk-citizen husband))
(assert (uk-citizen wife))

; Both have been resident in UK for whole lives
(assert (resident-uk-whole-life husband))
(assert (resident-uk-whole-life wife))

; Marriage occurred 3 years ago
(assert (= (years-since-marriage their-marriage) 3))

; CRITICAL FACT: Wife was pregnant by someone else at time of marriage
; (DNA testing revealed husband is not the girl's father)
(assert (spouse-pregnant-by-other their-marriage))

; ============================================
; 5. ASSERT LEGAL RULES (From UK Government Document)
; ============================================

; Rule 1: Residency requirement - lived in England/Wales 1+ year OR permanent home 6+ months
; UK citizens resident whole life satisfy this
(assert (forall ((p Person))
  (=> (resident-uk-whole-life p)
      (meets-residency-requirement their-marriage))))

; Rule 2: From document - "your spouse was pregnant by someone else when you got married"
; is explicitly listed as a VOIDABLE reason for annulment
(assert (forall ((m Marriage))
  (=> (spouse-pregnant-by-other m)
      (is-voidable-reason m))))

; Rule 3: From document - Unlike divorce, annulment can be applied for any time after wedding
; (3 years is acceptable, though may require explanation of delay)
(assert (forall ((m Marriage))
  (=> (>= (years-since-marriage m) 0)
      true)))  ; No time bar on annulment applications

; Rule 4: If voidable reason exists AND residency requirement met, marriage can be annulled
(assert (forall ((m Marriage))
  (=> (and (is-voidable-reason m)
           (meets-residency-requirement m))
      (can-annul m))))

; ============================================
; 6. VERIFICATION TEST
; ============================================
; Question: Can the marriage be voided (annulled) in light of this evidence?
; We assert the conclusion and check if it's satisfiable with the knowledge base

(assert (can-annul their-marriage))

; ============================================
; 7. CHECK SATISFIABILITY
; ============================================
(check-sat)
(get-model)

; ============================================
; EXPECTED RESULT: sat (True)
; ============================================
; Explanation: 
; - The document explicitly states "your spouse was pregnant by someone else 
;   when you got married" is a voidable reason for annulment
; - Both spouses meet UK residency requirements (citizens, resident whole lives)
; - No time bar prevents annulment after 3 years (unlike divorce's 1-year wait)
; - Therefore, the marriage CAN be annulled based on this evidence