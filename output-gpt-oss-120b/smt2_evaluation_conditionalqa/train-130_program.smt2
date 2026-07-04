;--- Sorts ---------------------------------------------------------
(declare-sort Person 0)

;--- Functions / Predicates ----------------------------------------
(declare-fun age (Person) Int)                 ; person's age in years
(declare-fun difficulty-daily (Person) Bool)   ; has daily‑living difficulties ≥3 months
(declare-fun difficulty-mobility (Person) Bool); has mobility difficulties ≥3 months
(declare-fun lived_England_last3 (Person) Bool); lived in England ≥2 of last 3 years
(declare-fun eligible (Person) Bool)           ; eligible for PIP

;--- Constants ------------------------------------------------------
(declare-const kid Person)                     ; the child in the scenario

;--- Knowledge base (facts) ----------------------------------------
; child is 16 years old
(assert (= (age kid) 16))

; long‑term physical disability that affects getting about → mobility difficulty
(assert (difficulty-mobility kid))

; (no daily‑living difficulty is needed for eligibility, but we could also assert false)
(assert (not (difficulty-daily kid)))

; lived in England since birth → satisfies residence condition
(assert (lived_England_last3 kid))

;--- Eligibility rule (derived from the guide) --------------------
; A person is eligible for PIP if:
;   - they are aged 16 or over,
;   - they have either daily‑living or mobility difficulties,
;   - they have satisfied the residence requirement.
(assert
  (forall ((p Person))
    (=> (and (>= (age p) 16)
             (or (difficulty-daily p) (difficulty-mobility p))
             (lived_England_last3 p))
        (eligible p))))

;--- Test the question: "Is my kid eligible for Personal Independence Payment?"
(assert (eligible kid))

;--- Solve ----------------------------------------------------------
(check-sat)
(get-model)