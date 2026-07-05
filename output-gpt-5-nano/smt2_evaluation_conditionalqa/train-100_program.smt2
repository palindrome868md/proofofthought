; Declare sorts
(declare-sort Person 0)

; Declare constants
(declare-const brother Person)

; Declare predicates/functions
(declare-fun missing-years (Person) Int)
(declare-fun missing-due-to-disaster (Person) Bool)
(declare-fun declaration-possible (Person) Bool)

; Scenario: Brother has been missing for 2 years and it was due to a disaster (earthquake)
(assert (= (missing-years brother) 2))
(assert (missing-due-to-disaster brother))

; Rule: If missing for less than 7 years and missing due to disaster, a declaration of presumed death may be possible
(assert (=> (and (< (missing-years brother) 7) (missing-due-to-disaster brother))
            (declaration-possible brother)))

; Test: Is it possible to declare brother dead?
(assert (declaration-possible brother))

; Check satisfiability
(check-sat)