; Declare an uninterpreted sort for all individuals
(declare-sort Entity 0)

; Declare predicates (functions returning Bool)
(declare-fun sees   (Entity Entity) Bool)   ; sees(subject, object)
(declare-fun eats   (Entity Entity) Bool)   ; eats(subject, object)
(declare-fun visits (Entity Entity) Bool)   ; visits(subject, object)
(declare-fun young  (Entity) Bool)          ; young(entity)
(declare-fun round  (Entity) Bool)          ; round(entity)

; Declare the two relevant constants
(declare-const cat     Entity)
(declare-const squirrel Entity)

; -----------------------------
; Knowledge base (facts)
; -----------------------------
(assert (sees cat squirrel))      ; The cat sees the squirrel.
(assert (sees squirrel cat))      ; The squirrel sees the cat.

; -----------------------------
; Rules (implications)
; -----------------------------
; Rule A: If someone visits the cat and the cat is young then they eat the squirrel.
(assert
  (forall ((x Entity))
    (=> (and (visits x cat) (young cat))
        (eats x squirrel))))

; Rule B: If someone eats the squirrel and the squirrel sees the cat then the squirrel is round.
(assert
  (forall ((x Entity))
    (=> (and (eats x squirrel) (sees squirrel cat))
        (round squirrel))))

; Rule C: If someone sees the cat and the cat sees the squirrel then they eat the squirrel.
(assert
  (forall ((x Entity))
    (=> (and (sees x cat) (sees cat squirrel))
        (eats x squirrel))))

; -----------------------------
; Query: Does the squirrel eat the squirrel?
; -----------------------------
(assert (eats squirrel squirrel))

; Check whether the knowledge base together with the query is consistent.
(check-sat)
(get-model)