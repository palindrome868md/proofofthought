;--- Sort declaration -------------------------------------------------
(declare-sort Entity 0)

;--- Predicate (Boolean function) declarations ------------------------
(declare-fun Zumpus (Entity) Bool)
(declare-fun Bright (Entity) Bool)

(declare-fun Vumpus (Entity) Bool)
(declare-fun Kind (Entity) Bool)

(declare-fun Wumpus (Entity) Bool)
(declare-fun Feisty (Entity) Bool)

(declare-fun Numpus (Entity) Bool)
(declare-fun Floral (Entity) Bool)

(declare-fun Dumpus (Entity) Bool)
(declare-fun Hot (Entity) Bool)

(declare-fun Rompuse (Entity) Bool)
(declare-fun Liquid (Entity) Bool)

(declare-fun Tumpus (Entity) Bool)
(declare-fun Brown (Entity) Bool)

(declare-fun Jompus (Entity) Bool)
(declare-fun Bitter (Entity) Bool)
(declare-fun Impus (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)

;--- Constant representing Sam -----------------------------------------
(declare-const Sam Entity)

;--- Knowledge base (facts and universal rules) -----------------------

; Zumpuses are bright
(assert (forall ((x Entity)) (=> (Zumpus x) (Bright x))))

; Every zumpus is a vumpus
(assert (forall ((x Entity)) (=> (Zumpus x) (Vumpus x))))

; Each vumpus is not kind
(assert (forall ((x Entity)) (=> (Vumpus x) (not (Kind x)))))

; Each vumpus is a wumpus
(assert (forall ((x Entity)) (=> (Vumpus x) (Wumpus x))))

; Wumpuses are feisty
(assert (forall ((x Entity)) (=> (Wumpus x) (Feisty x))))

; Wumpuses are numpuses
(assert (forall ((x Entity)) (=> (Wumpus x) (Numpus x))))

; Each numpus is floral
(assert (forall ((x Entity)) (=> (Numpus x) (Floral x))))

; Every numpus is a dumpus
(assert (forall ((x Entity)) (=> (Numpus x) (Dumpus x))))

; Every dumpus is hot
(assert (forall ((x Entity)) (=> (Dumpus x) (Hot x))))

; Rompuses are liquid
(assert (forall ((x Entity)) (=> (Rompuse x) (Liquid x))))

; Each dumpus is a tumpus
(assert (forall ((x Entity)) (=> (Dumpus x) (Tumpus x))))

; Every tumpus is not brown
(assert (forall ((x Entity)) (=> (Tumpus x) (not (Brown x)))))

; Every tumpus is a jompus
(assert (forall ((x Entity)) (=> (Tumpus x) (Jompus x))))

; Jompuses are bitter
(assert (forall ((x Entity)) (=> (Jompus x) (Bitter x))))

; Jompuses are impuses
(assert (forall ((x Entity)) (=> (Jompus x) (Impus x))))

; Each impus is not liquid
(assert (forall ((x Entity)) (=> (Impus x) (not (Liquid x)))))

; Impuses are yumpuses
(assert (forall ((x Entity)) (=> (Impus x) (Yumpus x))))

; Fact: Sam is a numpus
(assert (Numpus Sam))

;--- Query: is Sam not liquid? ----------------------------------------
(assert (not (Liquid Sam)))   ; the statement we are testing

;--- Check satisfiability ---------------------------------------------
(check-sat)
(get-model)