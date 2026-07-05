; Sorts
(declare-sort Person 0)

; Predicates
(declare-fun good_math (Person) Bool)
(declare-fun good_chem (Person) Bool)
(declare-fun enjoys (Person) Bool)
(declare-fun good_planning (Person) Bool)
(declare-fun failed (Person) Bool)
(declare-fun passed (Person) Bool)
(declare-fun in_class (Person) Bool)

; James
(declare-const James Person)

; Additional constraint: a student cannot both pass and fail
(assert (forall ((p Person)) (=> (passed p) (not (failed p)))))

; Premises (restricted to students in the class)
; 1. Some students in the class who are good at math are also good at chemistry.
(assert (exists ((p Person)) (and (in_class p) (good_math p) (good_chem p))))

; 2. All students in the class who are good at chemistry enjoy conducting experiments.
(assert (forall ((p Person)) (=> (in_class p) (=> (good_chem p) (enjoys p)))))

; 3. All students in the class that enjoy conducting experiments are good at planning.
(assert (forall ((p Person)) (=> (in_class p) (=> (enjoys p) (good_planning p)))))

; 4. None of the students in the class who are good at planning failed the class.
(assert (forall ((p Person)) (=> (in_class p) (=> (good_planning p) (not (failed p))))))

; 5. James is a student in the class; he is either good at chemistry and failed the class, or bad at chemistry and passed the class.
(assert (in_class James))
(assert (or (and (good_chem James) (failed James))
            (and (not (good_chem James)) (passed James))))

; Question test: If James is good at Chemistry or failed the class, then James is either good at planning or good at math.
; Check the negation of the implication to test for unsatisfiability
(assert (and (or (good_chem James) (failed James))
             (not (or (good_planning James) (good_math James)))))

; Check satisfiability and get a model if exists
(check-sat)
(get-model)