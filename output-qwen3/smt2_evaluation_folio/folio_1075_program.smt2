; 1. Declare sorts
(declare-sort Lipstick 0)

; 2. Declare functions (predicates)
(declare-fun in-set (Lipstick) Bool)
(declare-fun velvet-finish (Lipstick) Bool)
(declare-fun satin-finish (Lipstick) Bool)
(declare-fun refillable (Lipstick) Bool)
(declare-fun has-rosewood (Lipstick) Bool)

; 3. Declare constants
(declare-const c Lipstick) ; Represents ROUGE Dior Colored Lip Balm 999

; 4. Assert knowledge base (premises)

; Premise 1: All velvet-finish lipsticks in the set are refillable.
(assert (forall ((l Lipstick))
  (=> (and (in-set l) (velvet-finish l))
      (refillable l))))

; Premise 2: Lipsticks in the set have either a velvet-finish or a satin-finish.
(assert (forall ((l Lipstick))
  (=> (in-set l)
      (or (velvet-finish l) (satin-finish l)))))

; Premise 3: No satin-finish lipsticks in the set do not have "rosewood" in its official description.
; Logic: Not (Satin AND Not Rosewood) <=> Satin => Rosewood
(assert (forall ((l Lipstick))
  (=> (and (in-set l) (satin-finish l))
      (has-rosewood l))))

; Premise 4: Lipsticks in the set either does not have "rosewood" or has "rosewood".
; Logic: Tautology (Not Rosewood OR Rosewood)
(assert (forall ((l Lipstick))
  (=> (in-set l)
      (or (not (has-rosewood l)) (has-rosewood l)))))

; Premise 5: c is in the set, and (c has "rosewood" OR c has velvet finish).
(assert (in-set c))
(assert (or (has-rosewood c) (velvet-finish c)))

; 5. Assert the statement to verify
; Statement: If (refillable OR rosewood) then (refillable OR rosewood)
(assert (=> (or (refillable c) (has-rosewood c))
            (or (refillable c) (has-rosewood c))))

; 6. Check satisfiability
(check-sat)
(get-model)