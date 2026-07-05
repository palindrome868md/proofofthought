; Question: Is "James failed the class and is good at math" true or false given premises?

; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare predicates (functions)
(declare-fun good-at-math (Person) Bool)
(declare-fun good-at-chemistry (Person) Bool)
(declare-fun enjoys-experiments (Person) Bool)
(declare-fun planning (Person) Bool)
(declare-fun failed (Person) Bool)
(declare-fun passed (Person) Bool)

; 3. Declare constants
(declare-const james Person)

; 4. Assertions (Knowledge Base)

; Premise 1: Some student is good at math and good at chemistry
(assert (exists ((p Person)) (and (good-at-math p) (good-at-chemistry p))))

; Premise 2: If good at chemistry -> enjoys experiments
(assert (forall ((p Person)) (=> (good-at-chemistry p) (enjoys-experiments p))))

; Premise 3: If enjoys experiments -> planning
(assert (forall ((p Person)) (=> (enjoys-experiments p) (planning p))))

; Premise 4: If planning -> not failed
(assert (forall ((p Person)) (=> (planning p) (not (failed p)))))

; Premise 5: James is either (chemistry and failed) or (not chemistry and passed)
(assert (or (and (good-at-chemistry james) (failed james))
            (and (not (good-at-chemistry james)) (passed james))))

; Test scenario: James failed and James is good at math
(assert (and (failed james) (good-at-math james)))

; 5. Check satisfiability and optionally get a model
(check-sat)
(get-model)