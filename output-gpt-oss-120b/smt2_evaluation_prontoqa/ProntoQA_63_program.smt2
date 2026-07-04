;--------------------------------------------------------------------
; 1. Declare the uninterpreted sort for all individuals
;--------------------------------------------------------------------
(declare-sort Creature 0)

;--------------------------------------------------------------------
; 2. Declare unary predicates (properties / classes)
;--------------------------------------------------------------------
(declare-fun numpus   (Creature) Bool)
(declare-fun zumpus   (Creature) Bool)
(declare-fun romp     (Creature) Bool)
(declare-fun vump     (Creature) Bool)
(declare-fun impus    (Creature) Bool)
(declare-fun liquid   (Creature) Bool)
(declare-fun jomp     (Creature) Bool)
(declare-fun dull     (Creature) Bool)
(declare-fun tump     (Creature) Bool)
(declare-fun spicy    (Creature) Bool)
(declare-fun yump     (Creature) Bool)
(declare-fun fruity   (Creature) Bool)
(declare-fun wump     (Creature) Bool)
(declare-fun brown    (Creature) Bool)
(declare-fun dump     (Creature) Bool)

; properties that appear negated in the premises
(declare-fun mean     (Creature) Bool)
(declare-fun cold     (Creature) Bool)
(declare-fun happy    (Creature) Bool)

;--------------------------------------------------------------------
; 3. Declare the constant for the individual "Rex"
;--------------------------------------------------------------------
(declare-const rex Creature)

;--------------------------------------------------------------------
; 4. Knowledge base (facts and universal rules)
;--------------------------------------------------------------------
; Numpuses are not mean.
(assert (forall ((x Creature))
  (=> (numpus x) (not (mean x)))))

; Each zumpus is not brown.
(assert (forall ((x Creature))
  (=> (zumpus x) (not (brown x)))))

; Numpuses are rompuses.
(assert (forall ((x Creature))
  (=> (numpus x) (romp x))))

; Every rompus is not cold.
(assert (forall ((x Creature))
  (=> (romp x) (not (cold x)))))

; Rompuses are vumpuses.
(assert (forall ((x Creature))
  (=> (romp x) (vump x))))

; Vumpuses are not happy.
(assert (forall ((x Creature))
  (=> (vump x) (not (happy x)))))

; Every vumpus is an impus.
(assert (forall ((x Creature))
  (=> (vump x) (impus x))))

; Each impus is liquid.
(assert (forall ((x Creature))
  (=> (impus x) (liquid x))))

; Impuses are jompuses.
(assert (forall ((x Creature))
  (=> (impus x) (jomp x))))

; Jompuses are dull.
(assert (forall ((x Creature))
  (=> (jomp x) (dull x))))

; Every jompus is a tumpus.
(assert (forall ((x Creature))
  (=> (jomp x) (tump x))))

; Every tumpus is spicy.
(assert (forall ((x Creature))
  (=> (tump x) (spicy x))))

; Tumpuses are yumpuses.
(assert (forall ((x Creature))
  (=> (tump x) (yump x))))

; Every yumpus is fruity.
(assert (forall ((x Creature))
  (=> (yump x) (fruity x))))

; Each yumpus is a wumpus.
(assert (forall ((x Creature))
  (=> (yump x) (wump x))))

; Wumpuses are brown.
(assert (forall ((x Creature))
  (=> (wump x) (brown x))))

; Wumpuses are dumpuses.
(assert (forall ((x Creature))
  (=> (wump x) (dump x))))

; Fact: Rex is an impus.
(assert (impus rex))

;--------------------------------------------------------------------
; 5. The statement we want to verify: "Rex is brown."
;--------------------------------------------------------------------
(assert (brown rex))

;--------------------------------------------------------------------
; 6. Ask Z3 whether the constraints are satisfiable.
;    sat  -> the statement is true (derivable)
;    unsat-> the statement is false (contradicts the KB)
;--------------------------------------------------------------------
(check-sat)
(get-model)