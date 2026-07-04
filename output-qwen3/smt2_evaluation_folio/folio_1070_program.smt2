; 1. Declare sorts
(declare-sort Lipstick 0)

; 2. Declare functions (predicates)
(declare-fun in-set (Lipstick) Bool)
(declare-fun is-velvet (Lipstick) Bool)
(declare-fun is-satin (Lipstick) Bool)
(declare-fun is-refillable (Lipstick) Bool)
(declare-fun has-rosewood (Lipstick) Bool)

; 3. Declare constants
(declare-const lipstick-999 Lipstick)

; 4. Assert knowledge base (premises)

; Premise 1: All velvet-finish lipsticks in the Rouge Dior set are refillable.
(assert (forall ((x Lipstick))
  (=> (and (in-set x) (is-velvet x))
      (is-refillable x))))

; Premise 2: Lipsticks in the set have either a velvet-finish or a satin-finish.
(assert (forall ((x Lipstick))
  (=> (in-set x)
      (or (is-velvet x) (is-satin x)))))

; Premise 3: No satin-finish lipsticks in the set do not have "rosewood" in its official description.
; Logical equivalent: All satin-finish lipsticks in the set HAVE "rosewood".
(assert (forall ((x Lipstick))
  (=> (and (in-set x) (is-satin x))
      (has-rosewood x))))

; Premise 4: Lipsticks in the set either do not have "rosewood" or have "rosewood".
; This is a tautology (Law of Excluded Middle) and adds no constraints, so it is omitted.

; Premise 5: ROUGE Dior Colored Lip Balm 999 is a lipstick in the set.
(assert (in-set lipstick-999))

; Premise 5 (continued): ... and it either has "rosewood" in its official description or has a velvet finish.
(assert (or (has-rosewood lipstick-999) (is-velvet lipstick-999)))

; 5. Assert the statement to verify
; Statement: ROUGE Dior Colored Lip Balm 999 either is refillable or has "rosewood" in its official description.
(assert (or (is-refillable lipstick-999) (has-rosewood lipstick-999)))

; 6. Check satisfiability
; If sat, the statement is consistent/True given the premises.
; If unsat, the statement contradicts the premises/False.
(check-sat)
(get-model)