;--- Declarations -------------------------------------------------
(declare-sort Person 0)
(declare-sort Instrument 0)

(declare-fun plays (Person Instrument) Bool)
(declare-fun plays_concert (Person Instrument) Bool)
(declare-fun good_at (Person Instrument) Bool)

(declare-const peter Person)
(declare-const oliver Person)

(declare-const piano Instrument)
(declare-const violin Instrument)
(declare-const saxophone Instrument)

;--- Premises ------------------------------------------------------
; 1. If a person plays an instrument in a concert, they are good at it
(assert (forall ((p Person) (i Instrument))
  (=> (plays_concert p i) (good_at p i))))

; 2. Peter plays piano, violin, and saxophone (general)
(assert (plays peter piano))
(assert (plays peter violin))
(assert (plays peter saxophone))

; 3. Peter plays piano in a concert
(assert (plays_concert peter piano))

; 4. Oliver plays *some* instrument in the concert
(declare-const oliver_instr Instrument)
(assert (plays_concert oliver oliver_instr))

; 5. Oliver's concert instrument is different from Peter's
(assert (not (= oliver_instr piano)))

; 6. Each person plays at most one instrument in the concert
(assert (forall ((p Person) (i Instrument) (j Instrument))
  (=> (and (plays_concert p i) (plays_concert p j))
      (= i j))))

;--- Statement to test --------------------------------------------
; "Oliver plays piano in the concert"
(assert (plays_concert oliver piano))

;--- Check ---------------------------------------------------------
(check-sat)      ; Expected result: unsat (the statement is false)
(get-model)