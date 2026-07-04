; 1. Declare sorts
(declare-sort Lipstick 0)
(declare-datatypes () ((Finish (Velvet) (Satin))))

; 2. Declare functions
(declare-fun in-set (Lipstick) Bool)
(declare-fun finish (Lipstick) Finish)
(declare-fun has-rosewood (Lipstick) Bool)
(declare-fun is-refillable (Lipstick) Bool)

; 3. Declare constants
(declare-const c Lipstick) ; Represents ROUGE Dior Colored Lip Balm 999

; 4. Assert knowledge base (premises)
; Premise 1: All velvet-finish lipsticks in the set are refillable.
(assert (forall ((x Lipstick))
  (=> (and (in-set x) (= (finish x) Velvet))
      (is-refillable x))))

; Premise 2: Lipsticks in the set have either a velvet-finish or a satin-finish.
(assert (forall ((x Lipstick))
  (=> (in-set x)
      (or (= (finish x) Velvet) (= (finish x) Satin)))))

; Premise 3: No satin-finish lipsticks in the set do not have "rosewood".
; (Logically equivalent to: All satin-finish lipsticks in the set have "rosewood")
(assert (forall ((x Lipstick))
  (=> (and (in-set x) (= (finish x) Satin))
      (has-rosewood x))))

; Premise 4: Lipsticks in the set either does not have "rosewood" or it has "rosewood".
; (This is a tautology (P or not P), but included to reflect the text)
(assert (forall ((x Lipstick))
  (=> (in-set x)
      (or (not (has-rosewood x)) (has-rosewood x)))))

; Premise 5: ROUGE Dior Colored Lip Balm 999 is a lipstick in the set.
(assert (in-set c))

; Premise 5 (cont): It either has "rosewood" in its official description or has a velvet finish.
(assert (or (has-rosewood c) (= (finish c) Velvet)))

; 5. Assert the statement to be verified
; Statement: If c is not both a velvet finish lipstick in the set and refillable, 
;            then it neither is refillable nor has "rosewood" in its official description.
; Antecedent: not (velvet finish AND refillable)
; Consequent: (not refillable) AND (not rosewood)
(assert (=> 
  (not (and (= (finish c) Velvet) (is-refillable c)))
  (and (not (is-refillable c)) (not (has-rosewood c)))))

; 6. Check satisfiability
; sat = Statement is consistent with premises (True/Possible)
; unsat = Statement contradicts premises (False)
(check-sat)
(get-model)