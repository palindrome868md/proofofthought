; Declare sorts
(declare-sort Lipstick 0)

; Declare predicates
(declare-fun in_RD (Lipstick) Bool)
(declare-fun velvet_finish (Lipstick) Bool)
(declare-fun satin_finish (Lipstick) Bool)
(declare-fun refillable (Lipstick) Bool)
(declare-fun has_rosewood (Lipstick) Bool)

; Declare constants
(declare-const rouge999 Lipstick)

; Knowledge base (premises)

; 1. All velvet-finish lipsticks in RD set are refillable
(assert (forall ((l Lipstick))
  (=> (and (in_RD l) (velvet_finish l))
      (refillable l))))

; 2. Lipsticks in RD set have either velvet or satin finish
(assert (forall ((l Lipstick))
  (=> (in_RD l)
      (or (velvet_finish l) (satin_finish l)))))

; 3. No satin-finish lipsticks in the set do not have "rosewood" in official description
;    i.e., if satin_finish then has_rosewood
(assert (forall ((l Lipstick))
  (=> (and (in_RD l) (satin_finish l))
      (has_rosewood l))))

; 4. RD lipsticks either do not have rosewood or have rosewood (tautology)
(assert (forall ((l Lipstick))
  (=> (in_RD l)
      (or (not (has_rosewood l)) (has_rosewood l)))))

; 5. rouge999 is in RD and has either rosewood or velvet finish
(assert (in_RD rouge999))
(assert (or (has_rosewood rouge999) (velvet_finish rouge999)))

; Question: If rouge999 either does not have rosewood or is refillable, then it has rosewood.
; Negate the implication to check satisfiability
; p -> q is equivalent to (not p) or q
; Negation: p and not q
(assert (not (=> (or (not (has_rosewood rouge999)) (refillable rouge999))
                   (has_rosewood rouge999))))

; Check satisfiability to determine truth of the statement
(check-sat)
(get-model)