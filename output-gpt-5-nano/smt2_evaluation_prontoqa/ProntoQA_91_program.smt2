; Declare sorts
(declare-sort Entity 0)

; Declare predicates (unary properties)
(declare-fun numpus (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun opaque (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun floral (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun cold (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun bright (Entity) Bool)
(declare-fun impus (Entity) Bool)
(declare-fun nervous (Entity) Bool)
(declare-fun jompus (Entity) Bool)
(declare-fun mean (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun rompuses (Entity) Bool)  ; rompuses as a property

; Additional predicates used in KB
(declare-fun spicy (Entity) Bool)
(declare-fun small (Entity) Bool)

; Declare constants
(declare-const wren Entity)

; Knowledge base (universal rules)
(assert (forall ((x Entity)) (=> (numpus x) (spicy x))))
(assert (forall ((x Entity)) (=> (dumpus x) (not (small x)))))
(assert (forall ((x Entity)) (=> (numpus x) (yumpus x))))
(assert (forall ((x Entity)) (=> (yumpus x) (not (opaque x)))))
(assert (forall ((x Entity)) (=> (yumpus x) (wumpus x))))
(assert (forall ((x Entity)) (=> (wumpus x) (floral x))))
(assert (forall ((x Entity)) (=> (wumpus x) (tumpus x))))
(assert (forall ((x Entity)) (=> (tumpus x) (cold x))))
(assert (forall ((x Entity)) (=> (tumpus x) (vumpus x))))
(assert (forall ((x Entity)) (=> (vumpus x) (not (bright x)))))
(assert (forall ((x Entity)) (=> (vumpus x) (impus x))))
(assert (forall ((x Entity)) (=> (impus x) (nervous x))))
(assert (forall ((x Entity)) (=> (impus x) (jompus x))))
(assert (forall ((x Entity)) (=> (jompus x) (mean x))))
(assert (forall ((x Entity)) (=> (jompus x) (zumpus x))))
(assert (forall ((x Entity)) (=> (zumpus x) (small x))))
(assert (forall ((x Entity)) (=> (zumpus x) (rompuses x))))

; Specific fact: Wren is a tumpus
(assert (tumpus wren))

; Query: Is "Wren is not small" true?
; (We test the scenario by asserting the query and checking satisfiability)
(assert (not (small wren)))

; Check satisfiability and provide a model if possible
(check-sat)
(get-model)