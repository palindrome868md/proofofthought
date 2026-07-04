; ESA Eligibility Verification for COVID-19 Recovery Scenario
; Question: Can a freelance graphic designer recovering from COVID-19 
; still claim Employment and Support Allowance while taking freelance work again?

(declare-sort Person 0)

; Declare functions for properties and conditions
(declare-fun is-self-employed (Person) Bool)
(declare-fun recovering-from-covid (Person) Bool)
(declare-fun under-state-pension-age (Person) Bool)
(declare-fun has-ni-contributions (Person) Bool)
(declare-fun is-working (Person) Bool)
(declare-fun work-hours-weekly (Person) Int)
(declare-fun earnings-weekly (Person) Int)
(declare-fun eligible-health-condition (Person) Bool)
(declare-fun meets-work-thresholds (Person) Bool)
(declare-fun can-claim-esa-while-working (Person) Bool)

; Declare the freelance designer
(declare-const designer Person)

; =============================================================================
; KNOWLEDGE BASE: Facts from the scenario
; =============================================================================

; The designer is self-employed (freelance graphic designer)
(assert (is-self-employed designer))

; The designer contracted COVID-19 and is now recovering
(assert (recovering-from-covid designer))

; The designer was bedridden but is now taking work again
(assert (is-working designer))

; Assume designer meets basic eligibility (under pension age, has NI contributions)
(assert (under-state-pension-age designer))
(assert (has-ni-contributions designer))

; =============================================================================
; RULES: ESA Eligibility Conditions from the document
; =============================================================================

; Rule 1: COVID-19 recovery qualifies as an eligible health condition for ESA
; Document states: "you or your child might have COVID-19 or you're recovering from it"
(assert (forall ((p Person))
  (=> (recovering-from-covid p)
      (eligible-health-condition p))))

; Rule 2: Can work while claiming ESA if under thresholds
; Document states: "you work less than 16 hours a week" AND "do not earn more than £143 a week"
(assert (forall ((p Person))
  (=> (and (is-working p)
           (< (work-hours-weekly p) 16)
           (< (earnings-weekly p) 143))
      (meets-work-thresholds p))))

; Rule 3: Can claim ESA while working if eligible condition AND meets work thresholds
; Document states: "You can apply whether you're in or out of work" with conditions
(assert (forall ((p Person))
  (=> (and (eligible-health-condition p)
           (under-state-pension-age p)
           (has-ni-contributions p)
           (meets-work-thresholds p))
      (can-claim-esa-while-working p))))

; =============================================================================
; TEST SCENARIO: Designer works within permitted limits
; =============================================================================

; Set work hours within permitted threshold (less than 16 hours/week)
(assert (= (work-hours-weekly designer) 10))

; Set earnings within permitted threshold (less than £143/week)
(assert (= (earnings-weekly designer) 100))

; =============================================================================
; VERIFICATION: Can the designer claim ESA while working?
; =============================================================================

; Assert that the designer CAN claim ESA while working
; If SAT = True (they can claim), If UNSAT = False (they cannot claim)
(assert (can-claim-esa-while-working designer))

; Check satisfiability
(check-sat)

; Get model to see the values that satisfy the constraints
(get-model)