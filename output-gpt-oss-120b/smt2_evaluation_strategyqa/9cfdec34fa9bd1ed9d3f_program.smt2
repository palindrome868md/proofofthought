; 1. Declare the uninterpreted sort for people
(declare-sort Person 0)

; 2. Declare predicates
(declare-fun healthy_lungs (Person) Bool)
(declare-fun lung_disease (Person) Bool)

; 3. Declare the constant for J. P. Morgan
(declare-const jpm Person)

; 4. Knowledge base
;    Anyone with a lung disease does NOT have healthy lungs
(assert (forall ((p Person))
  (=> (lung_disease p) (not (healthy_lungs p)))))

; 5. Test the statement: "J. P. Morgan had healthy lungs"
(assert (healthy_lungs jpm))

; 6. Check satisfiability
(check-sat)
(get-model)