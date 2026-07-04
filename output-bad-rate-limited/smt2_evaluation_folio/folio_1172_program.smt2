; Sort
(declare-sort Person 0)

; Predicates
(declare-fun good_math (Person) Bool)
(declare-fun good_chem (Person) Bool)
(declare-fun enjoys_experiments (Person) Bool)
(declare-fun good_planning (Person) Bool)
(declare-fun failed (Person) Bool)
(declare-fun passed (Person) Bool)

; Individual
(declare-const james Person)

; 1. Some students in the class who are good at math are also good at chemistry.
(assert (exists ((p Person)) (and (good_math p) (good_chem p))))

; 2. All students in the class who are good at chemistry enjoy conducting experiments.
(assert (forall ((p Person)) (=> (good_chem p) (enjoys_experiments p))))

; 3. All students in the class that enjoy conducting experiments are good at planning.
(assert (forall ((p Person)) (=> (enjoys_experiments p) (good_planning p))))

; 4. None of the students who are good at planning failed the class.
(assert (forall ((p Person)) (=> (good_planning p) (not (failed p)))))

; 5. James's status: either (good_chem James ∧ failed James) or (¬good_chem James ∧ passed James)
(assert (or (and (good_chem james) (failed james))
            (and (not (good_chem james)) (passed james))))

; Mutual exclusivity between passed and failed (passed <-> not failed)
(assert (forall ((p Person)) (=> (passed p) (not (failed p)))))
(assert (forall ((p Person)) (=> (not (failed p)) (passed p))))

; Query: If James is good at Chemistry or failed the class, then James is either good at planning or good at math.
(assert (=> (or (good_chem james) (failed james))
            (or (good_planning james) (good_math james))))

; Check satisfiability
(check-sat)