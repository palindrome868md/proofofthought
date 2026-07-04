; Question: Could Lil Wayne legally operate a vehicle on his own at the beginning of his career?

; Declare sorts
(declare-sort Person 0)

; Declare functions
(declare-fun birth-year (Person) Int)
(declare-fun career-start-year (Person) Int)
(declare-fun age-at-career-start (Person) Int)
(declare-fun legal-driving-age () Int)
(declare-fun can-legally-drive-alone (Person) Bool)

; Declare constants
(declare-const lil-wayne Person)

; Knowledge Base

; Fact 1: Lil Wayne was born in 1982
(assert (= (birth-year lil-wayne) 1982))

; Fact 2: Lil Wayne's career began in 1995 (joined Cash Money Records at age 13)
(assert (= (career-start-year lil-wayne) 1995))

; Fact 3: Calculate age at career start
(assert (= (age-at-career-start lil-wayne)
           (- (career-start-year lil-wayne) (birth-year lil-wayne))))

; Fact 4: Legal driving age for independent operation in the US is 16
(assert (= (legal-driving-age) 16))

; Rule: A person can legally drive alone only if their age >= legal driving age
(assert (forall ((p Person))
  (=> (can-legally-drive-alone p)
      (>= (age-at-career-start p) (legal-driving-age)))))

; Test Scenario: Could Lil Wayne legally drive alone at career start?
; We assert that he COULD and check if this is satisfiable
(assert (can-legally-drive-alone lil-wayne))

; Check satisfiability
(check-sat)
(get-model)

; Expected result: unsat (false)
; Reasoning: Lil Wayne was 13 at career start (1995 - 1982 = 13)
; Legal driving age is 16
; 13 < 16, so he could NOT legally drive alone