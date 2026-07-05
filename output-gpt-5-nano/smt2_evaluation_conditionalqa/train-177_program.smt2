; Sorts
(declare-sort Person 0)
(declare-sort Country 0)
(declare-sort Organization 0)

; Constants
(declare-const ex-husband Person)

(declare-const germany Country)

(declare-const armed-forces Organization)

; Functions
(declare-fun living-in (Person) Country)

; Predicates
(declare-fun is-armed-forces (Person) Bool)

(declare-fun can-enforce (Person) Bool)
(declare-fun can-make-new-claim (Person) Bool)
(declare-fun can-pay (Person) Bool)

; Facts about the scenario
(assert (= (living-in ex-husband) germany))
(assert (is-armed-forces ex-husband))

; Rules from the document

; If the paying parent lives in REMO country, enforcement is possible
(assert (=> (= (living-in ex-husband) germany) (can-enforce ex-husband)))

; If the paying parent works abroad for the Armed Forces, you can make a new claim
(assert (=> (is-armed-forces ex-husband) (can-make-new-claim ex-husband)))

; If either enforcement or a new-claim route exists, the parent can be made to pay
(assert (=> (or (can-enforce ex-husband) (can-make-new-claim ex-husband))
            (can-pay ex-husband)))

; Test scenario: Can the absent parent in the army be made to pay while they are abroad?
(assert (can-pay ex-husband))

; Check satisfiability and model
(check-sat)
(get-model)