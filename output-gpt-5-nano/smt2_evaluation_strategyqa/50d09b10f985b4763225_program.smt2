; Declare sorts
(declare-sort Person 0)
(declare-sort Car 0)

; Car model (Chevrolet Corvette ZR1)
(declare-const corvette-zr1 Car)

; Lil Wayne's children (represent three distinct children for the scenario)
(declare-const child1 Person)
(declare-const child2 Person)
(declare-const child3 Person)

; Predicates / Functions
(declare-fun child-of (Person) Bool)
(declare-fun sits-in (Person Car) Bool)
(declare-fun seat (Person) Int)

; Knowledge base: these are Lil Wayne's children
(assert (child-of child1))
(assert (child-of child2))
(assert (child-of child3))
(assert (distinct child1 child2 child3))

; Scenario: these three children ride in the Corvette ZR1
(assert (sits-in child1 corvette-zr1))
(assert (sits-in child2 corvette-zr1))
(assert (sits-in child3 corvette-zr1))

; Capacity constraints: if someone sits in the Corvette, their seat must be 1 or 2
(assert (forall ((p Person))
  (=> (sits-in p corvette-zr1)
      (and (>= (seat p) 1)
           (<= (seat p) 2)))))

; Distinct seats for those sitting in the Corvette
(assert (forall ((p1 Person) (p2 Person))
  (=> (and (sits-in p1 corvette-zr1)
           (sits-in p2 corvette-zr1)
           (not (= p1 p2)))
        (not (= (seat p1) (seat p2))))))

; Test: Could Lil Wayne's children ride in a Chevrolet Corvette ZR1 together?
(check-sat)