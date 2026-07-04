;--- Sort declarations -------------------------------------------------
(declare-sort Person 0)
(declare-sort Instrument 0)

;--- Constant (individual) declarations ---------------------------------
(declare-const Peter Person)
(declare-const Oliver Person)

; Instruments
(declare-const piano Instrument)
(declare-const violin Instrument)
(declare-const saxophone Instrument)
(declare-const flute Instrument)   ; different from piano

;--- Predicate declarations --------------------------------------------
(declare-fun plays_in_concert (Person Instrument) Bool)
(declare-fun good_at (Person Instrument) Bool)

;--- Knowledge base -----------------------------------------------------

; Rule: playing an instrument in a concert implies being good at it
(assert (forall ((p Person) (i Instrument))
        (=> (plays_in_concert p i)
            (good_at p i))))

; Peter plays piano, violin and saxophone (general fact – not needed for the query)
; (We could also declare a generic `plays` predicate, but it is irrelevant here.)

; Peter plays piano in a concert
(assert (plays_in_concert Peter piano))

; Oliver also plays an instrument in a concert, and it is different from Peter's
(assert (plays_in_concert Oliver flute))

;--- Statement to verify -----------------------------------------------
; "Peter is good at playing piano."
(assert (good_at Peter piano))

;--- Check satisfiability -----------------------------------------------
(check-sat)
(get-model)