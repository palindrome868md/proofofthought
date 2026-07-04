;--- Declare uninterpreted sorts ---------------------------------
(declare-sort Person 0)
(declare-sort Movie  0)

;--- Declare predicates (functions returning Bool) ----------------
; A person is a rock star
(declare-fun is_rock_star (Person) Bool)

; The person plays the role of a boat captain in some movie
(declare-fun plays_captain (Person) Bool)

;--- Declare the individual of interest ---------------------------
(declare-const keith_richards Person)

;--- Knowledge base -----------------------------------------------
; Keith Richards is a rock star
(assert (is_rock_star keith_richards))

; General rule: rock stars do NOT play a captain of a boat in a movie
(assert (forall ((p Person))
          (=> (is_rock_star p)
              (not (plays_captain p)))))

;--- Test the statement --------------------------------------------
; Claim: Keith Richards plays a captain of a boat in a movie
(assert (plays_captain keith_richards))

;--- Check the claim ------------------------------------------------
(check-sat)   ; expected: unsat (the claim is false)
(get-model)