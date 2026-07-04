; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions (predicates)
(declare-fun WorksAtMeta (Person) Bool)
(declare-fun HighIncome (Person) Bool)
(declare-fun TakesBus (Person) Bool)
(declare-fun Drives (Person) Bool)
(declare-fun HasCar (Person) Bool)
(declare-fun IsStudent (Person) Bool)

; 3. Declare constants
(declare-const James Person)

; 4. Assert knowledge base (premises)

; Premise 1: Everyone working at Meta has a high income.
(assert (forall ((p Person))
  (=> (WorksAtMeta p) (HighIncome p))))

; Premise 2: A person with a high income will not take a bus.
(assert (forall ((p Person))
  (=> (HighIncome p) (not (TakesBus p)))))

; Premise 3: People will either take a bus or drive.
(assert (forall ((p Person))
  (or (TakesBus p) (Drives p))))

; Premise 4: Everyone who has a car will choose to drive.
(assert (forall ((p Person))
  (=> (HasCar p) (Drives p))))

; Premise 5: No students drive.
(assert (forall ((p Person))
  (=> (IsStudent p) (not (Drives p)))))

; Premise 6: James has a car or works at Meta.
(assert (or (HasCar James) (WorksAtMeta James)))

; 5. Test the statement: James is a student.
; We assert the statement to check if it is consistent with the premises.
; If (check-sat) returns 'unsat', the statement is False.
(assert (IsStudent James))

; 6. Check satisfiability
(check-sat)
(get-model)