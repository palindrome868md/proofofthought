; Declare sorts
(declare-sort Person 0)

; Declare constants
(declare-const you Person)

; Declare predicates/functions
(declare-fun diagnosis-year (Person) Int)
(declare-fun diagnosed-diffuse-mesothelioma (Person) Bool)
(declare-fun exposed-uk (Person) Bool)
(declare-fun cannot-trace-employer (Person) Bool)
(declare-fun cannot-trace-insurer (Person) Bool)
(declare-fun made-civil-claim (Person) Bool)
(declare-fun received-damages (Person) Bool)
(declare-fun within-3-years (Person) Bool)
(declare-fun DMPS-eligible (Person) Bool)

; Facts about the scenario
; You have the disease
(assert (diagnosed-diffuse-mesothelioma you))
; Diagnosis year is recent (e.g., 2026)
(assert (= (diagnosis-year you) 2026))
; Exposed in the UK
(assert (exposed-uk you))
; Cannot trace former employer or insurer
(assert (cannot-trace-employer you))
(assert (cannot-trace-insurer you))
; No civil claim made yet
(assert (not (made-civil-claim you)))
; No damages received elsewhere
(assert (not (received-damages you)))
; Entitlement window constraint (within 3 years of diagnosis)
(assert (within-3-years you))

; DMPS eligibility rule: you are eligible if all conditions for DMPS are met
(assert (=> (and (diagnosed-diffuse-mesothelioma you)
                 (> (diagnosis-year you) 2012)
                 (exposed-uk you)
                 (cannot-trace-employer you)
                 (cannot-trace-insurer you)
                 (not (made-civil-claim you))
                 (not (received-damages you))
                 (within-3-years you))
            (DMPS-eligible you)))

; Test: Are you entitled to compensation from the state?
(assert DMPS-eligible you)

; Check satisfiability and produce a model
(check-sat)
(get-model)