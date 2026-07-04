; Sorts
(declare-sort Lipstick 0)

; Constants
(declare-const rouge-999 Lipstick)

; Predicates / Functions
(declare-fun in_set (Lipstick) Bool)
(declare-fun velvet (Lipstick) Bool)
(declare-fun satin (Lipstick) Bool)
(declare-fun refillable (Lipstick) Bool)
(declare-fun has_rosewood (Lipstick) Bool)

; Knowledge base (premises)

; ROUGE Dior Colored Lip Balm 999 is in the Rouge Dior set
(assert (in_set rouge-999))

; All lipsticks in the Rouge Dior set have either velvet or satin finish
(assert (forall ((l Lipstick)) (=> (in_set l) (or (velvet l) (satin l)))))

; All velvet-finish lipsticks in the set are refillable
(assert (forall ((l Lipstick)) (=> (and (in_set l) (velvet l)) (refillable l))))

; No satin-finish lipsticks in the set do not have "rosewood" in its official description
(assert (forall ((l Lipstick)) (=> (and (in_set l) (satin l)) (has_rosewood l))))

; Lipsticks in the Rouge Dior set either do not have "rosewood" or have it
(assert (or (has_rosewood rouge-999) (velvet rouge-999)))

; Test statement: A ∧ ¬B
; A = not (velvet(rouge-999) ∧ refillable(rouge-999))
(assert (not (and (velvet rouge-999) (refillable rouge-999))))
; ¬B = (refillable(rouge-999)) ∨ (has_rosewood(rouge-999))
(assert (or (refillable rouge-999) (has_rosewood rouge-999)))

; Check satisfiability
(check-sat)