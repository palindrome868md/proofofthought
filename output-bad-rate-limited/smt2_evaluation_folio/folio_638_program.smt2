; Sorts
(declare-sort Person 0)
(declare-sort University 0)
(declare-sort Country 0)

; Predicates
(declare-fun attended (Person University) Bool)
(declare-fun located (University Country) Bool)

; Constants
(declare-const william-dickinson Person)
(declare-const edinburgh University)
(declare-const uk Country)
(declare-const uk-uni University)

; Knowledge base (premises)
(assert (attended william-dickinson edinburgh))
(assert (located edinburgh uk))

; Test scenario: "William Dickinson attended university in the United Kingdom"
; Use a witness university uk-uni, set equal to edinburgh to ensure consistency with KB
(assert (= uk-uni edinburgh))
(assert (attended william-dickinson uk-uni))
(assert (located uk-uni uk))

; Verification
(check-sat)
(get-model)