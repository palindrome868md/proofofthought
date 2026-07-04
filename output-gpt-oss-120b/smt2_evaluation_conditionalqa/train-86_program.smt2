;--- Sorts ---------------------------------------------------------
(declare-sort Person 0)

;--- Functions -----------------------------------------------------
; How many years the person has been missing
(declare-fun missing-years (Person) Int)

; Family relationship: (is-child child parent)
(declare-fun is-child (Person Person) Bool)

; Whether the claimant believes the missing person is dead
(declare-fun thinks-dead (Person) Bool)

; Whether a claimant can obtain a declaration of presumed death
(declare-fun can-get-death-certificate (Person Person) Bool)

; Sister's objection (recorded but not used in the eligibility rule)
(declare-fun sister-objection (Person) Bool)

;--- Constants -----------------------------------------------------
(declare-const me Person)          ; you, the claimant
(declare-const sister Person)      ; your sister
(declare-const father Person)      ; the missing father

;--- Knowledge base -----------------------------------------------
; Father has been missing for 5 years
(assert (= (missing-years father) 5))

; You and your sister are children of the father
(assert (is-child me father))
(assert (is-child sister father))

; You think the father is dead (required for <7‑year cases)
(assert (thinks-dead me))

; Sister does NOT want a declaration (recorded but does not block the claim)
(assert (sister-objection sister))

; Eligibility rule (derived from the document)
; A claimant can get a declaration if they are a spouse, civil partner,
; parent, child, or sibling of the missing person AND
;   – the person has been missing ≥7 years,   OR
;   – missing <7 years AND the claimant thinks they are dead.
; (Only the "child" relationship is needed for this scenario.)
(assert
  (forall ((c Person) (m Person))
    (=> (and (is-child c m)
             (or (>= (missing-years m) 7)
                 (and (< (missing-years m) 7) (thinks-dead c))))
        (can-get-death-certificate c m))))

;--- Test the question ---------------------------------------------
; Can you (me) obtain a death certificate for your father?
(assert (can-get-death-certificate me father))

;--- Solve ---------------------------------------------------------
(check-sat)   ; Expected result: sat  (you can obtain it)
(get-model)