; Question: Would a psychic who admits to hot reading be trustworthy?

; Declare sorts
(declare-sort Person 0)

; Declare functions
(declare-fun is-psychic (Person) Bool)
(declare-fun uses-hot-reading (Person) Bool)
(declare-fun admits-to-hot-reading (Person) Bool)
(declare-fun is-deceptive (Person) Bool)
(declare-fun is-trustworthy (Person) Bool)

; Declare constant for the test case
(declare-const test-psychic Person)

; Knowledge Base

; Rule 1: Hot reading is a deceptive practice
(assert (forall ((p Person))
  (=> (uses-hot-reading p)
      (is-deceptive p))))

; Rule 2: Deceptive people are not trustworthy
(assert (forall ((p Person))
  (=> (is-deceptive p)
      (not (is-trustworthy p)))))

; Rule 3: If someone admits to hot reading, they use hot reading
(assert (forall ((p Person))
  (=> (admits-to-hot-reading p)
      (uses-hot-reading p))))

; Fact: The test psychic admits to hot reading
(assert (admits-to-hot-reading test-psychic))

; Test: Would this psychic be trustworthy?
; We assert they ARE trustworthy and check if this is satisfiable
(assert (is-trustworthy test-psychic))

; Check satisfiability
(check-sat)
(get-model)

; Expected result: unsat
; Explanation: If unsat, it means the psychic CANNOT be trustworthy
; Therefore, the answer to "Would they be trustworthy?" is NO