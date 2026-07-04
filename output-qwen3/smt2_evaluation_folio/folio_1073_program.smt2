; SMT-LIB 2.0 Program for Logical Reasoning Verification
; Problem: Verify the truth of a statement regarding ROUGE Dior Colored Lip Balm 999

(set-logic ALL)

; 1. Declare Sorts
(declare-sort Lipstick 0)

; 2. Declare Functions (Properties)
(declare-fun InSet (Lipstick) Bool)
(declare-fun Velvet (Lipstick) Bool)
(declare-fun Satin (Lipstick) Bool)
(declare-fun Refillable (Lipstick) Bool)
(declare-fun Rosewood (Lipstick) Bool)

; 3. Declare Constants
(declare-const c Lipstick) ; ROUGE Dior Colored Lip Balm 999

; 4. Assert Knowledge Base (Premises)

; Premise 1: All velvet-finish lipsticks in the set are refillable.
(assert (forall ((x Lipstick))
  (=> (and (InSet x) (Velvet x))
      (Refillable x))))

; Premise 2: Lipsticks in the set have either a velvet-finish or a satin-finish.
(assert (forall ((x Lipstick))
  (=> (InSet x)
      (or (Velvet x) (Satin x)))))

; Premise 3: No satin-finish lipsticks in the set do not have "rosewood" in description.
; Equivalent to: All satin-finish lipsticks in the set have "rosewood".
(assert (forall ((x Lipstick))
  (=> (and (InSet x) (Satin x))
      (Rosewood x))))

; Premise 4: Lipsticks in the set either do not have "rosewood" or have "rosewood".
; (Tautology, included for completeness)
(assert (forall ((x Lipstick))
  (=> (InSet x)
      (or (not (Rosewood x)) (Rosewood x)))))

; Premise 5: c is in the set, and (c has "rosewood" OR c has velvet finish).
(assert (and (InSet c)
             (or (Rosewood c) (Velvet c))))

; 5. Assert the Statement to Verify
; Statement: If (c does not have "rosewood" OR c is refillable), then c has "rosewood".
; Logic: (or (not (Rosewood c)) (Refillable c)) => (Rosewood c)
(assert (=> (or (not (Rosewood c)) (Refillable c))
            (Rosewood c)))

; 6. Check Satisfiability
; sat = Statement is consistent with premises (True/Possible)
; unsat = Statement contradicts premises (False)
(check-sat)
(get-model)