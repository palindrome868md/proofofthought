; Propositional domain: a student from class of 2017 and their amnesia about 9/11

; Sorts
(declare-sort Person 0)

; Constants
(declare-const student-2017 Person)

; Predicates / Functions
(declare-fun class-year (Person) Int)
(declare-fun amnesia-9-11 (Person) Bool)

; Knowledge base
; 1) The class-of-2017 student has year 2017
(assert (= (class-year student-2017) 2017))

; 2) All persons in class of 2017 have amnesia about 9/11
(assert (forall ((p Person))
  (=> (= (class-year p) 2017)
      (amnesia-9-11 p))))

; Test scenario: Would a class-of-2017 student have amnesia about 9/11?
(assert (amnesia-9-11 student-2017))

; Check satisfiability: relies on a single check-sat to answer the question
(check-sat)