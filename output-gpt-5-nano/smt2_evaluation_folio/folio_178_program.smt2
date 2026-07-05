; Sorts
(declare-sort Building 0)
(declare-sort Location 0)
(declare-sort Org 0)

; Constants
(declare-const towerA Building)
(declare-const towerB Building)
(declare-const newhaven Location)
(declare-const manhattans Location)
(declare-const bloomberg Org)
(declare-const yale-housing Org)

; Predicates / Functions
(declare-fun located-in (Building Location) Bool)
(declare-fun is-high (Building) Bool)
(declare-fun managed-by (Building) Org)
(declare-fun owned-by (Building) Org)
(declare-fun has-logo-bloomberg (Building) Bool)

; Knowledge base (premises)

; All buildings in New Haven are not high.
(assert (forall ((b Building))
  (=> (located-in b newhaven) (not (is-high b)))))

; All buildings managed by Yale Housing are located in New Haven.
(assert (forall ((b Building))
  (=> (= (managed-by b) yale-housing) (located-in b newhaven))))

; All buildings in Manhattans are high.
(assert (forall ((b Building))
  (=> (located-in b manhattans) (is-high b))))

; All buildings owned by Bloomberg are located in Manhattans.
(assert (forall ((b Building))
  (=> (= (owned-by b) bloomberg) (located-in b manhattans))))

; All buildings with the Bloomberg logo are owned by Bloomberg.
(assert (forall ((b Building))
  (=> (has-logo-bloomberg b) (= (owned-by b) bloomberg))))

; Tower A is managed by Yale Housing.
(assert (= (managed-by towerA) yale-housing))

; Tower B is with the Bloomberg logo.
(assert (has-logo-bloomberg towerB))

; Test: Tower B is not located in Manhattans.
(assert (not (located-in towerB manhattans)))

; Check satisfiability
(check-sat)