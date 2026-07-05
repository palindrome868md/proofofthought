; Sorts
(declare-sort Building 0)
(declare-sort City 0)
(declare-sort Company 0)

; City constants
(declare-const new-haven City)
(declare-const manhattans City)

; Building constants
(declare-const towerA Building)
(declare-const towerB Building)

; Company constants
(declare-const YaleHousing Company)
(declare-const Bloomberg Company)

; Predicates / relations
; located-in: Building x City -> Bool
(declare-fun located-in (Building City) Bool)
; high: Building -> Bool
(declare-fun high (Building) Bool)
; owned-by: Building x Company -> Bool
(declare-fun owned-by (Building Company) Bool)
; has-logo: Building x Company -> Bool
(declare-fun has-logo (Building Company) Bool)
; is-managed-by: Building x Company -> Bool
(declare-fun is-managed-by (Building Company) Bool)

; Knowledge base (premises)

; 1. All buildings in New Haven are not high.
(assert (forall ((b Building))
  (=> (located-in b new-haven)
      (not (high b)))))

; 2. All buildings managed by Yale Housing are located in New Haven.
(assert (forall ((b Building))
  (=> (is-managed-by b YaleHousing)
      (located-in b new-haven))))

; 3. All buildings in Manhattans are high.
(assert (forall ((b Building))
  (=> (located-in b manhattans)
      (high b))))

; 4. All buildings owned by Bloomberg are located in Manhattans.
(assert (forall ((b Building))
  (=> (owned-by b Bloomberg)
      (located-in b manhattans))))

; 5. All buildings with the Bloomberg logo are owned by Bloomberg.
(assert (forall ((b Building))
  (=> (has-logo b Bloomberg)
      (owned-by b Bloomberg))))

; 6. Tower A is managed by Yale Housing.
(assert (is-managed-by towerA YaleHousing))

; 7. Tower B is with the Bloomberg logo.
(assert (has-logo towerB Bloomberg))

; Test: "Tower A is low." We model "low" as not high(towerA)
(assert (not (high towerA)))

; Check satisfiability for the single question
(check-sat)
(get-model)