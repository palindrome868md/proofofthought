; Define a simple model: pear and its sinking in water
(declare-sort Fruit 0)
(declare-fun is-heavy (Fruit) Bool)
(declare-fun sinks-in-water (Fruit) Bool)
(declare-const pear Fruit)

; Knowledge base: pears are heavy
(assert (is-heavy pear))

; Rule: if something is heavy, it sinks in water
(assert (=> (is-heavy pear) (sinks-in-water pear)))

; Test: Would a pear sink in water?
(assert (sinks-in-water pear))

(check-sat)
(get-model)