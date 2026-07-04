;------------------------------------------------------------
; 1. Declare the uninterpreted sort for all objects
;------------------------------------------------------------
(declare-sort Entity 0)

;------------------------------------------------------------
; 2. Declare the unary predicates (properties / classes)
;------------------------------------------------------------
(declare-fun Tumpus   (Entity) Bool)
(declare-fun Vumpus   (Entity) Bool)
(declare-fun Numpus   (Entity) Bool)
(declare-fun Rompus   (Entity) Bool)
(declare-fun Impus    (Entity) Bool)
(declare-fun Jompus   (Entity) Bool)
(declare-fun Yumpus   (Entity) Bool)

(declare-fun Sour     (Entity) Bool)
(declare-fun Bright   (Entity) Bool)
(declare-fun Liquid   (Entity) Bool)
(declare-fun Brown    (Entity) Bool)
(declare-fun Small    (Entity) Bool)

;------------------------------------------------------------
; 3. Declare the individual constant
;------------------------------------------------------------
(declare-const max Entity)

;------------------------------------------------------------
; 4. Knowledge base (facts + rules)
;------------------------------------------------------------

; Basic facts
(assert (Tumpus max))          ; Max is a tumpus

; Class hierarchy / property rules
; Tumpus → Vumpus → Numpus → Impus → Jompus → Brown
(assert (forall ((x Entity))
          (=> (Tumpus x) (Vumpus x))))
(assert (forall ((x Entity))
          (=> (Vumpus x) (Numpus x))))
(assert (forall ((x Entity))
          (=> (Numpus x) (Liquid x))))        ; Each numpus is liquid
(assert (forall ((x Entity))
          (=> (Numpus x) (Impus x))))         ; Numpuses are impuses
(assert (forall ((x Entity))
          (=> (Impus x) (not (Small x)))))    ; Impuses are not small
(assert (forall ((x Entity))
          (=> (Impus x) (Jompus x))))        ; Impuses are jompuses
(assert (forall ((x Entity))
          (=> (Jompus x) (Brown x))))        ; Jompuses are brown
(assert (forall ((x Entity))
          (=> (Jompus x) (Yumpus x))))       ; Jompuses are yumpuses

; Additional given facts
(assert (forall ((x Entity))
          (=> (Tumpus x) (Sour x))))         ; Tumpuses are sour
(assert (forall ((x Entity))
          (=> (Vumpus x) (Bright x))))       ; Vumpuses are bright
(assert (forall ((x Entity))
          (=> (Rompus x) (not (Brown x)))))  ; Each rompus is not brown

;------------------------------------------------------------
; 5. Query: "Max is not brown"
;------------------------------------------------------------
(assert (not (Brown max)))   ; assume Max is NOT brown

;------------------------------------------------------------
; 6. Check satisfiability
;------------------------------------------------------------
(check-sat)   ; expected: unsat (the statement is false)
(get-model)