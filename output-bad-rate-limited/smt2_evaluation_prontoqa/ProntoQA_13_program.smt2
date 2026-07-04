; Sorts
(declare-sort Creature 0)

; Constants
(declare-const max Creature)

; Predicates
(declare-fun is-yumpus (Creature) Bool)
(declare-fun is-dumpus (Creature) Bool)
(declare-fun is-zumpus (Creature) Bool)
(declare-fun is-impus (Creature) Bool)
(declare-fun is-rompus (Creature) Bool)
(declare-fun is-numpus (Creature) Bool)
(declare-fun is-jompus (Creature) Bool)
(declare-fun is-wumpus (Creature) Bool)
(declare-fun is-tumpus (Creature) Bool)
(declare-fun is-opaque (Creature) Bool)
(declare-fun is-floral (Creature) Bool)
(declare-fun is-large (Creature) Bool)
(declare-fun is-spicy (Creature) Bool)
(declare-fun is-amenable (Creature) Bool)
(declare-fun is-hot (Creature) Bool)
(declare-fun is-metallic (Creature) Bool)
(declare-fun is-vumpus (Creature) Bool)
(declare-fun is-dull (Creature) Bool)

; Knowledge base / axioms
; Max is a zumpus
(assert (is-zumpus max))

; Yumpus -> dumpus
(assert (forall ((p Creature)) (=> (is-yumpus p) (is-dumpus p))))
; Dumpus -> floral
(assert (forall ((p Creature)) (=> (is-dumpus p) (is-floral p))))
; Yumpus -> opaque
(assert (forall ((p Creature)) (=> (is-yumpus p) (is-opaque p))))

; Zumpus properties
(assert (forall ((p Creature)) (=> (is-zumpus p) (is-impus p))))
(assert (forall ((p Creature)) (=> (is-zumpus p) (is-hot p))))
; Impus -> large, rompus
(assert (forall ((p Creature)) (=> (is-impus p) (is-large p))))
(assert (forall ((p Creature)) (=> (is-impus p) (is-rompus p))))
; Rompus -> numpus
(assert (forall ((p Creature)) (=> (is-rompus p) (is-numpus p))))
; Numpus -> amenable
(assert (forall ((p Creature)) (=> (is-numpus p) (is-amenable p))))
; Numpus -> jompus
(assert (forall ((p Creature)) (=> (is-numpus p) (is-jompus p))))
; Jompus -> wumpus
(assert (forall ((p Creature)) (=> (is-jompus p) (is-wumpus p))))
; Wumpus -> tumpus
(assert (forall ((p Creature)) (=> (is-wumpus p) (is-tumpus p))))
; Jompus -> dull
(assert (forall ((p Creature)) (=> (is-jompus p) (is-dull p))))
; Vumpus -> not dull
(assert (forall ((p Creature)) (=> (is-vumpus p) (not (is-dull p)))))

; Test: Is Max dull?
; We test by asserting the positive statement and checking satisfiability
(assert (is-dull max))

(check-sat)
(get-model)