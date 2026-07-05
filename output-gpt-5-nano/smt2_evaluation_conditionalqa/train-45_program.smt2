; Sorts
(declare-sort Person 0)

; Predicates / Functions
(declare-fun is_living (Person) Bool)
(declare-fun wants_will (Person) Bool)
(declare-fun leave_charity (Person) Bool)
(declare-fun leave_dependants (Person) Bool)
(declare-fun not_straightforward (Person) Bool)
(declare-fun needs_legal_advice (Person) Bool)

; Knowledge base: you should get advice if not straightforward and living and want to make a will
(assert (forall ((p Person))
  (=> (and (not_straightforward p) (is_living p) (wants_will p))
      (needs_legal_advice p))))

; Scenario: a living person who wants to make a will to leave a charity and dependants
(declare-const me Person)
(assert (is_living me))
(assert (wants_will me))
(assert (leave_charity me))
(assert (leave_dependants me))
(assert (not_straightforward me))  ; scenario is not straightforward

; Question: Do I need legal advice? (i.e., is needs_legal_advice me true?)
(check-sat)