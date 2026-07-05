; Declare sorts
(declare-sort Person 0)

; Declare constants
(declare-const lil-wayne Person)

; Declare functions
(declare-fun age (Person) Int)
(declare-fun can-drive-alone (Person) Bool)

; Knowledge base: driving is legal for those age >= 16
(assert (forall ((p Person))
  (=> (>= (age p) 16)
      (can-drive-alone p))))

; Knowledge base: those younger than 16 cannot drive alone
(assert (forall ((p Person))
  (=> (< (age p) 16)
      (not (can-drive-alone p)))))

; Beginning of his career assumed age (for the test case)
(assert (= (age lil-wayne) 9))

; Test scenario: Could Lil Wayne legally operate a vehicle on his own at the beginning of his career?
(assert (can-drive-alone lil-wayne))

; Check satisfiability to answer the question
(check-sat)