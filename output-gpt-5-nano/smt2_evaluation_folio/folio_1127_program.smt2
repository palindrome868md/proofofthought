; Sorts
(declare-sort Person 0)

; Predicates
(declare-fun Coffee (Person) Bool)
(declare-fun Dependent (Person) Bool)
(declare-fun WantsAddict (Person) Bool)
(declare-fun Student (Person) Bool)
(declare-fun Aware (Person) Bool)

; Constant
(declare-const rina Person)

; Premises
(assert (forall ((p Person)) (=> (Coffee p) (Dependent p))))
(assert (forall ((p Person)) (or (Coffee p) (not (WantsAddict p)))))
(assert (forall ((p Person)) (=> (not (WantsAddict p)) (not (Aware p)))))

; Rina's two-case constraints
(assert (or (and (Student rina) (not (Aware rina)))
            (and (not (Student rina)) (Aware rina))))
(assert (or (and (Student rina) (Dependent rina))
            (and (not (Student rina)) (not (Dependent rina)))))

; Test: Negation of the statement "Rina either doesn't want to be addicted to caffeine or is unaware that caffeine is a drug."
; Negation is: (WantsAddict rina) AND (Aware rina)
(assert (and (WantsAddict rina) (Aware rina)))
(check-sat)