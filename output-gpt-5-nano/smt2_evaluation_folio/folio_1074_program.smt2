; Sort for Lipstick items
(declare-sort Lipstick 0)

; Predicates / Properties
(declare-fun InRougeDiorLNLE (Lipstick) Bool)   ; is in Rouge Dior Lunar New Year Limited Edition set
(declare-fun velvet_finish (Lipstick) Bool)     ; has velvet finish
(declare-fun satin_finish (Lipstick) Bool)     ; has satin finish
(declare-fun rosewood_desc (Lipstick) Bool)    ; rosewood in official description
(declare-fun refillable (Lipstick) Bool)       ; is refillable

; Constants
(declare-const ROUGE999 Lipstick)              ; ROUGE Dior Colored Lip Balm 999

; Premises (Knowledge Base)

; 1. ROUGE999 is in the Rouge Dior LNLE set
(assert (InRougeDiorLNLE ROUGE999))

; 2. ROUGE999 either has rosewood in description or velvet finish
(assert (or (rosewood_desc ROUGE999) (velvet_finish ROUGE999)))

; 3. All velvet-finish lipsticks in the set are refillable
(assert (forall ((x Lipstick))
  (=> (InRougeDiorLNLE x)
      (=> (velvet_finish x)
           (refillable x)))))

; 4. Lipsticks in the set have either velvet or satin finish
(assert (forall ((x Lipstick))
  (=> (InRougeDiorLNLE x)
      (or (velvet_finish x) (satin_finish x)))))

; 5. No satin-finish lipstick in the set does not have "rosewood" in its official description
;    i.e., if satin_finish and in set, then rosewood_desc
(assert (forall ((x Lipstick))
  (=> (and (InRougeDiorLNLE x) (satin_finish x))
      (rosewood_desc x))))

; 6. The statement about rosewood/or velvet for lipsticks in the set (tautological)
(assert (forall ((x Lipstick))
  (=> (InRougeDiorLNLE x)
      (or (not (rosewood_desc x)) (rosewood_desc x)))))

; 7. The ROUGE999 lipstick either has rosewood or velvet finish (explicit instantiation)
(assert (or (rosewood_desc ROUGE999) (velvet_finish ROUGE999)))

; Verification: Test the given statement by asserting the negation of the statement
; Statement S:
; If ROUGE999 either does not have "rosewood" in its official description or is refillable,
; then it neither has a satin-finish nor has "rosewood" in its official description.

; Negation of S to test entailment: (A -> B) is false iff A is true and B is false
; A := (or (not rosewood_desc(ROUGE999)) (refillable ROUGE999))
; B := (and (not satin_finish(ROUGE999)) (not rosewood_desc(ROUGE999)))
; not (A -> B)  ==  A and (satin_finish(ROUGE999) OR rosewood_desc(ROUGE999))

(assert (and
  (or (not (rosewood_desc ROUGE999)) (refillable ROUGE999))
  (or (satin_finish ROUGE999) (rosewood_desc ROUGE999))
))

(check-sat)
(get-model)