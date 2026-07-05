; Declarations
(declare-sort Person 0)
(declare-sort Instrument 0)

(declare-const Peter Person)
(declare-const Oliver Person)

(declare-const piano Instrument)
(declare-const violin Instrument)
(declare-const saxophone Instrument)

; Predicates
(declare-fun plays (Person Instrument) Bool)
(declare-fun in_concert (Person Instrument) Bool)
(declare-fun good_at (Person Instrument) Bool)

; Premises
; Peter plays piano, violin, and saxophone
(assert (plays Peter piano))
(assert (plays Peter violin))
(assert (plays Peter saxophone))

; Peter plays piano in a concert
(assert (in_concert Peter piano))

; Oliver and Peter both play instruments in a concert
(assert (in_concert Oliver violin))

; Rule: If a person plays an instrument in a concert, they are good at playing this kind of instrument
(assert (forall ((p Person) (i Instrument))
  (=> (and (plays p i) (in_concert p i))
      (good_at p i))))

; Test: Does Peter have the property of being good at piano?
(assert (good_at Peter piano))

; Check satisfiability (the single question-answering check)
(check-sat)
(get-model)