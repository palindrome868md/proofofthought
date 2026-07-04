; 1. Declare sorts
(declare-sort Lipstick 0)

; 2. Declare functions (predicates)
(declare-fun InSet (Lipstick) Bool)
(declare-fun VelvetFinish (Lipstick) Bool)
(declare-fun SatinFinish (Lipstick) Bool)
(declare-fun Refillable (Lipstick) Bool)
(declare-fun HasRosewood (Lipstick) Bool)

; 3. Declare constants
(declare-const lipstick_999 Lipstick)

; 4. Assert knowledge base (premises)

; Premise 1: All velvet-finish lipsticks in the set are refillable.
(assert (forall ((x Lipstick))
  (=> (and (InSet x) (VelvetFinish x))
      (Refillable x))))

; Premise 2: Lipsticks in the set have either a velvet-finish or a satin-finish.
(assert (forall ((x Lipstick))
  (=> (InSet x)
      (or (VelvetFinish x) (SatinFinish x)))))

; Premise 3: No satin-finish lipsticks in the set do not have "rosewood" in its official description.
; (Equivalent to: All satin-finish lipsticks in the set have "rosewood")
(assert (forall ((x Lipstick))
  (=> (and (InSet x) (SatinFinish x))
      (HasRosewood x))))

; Premise 4: Lipsticks in the set either does not have "rosewood" or has "rosewood".
; (Tautology, but asserted for completeness)
(assert (forall ((x Lipstick))
  (=> (InSet x)
      (or (not (HasRosewood x)) (HasRosewood x)))))

; Premise 5: ROUGE Dior Colored Lip Balm 999 is a lipstick in the set.
(assert (InSet lipstick_999))

; Premise 6: It either has "rosewood" in its official description or has a velvet finish.
(assert (or (HasRosewood lipstick_999) (VelvetFinish lipstick_999)))

; 5. Verify the statement
; Statement: If ROUGE Dior Colored Lip Balm 999 is refillable and has "rosewood" in its official description, 
;            then it either has a velvet-finish or has "rosewood" in its official description.
; Logical Form: (Refillable AND HasRosewood) => (VelvetFinish OR HasRosewood)

(assert (=> (and (Refillable lipstick_999) (HasRosewood lipstick_999))
            (or (VelvetFinish lipstick_999) (HasRosewood lipstick_999))))

; 6. Check satisfiability
; sat = Statement is True (consistent with premises)
; unsat = Statement is False (contradicts premises)
(check-sat)
(get-model)