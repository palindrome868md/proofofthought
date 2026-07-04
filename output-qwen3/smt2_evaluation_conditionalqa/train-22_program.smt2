; SMT-LIB 2.0 Program: Annulment Eligibility Check
; Question: Can I get an annulment given an abusive marriage of 1 year?

; ==================== SORTS ====================
(declare-sort Person 0)

; ==================== FUNCTIONS ====================
; Marriage properties
(declare-fun marriage-duration-years () Int)
(declare-fun meets-residency-requirement () Bool)
(declare-fun marriage-void () Bool)
(declare-fun marriage-voidable () Bool)

; Scenario-specific facts
(declare-fun spouse-abusive () Bool)
(declare-fun closely-related () Bool)
(declare-fun under-age-16 () Bool)
(declare-fun already-married () Bool)
(declare-fun not-consummated () Bool)
(declare-fun forced-consent () Bool)
(declare-fun spouse-has-std () Bool)
(declare-fun spouse-pregnant-by-other () Bool)
(declare-fun spouse-transitioning () Bool)

; Decision function
(declare-fun can-get-annulment () Bool)

; ==================== KNOWLEDGE BASE ====================
; Rule 1: To get annulment, must meet residency requirement
; (lived in England/Wales 1 year OR permanent home 6 months)
(assert (=> can-get-annulment meets-residency-requirement))

; Rule 2: To get annulment, marriage must be void OR voidable
(assert (=> can-get-annulment (or marriage-void marriage-voidable)))

; Rule 3: Void marriage conditions (from document)
; Marriage is void if: closely related, under 16, or already married
(assert (=> marriage-void (or closely-related under-age-16 already-married)))

; Rule 4: Voidable marriage conditions (from document)
; Marriage is voidable if: not consummated, forced consent, STD, 
; pregnant by other, or spouse transitioning
(assert (=> marriage-voidable 
            (or not-consummated 
                forced-consent 
                spouse-has-std 
                spouse-pregnant-by-other 
                spouse-transitioning)))

; Rule 5: Abuse is NOT a valid ground for annulment (it's for divorce)
; This is critical: abuse alone does not make marriage void or voidable
(assert (=> spouse-abusive (not marriage-void)))
(assert (=> spouse-abusive (not marriage-voidable)))

; ==================== SCENARIO FACTS ====================
; From the question scenario:
(assert (= marriage-duration-years 1))
(assert meets-residency-requirement)  ; Assume residency is met
(assert spouse-abusive)               ; Abusive husband (given)

; No other annulment grounds are present in the scenario:
(assert (not closely-related))
(assert (not under-age-16))
(assert (not already-married))
(assert (not not-consummated))
(assert (not forced-consent))
(assert (not spouse-has-std))
(assert (not spouse-pregnant-by-other))
(assert (not spouse-transitioning))

; ==================== VERIFICATION ====================
; Test: Can I get an annulment?
; We assert can-get-annulment and check if it's satisfiable
; If unsat, then annulment is NOT possible given the facts
(assert can-get-annulment)

; ==================== SOLVER COMMANDS ====================
(check-sat)
(get-model)

; ==================== EXPECTED RESULT ====================
; Expected: unsat
; Reasoning: 
; - Abuse is NOT a valid ground for annulment per the document
; - No void or voidable conditions are met in the scenario
; - Therefore, can-get-annulment contradicts the knowledge base
; - Answer to "Can I get an annulment?" = NO (based on abuse alone)
; Note: The person may qualify for DIVORCE instead, but not ANNULMENT