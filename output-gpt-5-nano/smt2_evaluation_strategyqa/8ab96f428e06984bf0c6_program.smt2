; Declare sorts
(declare-sort Person 0)
(declare-sort Layout 0)

; Declare predicates/functions
(declare-fun has-fine-motor-issues (Person) Bool)
(declare-fun is-altered (Layout) Bool)
(declare-fun benefits (Person Layout) Bool)

; Existential witness to test the scenario
(declare-const witness Person)
(declare-const layout1 Layout)

; Knowledge base (scenario: there exists a person with fine motor issues and an altered layout that benefits them)
(assert (has-fine-motor-issues witness))
(assert (is-altered layout1))
(assert (benefits witness layout1))

; Test: Could such a person benefit from an altered keyboard layout?
(check-sat)
(get-model)