; Sorts
(declare-sort Person 0)

; Predicates / Functions
(declare-fun is-ex-employee (Person) Bool)
(declare-fun would-have-qualified (Person) Bool)
(declare-fun is-widow_of (Person Person) Bool)  ; is-widow_of widow e
(declare-fun is-eligible (Person) Bool)

; Constants
(declare-const father Person)
(declare-const mother Person)

; Knowledge base (scenario: father was an ex-employee and would have qualified; mother is widow of father)
(assert (is-ex-employee father))
(assert (would-have-qualified father))
(assert (is-widow_of mother father))

; Rule: If someone is widow of an ex-employee who would have qualified, then they are eligible
(assert (forall ((w Person) (e Person))
  (=> (and (is-widow_of w e)
           (is-ex-employee e)
           (would-have-qualified e))
      (is-eligible w))))

; Test scenario: Is my mother eligible? (Negation used to determine entailment)
(assert (not (is-eligible mother)))

; Check satisfiability to answer the question
(check-sat)
(get-model)