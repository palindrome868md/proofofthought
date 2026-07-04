; Question: Would the high school class of 2010 have lived through the Presidency of Richard Nixon?

; Declare sorts
(declare-sort Person 0)

; Declare functions
(declare-fun birth-year (Person) Int)
(declare-fun nixon-presidency-start () Int)
(declare-fun nixon-presidency-end () Int)
(declare-fun alive-during-period (Person Int Int) Bool)

; Declare constants
(declare-const class-2010-student Person)

; Knowledge base - Nixon's presidency dates (1969-1974)
(assert (= (nixon-presidency-start) 1969))
(assert (= (nixon-presidency-end) 1974))

; Knowledge base - High school class of 2010 birth years
; Students in high school in 2010 were typically 14-18 years old
; Therefore born approximately 1992-1996
(assert (>= (birth-year class-2010-student) 1992))
(assert (<= (birth-year class-2010-student) 1996))

; Rule: A person was alive during a period only if they were born before the period ended
(assert (forall ((p Person) (start Int) (end Int))
  (=> (alive-during-period p start end)
      (<= (birth-year p) end))))

; Test: Assert that the class of 2010 lived through Nixon's presidency
(assert (alive-during-period class-2010-student (nixon-presidency-start) (nixon-presidency-end)))

; Check satisfiability
; Expected: unsat (false) - They were born 18+ years AFTER Nixon's presidency ended
(check-sat)
(get-model)