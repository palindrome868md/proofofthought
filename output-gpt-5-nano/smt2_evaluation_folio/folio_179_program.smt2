; Sorting
(declare-sort Building 0)

; Location datatype (enumerated)
(declare-datatypes () ((Location NewHaven Manhattans)))

; Predicates / relations
(declare-fun located-in (Building Location) Bool)
(declare-fun high (Building) Bool)
(declare-fun managed-by-yale (Building) Bool)
(declare-fun has-bloomberg-logo (Building) Bool)
(declare-fun owned-by-bloomberg (Building) Bool)

; Constants for buildings
(declare-const tower-a Building)
(declare-const tower-b Building)

; Knowledge base (premises)

; Tower A is managed by Yale Housing.
(assert (managed-by-yale tower-a))

; All buildings managed by Yale Housing are located in New Haven.
(assert (forall ((b Building))
  (=> (managed-by-yale b)
      (located-in b NewHaven))))

; All buildings in New Haven are not high.
(assert (forall ((b Building))
  (=> (located-in b NewHaven)
      (not (high b)))))

; All buildings in Manhattan are high.
(assert (forall ((b Building))
  (=> (located-in b Manhattans)
      (high b))))

; All buildings owned by Bloomberg are located in Manhattan.
(assert (forall ((b Building))
  (=> (owned-by-bloomberg b)
      (located-in b Manhattans))))

; All buildings with the Bloomberg logo are owned by Bloomberg.
(assert (forall ((b Building))
  (=> (has-bloomberg-logo b)
      (owned-by-bloomberg b))))

; Tower B is with the Bloomberg logo.
(assert (has-bloomberg-logo tower-b))

; Test: Is Tower B located in New Haven?
; Assert the scenario (Tower B located in New Haven) and check satisfiability.
(assert (located-in tower-b NewHaven))

(check-sat)