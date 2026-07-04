; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions (predicates)
(declare-fun good-math (Person) Bool)
(declare-fun good-chem (Person) Bool)
(declare-fun enjoy-exp (Person) Bool)
(declare-fun good-plan (Person) Bool)
(declare-fun failed (Person) Bool)

; 3. Declare constants
(declare-const james Person)
(declare-const some-student Person)

; 4. Assert knowledge base (facts)

; Premise 1: Some students in the class who are good at math are also good at chemistry.
; Modeled using a witness constant 'some-student'
(assert (and (good-math some-student) (good-chem some-student)))

; Premise 2: All students in the class who are good at chemistry enjoy conducting experiments.
(assert (forall ((p Person))
  (=> (good-chem p) (enjoy-exp p))))

; Premise 3: All students in the class that enjoy conducting experiments are good at planning.
(assert (forall ((p Person))
  (=> (enjoy-exp p) (good-plan p))))

; Premise 4: None of the students who are good at planning failed the class.
(assert (forall ((p Person))
  (=> (good-plan p) (not (failed p)))))

; Premise 5: James is either (good at chemistry and failed) OR (bad at chemistry and passed).
; "Passed" is modeled as (not failed).
(assert (or 
  (and (good-chem james) (failed james))
  (and (not (good-chem james)) (not (failed james)))
))

; 5. Test Statement: James is good at math and chemistry.
(assert (and (good-math james) (good-chem james)))

; 6. Check satisfiability
(check-sat)
(get-model)