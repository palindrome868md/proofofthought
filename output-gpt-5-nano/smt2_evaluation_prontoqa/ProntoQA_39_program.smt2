; Declare a general entity sort
(declare-sort Entity 0)

; Predicates representing properties and classes
(declare-fun isRompus (Entity) Bool)
(declare-fun isImpus (Entity) Bool)
(declare-fun isAmenable (Entity) Bool)
(declare-fun isHappy (Entity) Bool)
(declare-fun isWumpus (Entity) Bool)
(declare-fun isZumpus (Entity) Bool)
(declare-fun isTumpus (Entity) Bool)
(declare-fun isVumpus (Entity) Bool)
(declare-fun isJompus (Entity) Bool)
(declare-fun isDumpus (Entity) Bool)
(declare-fun isSour (Entity) Bool)
(declare-fun isFruity (Entity) Bool)
(declare-fun notLarge (Entity) Bool)
(declare-fun isLiquid (Entity) Bool)
(declare-fun isYumpus (Entity) Bool)
(declare-fun isHot (Entity) Bool)
(declare-fun notHot (Entity) Bool)

; Constant for Stella
(declare-const Stella Entity)

; Knowledge base (as per the given statements)
; 1) Each rompus is amenable
(assert (forall ((x Entity)) (=> (isRompus x) (isAmenable x))))
; 2) Each rompus is an impus
(assert (forall ((x Entity)) (=> (isRompus x) (isImpus x))))
; 3) Impuses are happy
(assert (forall ((x Entity)) (=> (isImpus x) (isHappy x))))
; 4) Every impus is a wumpus
(assert (forall ((x Entity)) (=> (isImpus x) (isWumpus x))))
; 5) Wumpuses are sour
(assert (forall ((x Entity)) (=> (isWumpus x) (isSour x))))
; 6) Each wumpus is a zumpus
(assert (forall ((x Entity)) (=> (isWumpus x) (isZumpus x))))
; 7) Zumpuses are fruity
(assert (forall ((x Entity)) (=> (isZumpus x) (isFruity x))))
; 8) Zumpuses are tumpuses
(assert (forall ((x Entity)) (=> (isZumpus x) (isTumpus x))))
; 9) Each tumpus is not large
(assert (forall ((x Entity)) (=> (isTumpus x) (notLarge x))))
; 10) Every tumpus is a vumpus
(assert (forall ((x Entity)) (=> (isTumpus x) (isVumpus x))))
; 11) Every vumpus is a jompus
(assert (forall ((x Entity)) (=> (isVumpus x) (isJompus x))))
; 12) Every vumpus is liquid
(assert (forall ((x Entity)) (=> (isVumpus x) (isLiquid x))))
; 13) Jompuses are hot
(assert (forall ((x Entity)) (=> (isJompus x) (isHot x))))
; 14) Jompuses are dumpuses
(assert (forall ((x Entity)) (=> (isJompus x) (isDumpus x))))
; 15) Stella is a wumpus
(assert (isWumpus Stella))
; 16) Test statement: "Stella is not hot."
(assert (notHot Stella))

; Check satisfiability to determine truth of the test statement
(check-sat)