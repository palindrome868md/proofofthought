; ---------- Sorts ----------
(declare-sort Building 0)

; ---------- Predicates (Boolean functions) ----------
(declare-fun inNewHaven (Building) Bool)          ; building is in New Haven
(declare-fun inManhattan (Building) Bool)         ; building is in Manhattan
(declare-fun high (Building) Bool)                ; building is high
(declare-fun managedByYaleHousing (Building) Bool) ; managed by Yale Housing
(declare-fun ownedByBloomberg (Building) Bool)    ; owned by Bloomberg
(declare-fun hasBloombergLogo (Building) Bool)    ; has Bloomberg logo

; ---------- Constants ----------
(declare-const TowerA Building)
(declare-const TowerB Building)

; ---------- Knowledge base ----------
; 1. All buildings in New Haven are not high.
(assert (forall ((b Building))
  (=> (inNewHaven b) (not (high b)))))

; 2. All buildings managed by Yale Housing are located in New Haven.
(assert (forall ((b Building))
  (=> (managedByYaleHousing b) (inNewHaven b))))

; 3. All buildings in Manhattans are high.
(assert (forall ((b Building))
  (=> (inManhattan b) (high b))))

; 4. All buildings owned by Bloomberg are located in Manhattans.
(assert (forall ((b Building))
  (=> (ownedByBloomberg b) (inManhattan b))))

; 5. All buildings with the Bloomberg logo are owned by Bloomberg.
(assert (forall ((b Building))
  (=> (hasBloombergLogo b) (ownedByBloomberg b))))

; 6. Tower A is managed by Yale Housing.
(assert (managedByYaleHousing TowerA))

; 7. Tower B is with the Bloomberg logo.
(assert (hasBloombergLogo TowerB))

; ---------- Test the statement ----------
; Statement: Tower B is located in New Haven.
(assert (inNewHaven TowerB))

; ---------- Check satisfiability ----------
(check-sat)      ; Expected: sat  (the statement is consistent)
(get-model)