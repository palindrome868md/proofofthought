; Declare sorts
(declare-sort Person 0)

; Declare predicates
(declare-fun drinks_coffee (Person) Bool)
(declare-fun dependent (Person) Bool)
(declare-fun wants_no_addiction (Person) Bool)
(declare-fun aware_drug (Person) Bool)
(declare-fun unaware_drug (Person) Bool)
(declare-fun is_student (Person) Bool)

; Declare constants
(declare-const rina Person)

; Knowledge base
(assert (forall ((p Person)) (=> (drinks_coffee p) (dependent p))))
(assert (forall ((p Person)) (or (drinks_coffee p) (wants_no_addiction p))))
(assert (forall ((p Person)) (=> (not (wants_no_addiction p)) (aware_drug p))))

; Rina's conditions (two alternatives)
(assert (or (and (is_student rina) (unaware_drug rina))
            (and (not (is_student rina)) (aware_drug rina))))
(assert (or (and (is_student rina) (dependent rina))
            (and (not (is_student rina)) (not (dependent rina)))))

; Test: Statement "Rina either doesn't want to be addicted to caffeine or is unaware that caffeine is a drug."
(assert (or (wants_no_addiction rina) (unaware_drug rina)))

; Check satisfiability and provide a model
(check-sat)
(get-model)