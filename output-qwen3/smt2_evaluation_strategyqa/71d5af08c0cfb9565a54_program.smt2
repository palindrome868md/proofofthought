; Question: Could Oscar Wilde have operated a motor vehicle?
; This tests possibility - if constraints allow it, answer is sat (true)

; Declare sorts
(declare-sort Person 0)
(declare-sort Vehicle 0)

; Declare functions
(declare-fun birth-year (Person) Int)
(declare-fun death-year (Person) Int)
(declare-fun vehicle-invented-year (Vehicle) Int)
(declare-fun is-motor-vehicle (Vehicle) Bool)
(declare-fun could-operate (Person Vehicle) Bool)
(declare-fun alive-during (Person Int) Bool)

; Declare constants
(declare-const oscar-wilde Person)
(declare-const motor-car Vehicle)

; Knowledge base - Oscar Wilde's lifespan (1854-1900)
(assert (= (birth-year oscar-wilde) 1854))
(assert (= (death-year oscar-wilde) 1900))

; Knowledge base - First motor vehicle invented (Karl Benz, 1886)
(assert (is-motor-vehicle motor-car))
(assert (= (vehicle-invented-year motor-car) 1886))

; Rule: Person is alive during a year if born before and died after
(assert (forall ((p Person) (y Int))
  (=> (and (<= (birth-year p) y)
           (>= (death-year p) y))
      (alive-during p y))))

; Rule: A person could operate a motor vehicle if they were alive when it existed
; and the vehicle was invented during their lifetime
(assert (forall ((p Person) (v Vehicle))
  (=> (and (is-motor-vehicle v)
           (alive-during p (vehicle-invented-year v)))
      (could-operate p v))))

; Test: Could Oscar Wilde have operated a motor vehicle?
; We assert this possibility and check if it's satisfiable
(assert (could-operate oscar-wilde motor-car))

; Check satisfiability
(check-sat)
(get-model)