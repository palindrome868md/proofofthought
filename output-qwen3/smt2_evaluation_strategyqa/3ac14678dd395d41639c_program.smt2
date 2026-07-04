; Declare sorts
(declare-sort Person 0)

; Declare functions
(declare-fun grade-level (Person) Int)
(declare-fun age (Person) Int)
(declare-fun eligible-for-medicare (Person) Bool)

; Declare constant
(declare-const student Person)

; Knowledge base: Medicare eligibility rules
; Rule 1: Medicare eligibility requires age 65 or older (standard eligibility)
(assert (forall ((p Person))
  (=> (eligible-for-medicare p)
      (>= (age p) 65))))

; Rule 2: Eleventh graders are typically 16-17 years old
(assert (forall ((p Person))
  (=> (= (grade-level p) 11)
      (and (>= (age p) 16) (<= (age p) 17)))))

; Test scenario: student is an eleventh-grader
(assert (= (grade-level student) 11))

; Test: Would an eleventh-grader be eligible for Medicare?
(assert (eligible-for-medicare student))

; Check satisfiability
(check-sat)
(get-model)