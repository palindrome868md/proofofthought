;------------------------------------------------------------
;  SMT‑LIB 2.0 encoding of the claim‑eligibility rules
;------------------------------------------------------------

;--- Sorts ---------------------------------------------------
(declare-sort Person 0)
(declare-sort Illness 0)

;--- Predicates / Functions ----------------------------------
; Service after 5 Apr 2005
(declare-fun servedAfter2005 (Person) Bool)

; Illness is a late‑onset condition (onset after the service period)
(declare-fun lateOnset (Person Illness) Bool)

; Eligibility to claim under the Armed Forces Compensation Scheme
(declare-fun eligible (Person Illness) Bool)

;--- Constants -----------------------------------------------
(declare-const me Person)          ; the asker
(declare-const ptss Illness)       ; post‑traumatic stress disorder

;--- Knowledge Base -------------------------------------------
; The asker served in the Royal Engineers in Afghanistan 2012‑2013,
; which is after 5 Apr 2005 → servedAfter2005 is true.
(assert (servedAfter2005 me))

; The PTSD symptoms have appeared only recently → it is a late‑onset illness.
(assert (lateOnset me ptss))

; Rule from the document:
; If a person served after 5 Apr 2005 **and** the illness is a late‑onset
; condition, then the person is eligible to claim.
(assert (forall ((p Person) (i Illness))
        (=> (and (servedAfter2005 p) (lateOnset p i))
            (eligible p i))))

;--- Test the specific question -------------------------------
; Can the asker claim for PTSD?
(assert (eligible me ptss))

;--- Check the result -----------------------------------------
(check-sat)      ; sat  → claim is allowed
(get-model)