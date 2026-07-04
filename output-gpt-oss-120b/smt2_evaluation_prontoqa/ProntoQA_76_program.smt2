;--- Sort declaration -------------------------------------------------
(declare-sort Creature 0)

;--- Predicate (unary function) declarations ---------------------------
(declare-fun zumpus          (Creature) Bool)
(declare-fun spicy           (Creature) Bool)
(declare-fun yumpus          (Creature) Bool)
(declare-fun cold            (Creature) Bool)
(declare-fun impus           (Creature) Bool)
(declare-fun red             (Creature) Bool)
(declare-fun jompus          (Creature) Bool)
(declare-fun feisty          (Creature) Bool)
(declare-fun rompus          (Creature) Bool)
(declare-fun angry           (Creature) Bool)
(declare-fun wumpus          (Creature) Bool)
(declare-fun vumpus          (Creature) Bool)
(declare-fun small           (Creature) Bool)
(declare-fun numpus          (Creature) Bool)
(declare-fun earthy          (Creature) Bool)
(declare-fun tumpus          (Creature) Bool)
(declare-fun luminous        (Creature) Bool)
(declare-fun dumpus          (Creature) Bool)

;--- Constant declaration -----------------------------------------------
(declare-const sally Creature)

;--- Knowledge base ----------------------------------------------------
; Zumpuses are not spicy
(assert (forall ((x Creature))
          (=> (zumpus x) (not (spicy x)))))

; Each yumpus is cold
(assert (forall ((x Creature))
          (=> (yumpus x) (cold x))))

; Yumpuses are impuses
(assert (forall ((x Creature))
          (=> (yumpus x) (impus x))))

; Every impus is red
(assert (forall ((x Creature))
          (=> (impus x) (red x))))

; Impuses are jompuses
(assert (forall ((x Creature))
          (=> (impus x) (jompus x))))

; Every jompus is not feisty
(assert (forall ((x Creature))
          (=> (jompus x) (not (feisty x)))))

; Every jompus is a rompus
(assert (forall ((x Creature))
          (=> (jompus x) (rompus x))))

; Rompuses are angry
(assert (forall ((x Creature))
          (=> (rompus x) (angry x))))

; Each rompus is a wumpus
(assert (forall ((x Creature))
          (=> (rompus x) (wumpus x))))

; Each wumpus is spicy
(assert (forall ((x Creature))
          (=> (wumpus x) (spicy x))))

; Wumpuses are vumpuses
(assert (forall ((x Creature))
          (=> (wumpus x) (vumpus x))))

; Vumpuses are not small
(assert (forall ((x Creature))
          (=> (vumpus x) (not (small x)))))

; Vumpuses are numpuses
(assert (forall ((x Creature))
          (=> (vumpus x) (numpus x))))

; Numpuses are earthy
(assert (forall ((x Creature))
          (=> (numpus x) (earthy x))))

; Numpuses are tumpuses
(assert (forall ((x Creature))
          (=> (numpus x) (tumpus x))))

; Every tumpus is luminous
(assert (forall ((x Creature))
          (=> (tumpus x) (luminous x))))

; Tumpuses are dumpuses
(assert (forall ((x Creature))
          (=> (tumpus x) (dumpus x))))

; Sally is a yumpus
(assert (yumpus sally))

;--- Test the claim ----------------------------------------------------
; Claim: Sally is spicy
(assert (spicy sally))

;--- Check satisfiability -----------------------------------------------
(check-sat)
(get-model)