; Declare sorts
(declare-sort Person 0)

; Declare constants
(declare-const oscar-wilde Person)

; Declare functions
(declare-fun birth-year (Person) Int)
(declare-fun death-year (Person) Int)
(declare-const car-invented-year Int)
(declare-fun can-operate-motor-vehicle (Person) Bool)

; Knowledge base
(assert (= (birth-year oscar-wilde) 1854))
(assert (= (death-year oscar-wilde) 1900))
(assert (= car-invented-year 1886))

; Rule: If born before the car invention year and died after (or during) that year, then the person can operate a motor vehicle
(assert (forall ((p Person))
  (=> (and (<= (birth-year p) car-invented-year)
           (>= (death-year p) car-invented-year))
      (can-operate-motor-vehicle p))))

; Test scenario: Could Oscar Wilde operate a motor vehicle?
(assert (can-operate-motor-vehicle oscar-wilde))

; Check satisfiability
(check-sat)
(get-model)