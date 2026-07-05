(declare-sort Item 0)

(declare-fun add-water (Item) Item)
(declare-fun is-rice-based (Item) Bool)
(declare-fun has-water (Item) Bool)
(declare-fun is-horchata (Item) Bool)

(declare-const rice-pudding Item)
(declare-const watered-rice-pudding Item)

; Knowledge base
(assert (is-rice-based rice-pudding))
(assert (= (add-water rice-pudding) watered-rice-pudding))
(assert (has-water watered-rice-pudding))
(assert (not (is-horchata watered-rice-pudding)))

; Test: Is watered-rice-pudding horchata?
(assert (is-horchata watered-rice-pudding))

(check-sat)