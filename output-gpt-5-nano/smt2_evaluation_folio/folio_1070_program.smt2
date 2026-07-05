; Sorts
(declare-sort Lipstick 0)

; Predicates
(declare-fun velvet (Lipstick) Bool)
(declare-fun satin (Lipstick) Bool)
(declare-fun refillable (Lipstick) Bool)
(declare-fun rosewood_in_desc (Lipstick) Bool)
(declare-fun in_set (Lipstick) Bool)

; Constants
(declare-const rouge999 Lipstick)

; Knowledge base (premises)

; 999 is in the Rouge Dior set
(assert (in_set rouge999))

; 999 has either velvet or satin finish
(assert (or (velvet rouge999) (satin rouge999)))

; 1) All velvet-finish lipsticks in the set are refillable
(assert (forall ((l Lipstick)) (=> (and (in_set l) (velvet l)) (refillable l))))

; 2) Lipsticks in the set have either velvet or satin finish
(assert (forall ((l Lipstick)) (=> (in_set l) (or (velvet l) (satin l)))))

; 3) No satin-finish lipstick in the set does not have rosewood in its official description
; i.e., if satin and in_set, then rosewood_in_desc
(assert (forall ((l Lipstick)) (=> (and (in_set l) (satin l)) (rosewood_in_desc l))))

; 4) Lipsticks in the set either do not have rosewood or do have rosewood (tautology)
(assert (forall ((l Lipstick)) (or (not (rosewood_in_desc l)) (rosewood_in_desc l))))

; 5) 999 either has rosewood in its description or has velvet finish
(assert (or (rosewood_in_desc rouge999) (velvet rouge999)))

; Target statement to test:
; "ROUGE Dior Colored Lip Balm 999 either is refillable or has rosewood in its official description."
; Test by negating the statement and checking for satisfiability
(assert (not (or (refillable rouge999) (rosewood_in_desc rouge999))))

; Check satisfiability to determine truth of the statement
(check-sat)
(get-model)