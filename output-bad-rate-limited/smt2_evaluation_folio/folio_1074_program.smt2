; Declare sorts
(declare-sort Lipstick 0)

; Predicates
(declare-fun VelvetFinish (Lipstick) Bool)
(declare-fun SatinFinish (Lipstick) Bool)
(declare-fun Refillable (Lipstick) Bool)
(declare-fun InRougeDiorLNY (Lipstick) Bool)
(declare-fun HasRosewood (Lipstick) Bool)

; Constants
(declare-const rouge999 Lipstick)

; Knowledge base

; 1. All velvet-finish lipsticks in the Rouge Dior set are refillable.
(assert (forall ((l Lipstick))
  (=> (and (InRougeDiorLNY l) (VelvetFinish l)) (Refillable l))))

; 2. Lipsticks in the Rouge Dior set have either a velvet-finish or a satin-finish.
(assert (forall ((l Lipstick))
  (=> (InRougeDiorLNY l) (or (VelvetFinish l) (SatinFinish l)))))

; 3. No satin-finish lipsticks in the set do not have "rosewood" in its official description.
; Interpreted as: satin lipsticks in the set have rosewood.
(assert (forall ((l Lipstick))
  (=> (and (InRougeDiorLNY l) (SatinFinish l)) (HasRosewood l))))

; 4. (tautological) omitted

; 5. ROUGE Dior Colored Lip Balm 999 is in the set, and it either has "rosewood" or velvet finish.
(assert (InRougeDiorLNY rouge999))
(assert (or (HasRosewood rouge999) (VelvetFinish rouge999)))

; Test scenario for the statement:
; A: (not HasRosewood(rouge999) OR Refillable(rouge999))
(assert (or (not (HasRosewood rouge999)) (Refillable rouge999)))

; NOT B: where B is (not SatinFinish(rouge999) AND not HasRosewood(rouge999))
; not B is (SatinFinish(rouge999) OR HasRosewood(rouge999))
(assert (or (SatinFinish rouge999) (HasRosewood rouge999)))

; Check satisfiability and query a model
(check-sat)
(get-model)