; -------------------------------------------------
;  Sort and predicate declarations
; -------------------------------------------------
(declare-sort Lipstick 0)

(declare-fun InSet (Lipstick) Bool)          ; belongs to the Rouge Dior LNY set
(declare-fun Velvet (Lipstick) Bool)        ; has velvet finish
(declare-fun Satin (Lipstick) Bool)         ; has satin finish
(declare-fun Refillable (Lipstick) Bool)    ; is refillable
(declare-fun Rosewood (Lipstick) Bool)      ; description contains "rosewood"

; -------------------------------------------------
;  Constant for the specific product
; -------------------------------------------------
(declare-const R Lipstick)   ; ROUGE Dior Colored Lip Balm 999

; -------------------------------------------------
;  Premises
; -------------------------------------------------
; 1. All velvet‑finish lipsticks in the set are refillable.
(assert (forall ((l Lipstick))
  (=> (and (InSet l) (Velvet l))
      (Refillable l))))

; 2. Lipsticks in the set have either a velvet‑finish or a satin‑finish.
(assert (forall ((l Lipstick))
  (=> (InSet l)
      (or (Velvet l) (Satin l)))))

; 3. No satin‑finish lipstick in the set lacks "rosewood".
;    (i.e., every satin lipstick in the set has rosewood.)
(assert (forall ((l Lipstick))
  (=> (and (InSet l) (Satin l))
      (Rosewood l))))

; 4. In the set, each lipstick either does not have rosewood or has rosewood
;    (law of excluded middle – kept for completeness).
(assert (forall ((l Lipstick))
  (=> (InSet l)
      (or (not (Rosewood l)) (Rosewood l)))))

; 5. R is in the set and it either has rosewood or has a velvet finish.
(assert (InSet R))
(assert (or (Rosewood R) (Velvet R)))

; -------------------------------------------------
;  Negation of the statement to be proved
; -------------------------------------------------
; Statement: (or (not (Rosewood R)) (Refillable R))
;            => (and (not (Satin R)) (not (Rosewood R)))
; Negation: antecedent holds AND consequent is false.
(assert (and
          (or (not (Rosewood R)) (Refillable R))          ; antecedent true
          (not (and (not (Satin R)) (not (Rosewood R)))))) ; consequent false

; -------------------------------------------------
;  Check entailment
; -------------------------------------------------
(check-sat)   ; unsat => statement is logically true given the premises
(get-model)   ; only shown if the solver returns sat