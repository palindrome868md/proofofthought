;--- Sorts ---------------------------------------------------------
(declare-sort Person 0)
(declare-sort Neighborhood 0)

;--- Constants ------------------------------------------------------
(declare-const tom Person)
(declare-const daniel Person)
(declare-const lawton_park Neighborhood)

;--- Functions ------------------------------------------------------
; citizen_of(p, n)  : Person × Neighborhood → Bool
; uses_zip(p, z)    : Person × Int → Bool
(declare-fun citizen_of (Person Neighborhood) Bool)
(declare-fun uses_zip   (Person Int) Bool)

;--- Knowledge Base -------------------------------------------------
; All citizens of Lawton Park use zip code 98199
(assert (forall ((p Person))
        (=> (citizen_of p lawton_park)
            (uses_zip p 98199))))

; Tom is a citizen of Lawton Park
(assert (citizen_of tom lawton_park))

; Daniel uses zip code 98199 (extra fact, not needed for the query)
(assert (uses_zip daniel 98199))

;--- Statement to verify -------------------------------------------
; "Tom doesn't use the zip code 98199"
(assert (not (uses_zip tom 98199)))

;--- Check -----------------------------------------------------------
(check-sat)   ; Expected result: unsat (the statement is false)
(get-model)   ; Optional: show a model if SAT (won't be produced here)