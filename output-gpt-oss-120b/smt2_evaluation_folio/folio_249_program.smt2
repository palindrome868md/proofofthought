;--- 1. Declare sorts -------------------------------------------------
(declare-sort Person 0)
(declare-sort Neighborhood 0)

;--- 2. Declare constants -----------------------------------------------
(declare-const lawton-park Neighborhood)
(declare-const tom Person)
(declare-const daniel Person)

;--- 3. Declare predicates (functions returning Bool) -------------------
(declare-fun citizen_of (Person Neighborhood) Bool)
(declare-fun uses_zip   (Person Int) Bool)

;--- 4. Knowledge base (premises) ---------------------------------------
; All citizens of Lawton Park use zip code 98199
(assert (forall ((p Person))
        (=> (citizen_of p lawton-park)
            (uses_zip p 98199))))

; Tom is a citizen of Lawton Park
(assert (citizen_of tom lawton-park))

; Daniel uses zip code 98199 (extra fact)
(assert (uses_zip daniel 98199))

;--- 5. Statement to test -----------------------------------------------
; "Tom uses the zip code 98199"
(assert (uses_zip tom 98199))

;--- 6. Query -----------------------------------------------------------
(check-sat)
(get-model)