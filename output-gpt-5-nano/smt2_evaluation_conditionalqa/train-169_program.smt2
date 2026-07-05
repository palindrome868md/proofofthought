; Sorts
(declare-sort Person 0)

; Constants
(declare-const you Person)
(declare-const wife Person)

; Predicates / Functions
(declare-fun is-blind (Person) Bool)
(declare-fun is-married (Person Person) Bool)
(declare-fun lives-together (Person Person) Bool)

(declare-fun can-claim-bpa (Person) Bool)
(declare-fun claim-bpa (Person) Bool)
(declare-fun pays-tax (Person) Bool)
(declare-fun transfer-bpa-to (Person Person) Bool)

; Knowledge base / Scenario setup
(assert (is-blind you))
(assert (is-married you wife))
(assert (lives-together you wife))
(assert (can-claim-bpa you))

; Test scenario: you claim BPA and transfer it to your wife
(assert (claim-bpa you))
(assert (not (pays-tax you)))
(assert (transfer-bpa-to you wife))

; Verification
(check-sat)
(get-model)