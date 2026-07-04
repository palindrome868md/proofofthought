; -------------------------------------------------
; Sort declarations
(declare-sort Entity 0)   ; buildings
(declare-sort Org    0)   ; organizations
(declare-sort Loc    0)   ; locations
(declare-sort Logo   0)   ; logos

; -------------------------------------------------
; Constant symbols (individuals)
(declare-const TowerA Entity)
(declare-const TowerB Entity)

(declare-const YaleHousing Org)
(declare-const Bloomberg   Org)

(declare-const NewHaven   Loc)
(declare-const Manhattans Loc)

(declare-const BloombergLogo Logo)

; -------------------------------------------------
; Predicate/function declarations
(declare-fun ManagedBy (Entity Org) Bool)
(declare-fun HasLogo   (Entity Logo) Bool)
(declare-fun OwnedBy   (Entity Org) Bool)
(declare-fun InLocation(Entity Loc) Bool)
(declare-fun High      (Entity) Bool)

; -------------------------------------------------
; Knowledge base (premises)

; All buildings managed by Yale Housing are located in New Haven.
(assert (forall ((x Entity))
        (=> (ManagedBy x YaleHousing)
            (InLocation x NewHaven))))

; All buildings in New Haven are not high.
(assert (forall ((x Entity))
        (=> (InLocation x NewHaven)
            (not (High x)))))

; All buildings in Manhattans are high.
(assert (forall ((x Entity))
        (=> (InLocation x Manhattans)
            (High x))))

; All buildings owned by Bloomberg are located in Manhattans.
(assert (forall ((x Entity))
        (=> (OwnedBy x Bloomberg)
            (InLocation x Manhattans))))

; All buildings with the Bloomberg logo are owned by Bloomberg.
(assert (forall ((x Entity))
        (=> (HasLogo x BloombergLogo)
            (OwnedBy x Bloomberg))))

; Facts
(assert (ManagedBy TowerA YaleHousing))   ; Tower A is managed by Yale Housing.
(assert (HasLogo   TowerB BloombergLogo)) ; Tower B has the Bloomberg logo.

; -------------------------------------------------
; Statement to verify: "Tower B is not located in Manhattans."
(assert (not (InLocation TowerB Manhattans)))

; -------------------------------------------------
(check-sat)   ; Expected result: unsat (the statement is false)
(get-model)