; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions
(declare-fun wbc-count (Person) Int)
(declare-fun dead (Person) Bool)

; 3. Knowledge base: zero white blood cells imply death
(assert (forall ((p Person))
  (=> (= (wbc-count p) 0)
      (dead p))))

; 4. Test scenario: exists a witness with 0 WBC who is not dead
(declare-const witness Person)
(assert (= (wbc-count witness) 0))
(assert (not (dead witness)))

; 5. Check satisfiability
(check-sat)