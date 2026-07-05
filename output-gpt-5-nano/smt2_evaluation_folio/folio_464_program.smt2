; Sorts and datatypes
(declare-sort Person 0)
(declare-sort Concert 0)

; Enumerated instrument datatype
(declare-datatypes () ((Instrument piano violin saxophone flute)))

; Constants
(declare-const peter Person)
(declare-const oliver Person)
(declare-const concert1 Concert)

; Predicates
(declare-fun plays_in_concert (Person Instrument Concert) Bool)
(declare-fun good_at (Person Instrument) Bool)

; Knowledge base (premises)
(assert (plays_in_concert peter piano concert1))
(assert (plays_in_concert peter violin concert1))
(assert (plays_in_concert peter saxophone concert1))

; Oliver and Peter both play instruments in the same concert
(assert (plays_in_concert oliver flute concert1))

; Oliver plays a different instrument from Peter in the concert
(assert (forall ((i Instrument))
  (=> (plays_in_concert peter i concert1)
      (not (plays_in_concert oliver i concert1)))))

; If a person plays an instrument in a concert, they are good at playing that instrument
(assert (forall ((p Person) (i Instrument) (c Concert))
  (=> (plays_in_concert p i c)
      (good_at p i))))

; Test scenario: Would Oliver play piano in the concert?
(assert (plays_in_concert oliver piano concert1))

; Check satisfiability
(check-sat)