; Declares
(declare-sort Person 0)

; Subject
(declare-const uncle Person)

; Predicates describing the scenario and eligibility
(declare-fun has-diffuse-mesothelioma (Person) Bool)
(declare-fun diagnosed-after-2012 (Person) Bool)
(declare-fun exposed-in-UK (Person) Bool)
(declare-fun trace-employer (Person) Bool)
(declare-fun civil-claim (Person) Bool)
(declare-fun damages-received (Person) Bool)

; DMPS eligibility and payment
(declare-fun DMPS-eligible (Person) Bool)
(declare-fun DMPS-payment (Person) Int)

; Knowledge base / Scenario assertions
(assert (has-diffuse-mesothelioma uncle))
(assert (diagnosed-after-2012 uncle))
(assert (exposed-in-UK uncle))
(assert (not (trace-employer uncle)))
(assert (not (civil-claim uncle)))
(assert (not (damages-received uncle)))

; Define DMPS eligibility as the conjunction of required conditions
(assert (= (DMPS-eligible uncle)
           (and (has-diffuse-mesothelioma uncle)
                (diagnosed-after-2012 uncle)
                (exposed-in-UK uncle)
                (not (trace-employer uncle))
                (not (civil-claim uncle))
                (not (damages-received uncle)))))

; If DMPS is eligible, there exists a positive payment
(assert (=> (DMPS-eligible uncle) (> (DMPS-payment uncle) 0)))

; One verification: does DMPS apply and provide compensation in this scenario?
(check-sat)
(get-model)