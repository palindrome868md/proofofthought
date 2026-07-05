; Declaring sorts
(declare-sort Person 0)
(declare-sort Condition 0)

; Declaring predicates / functions
(declare-fun has-condition (Person Condition) Bool)
(declare-fun affects-work (Person Condition) Bool)
(declare-fun has-NI-contributions (Person) Bool)
(declare-fun under-state-pension-age (Person) Bool)
(declare-fun ESA-eligible (Person) Bool)

; Declaring constants
(declare-const you Person)
(declare-const mental-health Condition)

; Knowledge base (general rule)
; If a person has a health condition, the condition affects their ability to work,
; they have paid enough NI contributions, and they are under State Pension age,
; then they are eligible for ESA.
(assert (forall ((pp Person) (cc Condition))
  (=> (and (has-condition pp cc)
           (affects-work pp cc)
           (has-NI-contributions pp)
           (under-state-pension-age pp))
      (ESA-eligible pp))))

; Scenario: You have a mental health condition that affects your ability to work,
; you have NI contributions, and you are under State Pension age.
(assert (has-condition you mental-health))
(assert (affects-work you mental-health))
(assert (has-NI-contributions you))
(assert (under-state-pension-age you))

; Test: Are you eligible for ESA?
(assert (ESA-eligible you))

; Check satisfiability and provide a model if sat
(check-sat)
(get-model)