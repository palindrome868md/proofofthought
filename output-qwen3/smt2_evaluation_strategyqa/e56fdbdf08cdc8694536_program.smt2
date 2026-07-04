; Question: Could the Powerpuff Girls hypothetically attend the Camden Military Academy?

; Declare sorts
(declare-sort Person 0)
(declare-sort School 0)

; Declare functions
(declare-fun age (Person) Int)
(declare-fun is-military-academy (School) Bool)
(declare-fun minimum-age (School) Int)
(declare-fun can-attend (Person School) Bool)

; Declare constants for Powerpuff Girls
(declare-const blossom Person)
(declare-const bubbles Person)
(declare-const buttercup Person)

; Declare constant for Camden Military Academy
(declare-const camden-military-academy School)

; Knowledge Base: Powerpuff Girls are kindergarten-aged (approximately 5-6 years old)
(assert (= (age blossom) 5))
(assert (= (age bubbles) 5))
(assert (= (age buttercup) 5))

; Knowledge Base: Camden Military Academy is a military boarding school
(assert (is-military-academy camden-military-academy))

; Knowledge Base: Military academies require high school age (minimum 14 years)
(assert (= (minimum-age camden-military-academy) 14))

; Rule: A person can attend a school only if their age meets the minimum requirement
(assert (forall ((p Person) (s School))
  (=> (can-attend p s)
      (>= (age p) (minimum-age s)))))

; Test: Could the Powerpuff Girls attend Camden Military Academy?
; We assert that at least one of them CAN attend and check satisfiability
(assert (can-attend blossom camden-military-academy))

; Check satisfiability
; If sat = Yes, they could attend
; If unsat = No, they could not attend
(check-sat)
(get-model)