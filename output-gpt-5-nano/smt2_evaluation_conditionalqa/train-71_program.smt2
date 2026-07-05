(declare-sort Person 0)

; The individual in question
(declare-const me Person)

; Knowledge about pregnancy duration
(declare-fun weeks_pregnant (Person) Int)

; MA eligibility predicate
(declare-fun eligible_ma (Person) Bool)

; Benefits impact (per document)
(declare-const tax_credits_affected_Me Bool)
(declare-const affects_ESA_Me Bool)
(declare-const affects_Housing_Me Bool)
(declare-const affects_CouncilTax_Me Bool)
(declare-const affects_IncomeSupport_Me Bool)
(declare-const JSA_stops_Me Bool)
(declare-const bereavement_Me Bool)
(declare-const CarerAllowance_Me Bool)
(declare-const UniversalCredit_Me Bool)

; 1) Scenario facts
(assert (>= (weeks_pregnant me) 26))      ; You can claim MA after 26 weeks

; 2) MA eligibility rule: if 26 weeks or more, MA eligibility is possible
(assert (=> (>= (weeks_pregnant me) 26) (eligible_ma me)))

; 3) Tax credits: MA does not affect tax credits
(assert (not tax_credits_affected_Me))

; 4) MA will affect other benefits (per document)
(assert affects_ESA_Me)
(assert affects_Housing_Me)
(assert affects_CouncilTax_Me)
(assert affects_IncomeSupport_Me)
(assert JSA_stops_Me)
(assert bereavement_Me)
(assert CarerAllowance_Me)
(assert UniversalCredit_Me)

; 5) Test scenario: Am I eligible?
(assert (eligible_ma me))

(check-sat)
(get-model)