; Sorts
(declare-sort Person 0)
(declare-sort Asset 0)

; Constants
(declare-const you Person)
(declare-const uncle Person)
(declare-const house Asset)

; Predicates (uninterpreted for the scenario)
(declare-fun sole-owner (Asset) Bool)
(declare-fun has-will (Person) Bool)
(declare-fun probate-needed (Person Asset) Bool)

; Knowledge base (facts)
(assert (sole-owner house))        ; the house is sole-owned (by the decedent)
(assert (has-will uncle))            ; the decedent left a will

; Rule: if an asset is solely owned and there is a will, probate is needed to deal with the sale
(assert (=> (and (sole-owner house) (has-will uncle))
            (probate-needed you house)))

; Test the scenario: Do you need probate before selling the house?
(assert (probate-needed you house))

; Check satisfiability and provide a model
(check-sat)
(get-model)