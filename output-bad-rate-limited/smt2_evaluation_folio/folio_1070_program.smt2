; Sorts
(declare-sort Lipstick 0)

; Predicates
(declare-fun in_rouge_dior_lnyle (Lipstick) Bool)
(declare-fun velvet (Lipstick) Bool)
(declare-fun satin (Lipstick) Bool)
(declare-fun refillable (Lipstick) Bool)
(declare-fun rosewood_in_description (Lipstick) Bool)

; Constants
(declare-const lip_999 Lipstick)

; 1. All velvet-finish lipsticks in Rouge Dior set, Lunar New Year Limited Edition are refillable.
(assert (forall ((l Lipstick))
  (=> (in_rouge_dior_lnyle l)
      (=> (velvet l)
          (refillable l)))))

; 2. Lipsticks in the Rouge Dior set, Lunar New Year Limited Edition have either velvet-finish or satin-finish.
(assert (forall ((l Lipstick))
  (=> (in_rouge_dior_lnyle l)
      (or (velvet l) (satin l)))))

; 3. No satin-finish lipsticks in the set do not have "rosewood" in its official description.
; i.e., if in set and satin, then not rosewood_in_description
(assert (forall ((l Lipstick))
  (=> (and (in_rouge_dior_lnyle l) (satin l))
      (not (rosewood_in_description l)))))

; 4. Lipsticks in the Rouge Dior set, Lunar New Year Limited Edition either does not have or has "rosewood" in its official description.
; (tautological constraint included per problem statement)
(assert (forall ((l Lipstick))
  (=> (in_rouge_dior_lnyle l)
      (or (not (rosewood_in_description l)) (rosewood_in_description l)))))

; 5. ROUGE Dior Colored Lip Balm 999 is a lipstick in the set, and it either has "rosewood" or has a velvet finish.
(assert (in_rouge_dior_lnyle lip_999))
(assert (or (rosewood_in_description lip_999) (velvet lip_999)))

; Test: "ROUGE Dior Colored Lip Balm 999 either is refillable or has 'rosewood' in its official description."
(assert (or (refillable lip_999) (rosewood_in_description lip_999)))

; Verification
(check-sat)
(get-model)