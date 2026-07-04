; Sorts
(declare-sort Person 0)

; Predicates
(declare-fun good_math (Person) Bool)
(declare-fun good_chem (Person) Bool)
(declare-fun enjoys_experiments (Person) Bool)
(declare-fun planning (Person) Bool)
(declare-fun failed (Person) Bool)
(declare-fun passed (Person) Bool)

; Constants
(declare-const james Person)

; Premises
; 1. Some students in the class who are good at math are also good at chemistry.
(assert (exists ((p Person)) (and (good_math p) (good_chem p))))

; 2. All students in the class who are good at chemistry enjoy conducting experiments.
(assert (forall ((p Person)) (=> (good_chem p) (enjoys_experiments p))))

; 3. All students in the class that enjoy conducting experiments are good at planning.
(assert (forall ((p Person)) (=> (enjoys_experiments p) (planning p))))

; 4. None of the students who are good at planning failed the class.
(assert (forall ((p Person)) (=> (planning p) (not (failed p)))))

; 5. James is either (chemistry and failed) or (not chemistry and passed)
(assert (or (and (good_chem james) (failed james))
            (and (not (good_chem james)) (passed james))))

; Test: Is James good at math and chemistry?
(assert (and (good_math james) (good_chem james)))
(check-sat)