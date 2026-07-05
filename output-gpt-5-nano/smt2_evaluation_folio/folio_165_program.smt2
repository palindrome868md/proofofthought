; Sorts
(declare-sort Person 0)

; Constants
(declare-const elizabeth Person)

; Predicates / Functions
(declare-fun is-leader-for-life (Person) Bool)
(declare-fun is-king (Person) Bool)
(declare-fun is-queen (Person) Bool)
(declare-fun is-female (Person) Bool)
(declare-fun is-male (Person) Bool)
(declare-fun has-power (Person) Bool)

; Knowledge base (premises)

; 1. Leaders for life are either a king or a queen
(assert (forall ((p Person)) (=> (is-leader-for-life p) (or (is-king p) (is-queen p)))))

; 2. Queens are female
(assert (forall ((p Person)) (=> (is-queen p) (is-female p))))

; 3. Kings are male
(assert (forall ((p Person)) (=> (is-king p) (is-male p))))

; 4. Kings and queens are exclusive (disjoint)
(assert (forall ((p Person)) (=> (or (is-king p) (is-queen p)) (not (and (is-king p) (is-queen p))))))

; 5. Leader for life implies power
(assert (forall ((p Person)) (=> (is-leader-for-life p) (has-power p))))

; Facts given in the problem
(assert (is-queen elizabeth))
(assert (is-leader-for-life elizabeth))

; Test: Is Elizabeth a king?
(assert (is-king elizabeth))

; Verification
(check-sat)
(get-model)