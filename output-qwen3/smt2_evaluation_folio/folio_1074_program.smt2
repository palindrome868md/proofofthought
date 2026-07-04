; 1. Declare sorts
(declare-sort Lipstick 0)

; 2. Declare functions
(declare-fun in_set (Lipstick) Bool)
(declare-fun velvet (Lipstick) Bool)
(declare-fun satin (Lipstick) Bool)
(declare-fun refillable (Lipstick) Bool)
(declare-fun has_rosewood (Lipstick) Bool)

; 3. Declare constants
(declare-const l999 Lipstick)

; 4. Assert knowledge base (premises)

; Premise 1: All velvet-finish lipsticks in the set are refillable.
(assert (forall ((x Lipstick))
  (=> (and (in_set x) (velvet x))
      (refillable x))))

; Premise 2: Lipsticks in the set have either a velvet-finish or a satin-finish.
; Assuming mutual exclusivity for finish types.
(assert (forall ((x Lipstick))
  (=> (in_set x)
      (and (or (velvet x) (satin x))
           (not (and (velvet x) (satin x)))))))

; Premise 3: No satin-finish lipsticks in the set do not have "rosewood" in its official description.
; Equivalent to: All satin-finish lipsticks in the set have "rosewood".
(assert (forall ((x Lipstick))
  (=> (and (in_set x) (satin x))
      (has_rosewood x))))

; Premise 4: Tautology (either has rosewood or does not), omitted as it adds no constraints.

; Premise 5: ROUGE Dior Colored Lip Balm 999 is in the set.
(assert (in_set l999))

; Premise 5 (cont.): It either has "rosewood" or has a velvet finish.
(assert (or (has_rosewood l999) (velvet l999)))

; 5. Assert the statement to be verified
; Statement: If (not rosewood OR refillable) then (not satin AND not rosewood)
(assert (=> 
          (or (not (has_rosewood l999)) (refillable l999))
          (and (not (satin l999)) (not (has_rosewood l999)))))

; 6. Check satisfiability
(check-sat)
(get-model)