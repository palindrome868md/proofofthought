; Scenario: I spent ten years in the army and suffered injuries to my right leg which meant that I was not able to serve any longer.
; Question: Can I claim compensation for the injury I suffered during my service?

; Declare sorts
(declare-sort Person 0)

; Declare constants for the scenario
(declare-const me Person)

; Declare predicates and functions
(declare-fun injured-during-service (Person) Bool)
(declare-fun is-former-member (Person) Bool)
(declare-fun injury-year (Person) Int)
(declare-fun claims-compensation (Person) Bool)

; Knowledge base (facts about the scenario)
(assert (injured-during-service me))
(assert (is-former-member me))
(assert (= (injury-year me) 2012))  ; injury occurred during/after service; year chosen to reflect post-2005 scenario

; Rule: if someone is injured during service and is a former member, they can claim compensation
(assert (forall ((p Person))
  (=> (and (injured-during-service p) (is-former-member p))
      (claims-compensation p))))

; Test scenario: Can I claim compensation?
(assert (claims-compensation me))

; Check satisfiability to answer the question
(check-sat)
(get-model)