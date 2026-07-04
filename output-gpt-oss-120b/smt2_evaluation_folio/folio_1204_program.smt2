;--- Sorts ---------------------------------------------------------
(declare-sort Person 0)

;--- Functions / Predicates ----------------------------------------
(declare-fun works_at_meta (Person) Bool)
(declare-fun high_income   (Person) Bool)
(declare-fun takes_bus    (Person) Bool)
(declare-fun drives       (Person) Bool)
(declare-fun has_car      (Person) Bool)
(declare-fun student      (Person) Bool)

;--- Constants ------------------------------------------------------
(declare-const James Person)

;--- Knowledge Base ------------------------------------------------
; 1. Everyone working at Meta has a high income.
(assert (forall ((p Person))
        (=> (works_at_meta p) (high_income p))))

; 2. A person with a high income will not take a bus.
(assert (forall ((p Person))
        (=> (high_income p) (not (takes_bus p)))))

; 3. People will either take a bus or drive to their destination.
(assert (forall ((p Person))
        (or (takes_bus p) (drives p))))

; 4. Everyone who has a car will choose to drive.
(assert (forall ((p Person))
        (=> (has_car p) (drives p))))

; 5. No students drive to their destination.
(assert (forall ((p Person))
        (=> (student p) (not (drives p)))))

; 6. James has a car or works at Meta.
(assert (or (has_car James) (works_at_meta James)))

;--- Statement to test ---------------------------------------------
; Claim: James is a student.
(assert (student James))

;--- Check satisfiability -------------------------------------------
(check-sat)   ; Expected: unsat → the claim is false.
(get-model)