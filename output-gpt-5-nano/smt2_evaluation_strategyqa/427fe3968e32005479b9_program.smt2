; Declare sorts
(declare-sort Person 0)
(declare-sort BodyPart 0)

; Declare constants
(declare-const tibia BodyPart)
(declare-const winner Person)

; Declare predicates (functions)
(declare-fun wins-cup (Person) Bool)
(declare-fun has-body-part (Person BodyPart) Bool)

; Knowledge base
; If someone wins the Stanley Cup, then they have tibia
(assert (forall ((p Person))
  (=> (wins-cup p)
      (has-body-part p tibia))))

; Test scenario: there exists a winner who does NOT have tibia
(assert (wins-cup winner))
(assert (not (has-body-part winner tibia)))

; Check satisfiability
(check-sat)
(get-model)