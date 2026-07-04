; 1. Declare sorts
(declare-sort Building 0)

; 2. Declare functions (predicates)
(declare-fun InNewHaven (Building) Bool)
(declare-fun IsHigh (Building) Bool)
(declare-fun ManagedByYale (Building) Bool)
(declare-fun InManhattans (Building) Bool)
(declare-fun OwnedByBloomberg (Building) Bool)
(declare-fun HasBloombergLogo (Building) Bool)

; 3. Declare constants
(declare-const TowerA Building)
(declare-const TowerB Building)

; 4. Assert knowledge base (premises)
; All buildings in New Haven are not high.
(assert (forall ((b Building)) 
  (=> (InNewHaven b) (not (IsHigh b)))))

; All buildings managed by Yale Housing are located in New Haven.
(assert (forall ((b Building)) 
  (=> (ManagedByYale b) (InNewHaven b))))

; All buildings in Manhattans are high.
(assert (forall ((b Building)) 
  (=> (InManhattans b) (IsHigh b))))

; All buildings owned by Bloomberg are located in Manhattans.
(assert (forall ((b Building)) 
  (=> (OwnedByBloomberg b) (InManhattans b))))

; All buildings with the Bloomberg logo are owned by Bloomberg.
(assert (forall ((b Building)) 
  (=> (HasBloombergLogo b) (OwnedByBloomberg b))))

; Tower A is managed by Yale Housing.
(assert (ManagedByYale TowerA))

; Tower B is with the Bloomberg logo.
(assert (HasBloombergLogo TowerB))

; 5. Assert the statement to be verified
; Statement: Tower B is not located in Manhattans.
(assert (not (InManhattans TowerB)))

; 6. Check satisfiability
(check-sat)
(get-model)