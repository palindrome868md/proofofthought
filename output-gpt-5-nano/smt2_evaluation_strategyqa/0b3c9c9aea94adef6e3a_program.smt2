; Declare sorts
(declare-sort Event 0)
(declare-sort Currency 0)

; Declare functions
(declare-fun paid-with (Event) Currency)

; Declare constants
(declare-const louisiana-purchase Event)
(declare-const bitcoin Currency)

; Knowledge base: the Louisiana Purchase was not paid with bitcoin
(assert (not (= (paid-with louisiana-purchase) bitcoin)))

; Test: Was the Louisiana Purchase paid with bitcoin?
(assert (= (paid-with louisiana-purchase) bitcoin))

; Check satisfiability
(check-sat)
(get-model)