; -------------------------------------------------
; 1. Declare the domain sort
; -------------------------------------------------
(declare-sort Entity 0)

; -------------------------------------------------
; 2. Declare unary predicates (properties / classes)
; -------------------------------------------------
(declare-fun isZumpus    (Entity) Bool)
(declare-fun isVumpus    (Entity) Bool)
(declare-fun isJompus    (Entity) Bool)
(declare-fun isWumpus    (Entity) Bool)
(declare-fun isImpus     (Entity) Bool)
(declare-fun isYumpus    (Entity) Bool)
(declare-fun isDumpus    (Entity) Bool)
(declare-fun isRompus    (Entity) Bool)
(declare-fun isTumpus    (Entity) Bool)
(declare-fun isNumpus    (Entity) Bool)

(declare-fun isWooden    (Entity) Bool)
(declare-fun isSour      (Entity) Bool)
(declare-fun isFloral    (Entity) Bool)
(declare-fun isTransparent (Entity) Bool)
(declare-fun isDull      (Entity) Bool)
(declare-fun isOrange    (Entity) Bool)
(declare-fun isAggressive (Entity) Bool)
(declare-fun isFeisty    (Entity) Bool)

; -------------------------------------------------
; 3. Declare the individual mentioned in the query
; -------------------------------------------------
(declare-const Fae Entity)

; -------------------------------------------------
; 4. Knowledge base (universal rules)
; -------------------------------------------------
(assert (forall ((x Entity)) (=> (isZumpus x) (not (isWooden x)))))
(assert (forall ((x Entity)) (=> (isZumpus x) (isVumpus x))))
(assert (forall ((x Entity)) (=> (isVumpus x) (not (isSour x)))))
(assert (forall ((x Entity)) (=> (isVumpus x) (isJompus x))))
(assert (forall ((x Entity)) (=> (isJompus x) (isFloral x))))
(assert (forall ((x Entity)) (=> (isJompus x) (isWumpus x))))
(assert (forall ((x Entity)) (=> (isWumpus x) (isTransparent x))))
(assert (forall ((x Entity)) (=> (isWumpus x) (isImpus x))))
(assert (forall ((x Entity)) (=> (isImpus x) (isDull x))))
(assert (forall ((x Entity)) (=> (isImpus x) (isYumpus x))))
(assert (forall ((x Entity)) (=> (isYumpus x) (isFeisty x))))
(assert (forall ((x Entity)) (=> (isYumpus x) (isDumpus x))))
(assert (forall ((x Entity)) (=> (isDumpus x) (isOrange x))))
(assert (forall ((x Entity)) (=> (isDumpus x) (isRompus x))))
(assert (forall ((x Entity)) (=> (isRompus x) (not (isAggressive x)))))
(assert (forall ((x Entity)) (=> (isRompus x) (isTumpus x))))
(assert (forall ((x Entity)) (=> (isNumpus x) (not (isOrange x)))))

; -------------------------------------------------
; 5. Facts from the problem statement
; -------------------------------------------------
(assert (isJompus Fae))          ; “Fae is a jompus.”

; -------------------------------------------------
; 6. Test the claim: “Fae is orange.”
;    We assert its negation; if the KB forces orange,
;    the negation will be impossible → unsat.
; -------------------------------------------------
(assert (not (isOrange Fae)))

; -------------------------------------------------
; 7. Run the solver
; -------------------------------------------------
(check-sat)
(get-model)