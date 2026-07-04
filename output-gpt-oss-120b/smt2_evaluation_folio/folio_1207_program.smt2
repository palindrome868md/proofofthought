; -------------------------------------------------
; Sorts
; -------------------------------------------------
(declare-sort Person 0)

; -------------------------------------------------
; Functions (predicates)
; -------------------------------------------------
(declare-fun worksMeta   (Person) Bool)   ; works at Meta
(declare-fun highIncome  (Person) Bool)   ; has high income
(declare-fun takesBus    (Person) Bool)   ; takes a bus
(declare-fun drives      (Person) Bool)   ; drives to destination
(declare-fun hasCar      (Person) Bool)   ; owns a car
(declare-fun student     (Person) Bool)   ; is a student

; -------------------------------------------------
; Constant for James
; -------------------------------------------------
(declare-const james Person)

; -------------------------------------------------
; Knowledge base (premises)
; -------------------------------------------------

; 1. Everyone working at Meta has a high income.
(assert (forall ((p Person))
  (=> (worksMeta p) (highIncome p))))

; 2. A person with a high income will not take a bus.
(assert (forall ((p Person))
  (=> (highIncome p) (not (takesBus p)))))

; 3. People will either take a bus or drive.
(assert (forall ((p Person))
  (or (takesBus p) (drives p))))

; 4. Everyone who has a car will choose to drive.
(assert (forall ((p Person))
  (=> (hasCar p) (drives p))))

; 5. No students drive to their destination.
(assert (forall ((p Person))
  (=> (student p) (not (drives p)))))

; 6. James has a car or works at Meta.
(assert (or (hasCar james) (worksMeta james)))

; -------------------------------------------------
; Negation of the target statement:
;   (drives(j) ∨ student(j)) → (highIncome(j) ∧ student(j))
; -------------------------------------------------
; Negation: (drives(j) ∨ student(j)) ∧ ¬(highIncome(j) ∧ student(j))
;           ≡ (drives(j) ∨ student(j)) ∧ (¬highIncome(j) ∨ ¬student(j))
(assert (and
          (or (drives james) (student james))
          (or (not (highIncome james)) (not (student james)))))

; -------------------------------------------------
; Query
; -------------------------------------------------
(check-sat)   ; sat  → the negation is possible → original statement NOT entailed
(get-model)   ; optional: shows a concrete model