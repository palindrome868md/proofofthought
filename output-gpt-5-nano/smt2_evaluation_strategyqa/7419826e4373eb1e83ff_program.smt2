; Declare sorts
(declare-sort Animal 0)

; Declare constants
(declare-const dog Animal)
(declare-const grey-seal Animal)

; Declare functions
(declare-fun first_response_time (Animal) Int)

; Knowledge base: times when each would respond to bell
(assert (= (first_response_time dog) 2))
(assert (= (first_response_time grey-seal) 5))

; Optional sane constraints (times are positive)
(assert (> (first_response_time dog) 0))
(assert (> (first_response_time grey-seal) 0))

; Test: Would a dog respond to bell before Grey seal?
(assert (< (first_response_time dog) (first_response_time grey-seal)))

(check-sat)
(get-model)