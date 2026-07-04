; Declare sorts
(declare-sort Fruit 0)

; Declare constants
(declare-const cherries Fruit)

; Declare predicates
(declare-fun grows_in_Ben_yard (Fruit) Bool)
(declare-fun red_fruit (Fruit) Bool)
(declare-fun apple (Fruit) Bool)
(declare-fun contains_vitamin_c (Fruit) Bool)
(declare-fun healthy (Fruit) Bool)
(declare-fun on_warning_list (Fruit) Bool)

; Knowledge base (premises)

; 1. All red fruits that grow in Ben's yard contain Vitamin C
(assert (forall ((f Fruit))
  (=> (and (red_fruit f) (grows_in_Ben_yard f))
      (contains_vitamin_c f))))

; 2. All apples that grow in Ben's yard are red fruits
(assert (forall ((f Fruit))
  (=> (and (apple f) (grows_in_Ben_yard f))
      (red_fruit f))))

; 3. All fruits that grow in Ben's yard and contain Vitamin C are healthy
(assert (forall ((f Fruit))
  (=> (and (grows_in_Ben_yard f) (contains_vitamin_c f))
      (healthy f))))

; 4. No fruits that grow in Ben's yard and are healthy are on a warning list
(assert (forall ((f Fruit))
  (=> (and (grows_in_Ben_yard f) (healthy f))
      (not (on_warning_list f)))))

; 5. The cherries grow in Ben's yard
(assert (grows_in_Ben_yard cherries))

; 6. If cherries are not apples and are not healthy, then they are red fruits
(assert (=> (and (not (apple cherries)) (not (healthy cherries)))
            (red_fruit cherries)))

; Statement to test: "The cherries are either on a warning list or are red."
(assert (or (on_warning_list cherries) (red_fruit cherries)))

; Single check to directly address the question
(check-sat)
(get-model)