; Declare sorts
(declare-sort Person 0)

; Declare constants
(declare-const you Person)

; Declare predicates/functions
(declare-fun eligible-RA (Person) Bool)          ; Is Reduced Earnings Allowance currently eligible for this person
(declare-fun reaches-SPA (Person) Bool)           ; Has this person reached State Pension Age
(declare-fun in-regular-employment (Person) Bool) ; Is this person in regular employment

; Knowledge base (scenario)
; You are currently receiving Reduced Earnings Allowance
(assert (eligible-RA you))

; You will reach State Pension Age (66) soon
(assert (reaches-SPA you))

; You are not in regular employment
(assert (not (in-regular-employment you)))

; Rule: Reduced Earnings Allowance is replaced by Retirement Allowance when both conditions apply
; (Reached SPA) AND (Not in regular employment) => Not eligible for RA
(assert (forall ((p Person))
  (=> (and (reaches-SPA p) (not (in-regular-employment p)))
      (not (eligible-RA p)))))

; Test: Would you still be eligible for Reduced Earnings Allowance?
; Assertion of the question: you are still eligible for RA
(assert (eligible-RA you))

; Check satisfiability to answer the question
(check-sat)
(get-model)