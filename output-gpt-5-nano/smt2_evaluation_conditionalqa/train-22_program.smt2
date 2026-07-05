; Declare sorts
(declare-sort Person 0)

; Declare predicates / functions
(declare-fun has-lived-1yr-in-e-w (Person) Bool)
(declare-fun not-consented (Person) Bool)
(declare-fun can-get-annulment (Person) Bool)

; Declare constants
(declare-const me Person)

; Knowledge base / scenario
(assert (has-lived-1yr-in-e-w me))     ; you have lived in England or Wales for 1 year
(assert (not-consented me))            ; you did not properly consent to the marriage

; Rule: Annulment is possible if residency condition is met and there was not proper consent
(assert (=> (and (has-lived-1yr-in-e-w me) (not-consented me))
            (can-get-annulment me)))

; Test: Can I get an annulment?
(check-sat)
(get-model)