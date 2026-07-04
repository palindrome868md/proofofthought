;--- 1. Declare the uninterpreted sort for people
(declare-sort Person 0)

;--- 2. Declare constants
(declare-const James Person)

;--- 3. Declare predicates (functions returning Bool)
(declare-fun worksAtMeta (Person) Bool)
(declare-fun highIncome (Person) Bool)
(declare-fun takesBus   (Person) Bool)
(declare-fun drives    (Person) Bool)
(declare-fun hasCar    (Person) Bool)
(declare-fun student   (Person) Bool)

;--- 4. Knowledge base (premises)

; Everyone working at Meta has a high income.
(assert (forall ((p Person))
  (=> (worksAtMeta p) (highIncome p))))

; A person with a high income will not take a bus.
(assert (forall ((p Person))
  (=> (highIncome p) (not (takesBus p)))))

; People will either take a bus or drive to their destination.
(assert (forall ((p Person))
  (or (takesBus p) (drives p))))

; Everyone who has a car will drive to their destination.
(assert (forall ((p Person))
  (=> (hasCar p) (drives p))))

; No students drive to their destination.
(assert (forall ((p Person))
  (=> (student p) (not (drives p)))))

; James has a car or works at Meta.
(assert (or (hasCar James) (worksAtMeta James)))

;--- 5. Negation of the statement we want to verify:
; "James either drives to his destination or is a student."
; We assert the opposite and check for unsatisfiability.
(assert (not (or (drives James) (student James))))

;--- 6. Check whether the constraints can be satisfied.
(check-sat)
(get-model)