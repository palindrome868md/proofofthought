; SMT-LIB 2.0 Program to verify PTSD claim eligibility with late onset
; Based on Armed Forces Compensation Scheme (AFCS) rules

; Declare sorts
(declare-sort Person 0)
(declare-sort Illness 0)
(declare-sort Scheme 0)

; Declare constants for schemes and entities
(declare-const AFCS Scheme)
(declare-const claimant Person)
(declare-const ptsd Illness)

; Declare functions/predicates
(declare-fun served-after-2005 (Person) Bool)
(declare-fun service-related (Person Illness) Bool)
(declare-fun late-onset (Person Illness) Bool)
(declare-fun can-claim (Person Illness Scheme) Bool)
(declare-fun within-7-year-limit (Person Illness) Bool)

; =============================================================================
; KNOWLEDGE BASE - Rules from the document
; =============================================================================

; Rule 1: Can claim for mental conditions from service (AFCS applies after 2005)
(assert (forall ((p Person) (i Illness))
  (=> (and (served-after-2005 p)
           (service-related p i))
      (can-claim p i AFCS))))

; Rule 2: 7-year time limit normally applies for AFCS claims
(assert (forall ((p Person) (i Illness))
  (=> (and (served-after-2005 p)
           (service-related p i)
           (not (late-onset p i)))
      (within-7-year-limit p i))))

; Rule 3: LATE ONSET ILLNESS EXCEPTION - Can claim even after 7 years
; Document states: "applying no later than 7 years after the injury or illness, 
; unless you're claiming for an illness that started later (sometimes known as 
; a 'late onset illness')"
(assert (forall ((p Person) (i Illness))
  (=> (and (served-after-2005 p)
           (service-related p i)
           (late-onset p i))
      (can-claim p i AFCS))))

; Rule 4: PTSD is a valid mental condition for claims
(assert (forall ((p Person))
  (=> (service-related p ptsd)
      (can-claim p ptsd AFCS))))

; =============================================================================
; SCENARIO FACTS - From the question
; =============================================================================

; Fact 1: Served in Afghanistan 2012-13 (after 5 April 2005)
(assert (served-after-2005 claimant))

; Fact 2: PTSD is service-related (traumatic flashbacks from war service)
(assert (service-related claimant ptsd))

; Fact 3: Late onset - symptoms began recently, not during service
(assert (late-onset claimant ptsd))

; =============================================================================
; VERIFICATION TEST
; =============================================================================
; Question: Can I claim for Post-Traumatic Stress, given the lateness of onset?
; We assert the claim is possible and check satisfiability
; sat = YES, can claim | unsat = NO, cannot claim

(assert (can-claim claimant ptsd AFCS))

; Check satisfiability
(check-sat)
(get-model)

; =============================================================================
; EXPECTED RESULT: sat (True)
; Reasoning: The claimant served after 2005 (AFCS applies), has a service-related
; mental condition (PTSD), and qualifies for the late-onset illness exception
; which overrides the 7-year time limit. Therefore, they CAN claim.
; =============================================================================