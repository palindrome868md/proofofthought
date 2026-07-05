(declare-sort Person 0)
(declare-sort Item 0)

(declare-fun depressed (Person) Bool)
(declare-fun cheer_up (Item Person) Bool)

(declare-const mao_bar Item)
(declare-const alice   Person)

; Knowledge base
(assert (depressed alice))

; Rule: If a person is depressed, a MAO bar would cheer them up
(assert (forall ((p Person))
  (=> (depressed p)
      (cheer_up mao_bar p))))

; Test: Would the MAO bar cheer up Alice?
(assert (cheer_up mao_bar alice))

(check-sat)
(get-model)