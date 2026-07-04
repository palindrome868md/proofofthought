; Reasoning Steps:
; 1. Define Sorts: Person
; 2. Define Predicates: works-at-meta, high-income, takes-bus, drives, has-car, is-student
; 3. Define Constant: james
; 4. Translate Premises:
;    P1: forall p, works-at-meta(p) -> high-income(p)
;    P2: forall p, high-income(p) -> not takes-bus(p)
;    P3: forall p, takes-bus(p) or drives(p)
;    P4: forall p, has-car(p) -> drives(p)
;    P5: forall p, is-student(p) -> not drives(p)
;    P6: has-car(james) or works-at-meta(james)
; 5. Translate Statement to Verify:
;    S: drives(james) or is-student(james)
; 6. Verification Strategy:
;    Assert P1-P6 (Knowledge Base).
;    Assert S (Statement).
;    Check Sat.
;    If Sat -> S is consistent with KB (True).
;    If Unsat -> S contradicts KB (False).
; Logical Deduction:
;    From P6, James either has a car or works at Meta.
;    Case 1 (Car): P4 -> James Drives.
;    Case 2 (Meta): P1 -> High Income -> P2 -> Not Bus.
;                 P3 (Not Bus) -> James Drives.
;    In both cases, James Drives.
;    Therefore, (James Drives OR James is Student) is True.
;    Expected Result: sat

; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions (predicates)
(declare-fun works-at-meta (Person) Bool)
(declare-fun high-income (Person) Bool)
(declare-fun takes-bus (Person) Bool)
(declare-fun drives (Person) Bool)
(declare-fun has-car (Person) Bool)
(declare-fun is-student (Person) Bool)

; 3. Declare constants
(declare-const james Person)

; 4. Assert knowledge base (premises)

; Premise 1: Everyone working at Meta has a high income.
(assert (forall ((p Person))
  (=> (works-at-meta p) (high-income p))))

; Premise 2: A person with a high income will not take a bus to their destination.
(assert (forall ((p Person))
  (=> (high-income p) (not (takes-bus p)))))

; Premise 3: People will either take a bus or drive to their destination.
(assert (forall ((p Person))
  (or (takes-bus p) (drives p))))

; Premise 4: Everyone who has a car will choose to drive to their destination.
(assert (forall ((p Person))
  (=> (has-car p) (drives p))))

; Premise 5: No students drive to their destination.
(assert (forall ((p Person))
  (=> (is-student p) (not (drives p)))))

; Premise 6: James has a car or works at Meta.
(assert (or (has-car james) (works-at-meta james)))

; 5. Verification
; Statement: James drives to his destination or he is a student.
(assert (or (drives james) (is-student james)))

; Check satisfiability
(check-sat)

; Get model to verify values (if sat)
(get-model)