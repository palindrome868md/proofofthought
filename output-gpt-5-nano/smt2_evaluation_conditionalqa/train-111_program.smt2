; Scenario-based verification: Can an order be obtained to prevent visits?
; Sorts
(declare-sort Person 0)
(declare-sort Order 0)

; Constants
(declare-const mother Person)
(declare-const ex_partner Person)

; Predicates / relations
(declare-fun can-consent (Person) Bool)
(declare-fun distressed (Person) Bool)
(declare-fun dv-conviction (Person) Bool)
(declare-fun prevents-visit (Order Person Person) Bool)

; Knowledge base (facts)
(assert (not (can-consent mother)))      ; mother lacks capacity to consent
(assert (distressed mother))              ; visiting prospect causes distress
(assert (dv-conviction ex_partner))        ; ex-partner has a DV conviction

; Test scenario (test for a one-off order to stop visits)
(declare-const order1 Order)
(assert (prevents-visit order1 mother ex_partner))

; Check satisfiability to answer the question
(check-sat)
(get-model)