(declare-sort Person 0)

(declare-const elsa Person)

(declare-fun is-disney-princess (Person) Bool)
(declare-fun is-ice-princess (Person) Bool)

(assert (is-disney-princess elsa))
(assert (is-ice-princess elsa))

; Test: Does Disney have an ice princess?
(assert (exists ((p Person))
  (and (is-disney-princess p) (is-ice-princess p))))

(check-sat)
(get-model)