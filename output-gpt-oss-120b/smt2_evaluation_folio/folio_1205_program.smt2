;--- Declarations -------------------------------------------------
(declare-sort Person 0)
(declare-const James Person)

; Predicates
(declare-fun works_meta (Person) Bool)
(declare-fun high_income (Person) Bool)
(declare-fun takes_bus (Person) Bool)
(declare-fun drives (Person) Bool)
(declare-fun has_car (Person) Bool)
(declare-fun student (Person) Bool)

;--- Premises ------------------------------------------------------
; 1. Everyone working at Meta has a high income.
(assert (forall ((p Person))
  (=> (works_meta p) (high_income p))))

; 2. A person with a high income will not take a bus.
(assert (forall ((p Person))
  (=> (high_income p) (not (takes_bus p)))))

; 3. People will either take a bus or drive (exclusive).
(assert (forall ((p Person))
  (or (takes_bus p) (drives p))))
(assert (forall ((p Person))
  (not (and (takes_bus p) (drives p)))))

; 4. Everyone who has a car will choose to drive.
(assert (forall ((p Person))
  (=> (has_car p) (drives p))))

; 5. No students drive.
(assert (forall ((p Person))
  (=> (student p) (not (drives p)))))

; 6. James has a car or works at Meta.
(assert (or (has_car James) (works_meta James)))

;--- Negation of the target statement -------------------------------
; Statement to test: (drives James) ∨ (student James)
; Negate it: ¬drives James ∧ ¬student James
(assert (and (not (drives James)) (not (student James))))

;--- Verification --------------------------------------------------
(check-sat)   ; expected result: unsat (statement is entailed)
(get-model)