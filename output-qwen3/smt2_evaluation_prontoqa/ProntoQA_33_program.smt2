; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions (predicates for categories and properties)
; Categories
(declare-fun yumpus (Entity) Bool)
(declare-fun rompus (Entity) Bool)
(declare-fun impus (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun numpus (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun jompus (Entity) Bool)

; Properties
(declare-fun temperate (Entity) Bool)
(declare-fun large (Entity) Bool)
(declare-fun blue (Entity) Bool)
(declare-fun nervous (Entity) Bool)
(declare-fun bright (Entity) Bool)
(declare-fun fruity (Entity) Bool)
(declare-fun opaque (Entity) Bool)
(declare-fun mean (Entity) Bool)

; 3. Declare constants
(declare-const stella Entity)

; 4. Assert knowledge base (facts and rules)
; Fact: Stella is a yumpus
(assert (yumpus stella))

; Rule: Every yumpus is not temperate
(assert (forall ((x Entity)) (=> (yumpus x) (not (temperate x)))))

; Rule: Yumpuses are rompuses
(assert (forall ((x Entity)) (=> (yumpus x) (rompus x))))

; Rule: Every rompus is large
(assert (forall ((x Entity)) (=> (rompus x) (large x))))

; Rule: Every rompus is an impus
(assert (forall ((x Entity)) (=> (rompus x) (impus x))))

; Rule: Impuses are not blue
(assert (forall ((x Entity)) (=> (impus x) (not (blue x)))))

; Rule: Impuses are tumpuses
(assert (forall ((x Entity)) (=> (impus x) (tumpus x))))

; Rule: Tumpuses are nervous
(assert (forall ((x Entity)) (=> (tumpus x) (nervous x))))

; Rule: Tumpuses are wumpuses
(assert (forall ((x Entity)) (=> (tumpus x) (wumpus x))))

; Rule: Wumpuses are bright
(assert (forall ((x Entity)) (=> (wumpus x) (bright x))))

; Rule: Numpuses are not bright
(assert (forall ((x Entity)) (=> (numpus x) (not (bright x)))))

; Rule: Each wumpus is a zumpus
(assert (forall ((x Entity)) (=> (wumpus x) (zumpus x))))

; Rule: Every zumpus is not fruity
(assert (forall ((x Entity)) (=> (zumpus x) (not (fruity x)))))

; Rule: Zumpuses are dumpuses
(assert (forall ((x Entity)) (=> (zumpus x) (dumpus x))))

; Rule: Dumpuses are opaque
(assert (forall ((x Entity)) (=> (dumpus x) (opaque x))))

; Rule: Dumpuses are vumpuses
(assert (forall ((x Entity)) (=> (dumpus x) (vumpus x))))

; Rule: Vumpuses are mean
(assert (forall ((x Entity)) (=> (vumpus x) (mean x))))

; Rule: Vumpuses are jompuses
(assert (forall ((x Entity)) (=> (vumpus x) (jompus x))))

; 5. Verify the statement: "Stella is not bright"
; We assert the statement directly. 
; If the result is 'unsat', the statement contradicts the knowledge base (False).
; If the result is 'sat', the statement is consistent with the knowledge base (True).
(assert (not (bright stella)))

; 6. Check satisfiability
(check-sat)
(get-model)