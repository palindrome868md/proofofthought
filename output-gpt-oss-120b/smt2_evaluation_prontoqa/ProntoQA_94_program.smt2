;=== Declarations ==========================================================
(declare-sort Entity 0)                ; universe of individuals

; Unary predicates (properties / classes)
(declare-fun dumpus   (Entity) Bool)
(declare-fun wooden   (Entity) Bool)
(declare-fun rompuse  (Entity) Bool)
(declare-fun small    (Entity) Bool)
(declare-fun jompus   (Entity) Bool)
(declare-fun orange   (Entity) Bool)
(declare-fun wumpus   (Entity) Bool)
(declare-fun earthy   (Entity) Bool)
(declare-fun zumpus   (Entity) Bool)
(declare-fun angry    (Entity) Bool)
(declare-fun tumpus   (Entity) Bool)
(declare-fun vumpus   (Entity) Bool)
(declare-fun spicy    (Entity) Bool)
(declare-fun yumpus   (Entity) Bool)
(declare-fun hot      (Entity) Bool)
(declare-fun impus    (Entity) Bool)
(declare-fun bright   (Entity) Bool)
(declare-fun numpuse  (Entity) Bool)

; Constant representing the individual named Max
(declare-const Max Entity)

;=== Knowledge Base =========================================================
; Dumpuses are wooden and rompuses
(assert (forall ((x Entity)) (=> (dumpus x) (wooden x))))
(assert (forall ((x Entity)) (=> (dumpus x) (rompuse x))))

; Rompuses are small and jompuses
(assert (forall ((x Entity)) (=> (rompuse x) (small x))))
(assert (forall ((x Entity)) (=> (rompuse x) (jompus x))))

; Jompuses are orange and wumpuses
(assert (forall ((x Entity)) (=> (jompus x) (orange x))))
(assert (forall ((x Entity)) (=> (jompus x) (wumpus x))))

; Each wumpus is earthy and a zumpus
(assert (forall ((x Entity)) (=> (wumpus x) (earthy x))))
(assert (forall ((x Entity)) (=> (wumpus x) (zumpus x))))

; Zumpuses are angry and vumpuses
(assert (forall ((x Entity)) (=> (zumpus x) (angry x))))
(assert (forall ((x Entity)) (=> (zumpus x) (vumpus x))))

; Tumpuses are not angry
(assert (forall ((x Entity)) (=> (tumpus x) (not (angry x)))))

; Vumpuses are not spicy
(assert (forall ((x Entity)) (=> (vumpus x) (not (spicy x)))))

; Each vumpus is a yumpus
(assert (forall ((x Entity)) (=> (vumpus x) (yumpus x))))

; Yumpuses are not hot
(assert (forall ((x Entity)) (=> (yumpus x) (not (hot x)))))

; Every yumpus is an impus
(assert (forall ((x Entity)) (=> (yumpus x) (impus x))))

; Each impus is bright; impuses are numpuses
(assert (forall ((x Entity)) (=> (impus x) (bright x))))
(assert (forall ((x Entity)) (=> (impus x) (numpuse x))))

; Fact: Max is a dumpus
(assert (dumpus Max))

;=== Test the claim: "Max is angry" =========================================
(assert (angry Max))

;=== Solver query ============================================================
(check-sat)
(get-model)