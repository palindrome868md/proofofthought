; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions (Predicates)
; Properties of customers
(declare-fun in-family (Person) Bool)           ; Is in James' family
(declare-fun sub-amc (Person) Bool)             ; Subscribes to AMC A-List
(declare-fun eligible-3 (Person) Bool)          ; Eligible for 3 movies/week w/o fees
(declare-fun cinema-weekly (Person) Bool)       ; Goes to cinema every week
(declare-fun sub-hbo (Person) Bool)             ; Subscribes to HBO
(declare-fun pref-tv (Person) Bool)             ; Prefers TV series
(declare-fun watch-tv-cinema (Person) Bool)     ; Watches TV series in cinemas

; 3. Declare constants
(declare-const Lily Person)
(declare-const OtherCustomer Person)            ; For the "Some customers" premise

; 4. Assert knowledge base (facts)

; Premise 1: All customers in James' family who subscribe to AMC A-List are eligible to watch three movies every week
(assert (forall ((p Person))
  (=> (and (in-family p) (sub-amc p))
      (eligible-3 p))))

; Premise 2: Some of the customers in James' family go to the cinema every week
(assert (and (in-family OtherCustomer) (cinema-weekly OtherCustomer)))

; Premise 3: Customers in James' family subscribe to AMC A-List or HBO service
(assert (forall ((p Person))
  (=> (in-family p)
      (or (sub-amc p) (sub-hbo p)))))

; Premise 4: Customers in James' family who prefer TV series will not watch TV series in cinemas
(assert (forall ((p Person))
  (=> (and (in-family p) (pref-tv p))
      (not (watch-tv-cinema p)))))

; Premise 5: All customers in James' family who subscribe to HBO services prefer TV series to movies
(assert (forall ((p Person))
  (=> (and (in-family p) (sub-hbo p))
      (pref-tv p))))

; Premise 6: Lily is in James' family; she watches TV series in cinemas
(assert (in-family Lily))
(assert (watch-tv-cinema Lily))

; 5. Test Statement
; Statement: Lily goes to cinemas every week or watches 3 movies every week without any additional fees.
; We assert the statement to check if it is consistent (sat = True) or contradictory (unsat = False).
(assert (or (cinema-weekly Lily) (eligible-3 Lily)))

; 6. Check satisfiability
(check-sat)
(get-model)