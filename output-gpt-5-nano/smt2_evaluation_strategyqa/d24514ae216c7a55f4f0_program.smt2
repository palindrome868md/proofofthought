; Determine whether Miami is a city on the American West Coast

(declare-sort City 0)
(declare-const miami City)
(declare-fun on_west_coast (City) Bool)

; Knowledge base: Miami is not on the West Coast
(assert (not (on_west_coast miami)))

; Test scenario: Is Miami on the West Coast?
(assert (on_west_coast miami))

(check-sat)