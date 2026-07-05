; Declare sorts
(declare-sort Person 0)

; Declare constants
(declare-const you Person)
(declare-const brother Person)

; Declare predicates / functions
(declare-fun age (Person) Int)
(declare-fun has-bank-account (Person) Bool)
(declare-fun cannot-manage-affairs (Person) Bool)
(declare-fun is-appointee-for (Person Person) Bool)

; Knowledge base (scenarios informed by the document)
; You are over 18
(assert (> (age you) 18))

; You have a bank account
(assert (has-bank-account you))

; Brother cannot manage his own affairs (he is sectioned)
(assert (= (cannot-manage-affairs brother) true))

; Test scenario: you would be the appointee for your brother
(assert (is-appointee-for you brother))

; Check satisfiability to answer the question: Can you be appointed?
(check-sat)
(get-model)