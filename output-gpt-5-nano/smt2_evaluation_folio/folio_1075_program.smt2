; Declare sorts
(declare-sort Lipstick 0)

; Declare predicates/functions
(declare-fun velvet (Lipstick) Bool)
(declare-fun satin (Lipstick) Bool)
(declare-fun refillable (Lipstick) Bool)
(declare-fun rosewood (Lipstick) Bool)
(declare-fun in_rouge_lny (Lipstick) Bool)

; Declare constants
(declare-const rouge999 Lipstick)

; Knowledge base (premises)

; 1) All velvet-finish lipsticks in Rouge Dior set Lunar New Year Limited Edition are refillable.
(assert (forall ((l Lipstick))
  (=> (and (velvet l) (in_rouge_lny l))
      (refillable l))))

; 2) Lipsticks in the Rouge Dior set Lunar New Year Limited Edition have either a velvet-finish or a satin-finish.
(assert (forall ((l Lipstick))
  (=> (in_rouge_lny l)
      (or (velvet l) (satin l)))))

; 3) No satin-finish lipsticks in the set do not have "rosewood" in its official description.
;    (i.e., satin -> rosewood)
(assert (forall ((l Lipstick))
  (=> (and (satin l) (in_rouge_lny l))
      (rosewood l))))

; 4) Lipsticks in the Rouge Dior set Lunar New Year Limited Edition either do not have rosewood
;    or have rosewood (tautology, included as given)
(assert (forall ((l Lipstick))
  (or (not (rosewood l)) (rosewood l))))

; 5) ROUGE Dior Colored Lip Balm 999 is a lipstick in the set, and it either has "rosewood" or has a velvet finish.
(assert (in_rouge_lny rouge999))
(assert (or (rosewood rouge999) (velvet rouge999)))

; Test statement:
; If rouge999 is refillable or has rosewood, then rouge999 is either refillable or rosewood.
; (A -> B) with A = (refillable rouge999) OR (rosewood rouge999)
; We test the negation to see if premises entail the statement.
(assert (not
  (=> (or (refillable rouge999) (rosewood rouge999))
      (or (refillable rouge999) (rosewood rouge999)))))

; Check satisfiability and get a model if sat
(check-sat)
(get-model)