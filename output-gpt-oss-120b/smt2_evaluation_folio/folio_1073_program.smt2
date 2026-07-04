;-------------------------------------------------
; Sort declaration
(declare-sort Lip 0)

;-------------------------------------------------
; Predicate (function) declarations
(declare-fun velvet      (Lip) Bool)   ; velvet‑finish
(declare-fun satin       (Lip) Bool)   ; satin‑finish
(declare-fun refillable  (Lip) Bool)   ; refillable
(declare-fun rosewood    (Lip) Bool)   ; description contains "rosewood"

;-------------------------------------------------
; Constant: the particular lipstick in the set
(declare-const balm Lip)

;-------------------------------------------------
; Knowledge base (premises)

; 1. All velvet‑finish lipsticks are refillable
(assert (forall ((x Lip))
  (=> (velvet x) (refillable x))))

; 2. Every lipstick has either a velvet‑ or a satin‑finish
(assert (forall ((x Lip))
  (or (velvet x) (satin x))))

; 3. No satin‑finish lipstick lacks "rosewood"
;    (i.e., satin ⇒ rosewood)
(assert (forall ((x Lip))
  (=> (satin x) (rosewood x))))

; 4. Tautology: (not rosewood) or rosewood holds for all lipsticks
(assert (forall ((x Lip))
  (or (not (rosewood x)) (rosewood x))))

; 5. The concrete lipstick satisfies "rosewood OR velvet"
(assert (or (rosewood balm) (velvet balm)))

;-------------------------------------------------
; Negation of the statement to be verified:
;   ( (not rosewood(balm) or refillable(balm)) -> rosewood(balm) )
; becomes:
;   (not rosewood(balm) or refillable(balm))  AND  (not rosewood(balm))

(assert (and
          (or (not (rosewood balm)) (refillable balm))
          (not (rosewood balm))))   ; this is the negation of the implication

;-------------------------------------------------
; Ask Z3 whether the premises together with the negated statement are satisfiable
(check-sat)
(get-model)