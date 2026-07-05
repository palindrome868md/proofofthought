; Declare sorts
(declare-sort Person 0)

; Declare constants (the individuals in the scenario)
(declare-const me Person)
(declare-const partner Person)

; Optional: ages (to reflect scenario details)
(declare-fun age (Person) Int)
(assert (= (age me) 34))
(assert (= (age partner) 36))

; Relations for the civil partnership reasoning
(declare-fun years-in-cp (Person Person) Int)        ; years in civil partnership between two people
(declare-fun cheated-on (Person Person) Bool)        ; whether one person has cheated on the other
(declare-fun unreasonable-behaviour (Person Person) Bool)  ; grounds of unreasonable behaviour by partner
(declare-fun can-end-cp (Person Person) Bool)        ; test predicate: can end civil partnership on grounds

; Knowledge base (scenario details)
; They have been in a civil partnership for over 1 year
(assert (> (years-in-cp me partner) 1))

; The partner has cheated on me
(assert (cheated-on partner me))

; Cheating is an instance of unreasonable behaviour
(assert (unreasonable-behaviour partner me))

; Rule: if years > 1 and there is unreasonable behaviour, then ending is possible
(assert (=> (and (> (years-in-cp me partner) 1)
                 (unreasonable-behaviour partner me))
            (can-end-cp me partner)))

; Test: Is it possible to end the civil partnership under these grounds?
(assert (can-end-cp me partner))

; Check satisfiability (answer question with a single check-sat)
(check-sat)
(get-model)