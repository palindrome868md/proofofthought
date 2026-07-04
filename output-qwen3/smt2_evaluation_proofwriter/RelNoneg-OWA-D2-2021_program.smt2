; 1. Declare sorts
(declare-sort Thing 0)

; 2. Declare constants
(declare-const mouse Thing)
(declare-const rabbit Thing)
(declare-const tiger Thing)

; 3. Declare functions (Properties)
(declare-fun is-rough (Thing) Bool)
(declare-fun is-red (Thing) Bool)
(declare-fun is-round (Thing) Bool)
(declare-fun is-nice (Thing) Bool)
(declare-fun is-kind (Thing) Bool)

; 3. Declare functions (Relations)
(declare-fun likes (Thing Thing) Bool)
(declare-fun visits (Thing Thing) Bool)

; 4. Assert knowledge base (facts)
(assert (is-rough mouse))
(assert (likes mouse rabbit))
(assert (likes mouse tiger))
(assert (visits mouse rabbit))
(assert (is-red rabbit))
(assert (is-round rabbit))
(assert (likes rabbit tiger))
(assert (visits rabbit tiger))
(assert (is-nice tiger))
(assert (is-rough tiger))

; Assert Rules
; Rule: Red, nice things are kind
(assert (forall ((x Thing))
  (=> (and (is-red x) (is-nice x))
      (is-kind x))))

; Rule: If something likes the rabbit then the rabbit is nice
(assert (forall ((x Thing))
  (=> (likes x rabbit)
      (is-nice rabbit))))

; 5. Verify Question: The rabbit is kind
(assert (is-kind rabbit))

; 6. Check satisfiability
(check-sat)
(get-model)