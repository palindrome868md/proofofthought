; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions (predicates)
(declare-fun in-family (Person) Bool)
(declare-fun sub-amc (Person) Bool)
(declare-fun sub-hbo (Person) Bool)
(declare-fun eligible (Person) Bool)
(declare-fun go-cinema (Person) Bool)
(declare-fun prefer-tv (Person) Bool)
(declare-fun watch-tv-cinema (Person) Bool)

; 3. Declare constants
(declare-const lily Person)
(declare-const some_customer Person)

; 4. Assert knowledge base (Premises)

; Premise 1: All customers in James' family who subscribe to AMC A-List are eligible to watch three movies every week without any additional fees.
(assert (forall ((p Person)) 
  (=> (and (in-family p) (sub-amc p)) 
      (eligible p))))

; Premise 2: Some of the customers in James' family go to the cinema every week.
(assert (and (in-family some_customer) (go-cinema some_customer)))

; Premise 3: Customers in James' family subscribe to AMC A-List or HBO service.
(assert (forall ((p Person)) 
  (=> (in-family p) 
      (or (sub-amc p) (sub-hbo p)))))

; Premise 4: Customers in James' family who prefer TV series will not watch TV series in cinemas.
(assert (forall ((p Person)) 
  (=> (and (in-family p) (prefer-tv p)) 
      (not (watch-tv-cinema p)))))

; Premise 5: All customers in James' family who subscribe to HBO services prefer TV series to movies.
(assert (forall ((p Person)) 
  (=> (and (in-family p) (sub-hbo p)) 
      (prefer-tv p))))

; Premise 6: Lily is in James' family; she watches TV series in cinemas.
(assert (in-family lily))
(assert (watch-tv-cinema lily))

; 5. Assert the Statement to Verify
; Statement: If Lily is available to watch 3 movies every week without any additional fees and she watches TV series in cinemas, 
; then she goes to cinemas every week and prefers TV series more.
(assert (=> (and (eligible lily) (watch-tv-cinema lily)) 
            (and (go-cinema lily) (prefer-tv lily))))

; 6. Check satisfiability
; If unsat, the Statement contradicts the Knowledge Base (Statement is False).
; If sat, the Statement is consistent with the Knowledge Base (Statement is True).
(check-sat)
(get-model)