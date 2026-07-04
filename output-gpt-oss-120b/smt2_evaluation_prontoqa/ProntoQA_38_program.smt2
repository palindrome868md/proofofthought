;--- Sort declaration -------------------------------------------------
(declare-sort Entity 0)

;--- Predicate (unary function) declarations ---------------------------
(declare-fun vumpus   (Entity) Bool)
(declare-fun wooden   (Entity) Bool)
(declare-fun jompus   (Entity) Bool)
(declare-fun earthy   (Entity) Bool)
(declare-fun wumpus   (Entity) Bool)
(declare-fun transparent (Entity) Bool)
(declare-fun yumpus   (Entity) Bool)
(declare-fun bright   (Entity) Bool)
(declare-fun impus    (Entity) Bool)
(declare-fun happy    (Entity) Bool)
(declare-fun rompus   (Entity) Bool)
(declare-fun dumpus   (Entity) Bool)
(declare-fun brown    (Entity) Bool)
(declare-fun zumpus   (Entity) Bool)
(declare-fun sour     (Entity) Bool)
(declare-fun numpus   (Entity) Bool)
(declare-fun angry    (Entity) Bool)
(declare-fun tumpus   (Entity) Bool)

;--- Constant declaration -----------------------------------------------
(declare-const polly Entity)

;--- Knowledge base ----------------------------------------------------
; Vumpuses are wooden.
(assert (forall ((x Entity)) (=> (vumpus x) (wooden x))))

; Every vumpus is a jompus.
(assert (forall ((x Entity)) (=> (vumpus x) (jompus x))))

; Jompuses are earthy.
(assert (forall ((x Entity)) (=> (jompus x) (earthy x))))

; Each jompus is a wumpus.
(assert (forall ((x Entity)) (=> (jompus x) (wumpus x))))

; Wumpuses are not transparent.
(assert (forall ((x Entity)) (=> (wumpus x) (not (transparent x)))))

; Wumpuses are yumpuses.
(assert (forall ((x Entity)) (=> (wumpus x) (yumpus x))))

; Yumpuses are not bright.
(assert (forall ((x Entity)) (=> (yumpus x) (not (bright x)))))

; Each yumpus is an impus.
(assert (forall ((x Entity)) (=> (yumpus x) (impus x))))

; Every rompus is happy.
(assert (forall ((x Entity)) (=> (rompus x) (happy x))))

; Impuses are not happy.
(assert (forall ((x Entity)) (=> (impus x) (not (happy x)))))

; Each impus is a dumpus.
(assert (forall ((x Entity)) (=> (impus x) (dumpus x))))

; Dumpuses are brown.
(assert (forall ((x Entity)) (=> (dumpus x) (brown x))))

; Dumpuses are zumpuses.
(assert (forall ((x Entity)) (=> (dumpus x) (zumpus x))))

; Zumpuses are not sour.
(assert (forall ((x Entity)) (=> (zumpus x) (not (sour x)))))

; Zumpuses are numpuses.
(assert (forall ((x Entity)) (=> (zumpus x) (numpus x))))

; Every numpus is not angry.
(assert (forall ((x Entity)) (=> (numpus x) (not (angry x)))))

; Numpuses are tumpuses.
(assert (forall ((x Entity)) (=> (numpus x) (tumpus x))))

; Polly is a vumpus.
(assert (vumpus polly))

;--- Query: "Polly is not happy." ---------------------------------------
(assert (not (happy polly)))   ; the statement we want to verify

;--- Check satisfiability ------------------------------------------------
(check-sat)   ; expected: sat (the statement is true)
(get-model)