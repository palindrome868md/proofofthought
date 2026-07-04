;-------------------------------------------------
;  Declarations
;-------------------------------------------------
(declare-sort Person 0)

; Boolean predicates describing the facts about a person
(declare-fun diagnosed_stage4 (Person) Bool)          ; has stage‑4 mesothelioma
(declare-fun diagnosed_after_2012 (Person) Bool)     ; diagnosis on/after 25‑Jul‑2012
(declare-fun exposure_at_work (Person) Bool)         ; asbestos exposure while working in the UK
(declare-fun employer_traced (Person) Bool)          ; employer (or insurer) can be traced
(declare-fun civil_claim_made (Person) Bool)         ; a civil claim has already been filed
(declare-fun received_damage_payment (Person) Bool) ; already received other compensation

; Derived predicates
(declare-fun can_claim_dmps (Person) Bool)           ; eligible for DMPS
(declare-fun compensated (Person) Bool)              ; receives compensation for health damages

;-------------------------------------------------
;  Knowledge base (facts about the uncle)
;-------------------------------------------------
(declare-const uncle Person)

(assert (diagnosed_stage4 uncle))
(assert (diagnosed_after_2012 uncle))          ; diagnosis is recent enough
(assert (exposure_at_work uncle))              ; work‑related asbestos exposure in the UK
(assert (not (employer_traced uncle)))         ; cannot trace the employer/insurer
(assert (not (civil_claim_made uncle)))        ; no civil claim has been filed
(assert (not (received_damage_payment uncle))) ; no other payment received yet

;-------------------------------------------------
;  Rules derived from the policy document
;-------------------------------------------------
; Eligibility for DMPS
(assert (forall ((p Person))
  (=> (and (diagnosed_stage4 p)
           (diagnosed_after_2012 p)
           (exposure_at_work p)
           (not (employer_traced p))
           (not (civil_claim_made p))
           (not (received_damage_payment p)))
      (can_claim_dmps p))))

; Receiving compensation follows from a successful DMPS claim
(assert (forall ((p Person))
  (=> (can_claim_dmps p) (compensated p))))

;-------------------------------------------------
;  Test the question: can the uncle claim DMPS AND be compensated?
;-------------------------------------------------
(assert (and (can_claim_dmps uncle) (compensated uncle)))

;-------------------------------------------------
;  Check the model
;-------------------------------------------------
(check-sat)
(get-model)