; Declare sorts
(declare-sort Person 0)

; Declare predicates / relations
(declare-fun GoodAtMath (Person) Bool)
(declare-fun GoodAtChemistry (Person) Bool)
(declare-fun EnjoyExperiments (Person) Bool)
(declare-fun GoodAtPlanning (Person) Bool)
(declare-fun Failed (Person) Bool)
(declare-fun Passed (Person) Bool)

; Declare constants
(declare-const james Person)

; Premises

; 1. Some students in the class who are good at math are also good at chemistry.
(assert (exists ((p Person)) (and (GoodAtMath p) (GoodAtChemistry p))))

; 2. All students in the class who are good at chemistry enjoy conducting experiments.
(assert (forall ((p Person)) (=> (GoodAtChemistry p) (EnjoyExperiments p))))

; 3. All students in the class that enjoy conducting experiments are good at planning.
(assert (forall ((p Person)) (=> (EnjoyExperiments p) (GoodAtPlanning p))))

; 4. None of the students who are good at planning failed the class.
(assert (forall ((p Person)) (=> (GoodAtPlanning p) (not (Failed p)))))

; 5. James is a student in the class; he is either good at chemistry and failed the class, or bad at chemistry and passed the class.
(assert (or (and (GoodAtChemistry james) (Failed james))
            (and (not (GoodAtChemistry james)) (Passed james))))

; Test: Is James good at math and chemistry?
(assert (and (GoodAtMath james) (GoodAtChemistry james)))

; Check satisfiability
(check-sat)
(get-model)