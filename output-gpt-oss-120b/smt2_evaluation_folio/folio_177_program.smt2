; -------------------------------------------------
; 1. Declare sorts
; -------------------------------------------------
(declare-sort Building 0)
(declare-sort Location 0)
(declare-sort Organization 0)

; -------------------------------------------------
; 2. Declare constants (individuals)
; -------------------------------------------------
(declare-const TowerA Building)
(declare-const TowerB Building)

(declare-const YaleHousing Organization)
(declare-const Bloomberg Organization)

(declare-const NewHaven Location)
(declare-const Manhattan Location)

; -------------------------------------------------
; 3. Declare predicates (as functions returning Bool)
; -------------------------------------------------
(declare-fun managedBy (Building Organization) Bool)
(declare-fun ownedBy   (Building Organization) Bool)
(declare-fun hasLogo  (Building Organization) Bool)
(declare-fun in       (Building Location)   Bool)
(declare-fun high     (Building)            Bool)

; -------------------------------------------------
; 4. Encode the premises
; -------------------------------------------------
; All buildings in New Haven are not high.
(assert (forall ((b Building))
  (=> (in b NewHaven) (not (high b)))))

; All buildings managed by Yale Housing are located in New Haven.
(assert (forall ((b Building))
  (=> (managedBy b YaleHousing) (in b NewHaven))))

; All buildings in Manhattan are high.
(assert (forall ((b Building))
  (=> (in b Manhattan) (high b))))

; All buildings owned by Bloomberg are located in Manhattan.
(assert (forall ((b Building))
  (=> (ownedBy b Bloomberg) (in b Manhattan))))

; All buildings with the Bloomberg logo are owned by Bloomberg.
(assert (forall ((b Building))
  (=> (hasLogo b Bloomberg) (ownedBy b Bloomberg))))

; Facts
(assert (managedBy TowerA YaleHousing))   ; Tower A is managed by Yale Housing
(assert (hasLogo   TowerB Bloomberg))    ; Tower B has the Bloomberg logo

; -------------------------------------------------
; 5. Test the statement: "Tower A is low"
;    (i.e., NOT high)
; -------------------------------------------------
(assert (not (high TowerA)))   ; assert that Tower A is low

; -------------------------------------------------
; 6. Check satisfiability
; -------------------------------------------------
(check-sat)   ; expected: sat  (the statement follows from the premises)
(get-model)