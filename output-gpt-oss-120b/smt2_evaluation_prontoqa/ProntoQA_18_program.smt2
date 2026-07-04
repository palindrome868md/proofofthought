;--- Declare an uninterpreted sort for all individuals
(declare-sort Entity 0)

;--- Declare constants
(declare-const Sam Entity)

;--- Declare unary predicates (properties/classes)
(declare-fun dumpus (Entity) Bool)
(declare-fun bright (Entity) Bool)
(declare-fun rompus (Entity) Bool)
(declare-fun aggressive (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun brown (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun impus (Entity) Bool)
(declare-fun fruity (Entity) Bool)
(declare-fun sour (Entity) Bool)
(declare-fun numpus (Entity) Bool)
(declare-fun temperate (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun metallic (Entity) Bool)
(declare-fun jompus (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun opaque (Entity) Bool)
(declare-fun wumpus (Entity) Bool)

;--- Knowledge base (rules)

; Each dumpus is bright.
(assert (forall ((x Entity)) (=> (dumpus x) (bright x))))

; Each dumpus is a rompus.
(assert (forall ((x Entity)) (=> (dumpus x) (rompus x))))

; Every rompus is aggressive.
(assert (forall ((x Entity)) (=> (rompus x) (aggressive x))))

; Every rompus is a yumpus.
(assert (forall ((x Entity)) (=> (rompus x) (yumpus x))))

; Yumpuses are brown.
(assert (forall ((x Entity)) (=> (yumpus x) (brown x))))

; Yumpuses are vumpuses.
(assert (forall ((x Entity)) (=> (yumpus x) (vumpus x))))

; Every impus is fruity.
(assert (forall ((x Entity)) (=> (impus x) (fruity x))))

; Every vumpus is sour.
(assert (forall ((x Entity)) (=> (vumpus x) (sour x))))

; Every vumpus is a numpus.
(assert (forall ((x Entity)) (=> (vumpus x) (numpus x))))

; Every numpus is not temperate.
(assert (forall ((x Entity)) (=> (numpus x) (not (temperate x)))))

; Every numpus is a zumpus.
(assert (forall ((x Entity)) (=> (numpus x) (zumpus x))))

; Zumpuses are metallic.
(assert (forall ((x Entity)) (=> (zumpus x) (metallic x))))

; Zumpuses are jompuses.
(assert (forall ((x Entity)) (=> (zumpus x) (jompus x))))

; Each jompus is not fruity.
(assert (forall ((x Entity)) (=> (jompus x) (not (fruity x)))))

; Jompuses are tumpuses.
(assert (forall ((x Entity)) (=> (jompus x) (tumpus x))))

; Tumpuses are opaque.
(assert (forall ((x Entity)) (=> (tumpus x) (opaque x))))

; Every tumpus is a wumpus.
(assert (forall ((x Entity)) (=> (tumpus x) (wumpus x))))

; Sam is a yumpus.
(assert (yumpus Sam))

;--- Test the statement: "Sam is fruity"
(assert (fruity Sam))

;--- Check whether the knowledge base permits this
(check-sat)
(get-model)