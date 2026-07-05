(declare-sort Person 0)

(declare-fun took-oath (Person) Bool)
(declare-fun okay-to-lie (Person) Bool)

(declare-const john Person)

; Knowledge: If someone took an oath, it is not okay to lie
(assert (forall ((p Person))
  (=> (took-oath p) (not (okay-to-lie p)))))

; Scenario: John took an oath
(assert (took-oath john))

; Test the question: Is it okay to lie after taking an oath?
; (Assuming "okay-to-lie" represents "it is okay to lie")
(assert (okay-to-lie john))

(check-sat)
(get-model)