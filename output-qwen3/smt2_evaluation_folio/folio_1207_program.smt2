; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions (Predicates)
(declare-fun WorksAtMeta (Person) Bool)
(declare-fun HighIncome (Person) Bool)
(declare-fun TakesBus (Person) Bool)
(declare-fun Drives (Person) Bool)
(declare-fun HasCar (Person) Bool)
(declare-fun IsStudent (Person) Bool)

; 3. Declare constants
(declare-const james Person)

; 4. Assert knowledge base (Premises)

; Premise 1: Everyone working at Meta has a high income.
(assert (forall ((p Person)) 
    (=> (WorksAtMeta p) (HighIncome p))))

; Premise 2: A person with a high income will not take a bus to their destination.
(assert (forall ((p Person)) 
    (=> (HighIncome p) (not (TakesBus p)))))

; Premise 3: People will either take a bus or drive to their destination.
(assert (forall ((p Person)) 
    (or (TakesBus p) (Drives p))))

; Premise 4: Everyone who has a car will choose to drive to their destination.
(assert (forall ((p Person)) 
    (=> (HasCar p) (Drives p))))

; Premise 5: No students drive to their destination.
(assert (forall ((p Person)) 
    (=> (IsStudent p) (not (Drives p)))))

; Premise 6: James has a car or works at Meta.
(assert (or (HasCar james) (WorksAtMeta james)))

; 5. Assert the Statement to be verified
; Statement: If James either drives to his destination or is a student, 
;            then he has a high income and is a student.
; We assert this implication. If it contradicts the KB, result is unsat (False).
(assert (=> (or (Drives james) (IsStudent james)) 
            (and (HighIncome james) (IsStudent james))))

; 6. Check satisfiability
; sat = True (Statement is consistent/possible given premises)
; unsat = False (Statement contradicts premises)
(check-sat)
(get-model)