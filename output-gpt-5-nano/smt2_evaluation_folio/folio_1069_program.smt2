; Declarations
(declare-sort Lipstick 0)
(declare-fun velvetFinish (Lipstick) Bool)
(declare-fun satinFinish (Lipstick) Bool)
(declare-fun hasRosewood (Lipstick) Bool)
(declare-fun refillable (Lipstick) Bool)
(declare-fun inSet (Lipstick) Bool)
(declare-const rouge999 Lipstick)

; Premises
; 1. All velvet-finish lipsticks in the Rouge Dior set, Lunar New Year Limited Edition are refillable.
(assert (forall ((l Lipstick))
  (=> (and (inSet l) (velvetFinish l)) (refillable l))))

; 2. Lipsticks in the set have either velvet or satin finish.
(assert (forall ((l Lipstick))
  (=> (inSet l) (or (velvetFinish l) (satinFinish l)))))

; 3. No satin-finish lipsticks in the set do not have "rosewood" in its official description.
; Interpretation: satinFinish -> hasRosewood
(assert (forall ((l Lipstick))
  (=> (and (inSet l) (satinFinish l)) (hasRosewood l))))

; 4. Lipsticks in the set either does not have "rosewood" in its official description or it has "rosewood".
(assert (forall ((l Lipstick))
  (=> (inSet l) (or (not (hasRosewood l)) (hasRosewood l)))))

; 5. ROUGE Dior Colored Lip Balm 999 is a lipstick in the set, and it either has "rosewood" in its official description or has a velvet finish.
(assert (inSet rouge999))
(assert (or (hasRosewood rouge999) (velvetFinish rouge999)))

; Test: negate the statement to verify its truth
; Statement to verify: rouge999 satinFinish AND hasRosewood
(assert (not (and (satinFinish rouge999) (hasRosewood rouge999))))
(check-sat)
(get-model)