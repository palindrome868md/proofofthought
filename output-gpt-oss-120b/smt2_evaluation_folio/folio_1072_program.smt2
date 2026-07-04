;-------------------------------------------------
; 1. Sort and predicate declarations
;-------------------------------------------------
(declare-sort Lip 0)                         ; the type of lipsticks

; Boolean predicates on lipsticks
(declare-fun InSet (Lip) Bool)               ; lipstick belongs to the Rouge Dior set
(declare-fun Velvet (Lip) Bool)              ; has velvet finish
(declare-fun Satin (Lip) Bool)               ; has satin finish
(declare-fun Refillable (Lip) Bool)          ; is refillable
(declare-fun Rosewood (Lip) Bool)            ; description contains “rosewood”

; Constant for the particular product
(declare-const lip999 Lip)

;-------------------------------------------------
; 2. Premises
;-------------------------------------------------
; 1) All velvet‑finish lipsticks in the set are refillable
(assert (forall ((x Lip))
  (=> (and (InSet x) (Velvet x)) (Refillable x))))

; 2) Every lipstick in the set has either a velvet‑finish or a satin‑finish
(assert (forall ((x Lip))
  (=> (InSet x) (or (Velvet x) (Satin x)))))

; 3) No satin‑finish lipstick in the set lacks “rosewood”
;    (i.e., satin ⇒ rosewood)
(assert (forall ((x Lip))
  (=> (and (InSet x) (Satin x)) (Rosewood x))))

; 4) Trivial law: each lipstick either does not have or has “rosewood”
;    (kept for completeness)
(assert (forall ((x Lip))
  (=> (InSet x) (or (not (Rosewood x)) (Rosewood x)))))

; 5) ROUGE Dior Colored Lip Balm 999 is in the set and (rosewood ∨ velvet)
(assert (InSet lip999))
(assert (or (Rosewood lip999) (Velvet lip999)))

;-------------------------------------------------
; 3. Negation of the target statement
;    (Refillable ∧ Rosewood) → (Velvet ∨ Rosewood)
;    Negated: Refillable ∧ Rosewood ∧ ¬(Velvet ∨ Rosewood)
;-------------------------------------------------
(assert (and (Refillable lip999)
             (Rosewood lip999)
             (not (or (Velvet lip999) (Rosewood lip999)))))

;-------------------------------------------------
; 4. Check satisfiability
;-------------------------------------------------
(check-sat)   ; expected: unsat (the statement is true)
(get-model)   ; optional, will be empty because the problem is unsat