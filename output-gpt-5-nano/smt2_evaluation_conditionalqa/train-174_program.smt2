; Sorts
(declare-sort Person 0)

; Constants
(declare-const father Person)
(declare-const panel-deputy-1 Person)

; Predicates
(declare-fun lacks-capacity (Person) Bool)
(declare-fun is-panel-deputy (Person) Bool)
(declare-fun can-manage-finances (Person) Bool)
(declare-fun is-deputy-for-finances (Person Person) Bool)

; Knowledge base (Scenario)
(assert (lacks-capacity father))

; The Court can appoint a panel deputy who is qualified to manage finances for the father
(assert (is-panel-deputy panel-deputy-1))
(assert (can-manage-finances panel-deputy-1))
(assert (is-deputy-for-finances panel-deputy-1 father))

; Verification query: Can the Court appoint someone qualified to deal with my father's finances if I cannot find someone myself?
(check-sat)
(get-model)