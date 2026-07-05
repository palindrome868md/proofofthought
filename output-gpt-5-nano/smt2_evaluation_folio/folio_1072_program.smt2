; Sorts
(declare-sort Lipstick 0)

; Predicates
(declare-fun in_rouge_dior_edition (Lipstick) Bool)
(declare-fun velvet_finish (Lipstick) Bool)
(declare-fun satin_finish (Lipstick) Bool)
(declare-fun rosewood_in_description (Lipstick) Bool)
(declare-fun refillable (Lipstick) Bool)

; Constants
(declare-const rouge999 Lipstick)

; Knowledge base

; 1. All velvet-finish lipsticks in the Rouge Dior set are refillable.
(assert (forall ((x Lipstick))
  (=> (and (in_rouge_dior_edition x) (velvet_finish x))
      (refillable x))))

; 2. Lipsticks in the Rouge Dior set have either velvet-finish or satin-finish.
(assert (forall ((x Lipstick))
  (=> (in_rouge_dior_edition x)
      (or (velvet_finish x) (satin_finish x)))))

; 3. No satin-finish lipsticks in the set do not have "rosewood" in its official description.
; interpreted as: satin_finish -> rosewood_in_description
(assert (forall ((x Lipstick))
  (=> (and (in_rouge_dior_edition x) (satin_finish x))
      (rosewood_in_description x))))

; 4. Lipsticks in the Rouge Dior set either does not have "rosewood" or has "rosewood".
; tautology (A or not A) for any x in the set
(assert (forall ((x Lipstick))
  (=> (in_rouge_dior_edition x)
      (or (not (rosewood_in_description x)) (rosewood_in_description x)))))

; 5. ROUGE Dior Colored Lip Balm 999 is a lipstick in the set, and it either has "rosewood" or has velvet finish.
(assert (in_rouge_dior_edition rouge999))
(assert (or (rosewood_in_description rouge999) (velvet_finish rouge999)))

; Question test: 
; Test negation of the implication:
; A = (refillable rouge999) and (rosewood_in_description rouge999)
; B = (velvet_finish rouge999) or (rosewood_in_description rouge999)
; Test: A ∧ ¬B
(assert (and (refillable rouge999)
             (rosewood_in_description rouge999)
             (not (or (velvet_finish rouge999) (rosewood_in_description rouge999)))))
(check-sat)
(get-model)