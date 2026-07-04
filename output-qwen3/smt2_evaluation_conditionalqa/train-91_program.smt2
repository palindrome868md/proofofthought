; Deputyship Fee Refund Eligibility Checker
; Question: Can the user apply for a deputyship fee refund?

; Declare sorts
(declare-sort Person 0)
(declare-sort TimePeriod 0)

; Declare functions for eligibility conditions
(declare-fun is-current-deputy (Person) Bool)
(declare-fun deputyship-start-year (Person) Int)
(declare-fun deputyship-end-year (Person) Int)
(declare-fun client-is-deceased (Person) Bool)
(declare-fun eligible-refund-period-start () Int)
(declare-fun eligible-refund-period-end () Int)
(declare-fun qualifies-for-refund (Person) Bool)
(declare-fun needs-to-apply (Person) Bool)
(declare-fun can-apply-for-refund (Person) Bool)

; Declare constants
(declare-const user Person)

; Knowledge Base: Refund Program Rules
; Rule 1: Eligible refund period is 1 April 2008 to 31 March 2015
(assert (= (eligible-refund-period-start) 2008))
(assert (= (eligible-refund-period-end) 2015))

; Rule 2: To qualify, deputyship must have been active during eligible period
(assert (forall ((p Person))
  (=> (qualifies-for-refund p)
      (and 
        (>= (deputyship-start-year p) (eligible-refund-period-start))
        (<= (deputyship-start-year p) (eligible-refund-period-end))))))

; Rule 3: Current deputies get automatic refund (don't need to apply)
(assert (forall ((p Person))
  (=> (and (is-current-deputy p) (qualifies-for-refund p))
      (not (needs-to-apply p)))))

; Rule 4: Can apply if: had deputy previously OR client deceased AND qualifies
(assert (forall ((p Person))
  (=> (can-apply-for-refund p)
      (or 
        (and (not (is-current-deputy p)) (qualifies-for-refund p))
        (and (client-is-deceased p) (qualifies-for-refund p))))))

; User's Specific Facts
; Fact 1: User became deputy in August 2018
(assert (= (deputyship-start-year user) 2018))

; Fact 2: User is still acting as deputy (current court order)
(assert (is-current-deputy user))

; Fact 3: Mother is alive (in residential care, not deceased)
(assert (not (client-is-deceased user)))

; Fact 4: User lives in England (Lincolnshire) - jurisdiction is correct
; (OPG for England and Wales - satisfied by location)

; TEST: Can the user apply for a deputyship fee refund?
; We assert that the user CAN apply and check if this is satisfiable
; If unsat, it means the user CANNOT apply (answer is False/No)
(assert (can-apply-for-refund user))

; Check satisfiability
(check-sat)
(get-model)

; Expected result: unsat
; Reasoning: 
; 1. User's deputyship started in 2018
; 2. Eligible period is 2008-2015
; 3. 2018 is outside the eligible period
; 4. Therefore user does not qualify for refund
; 5. Even though user is current deputy (automatic refund if eligible),
;    they don't meet the time period requirement
; 6. Answer: NO, cannot apply (not eligible for this refund scheme)