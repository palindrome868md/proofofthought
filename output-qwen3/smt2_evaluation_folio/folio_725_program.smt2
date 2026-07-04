; 1. Declare sorts
(declare-sort Bear 0)

; 2. Declare functions
(declare-fun InZoo (Bear) Bool)
(declare-fun IsWild (Bear) Bool)

; 3. Declare constants
; Constant to represent "Some bears are in zoos" (Existential witness for Premise 2)
(declare-const zoo_bear Bear)
; Constant to represent the existential claim in the Statement "Not all bears are wild"
(declare-const statement_witness Bear)

; 4. Assert knowledge base (Premises)
; Premise 1: All bears in zoos are not wild
(assert (forall ((x Bear))
  (=> (InZoo x) (not (IsWild x)))))

; Premise 2: Some bears are in zoos
(assert (InZoo zoo_bear))

; 5. Assert Statement to verify
; Statement: Not all bears are wild
; Logical equivalent: There exists at least one bear that is not wild
(assert (not (IsWild statement_witness)))

; 6. Check satisfiability
; sat = Statement is True (Consistent with premises)
; unsat = Statement is False (Contradicts premises)
(check-sat)
(get-model)