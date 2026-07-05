; Determine whether you would have to pay rent when gifting a home but continuing to live there

; Booleans representing the key aspects of the scenario
(declare-const give-entire-home Bool)       ; you gift the entire home (not just part)
(declare-const continue-living Bool)        ; you continue living in the property after the gift
(declare-const new-owners-live Bool)        ; the new owners (your son and his wife) also live at the property
(declare-const only-part-of-property Bool)  ; you only give away part of the property
(declare-const rent-needed Bool)            ; would you need to pay rent to the new owners?

; Scenario setup (assert the given facts)
(assert give-entire-home)
(assert continue-living)
(assert new-owners-live)
(assert (not only-part-of-property))  ; we are not giving away only a part

; Inheritance Tax document guidance translated into rules:

; Rule 1: If you gave away the entire home and you continue living and the new owners live there,
;          then rent would be needed.
(assert (=> (and give-entire-home continue-living new-owners-live)
            rent-needed))

; Rule 2: If you gave away only part of the property and the new owners live there (and you continue living),
;          then rent would not be needed.
(assert (=> (and only-part-of-property continue-living new-owners-live)
            (not rent-needed)))

; Check whether the constraints are satisfiable (answers the question)
(check-sat)
(get-model)